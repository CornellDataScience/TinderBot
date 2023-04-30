from django.shortcuts import render, HttpResponse
import pymongo
from rest_framework.decorators import action

# Create your views here.
from rest_framework import viewsets
from rest_framework.views import APIView
from .serializers import TodoSerializer
from rest_framework import status
from .models import TinderBot
from rest_framework.response import Response
from rest_framework.decorators import api_view

from .tinder_api.phone_auth_token import send_otp_code, get_refresh_token, get_api_token

# Create your views here.

#client = pymongo.MongoClient("mongodb+srv://tinderbot:tinderbotadmin@cluster0.ad62g.mongodb.net/?retryWrites=true&w=majority")
#db = client.test



## viewsets automatically implements a table to be edited, but we can change this
class TinderBotView(viewsets.ViewSet):
    @action(methods=['get'], detail=False)
    def get_next_profile(self, request, *args, **kwargs):
        '''
        Call Tinder API and recieve the next profile (profile) in this person's lineup
        Call result = model.classify(profile)
        Return both the image and result
        ''' 
        return

class InitialMatchingView(viewsets.ViewSet):
    @action(methods=['get'], detail=False)
    def get_initial_images(self, request, *args, **kwargs):
        '''
        Return all the inital images that the user should classify, in order 
        (IMG1, IMG2, etc.) This may be too much data to send over all at once, 
        so if it fails after attempting we should workshop it / google solutions
        ''' 
        return
    
    @action(methods=['post'], detail=False)
    def initial_classifications(self, request, *args, **kwargs):
        '''
        Request will contain the classifications, in order, like:
        {'IMG1.png': 1, 'IMG2.png':0, 'IMG3.png':1, ...}

        This function should prcoess the classifications, and call TRAIN_MODEL()

        Them model should be written to a .txt or stored to database,
        ''' 
        classifications = request.data['responses']
        
        return

class LoginApiView(viewsets.ViewSet):
    # add permission to check if user is authenticated

    # 1. List all
    @action(methods=['get'], detail=False)
    def get_token(self, request, *args, **kwargs):
        print(request.GET)
        refresh_token = get_refresh_token(request.GET.get("otp_code"), request.GET.get("phone_number"))
        api_token = get_api_token(refresh_token)
        return Response(refresh_token, status=status.HTTP_200_OK)

    @action(methods=['post'], detail=False)
    def get_sms(self, request, *args, **kwargs):
        '''
        Send SMS code to phone number
        '''
        req_body = request.data
        log_code = send_otp_code(req_body['phone_number'])
        
        return Response(log_code, status=status.HTTP_200_OK)

        todos = Todo.objects.filter(user = request.user.id)
        serializer = TodoSerializer(todos, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)


    