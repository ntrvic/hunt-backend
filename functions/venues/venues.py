import requests,json

def lambda_handler(event, context):
    lat = str(event["lat"])
    lon = str(event["lon"])  
    url = 'https://api.foursquare.com/v2/venues/search?ll='+ lat +'%2C'+ lon +'&client_id=HVKU25NQ3MXCJKA5AKRTN13KOWXCLVUCBSYEFL2T1NIHPFTN&client_secret=WMGZFV4I2U2UYFM11SULCL4Y4VWUESUF00GA0ULTZR5MV4EX&v=20160501'
    response = requests.get(url)
    # go some analysis here
    # return result
    return response.text
       
