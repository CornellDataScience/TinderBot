from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets
from .serializers import TodoSerializer
from .models import TinderBot

# Create your views here.

## viewsets automatically implements a table to be edited, but we can change this
class TinderBotView(viewsets.ModelViewSet):
    serializer_class = TodoSerializer
    queryset = TinderBot.objects.all()