from django.contrib import admin

from .models import (
    Slider, Testemonial, Marathon, MarathonCategory,
    FAQ, MarathonBookingCategory, MarathonBooking, 
    Itinerary, Timer, Affiliation, Gallery, MarathonGallery
)

admin.site.site_header = "Karnali Sports Admin"

class SliderAdmin(admin.ModelAdmin):
    list_display = ('title', 'image_tag', 'image_order','link_title','link','short_description',)
admin.site.register(Slider, SliderAdmin)

class TestemonialAdmin(admin.ModelAdmin):
    list_display = ('person', 'position',)
admin.site.register(Testemonial, TestemonialAdmin)

class GalleryInline(admin.StackedInline):   #tabularinline or stackedinline
    model = MarathonGallery

class ItineraryInline(admin.TabularInline):
    model = Itinerary

class MarathonAdmin(admin.ModelAdmin):
    list_display = ('name', 'date', 'tag', 'marathon_type', 'is_active', 'image_tag',)
    inlines = [
        GalleryInline,
        ItineraryInline,
    ]
admin.site.register(Marathon, MarathonAdmin)

class FaqInline(admin.StackedInline):
    model = FAQ

class MarathonCategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'short_description',)
    inlines = [
        FaqInline,
    ]
admin.site.register(MarathonCategory, MarathonCategoryAdmin) 

# admin.site.register(FAQ)
admin.site.register(MarathonBookingCategory)

# class MarathonBookingCategoryInline(admin.TabularInline):
#     model = MarathonBookingCategory

class MarathonBookingAdmin(admin.ModelAdmin):
    list_display = ('person_first_name',)
admin.site.register(MarathonBooking, MarathonBookingAdmin)

# admin.site.register(Itinerary)

class TimerAdmin(admin.ModelAdmin):
    list_display = ('marathon', 'is_active',)
admin.site.register(Timer, TimerAdmin)

class AffiliationAdmin(admin.ModelAdmin):
    list_display = ('name', 'image_tag',)
admin.site.register(Affiliation, AffiliationAdmin)

class GalleryAdmin(admin.ModelAdmin):
    list_display = ('image_tag', 'is_active',)
admin.site.register(Gallery, GalleryAdmin)

# admin.site.register(MarathonGallery)

