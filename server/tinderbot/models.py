from django.db import models

# Create your models here.

class TinderBot(models.Model):
    name = models.CharField(max_length=30)
    username = models.CharField(max_length=30)
    password = models.CharField(max_length=30)

    def _str_(self):
        return self.name
