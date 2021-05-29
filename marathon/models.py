from django.db import models
from django.template.defaultfilters import truncatechars
from django.core.validators import RegexValidator
# from django.contrib.contenttypes.fields import GenericForeignKey, GenericRelation
# from django.contrib.contenttypes.models import ContentType
from django.utils.html import format_html
import uuid
from django.utils.text import slugify

from composite_field import CompositeField
from django_countries.fields import CountryField
from ckeditor.fields import RichTextField


# Composite Fields 
class Distance(CompositeField):
    start = models.IntegerField()
    end = models.IntegerField()


class Address(CompositeField):
    street_address = models.CharField(max_length=100, verbose_name="Street Address")
    address_l2 = models.CharField(max_length=100, verbose_name="Address Line 2")
    city = models.CharField(max_length=100, verbose_name="City")
    state = models.CharField(max_length=100, verbose_name="State")
    zip_Code = models.IntegerField(verbose_name="ZIP/Postal")
    country = CountryField()


class PersonInfo(CompositeField):
    GENDER = (
        ('M', 'Male'),
        ('F', 'Female'),
        ('T', 'Prefer Not to Answer'),
    )
    first_name = models.CharField(max_length=200, verbose_name="First Name")
    last_name = models.CharField(max_length=200, verbose_name="Last Name")
    email = models.EmailField(verbose_name="Email")
    phone_regex = RegexValidator(regex=r'^\+?1?\d{9,15}$',
                                 message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed.")
    mobile_number = models.CharField(validators=[phone_regex], max_length=17, blank=True,
                                     verbose_name="Mobile Number")  # validators should be a list
    gender = models.CharField(max_length=1, choices=GENDER, null=True, verbose_name="Gender")
    birthdate = models.DateField(null=True, verbose_name="Date of Birth")
    nationality = models.CharField(max_length=100, null=True, verbose_name="Nationality")
    passport_no = models.CharField(max_length=100, null=True, verbose_name="Passport No.")


class MarathonCategory(models.Model):
    name = models.CharField(max_length=200)
    description = models.TextField()

    class Meta:
        verbose_name_plural = "Marathon Categories"

    def __str__(self):
        return self.name

    @property
    def short_description(self):
        return truncatechars(self.description, 20)


class Affiliation(models.Model):
    name = models.CharField(max_length=100)
    logo = models.ImageField(upload_to="uploads/", null=True, blank=True)

    def __str__(self):
        return self.name

    def image_tag(self):
        return format_html('<img href="{0}" src="{0}" width="150" height="auto" />'.format(self.logo.url))


class Marathon(models.Model):
    # id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=200)
    slug = models.SlugField(max_length=300,)
    date = models.DateField()
    time = models.TimeField(null=True)  # not null in production
    tag = models.CharField(max_length=200)
    marathon_type = models.ForeignKey(MarathonCategory, on_delete=models.RESTRICT)
    meta_description = RichTextField(blank=True, null=True)
    description = RichTextField(blank=True, null=True)
    image = models.ImageField(upload_to='uploads/', blank=True)
    map_image = models.ImageField(upload_to='uploads/', blank=True)
    distance = Distance()
    location = models.CharField(max_length=100)
    is_active = models.BooleanField(default=False)
    affiliation = models.ManyToManyField(Affiliation, blank=True)

    # gallery = GenericRelation(Gallery)

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        self.slug = slugify(str(self.name)+"-"+str(self.date)+"-booking page")
        if self.is_active:
            try:
                temp = Marathon.objects.get(marathon_type=self.marathon_type, is_active=True)
                if self != temp:
                    temp.is_active = False
                    temp.save()
            except Marathon.DoesNotExist:
                pass
        super(Marathon, self).save(*args, **kwargs)

    def image_tag(self):
        return format_html('<img href="{0}" src="{0}" width="150" height="auto" />'.format(self.image.url))

    


class FAQ(models.Model):
    question = models.CharField(max_length=400)
    answer = models.CharField(max_length=600)
    category = models.ForeignKey(MarathonCategory, on_delete=models.CASCADE)

    def __str__(self):
        return self.question


class MarathonBookingCategory(models.Model):
    name = models.CharField(max_length=200)
    description = models.TextField()
    is_active = models.BooleanField()

    class Meta:
        verbose_name_plural = "Marathon Booking Categories"

    def __str__(self):
        return self.name


class MarathonBooking(models.Model):
    person = PersonInfo()
    package = models.ForeignKey(MarathonBookingCategory, on_delete=models.RESTRICT)
    marathon = models.ForeignKey(Marathon, on_delete=models.CASCADE)
    address = Address()
    arrival_date = models.DateField(verbose_name="Arrival Date")
    departure_date = models.DateField(verbose_name="Departure Date")
    others_text = models.TextField(verbose_name="Other Specify")
    visa_recommend = models.BooleanField()
    agree_policy = models.BooleanField()

    class Meta:
        verbose_name_plural = 'Marathon Bookings'

    def __str__(self):
        return self.person_first_name


class Itinerary(models.Model):
    category = models.ForeignKey(Marathon, on_delete=models.CASCADE)
    date = models.DateField(null=True)
    day = models.IntegerField()
    description = RichTextField()

    class Meta:
        verbose_name_plural = 'Itineraries'

    def __str__(self):
        return (str(self.category) + " Day " + str(self.day))
