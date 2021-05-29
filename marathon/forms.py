from django import forms
from django.db.models import fields
from django.forms import widgets
from django.forms.widgets import TextInput
from .models import MarathonBooking
# from crispy_forms_foundation.layout import Layout, Fieldset, SplitDateTimeField, Row, Column, ButtonHolder, Submit

class BookForm(forms.ModelForm):
    class Meta:
        model = MarathonBooking
        # fields = ['person_first_name', 'person_last_name',]
        exclude = ['marathon',]

        widgets = {
            'person_gender': forms.Select(attrs={
                'style': 'width:200px',
            }),
            'person_birthdate' : forms.DateInput(format='%Y-%m-%d', attrs={
                'class':'form-control',
                'style': 'width:200px',
                'type': 'date',
            }),
            'address_street_address': forms.TextInput(attrs={
                'style': 'width:100%',
            }),
            'address_address_l2': forms.TextInput(attrs={
                'style': 'width:100%',
            }),
            'arrival_date' : forms.DateInput(format='%Y-%m-%d', attrs={
                'class':'form-control',
                'style': 'width:200px',
                'type': 'date',
            }),
            'departure_date' : forms.DateInput(format='%Y-%m-%d', attrs={
                'class':'form-control',
                'style': 'width:200px',
                'type': 'date',
            }),            
            'others_text': forms.Textarea(attrs={
                'style': 'width:100%',
            }),
            'visa_recommend': forms.CheckboxInput(attrs={
                'style': 'width:20px',
            }),
            'agree_policy': forms.CheckboxInput( attrs={
                'style': 'width:20px',
                'required': 'You must accept the terms and conditions',
            }),            
        }
