# Generated by Django 3.1.7 on 2021-03-09 07:37

import ckeditor.fields
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('marathon', '0021_auto_20210309_1320'),
    ]

    operations = [
        migrations.AlterField(
            model_name='marathon',
            name='description',
            field=ckeditor.fields.RichTextField(blank=True, null=True),
        ),
    ]
