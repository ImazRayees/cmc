# import json
# import ssl
# import Apireposebody
# import websocket
# import pprint
#
# from websocket import create_connection
# ws = create_connection('wss://cloud-stg.calix.com/sockjs/888/q495vp66/websocket',sslopt={"cert_reqs": ssl.CERT_NONE})
#
# class Retention:
#     def WebsocketConnection(self):
#         try:
#             result = ws.recv()
#             print('Result: {}'.format(result))
#             result = ws.recv()
#             print('Result: {}'.format(result))
#             ws.send(json.dumps([json.dumps({'msg': 'connect', 'version': '1', 'support': ['1', 'pre2', 'pre1']})]))
#             result = ws.recv()
#             print('Result: {}'.format(result))
#             return ('Result: {}'.format(result))
#         except  Exception  as e:
#             return ("Oops!", e.__class__, "occured")
#
#     def login(self):
#         try:
#             msg = [
#                 "{\"msg\":\"method\",\"method\":\"cloudLogin\",\"params\":[{\"username\":\"implementation@allophone.net\",\"password\":\"Impl7583\",\"clientLocalTime\":1591687526276,\"offsetTimeZone\":-330,\"loginType\":\"local\",\"logoutUrl\":\"/login\"}],\"id\":\"cloudLogin\"}"]
#
#             ws.send(json.dumps(msg, sort_keys=True))
#             result = ws.recv()
#             createsegment = ws.recv()
#             print('login Response Response: {}'.format(createsegment))
#             sliceresult = createsegment[1:]
#             sliceresult = json.loads(sliceresult)
#             print(sliceresult)
#             print('Result After slice: {}'.format(sliceresult))
#             as_dict = json.loads(sliceresult[0])
#             global Clientid
#             global orgId
#             Clientid = as_dict['result']['data']['_id']
#             orgId = as_dict['result']['data']['orgId']
#             print('Result of ClientId: {}'.format(Clientid))
#             print('Result of Orgid: {}'.format(orgId))
#             return ('Result: {}'.format(as_dict))
#         except  Exception  as e:
#             return ("Oops!", e.__class__, "occured")
#
#     def createprofile(self):
#         try:
#             msg = ["{\"msg\":\"method\",\"method\":\"createMarketingRetentionSegmentation\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":\"All\",\"location\":null,\"period\":\"last-28d\",\"name\":\"automation\",\"desc\":\"validation purpose for automation\",\"filter\":{\"name\":\"automation\",\"desc\":\"validation purpose for automation\",\"region\":\"All\",\"technologyType\":[],\"serviceTier\":[],\"userType\":[],\"customerType\":[],\"numOfDevices\":\"\",\"hasCalixSmartHomeApp\":true,\"configuredProfiles\":\"\"},\"countTimestamp\":\"2020-06-23\"}],\"id\":\"createMarketingRetentionSegmentation\"}"]
#             ws.send(json.dumps(msg, sort_keys=True))
#             result = ws.recv()
#             createsegment = ws.recv()
#             print('Retention Segmentation - Created Response Response: {}'.format(createsegment))
#             sliceresult = createsegment[1:]
#             sliceresult = json.loads(sliceresult)
#             print(sliceresult)
#             print('Result After slice: {}'.format(sliceresult))
#             string_input = ''.join(str(s) for s in sliceresult)
#             print(string_input)
#             Leftmenulist = json.loads(string_input)['result']
#             return (Leftmenulist)
#             return ('Result: {}'.format(createsegment))
#         except Exception as e:
#            return ("Oops!", e.__class__, "occured")
#
#     def RetentionData(self):
#         try:
#             # msg = ["{\"msg\":\"method\",\"method\":\"marketingRetentionSegmentationUserReport\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":\"all\",\"timezone\":\"05.30\",\"data\":{\"name\":\"automation\",\"desc\":\"validation purpose for automation\",\"region\":\"All\",\"technologyType\":[],\"serviceTier\":[],\"userType\":[],\"customerType\":[],\"numOfDevices\":\"\",\"hasCalixSmartHomeApp\":true,\"configuredProfiles\":\"\"},\"polygon\":null,\"attainableRate\":false}],\"id\":\"marketingRetentionSegmentationUserReport\"}"]
#             msg = Apireposebody.Retention_Map_Data
#             ws.send(json.dumps(msg, sort_keys=True))
#             result = ws.recv()
#
#             Leftmenulistdata = ws.recv()
#             print('Target Segmentation - Left menu list Response: {}'.format(Leftmenulistdata))
#             sliceresult = Leftmenulistdata[1:]
#             sliceresult = json.loads(sliceresult)
#             print(sliceresult)
#             print('Result After slice: {}'.format(sliceresult))
#             string_input = ''.join(str(s) for s in sliceresult)
#             print(string_input)
#             Leftmenulist_Data = json.loads(string_input)['result'][0]
#             getaccountNumber = Leftmenulist_Data['accountNumber']
#             getaccountName = Leftmenulist_Data['name']
#             getphonenumber = Leftmenulist_Data['phoneNumber']
#             Serviceaddress = Leftmenulist_Data['serviceAddress']
#             # Billingaddress = Leftmenulist_Data['billingAddress']
#             # email= Leftmenulist_Data['email']
#             # usoc = Leftmenulist_Data['usoc']
#             serviceTier = Leftmenulist_Data['serviceTier']
#             region = Leftmenulist_Data['region']
#             location = Leftmenulist_Data['location']
#             # wifiScore = Leftmenulist_Data['wifiScore']
#             # hasWap = Leftmenulist_Data['hasWap']
#             # numOfDevices = Leftmenulist_Data['numOfDevices']
#             technologyType = Leftmenulist_Data['technologyType']
#             customerType = Leftmenulist_Data['customerType']
#             # optOut = Leftmenulist_Data['optOut']
#             downloadSpeed = Leftmenulist_Data['downloadSpeed']
#             uploadSpeed = Leftmenulist_Data['uploadSpeed']
#             # lat = Leftmenulist_Data['lat']
#             # lng = Leftmenulist_Data['lng']
#             attainableRate = Leftmenulist_Data['attainableRate']
#             # curFee = Leftmenulist_Data['curFee']
#             # maxFee = Leftmenulist_Data['maxFee']
#             # upUsage = Leftmenulist_Data['upUsage']
#             # downUsage = Leftmenulist_Data['downUsage']
#             # totalUsage = Leftmenulist_Data['totalUsage']
#             # streaming = Leftmenulist_Data['streaming']
#             # social = Leftmenulist_Data['social']
#             # gaming = Leftmenulist_Data['gaming']
#             # wfh = Leftmenulist_Data['wfh']
#             # streamingUsage = Leftmenulist_Data['streamingUsage']
#             # gamingUsage = Leftmenulist_Data['gamingUsage']
#             # wfh_usage = Leftmenulist_Data['wfh_usage']
#             # field1 = Leftmenulist_Data['field1']
#             # field2 = Leftmenulist_Data['field2']
#             # field3 = Leftmenulist_Data['field3']
#             # field4 = Leftmenulist_Data['field4']
#             Check = 'N/A'
#             Retensiondatalist = [getaccountNumber, getaccountName, getphonenumber, Serviceaddress, serviceTier, region,
#                               location, technologyType, customerType, downloadSpeed, uploadSpeed, attainableRate
#                 , Check]
#             print(Retensiondatalist)
#             return (Retensiondatalist)
#         except  Exception  as e:
#             return ("Oops!", e.__class__, "occured")
#     def previewcount_retention(self):
#         try:
#             msg = ["{\"msg\":\"method\",\"method\":\"marketingRetentionSegmentationUserCount\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":\"All\",\"location\":null,\"period\":\"last-28d\",\"name\":\"automation\",\"desc\":\"validation purpose for automation\",\"filter\":{\"name\":\"automation\",\"desc\":\"validation purpose for automation\",\"technologyType\":[],\"serviceTier\":[],\"userType\":[],\"customerType\":[],\"numOfDevices\":\"\",\"hasCalixSmartHomeApp\":true,\"configuredProfiles\":\"\"}}],\"id\":\"marketingRetentionSegmentationUserCount\"}"]
#             print(msg)
#             ws.send(json.dumps(msg, sort_keys=True))
#             result = ws.recv()
#             TargetSegmentationUser_count = ws.recv()
#             print('Click Edit Icon -> Click Preview Response: {}'.format(TargetSegmentationUser_count))
#             sliceresult = TargetSegmentationUser_count[1:]
#             sliceresult = json.loads(sliceresult)
#             print(sliceresult)
#             print('Result After slice: {}'.format(sliceresult))
#             string_input = ''.join(str(s) for s in sliceresult)
#             print(string_input)
#             countdata = json.loads(string_input)['result']
#             return (countdata)
#         except Exception as e:
#            return ("Oops!", e.__class__, "occured")
#
# connectionObj=Retention()
# # Retention page onload
#
# # msg = Apireposebody.Retention_page_onload
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # Retentiondata = ws.recv()
# # print('Retention page onload Response: {}'.format(Retentiondata))
#
# # Retention page onload Regions
#
# # msg = Apireposebody.Retention_region
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # RetentionRegiondata = ws.recv()
# # print('Retention page onload Regions Response: {}'.format(RetentionRegiondata))
# #
# #
# # # Retention page onload Location
# #
# # msg = Apireposebody.Retention_location
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # Retentionlocationdata = ws.recv()
# # print('Retention page onload Location Response: {}'.format(Retentionlocationdata))
# #
# #
# # # Retention Target Segmentation - Left menu's list
# #
# # msg = Apireposebody.Retention_Left_menu_list
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # Retentionmenudata = ws.recv()
# # print('Retention Target Segmentation - Left menu list Response: {}'.format(Retentionmenudata))
# #
# # # Retention Map Data - for All Subscribers or Selected Item in Left Menu list
# #
# # # msg = Apireposebody.Retention_Map_Data
# # # ws.send(json.dumps(msg, sort_keys=True))
# # # result = ws.recv()
# # #
# # # Retentionmapdata = ws.recv()
# # # print('Retention Map Data - for All Subscribers or Selected Item in Left Menu list Response: {}'.format(Retentionmapdata))
# #
# # # Retention Get Map Data on Left menu selection CHANGE - 1 Setting user's list item selection
# #
# # msg = Apireposebody.Retention_Change_selection_item
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # Retentiongetmapdata = ws.recv()
# # print('Retention Get Map Data on Left menu selection CHANGE - 1 Response: {}'.format(Retentiongetmapdata))
# #
# #
# # # Retention Get Map Data on Left menu selection CHANGE - 2  Getting Map data
# #
# # msg = Apireposebody.Retention_Change_selection_item_Map
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # Retentiongetmapdata1 = ws.recv()
# # print('Retention Get Map Data on Left menu selection CHANGE - 2 Response: {}'.format(Retentiongetmapdata1))
# #
# # # Retention Create Target Segmentation -> Save - Req 1
# #
# # msg = Apireposebody.Retention_Save_request
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # Retentionsavereq = ws.recv()
# # print('Retention Create Target Segmentation -> Save - Req 1 Response: {}'.format(Retentionsavereq))
# #
# # # Retention Create Target Segmentation -> Save - Req 2 - Map data for Created Segment
# #
# # msg = Apireposebody.Retention_Created_MAp
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # Retentionsavereq2 = ws.recv()
# # print('Retention Create Target Segmentation -> Save - Req 2 Response: {}'.format(Retentionsavereq2))
# #
# # # Create Target Segmentation -> Save - Req 3 - Updated List of Segments
# #
# # msg = Apireposebody.Retention_Created_Updated_list
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # Retentionsaverequpdated = ws.recv()
# # print('Retention Create Target Segmentation -> Save - Req 3 Response: {}'.format(Retentionsaverequpdated))
# #
# # # Create Target Segmentation -> Save - Req 4 - newly created segment's(createdleft menu item's) Mappable Latlong count
# #
# # msg = Apireposebody.Retention_Created_Updated_Map_list
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # RetentionsaverequpdatedMap = ws.recv()
# # print('Retention Create Target Segmentation -> Save - Req 4 Response: {}'.format(RetentionsaverequpdatedMap))
# #
# #
# # # Select any segement->click edit icon-> click preview 1 - Returns total users count
# #
# # msg = Apireposebody.Retention_Preview_count
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # RetentionPreviewcount = ws.recv()
# # print('Retention click preview 1 - Returns total users count Response: {}'.format(RetentionPreviewcount))
# #
# # # Select any segement->click edit icon-> click preview 2 - Returns MAP latlongs data
# #
# # msg = Apireposebody.Retention_Preview_MapData
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # RetentionPreviewMap = ws.recv()
# # print('Retention click preview 2 - Returns MAP latlongs data Response: {}'.format(RetentionPreviewMap))
# #
# # # Select any segement->click edit icon-> click preview 3 - Updates segments total users count
# #
# # msg = Apireposebody.Retention_Preview_Update_count
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # RetentionPreviewUpdatecount = ws.recv()
# # print('Retention click preview 3 - Updates segments total users count Response: {}'.format(RetentionPreviewUpdatecount))
# #
# # # Select any segement->click edit icon-> click Save -  Req 1 - Update form Data
# #
# # msg = Apireposebody.Retention_Save_Update
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # RetentionSaveUpdate = ws.recv()
# # print('Retention click Save -  Req 1 - Update form Data Response: {}'.format(RetentionSaveUpdate))
# #
# # # Select any segement->click edit icon-> click Save -  Req 2 - get Updated Map Latlong data
# #
# # # msg = Apireposebody.Retention_Save_Update_MapData
# # # ws.send(json.dumps(msg, sort_keys=True))
# # # result = ws.recv()
# # #
# # # RetentionSaveUpdateMap = ws.recv()
# # # print('Retention click Save -  Req 2 - Update Map Latlong data Data Response: {}'.format(RetentionSaveUpdateMap))
# #
# # # Select any segement->click edit icon-> click Save -  Req 3 - Update selected segmentation count
# #
# # msg = Apireposebody.Retention_Save_Update_count
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # RetentionSaveUpdatecount = ws.recv()
# # print('Retention click Save -  Req 3 - Update selected segmentation count Response: {}'.format(RetentionSaveUpdatecount))
# #
# # # Select any segement->click edit icon-> click Save -  Req 4 - Get updated Segmation List items
# #
# # msg = Apireposebody.Retention_Save_Update_list
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # RetentionSaveUpdatelist = ws.recv()
# # print('Retention click Save -  Req 3 - Get updated Segmation List items Response: {}'.format(RetentionSaveUpdatelist))
# #
# # # Deleting by click edit icon -> click Delete - 1 - Delete request
# #
# # msg = Apireposebody.Retention_delete_Request
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # RetentiondeleteRequest = ws.recv()
# # print('Retention Deleting by click edit icon -> click Delete - 1 - Delete request Response: {}'.format(RetentiondeleteRequest))
# #
# # # Deleting by click edit icon -> click Delete - 2 - Get updated Menu list
# #
# # msg = Apireposebody.Retention_delete_Menu_list
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # RetentiondeleteMenulist = ws.recv()
# # print('Retention click Delete - 2 - Get updated Menu list Response: {}'.format(RetentiondeleteMenulist))
# #
# # # Deleting by click edit icon -> click Delete - 3 - Get updated Menu list count
# #
# # msg = Apireposebody.Retention_delete_Menu_list_count
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # RetentiondeleteMenulistcount = ws.recv()
# # print('Retention click Delete - 3 - Get updated Menu list count Response: {}'.format(RetentiondeleteMenulistcount))
# #
# # # Deleting by click edit icon -> click Delete - 4 - Get previously selected item's map data
# #
# # msg = Apireposebody.Retention_delete_Menu_Map
# # ws.send(json.dumps(msg, sort_keys=True))
# # result = ws.recv()
# #
# # RetentiondeleteMenuMap = ws.recv()
# # print('Retention click Delete - 4 - Get previously selected items map data Response: {}'.format(RetentiondeleteMenuMap))
# #
# # ws.close()
