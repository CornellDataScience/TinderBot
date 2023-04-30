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
class TinderBotView(viewsets.ModelViewSet):
    serializer_class = TodoSerializer
    queryset = TinderBot.objects.all()

    # define some endpoint getLogin(data) {
    #   // process data.username
    #  //  return httpResponse() }

    #@action(detail=False, methods=['get'])


class LoginApiView(viewsets.ViewSet):
    # add permission to check if user is authenticated

    # 1. List all
    @action(methods=['get'], detail=False)
    def get_token(self, request, *args, **kwargs):
        refresh_token = get_refresh_token(request.otp_code, request.phone_number)
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

    # 2. Create
    def post(self, request, *args, **kwargs):
        '''
        Create the Todo with given todo data
        '''
        data = {
            'task': request.data.get('task'), 
            'completed': request.data.get('completed'), 
            'user': request.user.id
        }
        serializer = TodoSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    



    