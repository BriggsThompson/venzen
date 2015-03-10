from datetime import datetime
from django.core.serializers import json
from django.db import models
from mongoengine import Document, StringField, DateTimeField, ListField, ReferenceField, IntField, FloatField, \
    EmbeddedDocumentField, EmbeddedDocument


# class Cost(EmbeddedDocument):
#     deposit = FloatField()
#     cleaningFee = FloatField()
#     startRange = DateTimeField()
#     endRange = DateTimeField()
#     daysOfWeek = ListField(StringField(regex="(Mo(n(day)?)?|Tu(e(sday)?)?|We(d(nesday)?)?|Th(u(rsday)?)?|Fr(i(day)?)?|Sa(t(urday)?)?|Su(n(day)?)?)", max_length=10))
#     details = StringField()
#     nonProfitDiscount = StringField(max_length=5)
#     createTimestamp = DateTimeField(default=datetime.now())
#
#
# class Space(EmbeddedDocument):
#     name = StringField(max_length=50)
#     description = StringField()
#     squareFootage = IntField()
#     width = IntField()
#     length = IntField()
#     height = IntField()
#     costs = ListField(EmbeddedDocumentField(Cost))
#     createTimestamp = DateTimeField(default=datetime.now())


class Venue2(Document):
    venueId = StringField(max_length=26, primary_key=True)
    name = StringField(max_length=100)
    description = StringField()
    mission = StringField()
    address = StringField(max_length=50)
    address2 = StringField(max_length=50)
    city = StringField(max_length=50, default='Austin')
    state = StringField(max_length=2, default='TX')
    zipcode = StringField(max_length=10)
    phoneNumber = StringField(max_length=13)
    email = StringField(max_length=75)
    createTimestamp = DateTimeField(default=datetime.now())
    #spaces = ListField(EmbeddedDocumentField(Space))



    
    
    
