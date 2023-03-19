import serial
import json
import pymongo
import requests

myclient = pymongo.MongoClient("mongodb+srv://user:user@cluster0.womcndb.mongodb.net/?retryWrites=true&w=majority")
mydb = myclient["main"]
mycol = mydb["sensors"]

requrl = "http://192.168.137.214:300/button-status"

arduino = serial.Serial(port='COM11', baudrate=9600, timeout=8)

def write_read(x):
    arduino.write(bytes(x, 'utf-8'))
    # time.sleep(4)
    data = arduino.readline()
    return data

while True:
    response = requests.get(requrl)
    response_json = response.json()
    if response_json['status'] == True:
        num = str(5)
    else:
        num = str(0)
    value = write_read(num)
    newval = value.decode('utf-8')
    newval2 = json.loads(newval)
    x = mycol.insert_one(newval2)

    print(newval)
