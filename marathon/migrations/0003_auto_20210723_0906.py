# Generated by Django 3.2.5 on 2021-07-23 09:06

import cloudinary.models
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('marathon', '0002_auto_20210723_0840'),
    ]

    operations = [
        migrations.RenameField(
            model_name='affiliation',
            old_name='image',
            new_name='logo',
        ),
        migrations.AddField(
            model_name='marathon',
            name='map_image',
            field=cloudinary.models.CloudinaryField(blank=True, max_length=255, verbose_name='image/marathon'),
        ),
    ]
