from django.contrib import admin

# Register your models here.

from .models import Profile


class ProfileAdmin(admin.ModelAdmin):
    list_display = [ 'user' , 'slug' , 'headline', 'join_date']
    list_filter = ['headline' , 'join_date']
    search_fields = [ 'user__first_name', 'headline' , 'bio']
   



admin.site.register(Profile, ProfileAdmin)