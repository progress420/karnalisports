from django.db import models
from django.template.defaultfilters import truncatechars
from django.core.validators import RegexValidator
from composite_field import CompositeField
from django_countries.fields import CountryField

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

class Distance(CompositeField):
    start = models.IntegerField()
    end = models.IntegerField()

class Marathon(models.Model):
    name = models.CharField(max_length=200)
    date = models.DateField()
    tag = models.CharField(max_length=200)
    marathon_type = models.ForeignKey(MarathonCategory, on_delete=models.RESTRICT)
    description = models.TextField()
    distance = Distance()
    location = models.CharField(max_length=100)
    is_active = models.BooleanField(default=False)

    def __str__(self):
        return self.name
        
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


class Address(CompositeField):
    street_address = models.CharField(max_length=100)
    address_l2 = models.CharField(max_length=100)
    city = models.CharField(max_length=100)
    state = models.CharField(max_length=100)
    zip_Code = models.IntegerField()
    country = CountryField()

class PersonInfo(CompositeField):
    GENDER = (
        ('M', 'Male'),
        ('F', 'Female'),
        ('T', 'Prefer Not to Answer'),
    )
    first_name = models.CharField(max_length=200)
    last_name = models.CharField(max_length=200)
    email = models.EmailField()
    phone_regex = RegexValidator(regex=r'^\+?1?\d{9,15}$', message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed.")
    mobile_number = models.CharField(validators=[phone_regex], max_length=17, blank=True) # validators should be a list
    gender = models.CharField(max_length=1, choices=GENDER, null=True)
    birthdate = models.DateField(null=True)
    nationality = models.CharField(max_length=100, null=True)
    passport_no = models.CharField(max_length=100, null=True)

    


class MarathonBooking(models.Model):
    person = PersonInfo()
    package = models.ForeignKey(MarathonBookingCategory, on_delete=models.RESTRICT)
    marathon = models.ForeignKey(Marathon, on_delete=models.CASCADE)
    address = Address()
    arrival_date = models.DateField()
    departure_date = models.DateField()
    others_text = models.TextField()
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









