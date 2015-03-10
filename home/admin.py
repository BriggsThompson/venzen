__author__ = 'briggs'

from django.contrib import admin
from home.models import Venue, Space, Capacity, Cost, SpaceAttribute, SpaceImage, VenueAttribute, VenueImage,\
    Inclusion, Attribute, Requirement, Detail


class VenueAdmin(admin.ModelAdmin):
    pass


class SpaceAdmin(admin.ModelAdmin):
    pass


class CostAdmin(admin.ModelAdmin):
    pass


class AttributeAdmin(admin.ModelAdmin):
    pass


class CapacityAdmin(admin.ModelAdmin):
    pass


class DetailAdmin(admin.ModelAdmin):
    pass


class InclusionAdmin(admin.ModelAdmin):
    pass


class RequirementAdmin(admin.ModelAdmin):
    pass


class SpaceAttributesAdmin(admin.ModelAdmin):
    pass


class VenueAttributesAdmin(admin.ModelAdmin):
    pass


class SpaceImagesAdmin(admin.ModelAdmin):
    pass


class VenueImagesAdmin(admin.ModelAdmin):
    pass


admin.site.register(Venue, VenueAdmin)
admin.site.register(Cost, CostAdmin)
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
