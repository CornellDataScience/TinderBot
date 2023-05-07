from tinder_api_sms import *
import pprint;
import urllib.request;
import os

#uses get_recs_v2() from features.py to return json with pfp urls 
def get_img_urls():
    #print(get_recommendations())
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
    i = 1
    for person in recs:
        #/Users/maxwang/CDS/TinderBot/images/unclassified/1.jpg 

        fname = '/Users/maxwang/CDS/TinderBot/images/unclassified/{}.jpg'.format(i)
        #print(fname)
        #isExist = os.path.exists(fname)
        #print(isExist)
        #person{}.jpg'.format(i)
        #print(fname)
        requesturl = recs[i]['user']['photos'][0]['url']
        #print(requesturl)

        urllib.request.urlretrieve(requesturl, fname)
        img_data = requests.get(requesturl).content
        with open(fname, 'wb') as handler:
            handler.write(img_data)
        #print(loc)
        i += 1
        if i == 21: break
#TRY RUNNING THIS?
# # Adding user_agent information
# opener=urllib.request.build_opener()
# opener.addheaders=[('User-Agent','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1941.0 Safari/537.36')]
# urllib.request.install_opener(opener)




#json_str = json.dumps(photo_dict)
#print(json_str)

# writing to text.txt
#with open("test.txt", 'w') as f:
#    f.write(json_str)


# format of json
#json_str = json.dumps(get_recs_v2(), indent =3)
#print(json_str)



if __name__ == "__main__":
    download_imgs()