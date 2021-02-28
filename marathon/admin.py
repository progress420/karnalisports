from django.contrib import admin

from .models import Slider, Testemonial, Marathon

class SliderAdmin(admin.ModelAdmin):
    list_display = ('title', 'image_order','link_title','link','short_description',)
admin.site.register(Slider, SliderAdmin)

admin.site.register(Testemonial)
admin.site.register(Marathon)