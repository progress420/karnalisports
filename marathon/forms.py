from django import forms
from .models import MarathonBooking

class BookForm(forms.ModelForm):
    class Meta:
        model = MarathonBooking
        exclude = ['marathon',]