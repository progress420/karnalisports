from django.contrib import admin

from .models import (
    Marathon, MarathonCategory,
    FAQ, MarathonBookingCategory, MarathonBooking, 
    Itinerary, Affiliation,
)

admin.site.site_header = "Karnali Sports Admin"

class ItineraryInline(admin.TabularInline):
    model = Itinerary

class MarathonAdmin(admin.ModelAdmin):
    list_display = ('name', 'date', 'tag', 'marathon_type', 'is_active', 'image_tag', 'slug',)

    def change_view(self, request, object_id, extra_context=None):
        self.exclude = ('slug',)
        return super().change_view(request, object_id, extra_context)

    inlines = [
        # GalleryInline,
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

admin.site.register(MarathonBookingCategory)

class MarathonBookingAdmin(admin.ModelAdmin):
    list_display = ('person_first_name',)
admin.site.register(MarathonBooking, MarathonBookingAdmin)

class AffiliationAdmin(admin.ModelAdmin):
    list_display = ('name', 'image_tag',)
admin.site.register(Affiliation, AffiliationAdmin)
