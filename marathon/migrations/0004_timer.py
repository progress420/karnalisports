# Generated by Django 3.1.7 on 2021-03-04 07:01

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('marathon', '0003_auto_20210304_1224'),
    ]

    operations = [
        migrations.CreateModel(
            name='Timer',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('time', models.TimeField()),
                ('marathon', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='marathon.marathon')),
            ],
        ),
    ]
