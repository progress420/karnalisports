# Generated by Django 3.1.7 on 2021-03-19 07:54

import ckeditor.fields
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('marathon', '0025_auto_20210319_1320'),
    ]

    operations = [
        migrations.AddField(
            model_name='marathon',
            name='meta_description',
            field=ckeditor.fields.RichTextField(blank=True, null=True),
        ),
    ]
