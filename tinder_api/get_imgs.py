from tinder_api_sms import *
import pprint;
import urllib;

#uses get_recs_v2() from features.py to return json with pfp urls 
def get_img_urls():
    recs = get_recs_v2()['data']['results']
    photo_dict = {}
    i = 0
    for person in recs:
        photo_dict[i] = recs[i]['user']['photos'][0]['url']
        i += 1
    return json.dumps(photo_dict)

#attemps to download images into the images/unclassified folder
def download_imgs():
    recs = get_recs_v2()['data']['results']
    i = 0
    for person in recs:
        urllib.request.urlretrieve(recs[i]['user']['photos'][0]['url'], 'tinderbot/images/unclassified/person{}.jpg'.format(i))
        i += 1


#json_str = json.dumps(photo_dict)
#print(json_str)

# writing to text.txt
#with open("test.txt", 'w') as f:
#    f.write(json_str)


# format of json
#json_str = json.dumps(get_recs_v2(), indent =3)
#print(json_str)



