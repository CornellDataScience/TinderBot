from django.contrib import admin
from .models import TinderBot



class TinderBotAdmin(admin.ModelAdmin):
    list_display = ['username']

  
# Register your models here.

admin.site.register(TinderBot, TinderBotAdmin)

