# Generated by Django 3.1.7 on 2021-03-04 07:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('marathon', '0004_timer'),
    ]

    operations = [
        migrations.AddField(
            model_name='timer',
            name='is_active',
            field=models.BooleanField(default=False),
        ),
    ]
