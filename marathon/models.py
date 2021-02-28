from django.db import models
from django.template.defaultfilters import truncatechars

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


class Testemonial(models.Model):
    person = models.CharField(max_length=200)
    position = models.CharField(max_length=200)
    image = models.ImageField(upload_to='testemonial/')
    testemonial_text = models.TextField()

    def __str__(self):
        return self.person

class Marathon(models.Model):
    MARATHON_TYPES=(
        (500, 'minimarathon'),
        (1000, 'marathon')
    )
    name = models.CharField(max_length=200)
    date = models.DateField()
    tag = models.CharField(max_length=200)
    marathon_type = models.IntegerField(choices=MARATHON_TYPES, default=500)
    description = models.TextField()

