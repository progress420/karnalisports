from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from .views import homepage

urlpatterns = [
    # path('', HomePageView.as_view(), name='home'),
    path('', homepage, name='home'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)