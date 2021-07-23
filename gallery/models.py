from django.db import models
import uuid
from django.utils.html import format_html
from cloudinary.models import CloudinaryField


class GalleryCategory(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=100)
    is_active = models.BooleanField(default=True)

    class Meta:
        verbose_name_plural = "Gallery Categories"

    def __str__(self):
        return self.name


class Gallery(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=100)
    category = models.ForeignKey(GalleryCategory, on_delete=models.RESTRICT)
    is_active = models.BooleanField(default=True)

    class Meta:
        verbose_name_plural = "Galleries"

    def __str__(self):
        return self.name

    def image_tag(self):
        return format_html('<img href="{0}" src="{0}" width="150" height="auto" />'.format(self.image.url))


class ImageGallery(models.Model):
    # image = models.ImageField(upload_to='gallery/')
    image = CloudinaryField('image/gallery')
    gallery = models.ForeignKey(Gallery, on_delete=models.RESTRICT)
