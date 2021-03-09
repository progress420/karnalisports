from django.contrib import admin

from .models import (
    Slider, Testemonial, Marathon, MarathonCategory,
    FAQ, MarathonBookingCategory, MarathonBooking, 
    Itinerary, Timer, Affiliation, Gallery, MarathonGallery
)

class SliderAdmin(admin.ModelAdmin):
    list_display = ('title', 'image_order','link_title','link','short_description',)
admin.site.register(Slider, SliderAdmin)

admin.site.register(Testemonial)

class GalleryInline(admin.StackedInline):   #tabularinline or stackedinline
    model = MarathonGallery

class ItineraryInline(admin.StackedInline):
    model = Itinerary

class MarathonAdmin(admin.ModelAdmin):
    list_display = ('name', 'date', 'tag', 'marathon_type', 'is_active',)
    inlines = [
        GalleryInline,
        ItineraryInline,
    ]
admin.site.register(Marathon, MarathonAdmin)

class MarathonCategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'short_description',)
admin.site.register(MarathonCategory, MarathonCategoryAdmin) 

admin.site.register(FAQ)
admin.site.register(MarathonBookingCategory)

class MarathonBookingAdmin(admin.ModelAdmin):
    list_display = ('person_first_name',)
admin.site.register(MarathonBooking, MarathonBookingAdmin)

# admin.site.register(Itinerary)
admin.site.register(Timer)
admin.site.register(Affiliation)

class GalleryAdmin(admin.ModelAdmin):
    list_display = ('image_tag', 'is_active',)
admin.site.register(Gallery, GalleryAdmin)

admin.site.register(MarathonGallery)

