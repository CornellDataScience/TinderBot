from tinder_api_sms import *
#print(get_recommendations())
import pprint;
printer = pprint.PrettyPrinter(indent = 4);
recs = get_recommendations()["results"];
for person in recs:
    person_id = person["_id"];
    person_bio = person["bio"];
    print(person_bio);