# Generated by Django 3.1.7 on 2021-03-08 11:46

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('marathon', '0016_auto_20210308_1719'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='gallery',
            name='content_type',
        ),
        migrations.RemoveField(
            model_name='gallery',
            name='object_id',
        ),
    ]
