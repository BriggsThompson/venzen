# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='spaceattribute',
            name='spaceAttributeId',
            field=models.IntegerField(default=1, serialize=False, primary_key=True, db_column='spaceAttributeId'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='spaceattribute',
            name='spaceId',
            field=models.ForeignKey(to='home.Space', db_column='spaceId'),
            preserve_default=True,
        ),
    ]
