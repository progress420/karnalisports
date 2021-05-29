from django.urls import path

from .views import registerview

urlpatterns = [
    path('register/', registerview, name='register'),
]
