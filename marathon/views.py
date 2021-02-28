from django.views.generic import ListView
from django.shortcuts import render

from .models import Slider, Testemonial

# class HomePageView(ListView):
#     model = Slider
#     template_name = 'home.html'

def homepage(request):
    slider = Slider.objects.exclude(image_order=0)
    testemonial = Testemonial.objects.all()
    context = {
        'slider': slider,
        'testemonial': testemonial,
    }
    return render(request, "home.html", context)
