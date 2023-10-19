# import json
# import ssl
# import pprint
# # import Apireposebody
# from websocket import create_connection
# from datetime import datetime
#
# ws = create_connection('wss://cloud-stg.calix.com/sockjs/888/q495vp66/websocket',sslopt={"cert_reqs": ssl.CERT_NONE})
#
# class MobileNotification:
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
#             msg = ["{\"msg\":\"method\",\"method\":\"cloudLogin\",\"params\":[{\"username\":\"implementation@allophone.net\",\"password\":\"Impl7583\",\"clientLocalTime\":1591687526276,\"offsetTimeZone\":-330,\"loginType\":\"local\",\"logoutUrl\":\"/login\"}],\"id\":\"cloudLogin\"}"]
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
#
#     def MobileNotification_ST(self):
#         try:
#             # msg = ["{\"msg\":\"method\",\"method\":\"callPromotionApi\",\"params\":[{\"endpoint\":\"promotion/list?orgId="+orgId+"\",\"methodType\":\"GET\"}],\"id\":\"callPromotionApi\"}"]
#             msg = Apireposebody.Mobile_Notifications_Schedule_tab
#             print(json.dumps(msg, sort_keys=True))
#             ws.send(json.dumps(msg, sort_keys=True))
#             result = ws.recv()
#             print('Result: {}'.format(result))
#             MNSheduletabresult = ws.recv()
#             sliceresult = MNSheduletabresult[1:]
#             sliceresult = json.loads(sliceresult)
#             print(sliceresult)
#             print('Result After slice: {}'.format(sliceresult))
#             string_input = ''.join(str(s) for s in sliceresult)
#             print(string_input)
#             MNSheduletabTableresult = json.loads(string_input)['result']['data'][0]
#             print('Mobile Notifications Schedule Tab: {}'.format(MNSheduletabTableresult))
#             NotificationName = MNSheduletabTableresult['campaignName']
#             SegmentType = MNSheduletabTableresult['segmentType']
#             timestamp=MNSheduletabTableresult['schedule']
#
#             dt_object = datetime.fromtimestamp(timestamp / 1000.0)
#             Date = dt_object.strftime('%Y-%m-%d')
#             time = dt_object.strftime("%X")
#             d = datetime.strptime(time, "%H:%M:%S")
#             NotificationTime1 = d.strftime("%I:%M %p")
#             timestamp1 = MNSheduletabTableresult['created']
#             dt_object = datetime.fromtimestamp(timestamp1 / 1000.0)
#             time = dt_object.strftime("%X")
#             d = datetime.strptime(time, "%H:%M:%S")
#             NotificationTime = d.strftime("%I:%M %p")
#             TimeZone= MNSheduletabTableresult['timeZone']
#             MobileNotificationScheduleList = [NotificationName, SegmentType, Date, NotificationTime, TimeZone]
#             print(MobileNotificationScheduleList)
#             return (MobileNotificationScheduleList)
#
#         except  Exception  as e:
#             return ("Oops!", e.__class__, "occured")
#
#
#     def MobileNotification_Event(self):
#         try:
#             # msg = ["{\"msg\":\"method\",\"method\":\"callPromotionApi\",\"params\":[{\"endpoint\":\"campaign-event/dashboard/"+orgId+"\",\"methodType\":\"GET\"},\"event\"],\"id\":\"callPromotionApi\"}"]
#             msg= Apireposebody.Mobile_Notifications_Event_tab
#             print(json.dumps(msg, sort_keys=True))
#             ws.send(json.dumps(msg, sort_keys=True))
#             result = ws.recv()
#             print('Result: {}'.format(result))
#             MNEventresult = ws.recv()
#             print('Mobile Notifications Event Tab: {}'.format(MNEventresult))
#             sliceresult = MNEventresult[1:]
#             sliceresult = json.loads(sliceresult)
#             print(sliceresult)
#             print('Result After slice: {}'.format(sliceresult))
#             string_input = ''.join(str(s) for s in sliceresult)
#             print(string_input)
#             MNEventtabTableresult = json.loads(string_input)['result']['data'][0]
#             print('Mobile Notifications Event Tab: {}'.format(MNEventtabTableresult))
#             NotificationName = MNEventtabTableresult['campaignName']
#             EventType = MNEventtabTableresult['eventType']
#             Startdate1 = MNEventtabTableresult['startDate']
#             Startdate = Startdate1.split('T')[0]
#             Enddate1 = MNEventtabTableresult['endDate']
#             Enddate = Enddate1.split('T')[0]
#             Monitoring= Startdate+" to "+Enddate
#             Threshold = MNEventtabTableresult['threshold']
#             NotificationTime1= MNEventtabTableresult['schedule']
#             from datetime import datetime
#             d = datetime.strptime(NotificationTime1, "%H:%M:%S")
#             NotificationTime=d.strftime("%I:%M %p")
#             TimeZone = MNEventtabTableresult['timeZone']
#             MobileNotificationEventList = [NotificationName, EventType, Monitoring, Threshold, NotificationTime, TimeZone]
#             print(MobileNotificationEventList)
#             return (MobileNotificationEventList)
#         except  Exception  as e:
#             return ("Oops!", e.__class__, "occured")
#
#     def History_SH(self):
#         try:
#             # msg = ["{\"msg\":\"method\",\"method\":\"callPromotionApi\",\"params\":[{\"endpoint\":\"promotion/history?orgId="+orgId+"&from=0&size=10\",\"methodType\":\"GET\"}],\"id\":\"callPromotionApi\"}"]
#             msg= Apireposebody.History_Schedule_button
#             print(json.dumps(msg, sort_keys=True))
#             ws.send(json.dumps(msg, sort_keys=True))
#             result = ws.recv()
#             print('Result: {}'.format(result))
#
#             MNHistoryScheduledresult = ws.recv()
#             print('Mobile Notifications History Schedule Tab: {}'.format(MNHistoryScheduledresult))
#             sliceresult = MNHistoryScheduledresult[1:]
#             sliceresult = json.loads(sliceresult)
#             print(sliceresult)
#             print('Result After slice: {}'.format(sliceresult))
#             string_input = ''.join(str(s) for s in sliceresult)
#             print(string_input)
#             MNHistoryScheduledresult = json.loads(string_input)['result']['data']['datas'][0]
#             print(MNHistoryScheduledresult)
#             NotificationName = MNHistoryScheduledresult['campaignName']
#             SegmentType = MNHistoryScheduledresult['segmentType']
#             timestamp = MNHistoryScheduledresult['schedule']
#             dt_object = datetime.fromtimestamp(timestamp / 1000.0)
#             Date = dt_object.strftime('%Y-%m-%d')
#             timestamp1 = MNHistoryScheduledresult['created']
#             dt_object = datetime.fromtimestamp(timestamp1 / 1000.0)
#             time = dt_object.strftime("%X")
#             d = datetime.strptime(time, "%H:%M:%S")
#             NotificationTime = d.strftime("%I:%M %p")
#             TimeZone = MNHistoryScheduledresult['timeZone']
#             successcount = MNHistoryScheduledresult['success']
#             failedscount = MNHistoryScheduledresult['fail']
#             HistoryNotificationScheduleList = [NotificationName, SegmentType, Date, NotificationTime, TimeZone, successcount, failedscount]
#             print(HistoryNotificationScheduleList)
#             return (HistoryNotificationScheduleList)
#         except  Exception  as e:
#             return ("Oops!", e.__class__, "occured")
#
#     def History_Event(self):
#         try:
#             # msg = ["{\"msg\":\"method\",\"method\":\"callPromotionApi\",\"params\":[{\"endpoint\":\"campaign-event/history/"+orgId+"\",\"methodType\":\"GET\"},\"event\"],\"id\":\"callPromotionApi\"}"]
#             msg= Apireposebody.History_event_button
#             print(json.dumps(msg, sort_keys=True))
#             ws.send(json.dumps(msg, sort_keys=True))
#             result = ws.recv()
#             print('Result: {}'.format(result))
#             MNHistoryevent = ws.recv()
#             print('Mobile Notifications History Event Tab: {}'.format(MNHistoryevent))
#             sliceresult = MNHistoryevent[1:]
#             sliceresult = json.loads(sliceresult)
#             print(sliceresult)
#             print('Result After slice: {}'.format(sliceresult))
#             string_input = ''.join(str(s) for s in sliceresult)
#             print(string_input)
#             MNHistoryevent = json.loads(string_input)['result']['data'][0]
#             print(MNHistoryevent)
#             NotificationName = MNHistoryevent['campaignName']
#             Subscriber = MNHistoryevent['subscriberInfo']
#             Startdate1 = MNHistoryevent['created']
#             NotificationDate = Startdate1.split('T')[0]
#             Enddate = MNHistoryevent['schedule']
#             NotificationTime1 = MNHistoryevent['schedule']
#             from datetime import datetime
#             d = datetime.strptime(Enddate, "%H:%M:%S")
#             NotificationTime = d.strftime("%I:%M %p")
#             TimeZone = MNHistoryevent['timeZone']
#             HistoryNotificationEventList = [NotificationName, Subscriber, NotificationDate, NotificationTime,
#                                            TimeZone]
#             print(HistoryNotificationEventList)
#             return (HistoryNotificationEventList)
#         except  Exception  as e:
#             return ("Oops!", e.__class__, "occured")
#
#
# MobileObj=MobileNotification()
# # MobileObj.WebsocketConnection()
# # MobileObj.History_SH()
