# Generated by Django 3.1.7 on 2021-03-03 08:47

import django.core.validators
from django.db import migrations, models
import django.db.models.deletion
import django_countries.fields


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Marathon',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('date', models.DateField()),
                ('tag', models.CharField(max_length=200)),
                ('description', models.TextField()),
                ('distance_start', models.IntegerField()),
                ('distance_end', models.IntegerField()),
                ('location', models.CharField(max_length=100)),
                ('is_active', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='MarathonBookingCategory',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('description', models.TextField()),
                ('is_active', models.BooleanField()),
            ],
            options={
                'verbose_name_plural': 'Marathon Booking Categories',
            },
        ),
        migrations.CreateModel(
            name='MarathonCategory',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('description', models.TextField()),
            ],
            options={
                'verbose_name_plural': 'Marathon Categories',
            },
        ),
        migrations.CreateModel(
            name='Slider',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200)),
                ('description', models.TextField()),
                ('image', models.ImageField(upload_to='uploads/')),
                ('image_order', models.IntegerField(choices=[(1, 'First'), (2, 'Second'), (3, 'Third'), (0, 'None')], default=0)),
                ('link', models.URLField()),
                ('link_title', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Testemonial',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('person', models.CharField(max_length=200)),
                ('position', models.CharField(max_length=200)),
                ('image', models.ImageField(upload_to='testemonial/')),
                ('testemonial_text', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='MarathonBooking',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('person_first_name', models.CharField(max_length=200)),
                ('person_last_name', models.CharField(max_length=200)),
                ('person_email', models.EmailField(max_length=254)),
                ('person_mobile_number', models.CharField(blank=True, max_length=17, validators=[django.core.validators.RegexValidator(message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed.", regex='^\\+?1?\\d{9,15}$')])),
                ('person_gender', models.CharField(choices=[('M', 'Male'), ('F', 'Female'), ('T', 'Prefer Not to Answer')], max_length=1, null=True)),
                ('person_birthdate', models.DateField(null=True)),
                ('person_nationality', models.CharField(max_length=100, null=True)),
                ('person_passport_no', models.CharField(max_length=100, null=True)),
                ('address_street_address', models.CharField(max_length=100)),
                ('address_address_l2', models.CharField(max_length=100)),
                ('address_city', models.CharField(max_length=100)),
                ('address_state', models.CharField(max_length=100)),
                ('address_zip_Code', models.IntegerField()),
                ('address_country', django_countries.fields.CountryField(max_length=2)),
                ('arrival_date', models.DateField()),
                ('departure_date', models.DateField()),
                ('others_text', models.TextField()),
                ('visa_recommend', models.BooleanField()),
                ('agree_policy', models.BooleanField()),
                ('marathon', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='marathon.marathon')),
                ('package', models.ForeignKey(on_delete=django.db.models.deletion.RESTRICT, to='marathon.marathonbookingcategory')),
            ],
        ),
        migrations.AddField(
            model_name='marathon',
            name='marathon_type',
            field=models.ForeignKey(on_delete=django.db.models.deletion.RESTRICT, to='marathon.marathoncategory'),
        ),
        migrations.CreateModel(
            name='FAQ',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('question', models.CharField(max_length=400)),
                ('answer', models.CharField(max_length=600)),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='marathon.marathoncategory')),
            ],
        ),
    ]
