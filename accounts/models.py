from django.db import models
from django.contrib.auth.models import AbstractUser

class CustomUser(AbstractUser):
    mail = models.EmailField(blank=True, null=True)