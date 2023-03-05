from rest_framework import serializers
from .models import TinderBot

class TodoSerializer(serializers.ModelSerializer):
    class Meta:
        model = TinderBot
        fields = ('id', 'name', 'username', 'password')