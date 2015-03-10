from __future__ import unicode_literals
from datetime import datetime

from django.db import models


class Attribute(models.Model):
    attributeId = models.AutoField(db_column='attributeId', primary_key=True)  # Field name made lowercase.
    type = models.CharField(max_length=200)
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)  # Field name made lowercase.

    def __unicode__(self):
        return self.type
    
    class Meta:
        db_table = 'attribute'

class EventType(models.Model):
    eventTypeId = models.AutoField(db_column='attributeId', primary_key=True)  # Field name made lowercase.
    type = models.CharField(max_length=200)
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)  # Field name made lowercase.

    def __unicode__(self):
        return self.type

    class Meta:
        db_table = 'attribute'


class VenueType(models.Model):
    venueTypeId = models.AutoField(db_column='attributeId', primary_key=True)  # Field name made lowercase.
    type = models.CharField(max_length=200)
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)  # Field name made lowercase.

    def __unicode__(self):
        return self.type

    class Meta:
        db_table = 'venue_type'


class Capacity(models.Model):
    capacityId = models.AutoField(db_column='capacityId', primary_key=True)  # Field name made lowercase.
    type = models.CharField(max_length=200)
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)  # Field name made lowercase.

    def __unicode__(self):
        return self.type
    
    class Meta:
        db_table = 'capacity'


class SpaceCapacity(models.Model):
    spaceCapacityId = models.AutoField(db_column='spaceCapacityId', primary_key=True)  # Field name made lowercase.
    capacityId = models.ForeignKey('Capacity', db_column='capacityId')  # Field name made lowercase.
    spaceId = models.ForeignKey('Space', db_column='spaceId')  # Field name made lowercase.
    capacity = models.IntegerField()

    class Meta:
        db_table = 'space_capacity'
        

class Detail(models.Model):
    detailId = models.AutoField(db_column='detailId', primary_key=True)  # Field name made lowercase.
    spaceId = models.ForeignKey('Space', db_column='spaceId')  # Field name made lowercase.
    title = models.CharField(max_length=100)
    description = models.CharField(max_length=100)
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)  # Field name made lowercase.

    class Meta:
        db_table = 'detail'


class Inclusion(models.Model):
    inclusionId = models.AutoField(db_column='inclusionId', primary_key=True)  # Field name made lowercase.
    spaceId = models.ForeignKey('Space', db_column='spaceId')  # Field name made lowercase.
    inclusion = models.CharField(max_length=1000)
    count = models.IntegerField(blank=True, null=True)
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)  # Field name made lowercase.

    class Meta:
        db_table = 'inclusion'


class Requirement(models.Model):
    requirementId = models.AutoField(db_column='requirementId', primary_key=True)  # Field name made lowercase.
    spaceId = models.ForeignKey('Space', db_column='spaceId')  # Field name made lowercase.
    requirement = models.CharField(max_length=1000)
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)  # Field name made lowercase.
    
    def __unicode__(self):
        return "{0} - {1}".format(self.spaceId, self.requirement)
    
    class Meta:
        db_table = 'requirement'


class Space(models.Model):
    spaceId = models.AutoField(db_column='spaceId', primary_key=True)  # Field name made lowercase.
    venueId = models.ForeignKey('Venue', db_column='venueId')  # Field name made lowercase.
    name = models.CharField(max_length=200)
    description = models.TextField(blank=True)
    squareFootage = models.IntegerField(db_column='squareFootage', blank=True, null=True)  # Field name made lowercase.
    width = models.IntegerField(blank=True, null=True)
    length = models.IntegerField(blank=True, null=True)
    height = models.IntegerField(blank=True, null=True)
    deposit = models.DecimalField(blank=True, null=True, decimal_places=2, max_digits=6)
    cleaningFee = models.DecimalField(blank=True, null=True, decimal_places=2, max_digits=6)
    costStartRange = models.DecimalField(blank=True, null=True, decimal_places=2, max_digits=6)
    costEndRange = models.DecimalField(blank=True, null=True, decimal_places=2, max_digits=6)
    costDetails = models.CharField(max_length=500)
    nonProfitDiscount = models.CharField(max_length=50)
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)  # Field name made lowercase.

    def __unicode__(self):
        return "{0} - {1}".format(self.venueId.name, self.name)
    
    class Meta:
        db_table = 'space'


class SpaceAttribute(models.Model):
    spaceAttributeId = models.AutoField(db_column='spaceAttributeId', primary_key=True)  # Field name made lowercase.
    spaceId = models.ForeignKey(Space, db_column='spaceId')  # Field name made lowercase.
    attributeId = models.ForeignKey(Attribute, db_column='attributeId')  # Field name made lowercase.
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)

    class Meta:
        db_table = 'space_attribute'


class SpaceImage(models.Model):
    spaceImageId = models.AutoField(db_column='spaceImageId', primary_key=True)  # Field name made lowercase.
    spaceId = models.ForeignKey(Space, db_column='spaceId')  # Field name made lowercase.
    image = models.CharField(max_length=1000, blank=True)
    order = models.IntegerField(blank=True, null=True)
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)

    class Meta:
        db_table = 'space_image'


class Venue(models.Model):
    venueId = models.AutoField(db_column='venueId', primary_key=True)  # Field name made lowercase.
    name = models.CharField(max_length=200)
    description = models.TextField(blank=True)
    mission = models.TextField(blank=True)
    address = models.CharField(max_length=1000, blank=True)
    address2 = models.CharField(max_length=1000, blank=True)
    city = models.CharField(max_length=100, blank=True)
    state = models.CharField(max_length=50, blank=True)
    zipcode = models.CharField(max_length=50, blank=True)
    phoneNumber = models.CharField(db_column='phoneNumber', max_length=50, blank=True)  # Field name made lowercase.
    email = models.CharField(max_length=100, blank=True)
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)  # Field name made lowercase.

    def __unicode__(self):
        return "{0} - {1}".format(self.name, self.venueId)

    class Meta:
        db_table = 'venue'


class VenueAttribute(models.Model):
    venueAttributeId = models.AutoField(db_column='venueAttributeId', primary_key=True)  # Field name made lowercase.
    venueId = models.ForeignKey(Venue, db_column='venueId')  # Field name made lowercase.
    attributeId = models.ForeignKey(Attribute, db_column='attributeId')  # Field name made lowercase.
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now)  # Field name made lowercase.

    def __unicode__(self):
        return "{0} - {1}".format(self.venueId.name, self.attributeId.type)
    
    class Meta:
        db_table = 'venue_attribute'


class VenueEvent(models.Model):
    venueEventId = models.AutoField(db_column='spaceId', primary_key=True)  # Field name made lowercase.
    venueId = models.ForeignKey('Venue', db_column='venueId')  # Field name made lowercase.
    eventTypeId = models.ForeignKey('EventType', db_column='eventTypeId')  # Field name made lowercase.
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now) # Field name made lowercase.

    def __unicode__(self):
        return "{0} - {1}".format(self.venueId.name, self.eventTypeId.type)

    class Meta:
        db_table = 'space'

class VenueImage(models.Model):
    venueImageId = models.AutoField(db_column='venueImageId', primary_key=True)  # Field name made lowercase.
    venueId = models.ForeignKey(Venue, db_column='venueId')  # Field name made lowercase.
    image = models.CharField(max_length=1000, blank=True)
    order = models.IntegerField(blank=True, null=True)
    createTimestamp = models.DateTimeField(db_column='createTimestamp', default=datetime.now) # Field name made lowercase.

    class Meta:
        db_table = 'venue_image'
