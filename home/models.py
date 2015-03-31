from __future__ import unicode_literals
from datetime import datetime
from django.conf import settings

from django.db import models
from s3direct.fields import S3DirectField
from boto.s3.connection import S3Connection, Bucket, Key


class Attribute(models.Model):
    attributeId = models.AutoField(db_column='attributeId', primary_key=True)
    type = models.CharField(max_length=200)
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)

    def __unicode__(self):
        return self.type

    class Meta:
        db_table = 'attribute'


class EventType(models.Model):
    eventTypeId = models.AutoField(db_column='eventTypeId', primary_key=True)
    type = models.CharField(max_length=200)
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)

    def __unicode__(self):
        return self.type

    class Meta:
        db_table = 'event_type'


class VenueType(models.Model):
    venueTypeId = models.AutoField(db_column='venueTypeId', primary_key=True)
    type = models.CharField(max_length=200)
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)

    def __unicode__(self):
        return self.type

    class Meta:
        db_table = 'venue_type'


class Capacity(models.Model):
    # COCKTAIL = 1
    # DINING = 2
    # THEATER = 3
    # WORKOUT = 4

    capacity_choices = (
        ('Cocktail', 'Cocktail'),
        ('Seated For Dining', 'Seated For Dining'),
        ('Theater Style', 'Theater Style'),
        ('Workout Activity', 'Workout Activity'),
    )

    capacity_choices_map = {1: 'Cocktail', 2: 'Seated For Dining', 3: 'Theater Style', 4: 'Workout Activity'}

    capacityId = models.AutoField(db_column='capacityId', primary_key=True)
    spaceId = models.ForeignKey('Space', db_column='spaceId')
    type = models.CharField(max_length=30, choices=capacity_choices)
    capacity = models.IntegerField()
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)

    # def get_type(self):
    #     return self.capacity_choices_map[self.type]

    def __unicode__(self):
        return self.type

    class Meta:
        db_table = 'capacity'


class Detail(models.Model):
    detailId = models.AutoField(db_column='detailId', primary_key=True)
    spaceId = models.ForeignKey('Space', db_column='spaceId')
    title = models.CharField(max_length=100)
    description = models.CharField(max_length=100)
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)

    class Meta:
        db_table = 'detail'


class Inclusion(models.Model):
    inclusionId = models.AutoField(db_column='inclusionId', primary_key=True)
    spaceId = models.ForeignKey('Space', db_column='spaceId')
    inclusion = models.CharField(max_length=1000)
    count = models.IntegerField(blank=True, null=True)
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)

    class Meta:
        db_table = 'inclusion'


class Requirement(models.Model):
    requirementId = models.AutoField(db_column='requirementId', primary_key=True)
    spaceId = models.ForeignKey('Space', db_column='spaceId')
    requirement = models.CharField(max_length=1000)
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)

    def __unicode__(self):
        return "{0} - {1}".format(self.spaceId, self.requirement)

    class Meta:
        db_table = 'requirement'


class Space(models.Model):
    spaceId = models.AutoField(db_column='spaceId', primary_key=True)
    venueId = models.ForeignKey('Venue', db_column='venueId')
    name = models.CharField(max_length=200)
    description = models.TextField(blank=True)
    squareFootage = models.IntegerField(db_column='squareFootage', blank=True, null=True)
    width = models.IntegerField(blank=True, null=True)
    length = models.IntegerField(blank=True, null=True)
    height = models.IntegerField(blank=True, null=True)
    deposit = models.DecimalField(blank=True, null=True, decimal_places=2, max_digits=6)
    cleaningFee = models.DecimalField(blank=True, null=True, decimal_places=2, max_digits=6)
    costStartRange = models.DecimalField(blank=True, null=True, decimal_places=2, max_digits=6)
    costEndRange = models.DecimalField(blank=True, null=True, decimal_places=2, max_digits=6)
    costDetails = models.CharField(max_length=500, blank=True, null=True)
    nonProfitDiscount = models.CharField(max_length=50, blank=True, null=True)
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)

    def __unicode__(self):
        return "{0} - {1}".format(self.venueId.name, self.name)

    class Meta:
        db_table = 'space'


class SpaceAttribute(models.Model):
    spaceAttributeId = models.AutoField(db_column='spaceAttributeId', primary_key=True)
    spaceId = models.ForeignKey(Space, db_column='spaceId')
    attributeId = models.ForeignKey(Attribute, db_column='attributeId')
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)

    def __unicode__(self):
        return "{0} - {1}".format(self.spaceId.name, self.attributeId.type)
    
    class Meta:
        db_table = 'space_attribute'


class SpaceImage(models.Model):
    spaceImageId = models.AutoField(db_column='spaceImageId', primary_key=True)
    spaceId = models.ForeignKey(Space, db_column='spaceId')
    image = S3DirectField(dest='space_images')
    order = models.IntegerField(blank=True, null=True)
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)

    def __unicode__(self):
        return "{0} - {1}".format(self.spaceId.name, self.spaceImageId)

    def delete(self, *args, **kwargs):
        # You have to prepare what you need before delete the model
        # Delete the model before the file
        super(SpaceImage, self).delete(*args, **kwargs)
        # Delete the file after the model
        conn = S3Connection(settings.AWS_ACCESS_KEY_ID, settings.AWS_SECRET_ACCESS_KEY)
        bucket = Bucket(conn, settings.AWS_STORAGE_BUCKET_NAME)
        key = Key(bucket)
        key.key = "{0}/{1}".format(settings.IMAGE_SPACE_S3_PATH, self.image.rsplit('/', 1)[1])
        bucket.delete_key(key)


    class Meta:
            db_table = 'space_image'


