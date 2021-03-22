from django.db import models
from django.template.defaultfilters import truncatechars
from django.utils.html import format_html
import uuid

from marathon.models import Marathon

class Slider(models.Model):
    IMAGE_ORDER = (
        (1, 'First'),
        (2, 'Second'),
        (3, 'Third'),
        (0, 'None'),
    )
    title = models.CharField(max_length=200)
    description = models.TextField()
    image = models.ImageField(upload_to='slider/')
    image_order = models.IntegerField(choices=IMAGE_ORDER, default=0)
    link = models.URLField()
    link_title = models.CharField(max_length=200)

    class Meta:
        verbose_name_plural = "Sliders"

    def __str__(self):
        return self.title

    @property
    def short_description(self):
        return truncatechars(self.description, 20)

    def save(self, *args, **kwargs):
        if self.image_order:
            try:
                temp = Slider.objects.get(image_order=self.image_order)
                if self != temp:
                    temp.image_order = 0
                    temp.save()
            except Slider.DoesNotExist:
                pass
        super(Slider, self).save(*args, **kwargs)

    def image_tag(self):
        return format_html('<img href="{0}" src="{0}" width="150" height="auto" />'.format(self.image.url))

class Testemonial(models.Model):
    person = models.CharField(max_length=200)
    position = models.CharField(max_length=200)
    image = models.ImageField(upload_to='testemonial/')
    testemonial_text = models.TextField()

    def __str__(self):
        return self.person
    
    def image_tag(self):
        return format_html('<img href="{0}" src="{0}" width="100" height="auto" />'.format(self.image.url))

    @property
    def short_description(self):
        return truncatechars(self.testemonial_text, 40)

class Timer(models.Model):
    marathon = models.ForeignKey(Marathon, on_delete=models.CASCADE)
    is_active = models.BooleanField(default=False)

    class Meta:
        verbose_name_plural = 'Home Timer'

    def __str__(self):
        return self.marathon.name

    def save(self, *args, **kwargs):
        if self.is_active:
            try:
                temp = Timer.objects.get(is_active=True)
                if self != temp:
                    temp.is_active = False
                    temp.save()
            except Timer.DoesNotExist:
                pass
        super(Timer, self).save(*args, **kwargs)

