__author__ = 'briggs'

from django.contrib import admin
from home.models import Venue, Space, Capacity, SpaceAttribute, SpaceImage, VenueAttribute, VenueImage,\
    Inclusion, Attribute, Requirement, Detail, SpaceCapacity, VenueType, EventType


class VenueAdmin(admin.ModelAdmin):
    list_display = ('name', 'phoneNumber', 'email')


class SpaceAdmin(admin.ModelAdmin):
    list_display = ('get_venue', 'name')
    
    def get_venue(self, obj):
        return obj.venueId.name
    
    get_venue.short_description = 'Venue Name'


class CostAdmin(admin.ModelAdmin):
    pass


class AttributeAdmin(admin.ModelAdmin):
    
    list_display = ('type',)


class CapacityAdmin(admin.ModelAdmin):
    list_display = ('type',)


class DetailAdmin(admin.ModelAdmin):
    pass


class InclusionAdmin(admin.ModelAdmin):
    list_display = ('get_venue', 'get_space', 'inclusion')

    def get_venue(self, obj):
        return obj.spaceId.venueId.name
    
    def get_space(self, obj):
        return obj.spaceId.name

    get_venue.short_description = 'Venue Name'
    get_space.short_description = 'Space Name'


class RequirementAdmin(admin.ModelAdmin):
    pass


class SpaceAttributesAdmin(admin.ModelAdmin):
    list_display = ('get_venue', 'get_space', 'get_attribute')

    def get_venue(self, obj):
        return obj.spaceId.venueId.name

    def get_space(self, obj):
        return obj.spaceId.name

    def get_attribute(self, obj):
        return obj.attributeId.value

    get_venue.short_description = 'Venue Name'
    get_space.short_description = 'Space Name'
    get_attribute.short_description = 'Attribute Value'


class VenueAttributesAdmin(admin.ModelAdmin):
    pass


class SpaceImagesAdmin(admin.ModelAdmin):
    pass


class VenueImagesAdmin(admin.ModelAdmin):
    pass


class SpaceCapacityAdmin(admin.ModelAdmin):
    list_display = ('get_venue', 'get_space', 'get_capacity', 'capacity')

    def get_venue(self, obj):
        return obj.spaceId.venueId.name
    
    def get_space(self, obj):
        return obj.spaceId.name

    def get_capacity(self, obj):
        return obj.capacityId.type
    
    get_venue.short_description = 'Venue Name'
    get_space.short_description = 'Space Name'
    get_capacity.short_description = 'Type'


class VenueTypeAdmin(admin.ModelAdmin):
    list_display = ('type',)

class EventTypeAdmin(admin.ModelAdmin):
    list_display = ('type',)


class VenueEventAdmin(admin.ModelAdmin):
    list_display = ('get_venue', 'get_event', 'get_capacity')

    def get_venue(self, obj):
        return obj.venueId.name

    def get_event(self, obj):
        return obj.eventTypeId.type

    get_venue.short_description = 'Venue Name'
    get_event.short_description = 'Event Type'


admin.site.register(VenueType, VenueTypeAdmin)
admin.site.register(EventType, EventTypeAdmin)
admin.site.register(Venue, VenueAdmin)
admin.site.register(Space, SpaceAdmin)
admin.site.register(Attribute, AttributeAdmin)
admin.site.register(Capacity, CapacityAdmin)
admin.site.register(Detail, DetailAdmin)
admin.site.register(Inclusion, InclusionAdmin)
admin.site.register(Requirement, RequirementAdmin)
admin.site.register(SpaceAttribute, SpaceAttributesAdmin)
admin.site.register(VenueAttribute, VenueAttributesAdmin)
admin.site.register(SpaceImage, SpaceImagesAdmin)
admin.site.register(VenueImage, VenueImagesAdmin)
admin.site.register(SpaceCapacity, SpaceCapacityAdmin)
