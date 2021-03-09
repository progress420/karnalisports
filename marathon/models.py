from django.db import models
from django.template.defaultfilters import truncatechars
from django.core.validators import RegexValidator
from django.contrib.contenttypes.fields import GenericForeignKey, GenericRelation
from django.contrib.contenttypes.models import ContentType
from django.utils.html import format_html

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
    phone_regex = RegexValidator(regex=r'^\+?1?\d{9,15}$', message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed.")
    mobile_number = models.CharField(validators=[phone_regex], max_length=17, blank=True, verbose_name="Mobile Number") # validators should be a list
    gender = models.CharField(max_length=1, choices=GENDER, null=True, verbose_name="Gender")
    birthdate = models.DateField(null=True, verbose_name="Date of Birth")
    nationality = models.CharField(max_length=100, null=True, verbose_name="Nationality")
    passport_no = models.CharField(max_length=100, null=True, verbose_name="Passport No.")

# class Prize(CompositeField):
#     first_prize = models.IntegerField()
#     second_prize = models.IntegerField()
#     third_prize = models.IntegerField()


# Models starts from here


class Slider(models.Model):
    IMAGE_ORDER = (
        (1, 'First'),
        (2, 'Second'),
        (3, 'Third'),
        (0, 'None'),
    )
    title = models.CharField(max_length=200)
    description = models.TextField()
    image = models.ImageField(upload_to='uploads/')
    image_order = models.IntegerField(choices=IMAGE_ORDER, default=0)
    link = models.URLField()
    link_title = models.CharField(max_length=200)
    # isactive = models.BooleanField(default=True)

    def __str__(self):
        return self.title

    @property
    def short_description(self):
        return truncatechars(self.description, 20)

    def save(self, *args, **kwargs):
        if self.image_order:
            try:
                temp = Slider.objects.get(image_order=self.image_order)
                if self != temp:
                    temp.image_order = 0
                    temp.save()
            except Slider.DoesNotExist:
                pass
        super(Slider, self).save(*args, **kwargs)


class Testemonial(models.Model):
    person = models.CharField(max_length=200)
    position = models.CharField(max_length=200)
    image = models.ImageField(upload_to='testemonial/')
    testemonial_text = models.TextField()

    def __str__(self):
        return self.person

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
    # marathon = models.ForeignKey(Marathon, on_delete=models.CASCADE)

    def __str__(self):
        return self.name


class Marathon(models.Model):
    name = models.CharField(max_length=200)
    date = models.DateField()
    time = models.TimeField(null=True)   #not null in production
    tag = models.CharField(max_length=200)
    marathon_type = models.ForeignKey(MarathonCategory, on_delete=models.RESTRICT)
    description = RichTextField(blank=True, null=True)
    image = models.ImageField(upload_to='uploads/', blank=True)
    map_image = models.ImageField(upload_to='uploads/', blank=True)
    distance = Distance()
    location = models.CharField(max_length=100)
    # prize = Prize()
    is_active = models.BooleanField(default=False)
    affiliation = models.ManyToManyField(Affiliation, blank=True)
    # gallery = GenericRelation(Gallery)

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        if self.is_active:
            try:
                temp = Marathon.objects.get(marathon_type = self.marathon_type)
                if self != temp:
                    temp.is_active = False
                    temp.save()
            except Marathon.DoesNotExist:
                pass
        super(Marathon, self).save(*args, **kwargs)
        
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

    def __str__(self):
        return self.person_first_name

    # def get_absolute_url(self):
    #     return reverse("home")
    

class Itinerary(models.Model):
    category = models.ForeignKey(Marathon, on_delete=models.CASCADE)
    date = models.DateField(null=True)
    day = models.IntegerField()
    description = models.CharField(max_length=500)

    def __str__(self):
        return (str(self.category) + " Day " + str(self.day))

class Timer(models.Model):
    marathon = models.ForeignKey(Marathon, on_delete=models.CASCADE)
    time = models.TimeField()
    is_active = models.BooleanField(default=False)

    def __str__(self):
        return self.marathon.name

    def save(self, *args, **kwargs):
        if self.is_active:
            try: 
                temp = Timer.objects.get(is_active=True)
                if self != temp:
                    temp.is_active = False
                    temp.save()
            except Timer.DoesNotExist:
                pass
        super(Timer, self).save(*args, **kwargs)


# class Gallery(models.Model):
#     image = models.ImageField(upload_to='uploads/')
#     content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)
#     object_id = models.PositiveIntegerField()
#     content_object = GenericForeignKey('content_type', 'object_id')

#     class Meta:
#         verbose_name_plural = 'Galleries'

#     def __str__(self):
#         return str(self.content_type)
    

#     def image_tag(self):
#         return format_html('<img href="{0}" src="{0}" width="150" height="auto" />'.format(self.image.url))

class Gallery(models.Model):
    image = models.ImageField(upload_to='uploads/')
    is_active = models.BooleanField()

    class Meta:
        verbose_name_plural = 'Galleries'

    def __str__(self):
        return str(self.id)
    

    def image_tag(self):
        return format_html('<img href="{0}" src="{0}" width="150" height="auto" />'.format(self.image.url))

class MarathonGallery(Gallery):
    marathon = models.ForeignKey(Marathon, on_delete=models.CASCADE)


