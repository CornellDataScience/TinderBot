from django.contrib import admin
from .models import TinderBot



class TinderBotAdmin(admin.ModelAdmin):
    list_display = ('name', 'username', 'password')

  
# Register your models here.

admin.site.register(TinderBot, TinderBotAdmin)

