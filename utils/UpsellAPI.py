# import json
# import websocket
# import pprint
# import ssl
# # import Apireposebody
# from websocket import create_connection
#
#
# ws = create_connection('wss://cloud-stg.calix.com/sockjs/888/q495vp66/websocket',sslopt={"cert_reqs": ssl.CERT_NONE})
#
#
#
# class upsell:
#  def WebsocketConnection(self):
#     try:
#         result = ws.recv()
#         print('Result: {}'.format(result))
#         result = ws.recv()
#         print('Result: {}'.format(result))
#         ws.send(json.dumps([json.dumps({'msg': 'connect', 'version': '1', 'support': ['1', 'pre2', 'pre1']})]))
#         result = ws.recv()
#         print('Result: {}'.format(result))
#         return ('Result: {}'.format(result))
#     except  Exception  as e:
#        return ("Oops!",e.__class__,"occured")
#  def login(self):
#      try:
#          msg = ["{\"msg\":\"method\",\"method\":\"cloudLogin\",\"params\":[{\"username\":\"implementation@allophone.net\",\"password\":\"Impl7583\",\"clientLocalTime\":1591687526276,\"offsetTimeZone\":-330,\"loginType\":\"local\",\"logoutUrl\":\"/login\"}],\"id\":\"cloudLogin\"}"]
#
#          ws.send(json.dumps(msg, sort_keys=True))
#          result = ws.recv()
#          createsegment = ws.recv()
#          print('login Response Response: {}'.format(createsegment))
#          sliceresult = createsegment[1:]
#          sliceresult = json.loads(sliceresult)
#          print(sliceresult)
#          print('Result After slice: {}'.format(sliceresult))
#          as_dict = json.loads(sliceresult[0])
#          global Clientid
#          global orgId
#          Clientid=as_dict['result']['data']['_id']
#          orgId=as_dict['result']['data']['orgId']
#          print('Result of ClientId: {}'.format(Clientid))
#          print('Result of Orgid: {}'.format(orgId))
#          return ('Result: {}'.format(as_dict))
#      except  Exception  as e:
#          return ("Oops!", e.__class__, "occured")
#  def createtargetsegment(self):
#     try:
#         msg = ["{\"msg\":\"method\",\"method\":\"createMarketingTargetSegmentation\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":\"All\",\"location\":null,\"period\":\"last-28d\",\"name\":\"automation\",\"desc\":\"validation purpose for automation\",\"filter\":{\"name\":\"automation\",\"desc\":\"validation purpose for automation\",\"region\":\"All\",\"technologyType\":[],\"serviceTier\":[],\"userType\":[],\"customerType\":[],\"numOfDevices\":\"\",\"hasCalixSmartHomeApp\":true,\"configuredProfiles\":\"\"},\"countTimestamp\":\"2020-06-17\"}],\"id\":\"createMarketingTargetSegmentation\"}"]
#
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         createsegment = ws.recv()
#         print('Target Segmentation - Created Response Response: {}'.format(createsegment))
#         sliceresult = createsegment[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         Leftmenulist = json.loads(string_input)['result']
#         return (Leftmenulist)
#         return ('Result: {}'.format(createsegment))
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#  def UpsellData(self):
#     try:
#         # msg = ["{\"msg\":\"method\",\"method\":\"marketingTargetSegmentationTargetUserReport\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":\"all\",\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":\"all\",\"timezone\":\"05.30\",\"data\":{\"name\":\"automation\",\"desc\":\"validation purpose for automation\",\"region\":\"All\",\"technologyType\":[],\"serviceTier\":[],\"userType\":[],\"customerType\":[],\"numOfDevices\":\"\",\"hasCalixSmartHomeApp\":true,\"configuredProfiles\":\"\"}}],\"id\":\"marketingTargetSegmentationTargetUserReport\"}"]
#         msg = Apireposebody.Map_Data_for_All_Subscribers
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         Leftmenulistdata = ws.recv()
#         sliceresult = Leftmenulistdata[1:]
#         sliceresult = json.loads(sliceresult)
#         string_input = ''.join(str(s) for s in sliceresult)
#         Leftmenulist_Data = json.loads(string_input)['result'][0]
#         print(Leftmenulist_Data)
#         getaccountNumber = Leftmenulist_Data['accountNumber']
#         getaccountName = Leftmenulist_Data['name']
#         getphonenumber = Leftmenulist_Data['phoneNumber']
#         Serviceaddress = Leftmenulist_Data['serviceAddress']
#         # Billingaddress = Leftmenulist_Data['billingAddress']
#         # email= Leftmenulist_Data['email']
#         # usoc = Leftmenulist_Data['usoc']
#         serviceTier = Leftmenulist_Data['serviceTier']
#         region = Leftmenulist_Data['region']
#         location = Leftmenulist_Data['location']
#         # wifiScore = Leftmenulist_Data['wifiScore']
#         # hasWap = Leftmenulist_Data['hasWap']
#         # numOfDevices = Leftmenulist_Data['numOfDevices']
#         technologyType = Leftmenulist_Data['technologyType']
#         customerType = Leftmenulist_Data['customerType']
#         # optOut = Leftmenulist_Data['optOut']
#         downloadSpeed = Leftmenulist_Data['downloadSpeed']
#         uploadSpeed = Leftmenulist_Data['uploadSpeed']
#         # lat = Leftmenulist_Data['lat']
#         # lng = Leftmenulist_Data['lng']
#         attainableRate = Leftmenulist_Data['attainableRate']
#         # curFee = Leftmenulist_Data['curFee']
#         # maxFee = Leftmenulist_Data['maxFee']
#         # upUsage = Leftmenulist_Data['upUsage']
#         # downUsage = Leftmenulist_Data['downUsage']
#         # totalUsage = Leftmenulist_Data['totalUsage']
#         # streaming = Leftmenulist_Data['streaming']
#         # social = Leftmenulist_Data['social']
#         # gaming = Leftmenulist_Data['gaming']
#         # wfh = Leftmenulist_Data['wfh']
#         # streamingUsage = Leftmenulist_Data['streamingUsage']
#         # gamingUsage = Leftmenulist_Data['gamingUsage']
#         # wfh_usage = Leftmenulist_Data['wfh_usage']
#         # field1 = Leftmenulist_Data['field1']
#         # field2 = Leftmenulist_Data['field2']
#         # field3 = Leftmenulist_Data['field3']
#         # field4 = Leftmenulist_Data['field4']
#         Check = 'N/A'
#         Upselldatalist = [getaccountNumber, getaccountName, getphonenumber, Serviceaddress, serviceTier, region,
#                                location, technologyType, customerType, downloadSpeed, uploadSpeed, attainableRate
#             , Check]
#         print(Upselldatalist)
#         return (Upselldatalist)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def previewcount(self):
#      try:
#          msg = ["{\"msg\":\"method\",\"method\":\"marketingUpsellSegmentationUserCount\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"_id\":\"eGnGjQPGZsKHHX2su\",\"region\":\"All\",\"location\":null,\"period\":\"last-28d\",\"name\":\"automation\",\"desc\":\"validation purpose for automation\",\"filter\":{\"name\":\"automation\",\"desc\":\"validation purpose for automation\",\"technologyType\":[],\"serviceTier\":[],\"userType\":[],\"customerType\":[],\"numOfDevices\":\"\",\"hasCalixSmartHomeApp\":true,\"configuredProfiles\":\"\"}}],\"id\":\"marketingUpsellSegmentationUserCount\"}"]
#          # msg= Apireposebody.Target_Segmentation
#          print(msg)
#          ws.send(json.dumps(msg, sort_keys=True))
#          result = ws.recv()
#          TargetSegmentationUser_count = ws.recv()
#          print('Click Edit Icon -> Click Preview Response: {}'.format(TargetSegmentationUser_count))
#          sliceresult = TargetSegmentationUser_count[1:]
#          sliceresult = json.loads(sliceresult)
#          print(sliceresult)
#          print('Result After slice: {}'.format(sliceresult))
#          string_input = ''.join(str(s) for s in sliceresult)
#          print(string_input)
#          countdata = json.loads(string_input)['result']
#          return (countdata)
#          ws.close()
#      except  Exception  as e:
#          return ("Oops!", e.__class__, "occured")
#
# connectionObj=upsell()
# # connectionObj.WebsocketConnection()
# # connectionObj.login()
# # connectionObj.UpsellData()
#
# # # Map Data - for All Subscribers or Selected Item in Left Menu list
# #
# # # msg = Apireposebody.Map_Data_for_All_Subscribers
# # # ws.send(json.dumps(msg, sort_keys=True))
# # # result = ws.recv()
# # #
# # # MapLeftmenulistdata = ws.recv()
# # # print('Map Data - for All Subscribers or Selected Item in Left Menu list Response: {}'.format(MapLeftmenulistdata))
# #
# # # Get Map Data on Left menu selection CHANGE
# #
# # msg = Apireposebody.Map_Data_Left_menu_selection_CHANGE
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # MapLeftmenulistdata = ws.recv()
# # print('Get Map Data on Left menu selection CHANGE Response: {}'.format(MapLeftmenulistdata))
# #
# # # Click Edit Icon -> Click Preview
# #
# # msg = Apireposebody.Target_Segmentation_User_count
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # TargetSegmentationUser_count = ws.recv()
# # print('Click Edit Icon -> Click Preview Response: {}'.format(TargetSegmentationUser_count))
# #
# # # Target SegmentationClick Edit Icon -> Click Preview User Report
# #
# # msg = Apireposebody.Target_Segmentation_User_Report
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # TargetSegmentationUser_count = ws.recv()
# # print('Target SegmentationClick Edit Icon -> Click Preview User Report Response: {}'.format(TargetSegmentationUser_count))
# #
# # # Create new Target Segmentation - 1 New from values sending
# #
# # msg = Apireposebody.Target_Segmentation_Create_Newform_values_sending
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # TargetSegmentation_createform = ws.recv()
# # print('Create new Target Segmentation - 1 New from values sending Response: {}'.format(TargetSegmentation_createform))
# #
# # # Create new Target Segmentation - 2 - Map Data for created segment
# #
# # msg = Apireposebody.Target_Segmentation_Map_Data_created_segment
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # TargetSegmentation_createddata = ws.recv()
# # print('Create new Target Segmentation - 2 - Map Data for created segment Response: {}'.format(TargetSegmentation_createddata))
# #
# # # Create new Target Segmentation - 3 - Updated Leftmenu list after added new target segmentation
# #
# # msg = Apireposebody.Target_Segmentation_Updated_Leftmenu_list
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # TargetSegmentation_Updatedlist = ws.recv()
# # print('Create new Target Segmentation - 3 - Updated Leftmenu list after added new target segmentation Response: {}'.format(TargetSegmentation_Updatedlist))
# #
# # # Create new Target Segmentation - 4 - Count of each segmentations count values in brackets
# #
# # msg = Apireposebody.Target_Segmentation_Create_count
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # TargetSegmentation_Updatedcount = ws.recv()
# # print('Create new Target Segmentation - 4 - Count of each segmentations count values Response: {}'.format(TargetSegmentation_Updatedcount))
# #
# # # Create new Target Segmentation - 5 - Count of Mappable Latlongs
# #
# # msg = Apireposebody.Target_Segmentation_Create_count_Map
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # TargetSegmentation_UpdatedMapcount = ws.recv()
# # print('Create new Target Segmentation - 5 - Count of Mappable Latlongs Response: {}'.format(TargetSegmentation_UpdatedMapcount))
# #
# # # Saving/Updating form by clicking edit icon in Left menu list items - Update
# #
# # msg = Apireposebody.Target_Segmentation_Save
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # TargetSegmentation_Save = ws.recv()
# # print('Saving/Updating form by clicking edit icon in Left menu list items - Update Response: {}'.format(TargetSegmentation_Save))
# #
# # # Deleting by click edit icon -> click Delete - 1 - Delete request
# #
# # msg = Apireposebody.Target_Segmentation_Delete_Request
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # TargetSegmentation_DeleteRequest = ws.recv()
# # print('Deleting by click edit icon -> click Delete - 1 - Delete request Response: {}'.format(TargetSegmentation_DeleteRequest))
# #
# # # Deleting by click edit icon -> click Delete - 2 - Get updated Menu list
# #
# # msg = Apireposebody.Target_Segmentation_Delete_Update
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # TargetSegmentation_clickDelete = ws.recv()
# # print('Deleting by click edit icon -> click Delete - 2 - Get updated Menu list Response: {}'.format(TargetSegmentation_clickDelete))
# #
# # # Deleting by click edit icon -> click Delete - 3 - Get updated Menu list count
# #
# # msg = Apireposebody.Target_Segmentation_Delete_Update_count
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # TargetSegmentation_DeleteUpdatecount = ws.recv()
# # print('Deleting by click edit icon -> click Delete - 3 - Get updated Menu list count Response: {}'.format(TargetSegmentation_DeleteUpdatecount))
# #
# # # Deleting by click edit icon -> click Delete - 4 - Get previously selected item's map data
# #
# # msg = Apireposebody.Target_Segmentation_Delete_map_data
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # TargetSegmentation_DeleteMapData = ws.recv()
# # print('Deleting by click edit icon -> click Delete - 3 - Get updated Menu list count Response: {}'.format(TargetSegmentation_DeleteMapData))
