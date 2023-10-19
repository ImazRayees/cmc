import json
import ssl

import websocket
import pprint
import Apireposebody

from websocket import create_connection
global Clientid
global orgId
ws = create_connection('wss://cloud-stg.calix.com/sockjs/888/q495vp66/websocket',sslopt={"cert_reqs": ssl.CERT_NONE})
class upsell:
 def WebsocketConnection(self):
    try:
# websocket.enableTrace(True)

        result = ws.recv()
        print('Result: {}'.format(result))

        result = ws.recv()
        print('Result: {}'.format(result))

        ws.send(json.dumps([json.dumps({'msg': 'connect', 'version': '1', 'support': ['1', 'pre2', 'pre1']})]))
        result = ws.recv()
        print('Result: {}'.format(result))
    except  Exception  as e:
       return ("Oops!",e.__class__,"occured")
 def cloudlogin(self):
     try:
         msg = Apireposebody.cloudLogin
         ws.send(json.dumps(msg, sort_keys=True))
         result = ws.recv()
         createsegment = ws.recv()
         print('login Response Response: {}'.format(createsegment))
         sliceresult = createsegment[1:]
         sliceresult = json.loads(sliceresult)
         print(sliceresult)
         print('Result After slice: {}'.format(sliceresult))
         as_dict = json.loads(sliceresult[0])
         Clientid = as_dict['result']['data']['_id']
         orgId = as_dict['result']['data']['orgId']
         print('Result of ClientId: {}'.format(Clientid))
         print('Result of Orgid: {}'.format(orgId))
     except  Exception  as e:
         return ("Oops!", e.__class__, "occured")

 def logintoken(self):
     try:
         msg = Apireposebody.Logintoken
         print(json.dumps(msg, sort_keys=True))
         ws.send(json.dumps(msg, sort_keys=True))
         result = ws.recv()
         print('Result: {}'.format(result))

         logintokenresponse = ws.recv()
         print('Login Response: {}'.format(logintokenresponse))
     except  Exception  as e:
         return ("Oops!", e.__class__, "occured")


 def user_preferences(self):
     try:
         msg = Apireposebody.user_preferences
         print(json.dumps(msg, sort_keys=True))
         ws.send(json.dumps(msg, sort_keys=True))
         result = ws.recv()
         print('Result: {}'.format(result))

         loguserdetails = ws.recv()
         print('Login Response: {}'.format(loguserdetails))
     except  Exception  as e:
         return ("Oops!", e.__class__, "occured")

ws.close()