class SpaceFloorplan(models.Model):
    spaceFloorplanId = models.AutoField(db_column='spaceFloorplanId', primary_key=True)
    spaceId = models.ForeignKey(Space, db_column='spaceId')
    floorplan = S3DirectField(dest='space_floorplan')
    order = models.IntegerField(blank=True, null=True)
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)

    def __unicode__(self):
        return "{0} - {1}".format(self.spaceId.name, self.spaceFloorplanId)

    def delete(self, *args, **kwargs):
        # You have to prepare what you need before delete the model
        # Delete the model before the file
        super(SpaceFloorplan, self).delete(*args, **kwargs)
        # Delete the file after the model
        conn = S3Connection(settings.AWS_ACCESS_KEY_ID, settings.AWS_SECRET_ACCESS_KEY)
        bucket = Bucket(conn, settings.AWS_STORAGE_BUCKET_NAME)
        key = Key(bucket)
        key.key = "{0}/{1}".format(settings.IMAGE_SPACE_FLOORPLAN_S3_PATH, self.floorplan.rsplit('/', 1)[1])
        bucket.delete_key(key)

    class Meta:
        db_table = 'space_floorplan'


class Venue(models.Model):
    venueId = models.AutoField(db_column='venueId', primary_key=True)
    name = models.CharField(max_length=200)
    description = models.TextField(blank=True)
    mission = models.TextField(blank=True)
    address = models.CharField(max_length=1000, blank=True)
    address2 = models.CharField(max_length=1000, blank=True)
    city = models.CharField(max_length=100, blank=True)
    state = models.CharField(max_length=50, blank=True)
    zipcode = models.CharField(max_length=50, blank=True)
    phoneNumber = models.CharField(db_column='phoneNumber', max_length=50, blank=True)
    email = models.CharField(max_length=100, blank=True)
    totalCapacity = models.IntegerField(blank=True, null=True)
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)

    def __unicode__(self):
        return "{0} - {1}".format(self.name, self.venueId)

    class Meta:
        db_table = 'venue'


class VenueAttribute(models.Model):
    venueAttributeId = models.AutoField(db_column='venueAttributeId', primary_key=True)
    venueId = models.ForeignKey(Venue, db_column='venueId')
    attributeId = models.ForeignKey(Attribute, db_column='attributeId')
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)

    def __unicode__(self):
        return "{0} - {1}".format(self.venueId.name, self.attributeId.type)

    class Meta:
        db_table = 'venue_attribute'


class VenueEvent(models.Model):
    venueEventId = models.AutoField(db_column='venueEventId', primary_key=True)
    venueId = models.ForeignKey('Venue', db_column='venueId')
    eventTypeId = models.ForeignKey('EventType', db_column='eventTypeId')
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)

    def __unicode__(self):
        return "{0} - {1}".format(self.venueId.name, self.eventTypeId.type)

    class Meta:
        db_table = 'venue_event'


class VenueVenueType(models.Model):
    venueVenueTypeId = models.AutoField(db_column='venueVenueTypeId', primary_key=True)
    venueId = models.ForeignKey('Venue', db_column='venueId')
    venueTypeId = models.ForeignKey('VenueType', db_column='venueTypeId')
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)

    def __unicode__(self):
        return "{0} - {1}".format(self.venueId.name, self.venueTypeId.type)

    class Meta:
        db_table = 'venue_venue_type'


class VenueImage(models.Model):
    venueImageId = models.AutoField(db_column='venueImageId', primary_key=True)
    venueId = models.ForeignKey(Venue, db_column='venueId')
    image = S3DirectField(dest='venue_images')
    order = models.IntegerField(blank=True, null=True)
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)

    class Meta:
        db_table = 'venue_image'

    def __unicode__(self):
        return "{0} - {1}".format(self.venueId.name, self.venueImageId)

    def delete(self, *args, **kwargs):
        super(VenueImage, self).delete(*args, **kwargs)
        
        conn = S3Connection(settings.AWS_ACCESS_KEY_ID, settings.AWS_SECRET_ACCESS_KEY)
        bucket = Bucket(conn, settings.AWS_STORAGE_BUCKET_NAME)
        key = Key(bucket)
        key.key = "{0}/{1}".format(settings.IMAGE_VENUE_S3_PATH, self.image.rsplit('/', 1)[1])
        bucket.delete_key(key)


class VenueFloorplan(models.Model):
    venueFloorplanId = models.AutoField(db_column='venueFloorplanId', primary_key=True)
    venueId = models.ForeignKey(Venue, db_column='venueId')
    floorplan = S3DirectField(dest='venue_floorplan')
    order = models.IntegerField(blank=True, null=True)
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)

    class Meta:
        db_table = 'venue_floorplan'

    def __unicode__(self):
        return "{0} - {1}".format(self.venueId.name, self.venueFloorplanId)

    def delete(self, *args, **kwargs):
        super(VenueFloorplan, self).delete(*args, **kwargs)
        
        conn = S3Connection(settings.AWS_ACCESS_KEY_ID, settings.AWS_SECRET_ACCESS_KEY)
        bucket = Bucket(conn, settings.AWS_STORAGE_BUCKET_NAME)
        key = Key(bucket)
        key.key = "{0}/{1}".format(settings.IMAGE_VENUE_FLOORPLAN_S3_PATH, self.floorplan.rsplit('/', 1)[1])
        bucket.delete_key(key)        


