from django.shortcuts import render
from django.contrib import messages

from .forms import NewUserForm

def registerview(request):
    if request.method == "POST":
        form = NewUserForm(request.POST)
        if form.isvalid():
            user = form.save()
            login(request, user)
            message.success(request, "Registration Success!!")
            return redirect("marathon:home")
        messages.error(request, "Unsuccessful!!!")
    form = NewUserForm
    return render(request=request, template_name="registration/register.html", context={"register_form":form})