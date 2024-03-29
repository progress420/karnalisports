# Generated by Django 3.2.5 on 2021-07-23 08:31

import cloudinary.models
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0002_alter_slider_image'),
    ]

    operations = [
        migrations.AlterField(
            model_name='slider',
            name='image',
            field=cloudinary.models.CloudinaryField(max_length=255, verbose_name='image/slider'),
        ),
        migrations.AlterField(
            model_name='testemonial',
            name='image',
            field=cloudinary.models.CloudinaryField(max_length=255, verbose_name='image/slider'),
        ),
    ]
