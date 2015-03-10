# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin.py sqlcustom [app_label]'
# into your database.
from __future__ import unicode_literals

from django.db import models


class Attribute(models.Model):
    attributeid = models.IntegerField(db_column='attributeId', primary_key=True)  # Field name made lowercase.
    key = models.CharField(max_length=200)
    value = models.CharField(max_length=1000, blank=True)
    createtimestamp = models.DateTimeField(db_column='createTimestamp')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'attribute'


class AuthGroup(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    group = models.ForeignKey(AuthGroup)
    permission = models.ForeignKey('AuthPermission')

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'


class AuthPermission(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    name = models.CharField(max_length=50)
    content_type = models.ForeignKey('DjangoContentType')
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'


class AuthUser(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField()
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=30)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.CharField(max_length=75)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    user = models.ForeignKey(AuthUser)
    group = models.ForeignKey(AuthGroup)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'


class AuthUserUserPermissions(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    user = models.ForeignKey(AuthUser)
    permission = models.ForeignKey(AuthPermission)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'


class Capacity(models.Model):
    capacityid = models.IntegerField(db_column='capacityId', primary_key=True)  # Field name made lowercase.
    spaceid = models.ForeignKey('Space', db_column='spaceId')  # Field name made lowercase.
    type = models.CharField(max_length=200)
    capacity = models.IntegerField()
    createtimestamp = models.DateTimeField(db_column='createTimestamp')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'capacity'


class Cost(models.Model):
    costid = models.IntegerField(db_column='costId', primary_key=True)  # Field name made lowercase.
    spaceid = models.ForeignKey('Space', db_column='spaceId')  # Field name made lowercase.
    cost = models.DecimalField(max_digits=10, decimal_places=0)
    deposit = models.DecimalField(max_digits=10, decimal_places=0, blank=True, null=True)
    cleaningfee = models.DecimalField(db_column='cleaningFee', max_digits=10, decimal_places=0, blank=True, null=True)  # Field name made lowercase.
    startrange = models.CharField(db_column='startRange', max_length=500, blank=True)  # Field name made lowercase.
    endrange = models.CharField(db_column='endRange', max_length=500, blank=True)  # Field name made lowercase.
    dayofweek = models.CharField(db_column='dayOfWeek', max_length=50, blank=True)  # Field name made lowercase.
    details = models.CharField(max_length=500, blank=True)
    nonprofitdiscount = models.CharField(db_column='nonProfitDiscount', max_length=50, blank=True)  # Field name made lowercase.
    createtimestamp = models.DateTimeField(db_column='createTimestamp')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'cost'


class Detail(models.Model):
    detailid = models.IntegerField(db_column='detailId', primary_key=True)  # Field name made lowercase.
    spaceid = models.ForeignKey('Space', db_column='spaceId')  # Field name made lowercase.
    title = models.CharField(max_length=100)
    description = models.CharField(max_length=100)
    createtimestamp = models.DateTimeField(db_column='createTimestamp')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'detail'


class DjangoAdminLog(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.IntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', blank=True, null=True)
    user = models.ForeignKey(AuthUser)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    name = models.CharField(max_length=100)
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'


class DjangoMigrations(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Inclusion(models.Model):
    inclusionid = models.IntegerField(db_column='inclusionId', primary_key=True)  # Field name made lowercase.
    spaceid = models.ForeignKey('Space', db_column='spaceId')  # Field name made lowercase.
    inclusion = models.CharField(max_length=1000)
    count = models.IntegerField(blank=True, null=True)
    createtimestamp = models.DateTimeField(db_column='createTimestamp')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'inclusion'


class Requirement(models.Model):
    requirementid = models.IntegerField(db_column='requirementId', primary_key=True)  # Field name made lowercase.
    spaceid = models.ForeignKey('Space', db_column='spaceId')  # Field name made lowercase.
    requirement = models.CharField(max_length=1000)
    createtimestamp = models.DateTimeField(db_column='createTimestamp')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'requirement'


class Space(models.Model):
    spaceid = models.IntegerField(db_column='spaceId', primary_key=True)  # Field name made lowercase.
    venueid = models.ForeignKey('Venue', db_column='venueId')  # Field name made lowercase.
    name = models.CharField(max_length=200)
    description = models.CharField(max_length=1000, blank=True)
    squarefootage = models.IntegerField(db_column='squareFootage', blank=True, null=True)  # Field name made lowercase.
    width = models.IntegerField(blank=True, null=True)
    length = models.IntegerField(blank=True, null=True)
    height = models.IntegerField(blank=True, null=True)
    createtimestamp = models.DateTimeField(db_column='createTimestamp')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'space'


class SpaceAttributes(models.Model):
    spaceid = models.ForeignKey(Space, db_column='spaceId', primary_key=True)  # Field name made lowercase.
    attributeid = models.ForeignKey(Attribute, db_column='attributeId')  # Field name made lowercase.
    value = models.CharField(max_length=100, blank=True)
    details = models.CharField(max_length=1000, blank=True)
    createtimestamp = models.DateTimeField(db_column='createTimestamp')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'space_attributes'


class SpaceImages(models.Model):
    spaceimageid = models.IntegerField(db_column='spaceImageId', primary_key=True)  # Field name made lowercase.
    spaceid = models.ForeignKey(Space, db_column='spaceId')  # Field name made lowercase.
    image = models.CharField(max_length=1000, blank=True)
    order = models.IntegerField(blank=True, null=True)
    createtimestamp = models.DateTimeField(db_column='createTimestamp')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'space_images'


class Venue(models.Model):
    venueid = models.IntegerField(db_column='venueId', primary_key=True)  # Field name made lowercase.
    name = models.CharField(max_length=200)
    description = models.TextField(blank=True)
    mission = models.TextField(blank=True)
    address = models.CharField(max_length=1000, blank=True)
    address2 = models.CharField(max_length=1000, blank=True)
    city = models.CharField(max_length=100, blank=True)
    state = models.CharField(max_length=50, blank=True)
    zipcode = models.CharField(max_length=50, blank=True)
    phonenumber = models.CharField(db_column='phoneNumber', max_length=50, blank=True)  # Field name made lowercase.
    email = models.CharField(max_length=100, blank=True)
    createtimestamp = models.DateTimeField(db_column='createTimestamp')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'venue'


class VenueAttributes(models.Model):
    venueid = models.ForeignKey(Venue, db_column='venueId', primary_key=True)  # Field name made lowercase.
    attributeid = models.ForeignKey(Attribute, db_column='attributeId')  # Field name made lowercase.
    value = models.CharField(max_length=100, blank=True)
    details = models.CharField(max_length=1000, blank=True)
    createtimestamp = models.DateTimeField(db_column='createTimestamp')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'venue_attributes'


class VenueImages(models.Model):
    venueimageid = models.IntegerField(db_column='venueImageId', primary_key=True)  # Field name made lowercase.
    venueid = models.ForeignKey(Venue, db_column='venueId')  # Field name made lowercase.
    image = models.CharField(max_length=1000, blank=True)
    order = models.IntegerField(blank=True, null=True)
    createtimestamp = models.DateTimeField(db_column='createTimestamp')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'venue_images'
