from django.shortcuts import render, HttpResponse
import pymongo

# Create your views here.
from rest_framework import viewsets
from .serializers import TodoSerializer
from .models import TinderBot

# Create your views here.

#client = pymongo.MongoClient("mongodb+srv://tinderbot:tinderbotadmin@cluster0.ad62g.mongodb.net/?retryWrites=true&w=majority")
#db = client.test

## viewsets automatically implements a table to be edited, but we can change this
class TinderBotView(viewsets.ModelViewSet):
    serializer_class = TodoSerializer
    queryset = TinderBot.objects.all()

    #@action(detail=False, methods=['get'])
    



    