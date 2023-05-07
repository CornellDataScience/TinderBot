import pickle
from predictions import train, predict
from argparse import Action
from tinder_api.features import *
from tinder_api.tinder_api import get_recs_v2
from tinder_api.get_imgs import get_img_urls
import urllib.request

import os

# Create your views here.
from viewsets import *
from views import *
from serializers import TodoSerializer
from status import *
from .models import *
from response import *

from .tinder_api.phone_auth_token import send_otp_code, get_refresh_token, get_api_token

# Create your views here.

# viewsets automatically implements a table to be edited, but we can change this


class TinderBotView(ViewSet):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Train the model using the classified images
        self.model = train("tinderbot/images/classified")

    @Action(methods=['get'], detail=False)
    def get_next_profile(self, request, *args, **kwargs):
        try:
            # Call the Tinder API to get the next profile's recommendations
            recommendations = get_recs_v2()[
                "data"]["results"]
            if not recommendations:
                return Response({"message": "No more recommendations"}, status=HTTP_200_OK)

            # Get the first recommendation (profile) from the list
            profile = recommendations[0]["user"]

            # Extract photos from the profile using the get_img_urls() function
            photos = get_img_urls(profile)

            # Save the first photo to a temporary file
            photo_url = photos[0]
            temp_photo_path = "temp.jpg"
            urllib.request.urlretrieve(photo_url, temp_photo_path)

            # Perform your model classification using the predict function
            prediction = predict(self.model, temp_photo_path)

            # Remove the temporary photo file
            os.remove(temp_photo_path)

            # Return the profile information, photos, and prediction
            response_data = {
                "profile": profile,
                "photos": photos,
                "prediction": prediction,
            }
            return Response(response_data, status=HTTP_200_OK)

        except Exception as e:
            return Response({"message": str(e)}, status=HTTP_500_INTERNAL_SERVER_ERROR)


class InitialMatchingView(ViewSet):
    @Action(methods=['get'], detail=False)
    def get_initial_images(self, request, *args, **kwargs):
        try:
            # Call the Tinder API to get the initial profiles
            recommendations = get_recs_v2()["data"]["results"]

            # Initialize an empty list to store the images
            images = []

            # Extract images from each profile and store them in the list
            for rec in recommendations:
                profile = rec["user"]
                photos = get_img_urls(profile)
                images.extend(photos)

            # Check if there are too many images
            if len(images) > 50:  # You can adjust this limit as needed
                return Response({"message": "Too many images to send at once"}, status=HTTP_500_INTERNAL_SERVER_ERROR)

            # Send the list of images as a response
            return Response({"images": images}, status=HTTP_200_OK)

        except Exception as e:
            return Response({"message": str(e)}, status=HTTP_500_INTERNAL_SERVER_ERROR)

    @Action(methods=['post'], detail=False)
    def initial_classifications(self, request, *args, **kwargs):
        try:
            # Get the classifications from the request
            classifications = request.data['responses']

            # Prepare the dataset for training
            data = []
            for img, label in classifications.items():
                data.append((img, label))

            # Train the model with the dataset
            model = train(data)

            # Create a new folder called 'trained_models' if it doesn't exist
            models_dir = 'trained_models'
            if not os.path.exists(models_dir):
                os.makedirs(models_dir)

            # Save the trained model to a .txt file
            model_path = os.path.join(models_dir, 'model.txt')
            with open(model_path, 'wb') as f:
                pickle.dump(model, f)

            return Response({"message": "Model trained and saved successfully"}, status=HTTP_200_OK)

        except Exception as e:
            return Response({"message": str(e)}, status=HTTP_500_INTERNAL_SERVER_ERROR)


class LoginApiView(ViewSet):
    # add permission to check if user is authenticated

    # 1. List all
    @Action(methods=['get'], detail=False)
    def get_token(self, request, *args, **kwargs):
        print(request.GET)
        refresh_token = get_refresh_token(request.GET.get(
            "otp_code"), request.GET.get("phone_number"))
        api_token = get_api_token(refresh_token)
        return Response(refresh_token, status=HTTP_200_OK)

    @Action(methods=['post'], detail=False)
    def get_sms(self, request, *args, **kwargs):
        '''
        Send SMS code to phone number
        '''
        req_body = request.data
        log_code = send_otp_code(req_body['phone_number'])

        return Response(log_code, status=HTTP_200_OK)

        todos = Todo.objects.filter(user=request.user.id)
        serializer = TodoSerializer(todos, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
