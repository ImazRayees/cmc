# import json
# import ssl
#
# import websocket
# import pprint
# # import Apireposebody
#
# from websocket import create_connection
#
# # websocket.enableTrace(True)
# ws = create_connection('wss://cloud-stg.calix.com/sockjs/888/q495vp66/websocket',sslopt={"cert_reqs": ssl.CERT_NONE})
# class SearchTab:
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
# # Search
#     def searchfilter(self):
#         try:
#             msg = Apireposebody.searchfilter
#             print(json.dumps(msg, sort_keys=True))
#             ws.send(json.dumps(msg, sort_keys=True))
#             result = ws.recv()
#
#             Searchfilter = ws.recv()
#             print('Result: {}'.format(Searchfilter))
#             return ('Result: {}'.format(Searchfilter))
#         except  Exception  as e:
#             return ("Oops!", e.__class__, "occured")
#
# # Search User Data
#     def searchtabledata(self):
#         try:
#                 msg = Apireposebody.searchTableData
#                 print(json.dumps(msg, sort_keys=True))
#                 ws.send(json.dumps(msg, sort_keys=True))
#                 result = ws.recv()
#                 print('Result: {}'.format(result))
#
#                 Search_User_Data = ws.recv()
#                 print('Search User Data: {}'.format(Search_User_Data))
#                 sliceresult = Search_User_Data[1:]
#                 sliceresult = json.loads(sliceresult)
#                 print(sliceresult)
#                 string_input = ''.join(str(s) for s in sliceresult)
#                 Searchfilter = json.loads(string_input)['result']['subscriber']
#                 print('Search: {}'.format(Searchfilter))
#                 getaccountNumber = Searchfilter['account']
#                 getaccountName = Searchfilter['name']
#                 getphonenumber = Searchfilter['phone']
#                 email = Searchfilter['email']
#                 Serviceaddress = Searchfilter['serviceAddress']
#                 serviceTier = Searchfilter['serviceTier']
#                 attainableRate = Searchfilter['attainableRate']
#                 upstreamServiceLimit = Searchfilter['upstreamServiceLimit']
#                 downstreamServiceLimit = Searchfilter['downstreamServiceLimit']
#                 speedTest = Searchfilter['speedTest']
#                 competitor = Searchfilter['competitor']
#                 streamingUsage = Searchfilter['streamingUsage']
#                 gamingUsage = Searchfilter['gamingUsage']
#                 totalUsage = Searchfilter['totalUsage']
#                 wifiScore = Searchfilter['wifiScore']
#                 connectDevicesCount = Searchfilter['connectDevicesCount']
#                 Check = 'N/A'
#                 Searchtablelist = [getaccountNumber, getaccountName, getphonenumber, email,Serviceaddress, serviceTier,
#                                        attainableRate, upstreamServiceLimit, downstreamServiceLimit, speedTest, competitor, streamingUsage,
#                                    gamingUsage,totalUsage,wifiScore,connectDevicesCount,Check]
#                 print(Searchtablelist)
#                 return (Searchtablelist)
#         except  Exception  as e:
#             return ("Oops!", e.__class__, "occured")
#
# # Subscriber usage
#     def searchusage(self):
#         try:
#             msg = Apireposebody.Subscriber_usage
#             print(json.dumps(msg, sort_keys=True))
#             ws.send(json.dumps(msg, sort_keys=True))
#             result = ws.recv()
#             print('Result: {}'.format(result))
#
#             Subscriber_usage = ws.recv()
#             print('Subscriber usage: {}'.format(Subscriber_usage))
#             sliceresult = Subscriber_usage[1:]
#             sliceresult = json.loads(sliceresult)
#             print(sliceresult)
#             string_input = ''.join(str(s) for s in sliceresult)
#             Searchfilter = json.loads(string_input)['result']['lens']
#             print('Search: {}'.format(Searchfilter))
#             return ('Result: {}'.format(Searchfilter))
#         except  Exception  as e:
#             return ("Oops!", e.__class__, "occured")
# # Usage By Application
#     def usagebyapplication(self):
#         try:
#             msg = Apireposebody.searchusagebyapplication
#             print(json.dumps(msg, sort_keys=True))
#             ws.send(json.dumps(msg, sort_keys=True))
#             result = ws.recv()
#             print('Result: {}'.format(result))
#
#             Usage_By_Application = ws.recv()
#             print('Usage By Application: {}'.format(Usage_By_Application))
#             sliceresult = Usage_By_Application[1:]
#             sliceresult = json.loads(sliceresult)
#             print(sliceresult)
#             string_input = ''.join(str(s) for s in sliceresult)
#             usageapplication = json.loads(string_input)['result']
#             print('Search: {}'.format(usageapplication))
#             return ('Result: {}'.format(usageapplication))
#         except  Exception  as e:
#             return ("Oops!", e.__class__, "occured")
# # Top Search app
#     def topApp(self):
#         try:
#             msg = Apireposebody.Top_Search_app
#             print(json.dumps(msg, sort_keys=True))
#             ws.send(json.dumps(msg, sort_keys=True))
#             result = ws.recv()
#             print('Result: {}'.format(result))
#             Top_Search_app = ws.recv()
#             print('Top Search app: {}'.format(Top_Search_app))
#             sliceresult = Top_Search_app[1:]
#             sliceresult = json.loads(sliceresult)
#             print(sliceresult)
#             string_input = ''.join(str(s) for s in sliceresult)
#             Topapp = json.loads(string_input)['result']
#             print('Search: {}'.format(Topapp))
#             return ('Result: {}'.format(Topapp))
#         except  Exception  as e:
#             return ("Oops!", e.__class__, "occured")
# # Device and WiFI score Trend
#
#     def deviceandwifi(self):
#         try:
#             msg = Apireposebody.searchDevicecategory
#             print(json.dumps(msg, sort_keys=True))
#             ws.send(json.dumps(msg, sort_keys=True))
#             result = ws.recv()
#             Device_and_WiFI_Sscore_Trend = ws.recv()
#             print('Device and WiFI score Trend: {}'.format(Device_and_WiFI_Sscore_Trend))
#             sliceresult = Device_and_WiFI_Sscore_Trend[1:]
#             sliceresult = json.loads(sliceresult)
#             print(sliceresult)
#             string_input = ''.join(str(s) for s in sliceresult)
#             Device_and_WiFI_SscoreTrend = json.loads(string_input)['result']
#             print('Search: {}'.format(Device_and_WiFI_SscoreTrend))
#             return ('Result: {}'.format(Device_and_WiFI_SscoreTrend))
#         except  Exception  as e:
#             return ("Oops!", e.__class__, "occured")
# # Competitor_vist_and_Speed_test_mintues
#     def Competitor_vist_and_Speed_test_mintues(self):
#         try:
#             msg = Apireposebody.searchIotdevices
#             print(json.dumps(msg, sort_keys=True))
#             ws.send(json.dumps(msg, sort_keys=True))
#             result = ws.recv()
#             print('Result: {}'.format(result))
#
#             Competitor_vist_and_Speed_test_mintues = ws.recv()
#             print('Competitor vist and Speed test mintues: {}'.format(Competitor_vist_and_Speed_test_mintues))
#             sliceresult = Competitor_vist_and_Speed_test_mintues[1:]
#             sliceresult = json.loads(sliceresult)
#             print(sliceresult)
#             string_input = ''.join(str(s) for s in sliceresult)
#             Competitor_vist_and_Speed_test_mintue = json.loads(string_input)['result']
#             print('Search: {}'.format(Competitor_vist_and_Speed_test_mintue))
#             return ('Result: {}'.format(Competitor_vist_and_Speed_test_mintue))
#         except  Exception  as e:
#             return ("Oops!", e.__class__, "occured")
#
# connectionObj=SearchTab()
# # connectionObj.WebsocketConnection()
# # connectionObj.Competitor_vist_and_Speed_test_mintues()