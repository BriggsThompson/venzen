# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import home.models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Attribute',
            fields=[
                ('attributeId', models.AutoField(serialize=False, primary_key=True, db_column='attributeId')),
                ('key', models.CharField(max_length=200)),
                ('value', models.CharField(max_length=1000, blank=True)),
                ('createTimestamp', models.DateTimeField(db_column='createTimestamp')),
            ],
            options={
                'db_table': 'attribute',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Capacity',
            fields=[
                ('capacityId', models.AutoField(serialize=False, primary_key=True, db_column='capacityId')),
                ('type', models.CharField(max_length=200)),
                ('createtimestamp', models.DateTimeField(db_column='createTimestamp')),
            ],
            options={
                'db_table': 'capacity',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Cost',
            fields=[
                ('costId', models.AutoField(serialize=False, primary_key=True, db_column='costId')),
                ('deposit', models.DecimalField(max_digits=10, decimal_places=0)),
                ('cleaningFee', models.DecimalField(decimal_places=0, max_digits=10, db_column='cleaningFee')),
                ('startRange', models.DateTimeField(null=True, db_column='startRange', blank=True)),
                ('endRange', models.DateTimeField(null=True, db_column='endRange', blank=True)),
                ('dayofweek', models.CharField(max_length=50, db_column='dayOfWeek', blank=True)),
                ('details', models.CharField(max_length=500, blank=True)),
                ('nonProfitDiscount', models.CharField(max_length=50, db_column='nonProfitDiscount', blank=True)),
                ('createTimestamp', models.DateTimeField(db_column='createTimestamp')),
            ],
            options={
                'db_table': 'cost',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Detail',
            fields=[
                ('detailId', models.AutoField(serialize=False, primary_key=True, db_column='detailId')),
                ('title', models.CharField(max_length=100)),
                ('description', models.CharField(max_length=100)),
                ('createTimestamp', models.DateTimeField(db_column='createTimestamp')),
            ],
            options={
                'db_table': 'detail',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Inclusion',
            fields=[
                ('inclusionId', models.AutoField(serialize=False, primary_key=True, db_column='inclusionId')),
                ('inclusion', models.CharField(max_length=1000)),
                ('count', models.IntegerField(null=True, blank=True)),
                ('createTimestamp', models.DateTimeField(db_column='createTimestamp')),
            ],
            options={
                'db_table': 'inclusion',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Requirement',
            fields=[
                ('requirementId', models.AutoField(serialize=False, primary_key=True, db_column='requirementId')),
                ('requirement', models.CharField(max_length=1000)),
                ('createTimestamp', models.DateTimeField(db_column='createTimestamp')),
            ],
            options={
                'db_table': 'requirement',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Space',
            fields=[
                ('spaceId', models.AutoField(serialize=False, primary_key=True, db_column='spaceId')),
                ('name', models.CharField(max_length=200)),
                ('description', models.TextField(blank=True)),
                ('squareFootage', models.IntegerField(null=True, db_column='squareFootage', blank=True)),
                ('width', models.IntegerField(null=True, blank=True)),
                ('length', models.IntegerField(null=True, blank=True)),
                ('height', models.IntegerField(null=True, blank=True)),
                ('createTimestamp', models.DateTimeField(db_column='createTimestamp')),
            ],
            options={
                'db_table': 'space',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='SpaceAttribute',
            fields=[
                ('spaceId', models.AutoField(serialize=False, verbose_name=home.models.Space, primary_key=True, db_column='spaceId')),
                ('value', models.CharField(max_length=100, blank=True)),
                ('details', models.TextField(blank=True)),
                ('createTimestamp', models.DateTimeField(db_column='createTimestamp')),
                ('attributeId', models.ForeignKey(to='home.Attribute', db_column='attributeId')),
            ],
            options={
                'db_table': 'space_attribute',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='SpaceCapacity',
            fields=[
                ('spaceCapacityId', models.AutoField(serialize=False, primary_key=True, db_column='spaceCapacityId')),
                ('capacity', models.IntegerField()),
                ('capacityId', models.ForeignKey(to='home.Capacity', db_column='capacityId')),
                ('spaceId', models.ForeignKey(to='home.Space', db_column='spaceId')),
            ],
            options={
                'db_table': 'space_capacity',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='SpaceImage',
            fields=[
                ('spaceImageId', models.AutoField(serialize=False, primary_key=True, db_column='spaceImageId')),
                ('image', models.CharField(max_length=1000, blank=True)),
                ('order', models.IntegerField(null=True, blank=True)),
                ('createTimestamp', models.DateTimeField(db_column='createTimestamp')),
                ('spaceId', models.ForeignKey(to='home.Space', db_column='spaceId')),
            ],
            options={
                'db_table': 'space_image',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Venue',
            fields=[
                ('venueId', models.AutoField(serialize=False, primary_key=True, db_column='venueId')),
                ('name', models.CharField(max_length=200)),
                ('description', models.TextField(blank=True)),
                ('mission', models.TextField(blank=True)),
                ('address', models.CharField(max_length=1000, blank=True)),
                ('address2', models.CharField(max_length=1000, blank=True)),
                ('city', models.CharField(max_length=100, blank=True)),
                ('state', models.CharField(max_length=50, blank=True)),
                ('zipcode', models.CharField(max_length=50, blank=True)),
                ('phoneNumber', models.CharField(max_length=50, db_column='phoneNumber', blank=True)),
                ('email', models.CharField(max_length=100, blank=True)),
                ('createTimestamp', models.DateTimeField(db_column='createTimestamp')),
            ],
            options={
                'db_table': 'venue',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='VenueAttribute',
            fields=[
                ('venueAttributeId', models.AutoField(serialize=False, primary_key=True, db_column='venueAttributeId')),
                ('value', models.CharField(max_length=100, blank=True)),
                ('details', models.TextField(blank=True)),
                ('createTimestamp', models.DateTimeField(db_column='createTimestamp')),
                ('attributeId', models.ForeignKey(to='home.Attribute', db_column='attributeId')),
                ('venueId', models.ForeignKey(to='home.Venue', db_column='venueId')),
            ],
            options={
                'db_table': 'venue_attribute',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='VenueImage',
            fields=[
                ('venueImageId', models.AutoField(serialize=False, primary_key=True, db_column='venueImageId')),
                ('image', models.CharField(max_length=1000, blank=True)),
                ('order', models.IntegerField(null=True, blank=True)),
                ('createTimestamp', models.DateTimeField(db_column='createTimestamp')),
                ('venueId', models.ForeignKey(to='home.Venue', db_column='venueId')),
            ],
            options={
                'db_table': 'venue_image',
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='space',
            name='venueId',
            field=models.ForeignKey(to='home.Venue', db_column='venueId'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='requirement',
            name='spaceId',
            field=models.ForeignKey(to='home.Space', db_column='spaceId'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='inclusion',
            name='spaceId',
            field=models.ForeignKey(to='home.Space', db_column='spaceId'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='detail',
            name='spaceId',
            field=models.ForeignKey(to='home.Space', db_column='spaceId'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='cost',
            name='spaceId',
            field=models.ForeignKey(to='home.Space', db_column='spaceId'),
            preserve_default=True,
        ),
    ]
