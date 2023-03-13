from tinder_api_sms import *
import pprint;

def get_img_urls():
    recs = get_recs_v2()['data']['results']
    photo_dict = {}
    i = 0
    for person in recs:
        photo_dict[i] = recs[i]['user']['photos'][0]['url']
        i += 1
    #print(photo_dict)
    return json.dumps(photo_dict)




#json_str = json.dumps(photo_dict)
#print(json_str)

# writing to text.txt
#with open("test.txt", 'w') as f:
#    f.write(json_str)


# format of json
#json_str = json.dumps(get_recs_v2(), indent =3)
#print(json_str)



