from django.contrib import admin

from .models import (
    Slider, Testemonial, Timer,
)

class SliderAdmin(admin.ModelAdmin):
    list_display = ('title', 'image_tag', 'image_order','link_title','link','short_description',)
admin.site.register(Slider, SliderAdmin)

class TestemonialAdmin(admin.ModelAdmin):
    list_display = ('person', 'position', 'image_tag', 'short_description',)
admin.site.register(Testemonial, TestemonialAdmin)

class TimerAdmin(admin.ModelAdmin):
    list_display = ('marathon', 'is_active',)
admin.site.register(Timer, TimerAdmin)