from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from .views import homepage, bookingview, profileview

app_name = 'home_urls'

urlpatterns = [
    # path('', HomePageView.as_view(), name='home'),
    path('', homepage, name='home'),
    path('book/<slug:slug>', bookingview, name='book'),
    path('profile/', profileview, name='profile'),
]
# + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
