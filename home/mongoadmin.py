from old.models_bk_mongo import Venue2#, Space, Cost

__author__ = 'briggs'

# Import the MongoAdmin base class
from mongonaut.sites import MongoAdmin

# Import your custom models

class VenueAdmin(MongoAdmin):

    search_fields = ('name')
    readonly_fields = ('venueId')
    #prepopulated_fields = { 'spaces_costs_daysofweek' : ('mon', 'tue', 'wed',)}
    ordering = ('name', 'description', 'mission')

Venue2.mongoadmin = VenueAdmin()