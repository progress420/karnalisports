from django.contrib import admin

from .models import GalleryCategory, Gallery, ImageGallery

class ImageGalleryInline(admin.TabularInline):
    model = ImageGallery

class GalleryAdmin(admin.ModelAdmin):
    list_display = ('name', 'category', 'is_active',)
    inlines = [
        ImageGalleryInline,
    ]
admin.site.register(Gallery, GalleryAdmin)

admin.site.register(GalleryCategory)