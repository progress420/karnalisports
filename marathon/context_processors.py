from .models import Marathon

def header_objects(request):
    marathon = Marathon.objects.exclude(is_active=False)[:5]
    return{
        'header_marathon' : marathon,
    }