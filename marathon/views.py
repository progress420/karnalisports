from django.views.generic import ListView, DetailView
from django.views.generic.edit import CreateView
from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse
from django.http import HttpResponseRedirect
from datetime import date

from .models import Slider, Testemonial, Marathon, MarathonBooking, FAQ
from .forms import BookForm

# class HomePageView(ListView):
#     model = Slider
#     template_name = 'home.html'

def homepage(request):
    slider = Slider.objects.exclude(image_order=0)
    testemonial = Testemonial.objects.all()
    marathon = Marathon.objects.exclude(is_active=False)
    context = {
        'slider': slider,
        'testemonial': testemonial,
        'marathon' : marathon,
        'range' : range(1,4),
    }
    return render(request, "index.html", context)

# class BookCreateView(CreateView):
#     model = MarathonBooking
#     template_name = "book.html"
#     fields = "__all__"

#     def get_success_url(self):
#         return reverse("home")

#     def get_context_data(self, **kwargs):
#         kwargs['faq'] = FAQ.objects.all()
#         kwargs['marathon'] = Marathon.objects.get(pk=kwargs(self.pk))
#         return super().get_context_data(**kwargs)

def bookingview(request, pk):
    # marathon = Marathon.objects.filter(pk=pk)
    marathon = get_object_or_404(Marathon, pk=pk)
    marathon_category = marathon.marathon_type
    faq = FAQ.objects.filter(category=marathon_category)
    date_present = date.today()
    if marathon.date > date_present:
        if request.method == "POST":
            form = BookForm(request.POST)
            if form.is_valid():
                marathonbooking = form.save(commit=False)
                marathonbooking.marathon = marathon
                marathonbooking.save()
                return redirect('home')
        else:
            form = BookForm() 
        return render(request, 'book.html', {'form':form, 'faq': faq})
    else:
        return render(request, 'book.html', {'faq':faq}) 

        




