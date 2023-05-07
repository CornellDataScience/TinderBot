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
def download_imgs(index):
    recs = get_recs_v2()['data']['results']
    i = index*20 + 1
    count = 0
    for person in recs:
        #/Users/maxwang/CDS/TinderBot/images/unclassified/1.jpg 

        fname = '../images/unclassified/{}.jpg'.format(i)
        #isExist = os.path.exists(fname)
        #print(isExist)
        if(count +1 > len(recs)): break
        requesturl = recs[count]['user']['photos'][0]['url']
        #print(requesturl)

        urllib.request.urlretrieve(requesturl, fname)
        img_data = requests.get(requesturl).content
        with open(fname, 'wb') as handler:
            handler.write(img_data)
        #print(loc)
        i += 1
        count += 1
  


if __name__ == "__main__":
    download_imgs(1)