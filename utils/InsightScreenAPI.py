# import json
# from websocket import create_connection
# import os
# from configparser import ConfigParser
#
# # sortDate = 'last-2m'
# # username = 'implementation@allophone.net'
# # password = 'Impl7583'
#
# class sample():
#  def ConfigReader(self):
#    global  sortDate
#    global  username
#    global  password
#    dir_path = os.path.dirname(os.path.realpath(__file__))
#    config_file = os.path.join(dir_path, 'config.ini')
#    config = ConfigParser()
#    print(config.sections())
#    config.read(config_file)
#    print(config.sections())
#    print(config['APIDATA']['sortDate'])
#    print(config['APIDATA']['usernameDev'])
#    print(config['APIDATA']['passwordDev'])
#    if config['ENVIRONMENT']['environment'] == 'Dev':
#      sortDate = config['APIDATA']['sortDate']
#      username = config['APIDATA']['usernameDev']
#      password = config['APIDATA']['passwordDev']
#    else:
#        if config['ENVIRONMENT']['environment'] == 'Stage':
#            sortDate = config['APIDATA']['sortDate']
#            username = config['APIDATA']['usernameDev']
#            password = config['APIDATA']['passwordDev']
#        else:
#            if config['ENVIRONMENT']['environment'] == 'Prod':
#                sortDate = config['APIDATA']['sortDate']
#                username = config['APIDATA']['usernameDev']
#                password = config['APIDATA']['passwordDev']
#
#    return(config['APIDATA']['passwordDev'])
#
#  def ConfigReaderDev(self):
#    global  sortDate
#    global  username
#    global  password
#    dir_path = os.path.dirname(os.path.realpath(__file__))
#    config_file = os.path.join(dir_path, 'config.ini')
#    config = ConfigParser()
#    print(config.sections())
#    config.read(config_file)
#    print(config.sections())
#    print(config['APIDATA']['sortDate'])
#    print(config['APIDATA']['usernameDev'])
#    print(config['APIDATA']['passwordDev'])
#    sortDate = config['APIDATA']['sortDate']
#    username = config['APIDATA']['usernameDev']
#    password = config['APIDATA']['passwordDev']
#    return(config['APIDATA']['passwordDev'])
#
#  def ConfigReaderStage(self):
#    global  sortDate
#    global  username
#    global  password
#    dir_path = os.path.dirname(os.path.realpath(__file__))
#    config_file = os.path.join(dir_path, 'config.ini')
#    config = ConfigParser()
#    print(config.sections())
#    config.read(config_file)
#    print(config.sections())
#    print(config['APIDATA']['sortDate'])
#    print(config['APIDATA']['usernameStage'])
#    print(config['APIDATA']['passwordStage'])
#    sortDate = config['APIDATA']['sortDate']
#    username = config['APIDATA']['usernameStage']
#    password = config['APIDATA']['passwordStage']
#    return(config['APIDATA']['passwordDev'])
#
#  def ConfigReaderProd(self):
#    global  sortDate
#    global  username
#    global  password
#    dir_path = os.path.dirname(os.path.realpath(__file__))
#    config_file = os.path.join(dir_path, 'config.ini')
#    config = ConfigParser()
#    print(config.sections())
#    config.read(config_file)
#    print(config.sections())
#    print(config['APIDATA']['sortDate'])
#    print(config['APIDATA']['usernameDev'])
#    print(config['APIDATA']['passwordDev'])
#    sortDate = config['APIDATA']['sortDate']
#    username = config['APIDATA']['usernameProd']
#    password = config['APIDATA']['passwordProd']
#    return(config['APIDATA']['passwordDev'])
#
#
#
#  def WebsocketConnection(self):
#     try:
#         global ws
#         ws = create_connection('wss://cloud-stg.calix.com/sockjs/888/q495vp66/websocket')
#         result = ws.recv()
#         print('Result: {}'.format(result))
#         result = ws.recv()
#         print('Result: {}'.format(result))
#         ws.send(json.dumps([json.dumps({'msg': 'connect', 'version': '1', 'support': ['1', 'pre2', 'pre1']})]))
#         result = ws.recv()
#         print('Result: {}'.format(result))
#         return('Result: {}'.format(result))
#     except  Exception  as e:
#        return ("Oops!",e.__class__,"occured")
#
#  def login(self):
#         try:
#             global Clientid
#             global orgId
#             msg = ["{\"msg\":\"method\",\"method\":\"cloudLogin\",\"params\":[{\"username\":\""+username+"\",\"password\":\""+password+"\",\"clientLocalTime\":1591687526276,\"offsetTimeZone\":-330,\"loginType\":\"local\",\"logoutUrl\":\"/login\"}],\"id\":\"cloudLogin\"}"]
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
#             # return ('Result: {}'.format(as_dict))
#         except  Exception  as e:
#             return ("Oops!", e.__class__, "occured")
#
#
#  def Search_Region_Data(self):
#     try:
#         global msg
#         msg = ["{\"id\":\"cloudRegions\",\"msg\":\"method\",\"method\":\"cloudRegions\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         Regiondata = ws.recv()
#         print('Region Response: {}'.format(Regiondata))
#         return('Region Response: {}'.format(Regiondata))
#     except  Exception  as e:
#        return ("Oops!",e.__class__,"occured")
#
#  def ping_msg(self):
#      try:
#          ws.send(json.dumps(["{\"msg\":\"ping\"}"], sort_keys=True))
#          result = ws.recv()
#          Error1 = 'No response from heartbeat'
#          Error2 = 'ConnectionAbortedError'
#          if  Error1 in result or Error2 in result:
#             ws.close()
#             connectionObj.WebsocketConnection()
#          return (result)
#      except  Exception  as e:
#          connectionObj.WebsocketConnection()
#          return ("Oops!", e.__class__, "occured")
#
#  def pong_msg(self):
#      try:
#          ws.send(json.dumps(["{\"msg\":\"pong\"}"], sort_keys=True))
#          result = ws.recv()
#          return (result)
#      except  Exception  as e:
#          return ("Oops!", e.__class__, "occured")
#
#  def Search_Region_LocationData(self):
#     try:
#         # ws.send(json.dumps(["{\"msg\":\"pong\"}"], sort_keys=True))
#         msg = ["{\"id\":\"cloudRegionsLocations\",\"msg\":\"method\",\"method\":\"cloudRegionsLocations\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         Locationdata = ws.recv()
#         print('Location Response: {}'.format(Locationdata))
#         return('Location Response: {}'.format(Locationdata))
#     except  Exception  as e:
#        return ("Oops!",e.__class__,"occured")
#
#  def Subscribers_by_Service_Tier_And_Technology_Chart(self):
#      try:
#         connectionObj.ping_msg()
#         global  Subscribersbyservicechart
#         msg = ["{\"id\":\"marketingTargetSegmentationTechnologyCountByServiceTier\",\"msg\":\"method\",\"method\":\"marketingTargetSegmentationTechnologyCountByServiceTier\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\"7583\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         Subscribersbyservicechart = ws.recv()
#         print('Subscribers by Service Tier & Technology Chart Response: {}'.format(Subscribersbyservicechart))
#         return('Subscribers by Service Tier & Technology Chart Response: {}'.format(Subscribersbyservicechart))
#      except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#
#  def Subscribers_by_Service_Tier_And_Technology_Chart_category(self):
#      try:
#         sliceresult = Subscribersbyservicechart[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         category = json.loads(string_input)['result']['categories']
#         return(category)
#      except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Subscribers_by_Service_Tier_And_Technology_Chart_series(self):
#      try:
#         sliceresult = Subscribersbyservicechart[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         series = json.loads(string_input)['result']['series'][0]['name']
#         return(series)
#      except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Subscribers_by_Service_Tier_And_Technology_Chart_total(self):
#      try:
#         sliceresult = Subscribersbyservicechart[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         total = json.loads(string_input)['result']['series'][0]['data']
#         return(total)
#      except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def  Subscribers_by_Service_Tier_And_Technology_Table(self):
#      try:
#
#       msg = ["{\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserListByServiceTierAndTechDetail\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\",\"tier\":\"300M+\",\"tech\":\"Fiber\",\"page\":1,\"size\":10}],\"id\":\"marketingTargetSegmentationUserListByServiceTierAndTechDetail\"}"]
#       ws.send(json.dumps(msg, sort_keys=True))
#       result = ws.recv()
#       SubscribersbyserviceTable = ws.recv()
#       print('Subscribers by Service Tier & Technology Table Response: {}'.format(SubscribersbyserviceTable))
#
#      # Removing a
#       sliceresult = SubscribersbyserviceTable[1:]
#       sliceresult = json.loads(sliceresult)
#       print(sliceresult)
#       print('Result After slice: {}'.format(sliceresult))
#
#       string_input = ''.join(str(s) for s in sliceresult)
#       print(string_input)
#       serviceTable1 = json.loads(string_input)['result']
#       serviceTable2 = json.loads(string_input)['result'][1]
#       serviceTable3 = json.loads(string_input)['result'][2]
#       print('Subscribers by Service Tier & Technology Column 1 values :', serviceTable1)
#       print('Subscribers by Service Tier & Technology Column 2 values :', serviceTable2)
#       print('Subscribers by Service Tier & Technology Column 3 values :', serviceTable3)
#       # ws.close()
#       return(serviceTable1)
#      except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Subscribers_Data_Usage_Chart(self):
#     try:
#         msg = ["{\"id\":\"insightsTotalBandwidthConsumed\",\"msg\":\"method\",\"method\":\"insightsTotalBandwidthConsumed\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         SubscribersDataUsageChart = ws.recv()
#         print('Subscribers Data Usage Chart: {}'.format(SubscribersDataUsageChart))
#
#         # Removing a
#         sliceresult = SubscribersDataUsageChart[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         UsageData = json.loads(string_input)['result']
#         print('Subscribers Data Usage Chart Data values :', UsageData)
#         return (UsageData)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#
#  def Subscribers_Data_Usage_Chart_Gigabytes(self):
#     try:
#         msg = ["{\"id\":\"insightsTotalBandwidthConsumed\",\"msg\":\"method\",\"method\":\"insightsTotalBandwidthConsumed\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         SubscribersDataUsageChart = ws.recv()
#         print('Subscribers Data Usage Chart: {}'.format(SubscribersDataUsageChart))
#
#         # Removing a
#         sliceresult = SubscribersDataUsageChart[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         UsageData1 = json.loads(string_input)['result'][0]['0-5']
#         UsageData2 = json.loads(string_input)['result'][1]['5-15']
#         UsageData3 = json.loads(string_input)['result'][2]['15-35']
#         UsageData4 = json.loads(string_input)['result'][3]['35-75']
#         UsageData5 = json.loads(string_input)['result'][4]['75-150']
#         UsageData6 = json.loads(string_input)['result'][5]['150-300']
#         UsageData7 = json.loads(string_input)['result'][6]['300+']
#         list_UsageData=  [UsageData1, UsageData2, UsageData3, UsageData4, UsageData5, UsageData6, UsageData7]
#         print('Subscribers Data Usage Chart Data values :', list_UsageData)
#         return (list_UsageData)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#
#
#
#  def  Subscribers_Data_Usage_Table(self):
#      try:
#          msg = ["{\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserListByUsageDetail\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\",\"category\":\"150-300\",\"page\":1,\"size\":10}],\"id\":\"marketingTargetSegmentationUserListByUsageDetail\"}"]
#          ws.send(json.dumps(msg, sort_keys=True))
#          result = ws.recv()
#          SubscribersDataUsageTable = ws.recv()
#          print('Subscribers Data Usage Table: {}'.format(SubscribersDataUsageTable))
#          sliceresult = SubscribersDataUsageTable[1:]
#          sliceresult = json.loads(sliceresult)
#          print(sliceresult)
#          print('Result After slice: {}'.format(sliceresult))
#
#          string_input = ''.join(str(s) for s in sliceresult)
#          print(string_input)
#          Datausage1 = json.loads(string_input)['result']
#          Datausage2 = json.loads(string_input)['result'][1]
#          Datausage3 = json.loads(string_input)['result'][2]
#          print('Subscribers Data Usage Table Column 1 values :', Datausage1)
#          print('Subscribers Data Usage Table Column 2 values :', Datausage2)
#          print('Subscribers Data Usage Table Column 3 values :', Datausage3)
#          return (Datausage1)
#      except  Exception  as e:
#          return ("Oops!", e.__class__, "occured")
#
#
#
#  def Social_Channel_Heatmap_Applications_List(self):
#     try:
#         msg = ["{\"id\":\"marketingInsightsApplicationList\",\"msg\":\"method\",\"method\":\"marketingInsightsApplicationList\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         HeatMapApplicationlist = ws.recv()
#         print('Subscribers Data Usage Table: {}'.format(HeatMapApplicationlist))
#         sliceresult = HeatMapApplicationlist[1:]
#         sliceresult = json.loads(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         HeatMapApplicationlist1 = json.loads(string_input)['result']
#         HeatMapApplicationlist2 = json.loads(string_input)['result'][1]
#         HeatMapApplicationlist3 = json.loads(string_input)['result'][2]
#         print('Social Channel Heatmap Applications List 1 values :', HeatMapApplicationlist1)
#         print('Social Channel Heatmap Applications List 2 values :', HeatMapApplicationlist2)
#         print('Social Channel Heatmap Applications List values :', HeatMapApplicationlist3)
#
#         return (HeatMapApplicationlist1)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Social_Channel_Heatmap_Chart_Data(self):
#     try:
#         msg = ["{\"id\":\"marketingInsightsApplicationHeatmap\",\"msg\":\"method\",\"method\":\"marketingInsightsApplicationHeatmap\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         HeatMapChartData = ws.recv()
#         print('Social Channel Heatmap Applications Data : {}'.format(HeatMapChartData))
#         sliceresult = HeatMapChartData[1:]
#         sliceresult = json.loads(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         HeatMapApplicationChartData = json.loads(string_input)['result']
#         print('Social Channel Heatmap Chart Data :', HeatMapApplicationChartData)
#         return (HeatMapApplicationChartData)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Social_Channel_Heatmap_Applications_List(self):
#     try:
#         msg = ["{\"id\":\"marketingInsightsApplicationList\",\"msg\":\"method\",\"method\":\"marketingInsightsApplicationList\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         HeatMapApplicationlist = ws.recv()
#         print('Subscribers Data Usage Table: {}'.format(HeatMapApplicationlist))
#         sliceresult = HeatMapApplicationlist[1:]
#         sliceresult = json.loads(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         HeatMapApplicationlist1 = json.loads(string_input)['result']
#         HeatMapApplicationlist2 = json.loads(string_input)['result'][1]
#         HeatMapApplicationlist3 = json.loads(string_input)['result'][2]
#         print('Social Channel Heatmap Applications List 1 values :', HeatMapApplicationlist1)
#         print('Social Channel Heatmap Applications List 2 values :', HeatMapApplicationlist2)
#         print('Social Channel Heatmap Applications List values :', HeatMapApplicationlist3)
#
#         return (HeatMapApplicationlist1)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#
#  def  Social_Channel_Heatmap_Chart_Data(self):
#     try:
#         msg = ["{\"id\":\"marketingInsightsApplicationHeatmap\",\"msg\":\"method\",\"method\":\"marketingInsightsApplicationHeatmap\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         HeatMapChartData = ws.recv()
#         print('Social Channel Heatmap Applications Data : {}'.format(HeatMapChartData))
#         sliceresult = HeatMapChartData[1:]
#         sliceresult = json.loads(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         HeatMapApplicationChartData = json.loads(string_input)['result']
#         print('Social Channel Heatmap Chart Data :', HeatMapApplicationChartData)
#
#         return (HeatMapApplicationChartData)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Streaming_Subscribers_Gaming_Subscribers_AND_Work_from_Home_WFH_Subscribers_get_Users_Count(self):
#     try:
#         msg = ["{\"id\":\"marketingTargetSegmentationUserSummary\",\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserSummary\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         UserCounts = ws.recv()
#         print(
#             'Streaming Subscribers, Gaming Subscribers & Work from Home (WFH) Subscribers  get Users  Count : {}'.format(
#                 UserCounts))
#         sliceresult = UserCounts[1:]
#         sliceresult = json.loads(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         SS_GS_WFH_Counts = json.loads(string_input)['result']
#         print('Streaming Subscribers, Gaming Subscribers & Work from Home (WFH) Subscribers  get Users  Count :',SS_GS_WFH_Counts)
#         return (SS_GS_WFH_Counts)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Streaming_Subscribers_Chart_Data_categories(self):
#     try:
#         msg = ["{\"id\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"type\":\"streaming\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         StreamingSubscribers = ws.recv()
#         print('Streaming Subscribers Chart Data Response: {}'.format(StreamingSubscribers))
#
#         # Removing a
#         sliceresult = StreamingSubscribers[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         Streamingcategory = json.loads(string_input)['result']['categories']
#         Streamingseries = json.loads(string_input)['result']['series']
#         Streamingtotal = json.loads(string_input)['result']['totals']
#         print('Streaming Subscribers Category values :', Streamingcategory)
#         print('Streaming Subscribers series values :', Streamingseries)
#         print('Streaming Subscribers total values :', Streamingtotal)
#
#         return (Streamingcategory)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Streaming_Subscribers_Chart_Data_series(self):
#     try:
#         msg = ["{\"id\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"type\":\"streaming\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         StreamingSubscribers = ws.recv()
#         print('Streaming Subscribers Chart Data Response: {}'.format(StreamingSubscribers))
#
#         # Removing a
#         sliceresult = StreamingSubscribers[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         Streamingseries = json.loads(string_input)['result']['series'][0]['name']
#         return (Streamingseries)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Streaming_Subscribers_Chart_Data_totalStreaming(self):
#     try:
#         msg = ["{\"id\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"type\":\"streaming\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         StreamingSubscribers = ws.recv()
#         print('Streaming Subscribers Chart Data Response: {}'.format(StreamingSubscribers))
#
#         # Removing a
#         sliceresult = StreamingSubscribers[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         Streamingcategory = json.loads(string_input)['result']['categories']
#         Streamingseries = json.loads(string_input)['result']['series']
#         Streamingtotal = json.loads(string_input)['result']['series'][0]['data']
#         print('Streaming Subscribers Category values :', Streamingcategory)
#         print('Streaming Subscribers series values :', Streamingseries)
#         print('Streaming Subscribers total values :', Streamingtotal)
#
#         return (Streamingtotal)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Streaming_Subscribers_Chart_Data_total_Nonstreaming(self):
#     try:
#         msg = ["{\"id\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"type\":\"streaming\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         StreamingSubscribers = ws.recv()
#         print('Streaming Subscribers Chart Data Response: {}'.format(StreamingSubscribers))
#
#         # Removing a
#         sliceresult = StreamingSubscribers[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         Streamingcategory = json.loads(string_input)['result']['categories']
#         Streamingseries = json.loads(string_input)['result']['series']
#         Streamingtotal = json.loads(string_input)['result']['series'][1]['data']
#         print('Streaming Subscribers Category values :', Streamingcategory)
#         print('Streaming Subscribers series values :', Streamingseries)
#         print('Streaming Subscribers total values :', Streamingtotal)
#
#         return (Streamingtotal)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#
#  def Streaming_Subscribers_Table_Data(self):
#      try:
#          msg = ["{\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserListByServiceTierAndGroupDetail\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\",\"tier\":\"300M+\",\"reverse\":true,\"group\":\"streaming\",\"page\":1,\"size\":10}],\"id\":\"marketingTargetSegmentationUserListByServiceTierAndGroupDetail\"}"]
#          ws.send(json.dumps(msg, sort_keys=True))
#          result = ws.recv()
#          StreamingTable = ws.recv()
#          print('Streaming Subscribers Table Data: {}'.format(StreamingTable))
#
#          # Removing a
#          sliceresult = StreamingTable[1:]
#          sliceresult = json.loads(sliceresult)
#          print(sliceresult)
#          print('Result After slice: {}'.format(sliceresult))
#
#          string_input = ''.join(str(s) for s in sliceresult)
#          print(string_input)
#          StreamingTable1 = json.loads(string_input)['result']
#          StreamingTable2 = json.loads(string_input)['result'][1]
#          StreamingTable3 = json.loads(string_input)['result'][2]
#          print('Streaming Subscribers Table Data Column 1 values :', StreamingTable1)
#          print('Streaming Subscribers Table Data Column 2 values :', StreamingTable2)
#          print('Streaming Subscribers Table Data Column 3 values :', StreamingTable3)
#
#          return (StreamingTable1)
#      except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Gaming_Subscribers_Chart_Data_categories(self):
#     try:
#         msg = ["{\"id\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"type\":\"gaming\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         GamingSubscribers = ws.recv()
#         print('Gaming Subscribers Chart Data Response: {}'.format(GamingSubscribers))
#
#         # Removing a
#         sliceresult = GamingSubscribers[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         Gamingcategory = json.loads(string_input)['result']['categories']
#         Gamingseries = json.loads(string_input)['result']['series']
#         Gamingtotal = json.loads(string_input)['result']['totals']
#         print('Gaming Subscribers Category values :', Gamingcategory)
#         print('Gaming Subscribers  series values :', Gamingseries)
#         print('Gaming Subscribers total values :', Gamingtotal)
#
#         return (Gamingcategory)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Gaming_Subscribers_Chart_Data_series(self):
#     try:
#         msg = ["{\"id\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"type\":\"gaming\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         GamingSubscribers = ws.recv()
#         print('Gaming Subscribers Chart Data Response: {}'.format(GamingSubscribers))
#
#         # Removing a
#         sliceresult = GamingSubscribers[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         Gamingcategory = json.loads(string_input)['result']['categories']
#         Gamingseries = json.loads(string_input)['result']['series'][0]['name']
#         Gamingtotal = json.loads(string_input)['result']['totals']
#         print('Gaming Subscribers Category values :', Gamingcategory)
#         print('Gaming Subscribers  series values :', Gamingseries)
#         print('Gaming Subscribers total values :', Gamingtotal)
#
#         return (Gamingseries)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Gaming_Subscribers_Chart_Data_total(self):
#     try:
#         msg = ["{\"id\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"type\":\"gaming\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         GamingSubscribers = ws.recv()
#         print('Gaming Subscribers Chart Data Response: {}'.format(GamingSubscribers))
#
#         # Removing a
#         sliceresult = GamingSubscribers[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         Gamingcategory = json.loads(string_input)['result']['categories']
#         Gamingseries = json.loads(string_input)['result']['series']
#         Gamingtotal = json.loads(string_input)['result']['series'][0]['data']
#         print('Gaming Subscribers Category values :', Gamingcategory)
#         print('Gaming Subscribers  series values :', Gamingseries)
#         print('Gaming Subscribers total values :', Gamingtotal)
#
#         return (Gamingtotal)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Gaming_Subscribers_Table_Data(self):
#     try:
#         msg = ["{\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserListByServiceTierAndGroupDetail\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\",\"tier\":\"50M+\",\"reverse\":true,\"group\":\"gaming\",\"page\":1,\"size\":10}],\"id\":\"marketingTargetSegmentationUserListByServiceTierAndGroupDetail\"}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         GamingTable = ws.recv()
#         print('Gaming Subscribers Table Data: {}'.format(GamingTable))
#
#         # Removing a
#         sliceresult = GamingTable[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         GamingTable1 = json.loads(string_input)['result'][1]
#         GamingTable2 = json.loads(string_input)['result'][1]
#         GamingTable3 = json.loads(string_input)['result'][2]
#         print('Gaming Subscribers Table Data Column 1 values :', GamingTable1)
#         print('Gaming Subscribers Table Data Column 2 values :', GamingTable2)
#         print('Gaming Subscribers Table Data Column 3 values :', GamingTable3)
#
#         return (GamingTable1)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Work_from_Home_WFH_Subscribers_Chart_Data_categories(self):
#     try:
#         msg = ["{\"id\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"type\":\"wfh\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         WFHSubscribers = ws.recv()
#         print('Gaming Subscribers Chart Data Response: {}'.format(WFHSubscribers))
#
#         # Removing a
#         sliceresult = WFHSubscribers[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         WFHcategory = json.loads(string_input)['result']['categories']
#         WFHseries = json.loads(string_input)['result']['series']
#         WFHtotal = json.loads(string_input)['result']['totals']
#         print('WFH Subscribers Category values :', WFHcategory)
#         print('WFH Subscribers  series values :', WFHseries)
#         print('WFH Subscribers total values :', WFHtotal)
#
#         return (WFHcategory)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Work_from_Home_WFH_Subscribers_Chart_Data_series(self):
#     try:
#         msg = ["{\"id\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"type\":\"wfh\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         WFHSubscribers = ws.recv()
#         print('Gaming Subscribers Chart Data Response: {}'.format(WFHSubscribers))
#
#         # Removing a
#         sliceresult = WFHSubscribers[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         WFHcategory = json.loads(string_input)['result']['categories']
#         WFHseries = json.loads(string_input)['result']['series'][0]['name']
#         WFHtotal = json.loads(string_input)['result']['totals']
#         print('WFH Subscribers Category values :', WFHcategory)
#         print('WFH Subscribers  series values :', WFHseries)
#         print('WFH Subscribers total values :', WFHtotal)
#
#         return (WFHseries)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#
#  def Work_from_Home_WFH_Subscribers_Chart_Data_totals(self):
#     try:
#         msg = ["{\"id\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"type\":\"wfh\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         WFHSubscribers = ws.recv()
#         print('Gaming Subscribers Chart Data Response: {}'.format(WFHSubscribers))
#
#         # Removing a
#         sliceresult = WFHSubscribers[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         WFHcategory = json.loads(string_input)['result']['categories']
#         WFHseries = json.loads(string_input)['result']['series']
#         WFHtotal = json.loads(string_input)['result']['series'][0]['data']
#         print('WFH Subscribers Category values :', WFHcategory)
#         print('WFH Subscribers  series values :', WFHseries)
#         print('WFH Subscribers total values :', WFHtotal)
#
#         return (WFHtotal)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Work_from_Home_WFH_Subscribers_Table_Data(self):
#     try:
#         msg = ["{\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserListByServiceTierAndGroupDetail\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\",\"tier\":\"50M+\",\"reverse\":false,\"group\":\"wfh\",\"page\":1,\"size\":10}],\"id\":\"marketingTargetSegmentationUserListByServiceTierAndGroupDetail\"}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         WHFTable = ws.recv()
#         print('WHF Subscribers Table Data: {}'.format(WHFTable))
#
#         # Removing a
#         sliceresult = WHFTable[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         WHFTable1 = json.loads(string_input)['result']
#         WHFTable2 = json.loads(string_input)['result'][1]
#         WHFTable3 = json.loads(string_input)['result'][2]
#         print('WHF Subscribers Table Data Column 1 values :', WHFTable1)
#         print('WHF Subscribers Table Data Column 2 values :', WHFTable2)
#         print('WHF Subscribers Table Data Column 3 values :', WHFTable3)
#
#         return (WHFTable1)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#
#  def Churn_Rate_AND_Insights_Chart_Data_categories(self):
#     try:
#         msg = ["{\"id\":\"insightsChurnInsights\",\"msg\":\"method\",\"method\":\"insightsChurnInsights\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         ChurnRateInsights = ws.recv()
#         print('Churn Rate & Insights Chart Data Response: {}'.format(ChurnRateInsights))
#
#         # Removing a
#         sliceresult = ChurnRateInsights[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         ChurnRateInsightscategory = json.loads(string_input)['result']['categories']
#         ChurnRateInsightsseries = json.loads(string_input)['result']['series']
#         ChurnRateInsightstotal = json.loads(string_input)['result']['totalObj']
#         print('Churn Rate & Insights Category values :', ChurnRateInsightscategory)
#         print('Churn Rate & Insights  series values :', ChurnRateInsightsseries)
#         print('Churn Rate & Insights total values :', ChurnRateInsightstotal)
#
#         return (ChurnRateInsightscategory)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Churn_Rate_AND_Insights_Chart_Data_series(self):
#     try:
#         msg = ["{\"id\":\"insightsChurnInsights\",\"msg\":\"method\",\"method\":\"insightsChurnInsights\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         ChurnRateInsights = ws.recv()
#         print('Churn Rate & Insights Chart Data Response: {}'.format(ChurnRateInsights))
#
#         # Removing a
#         sliceresult = ChurnRateInsights[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         ChurnRateInsightscategory = json.loads(string_input)['result']['categories']
#         ChurnRateInsightsseries = json.loads(string_input)['result']['series']
#         ChurnRateInsightstotal = json.loads(string_input)['result']['totalObj']
#         print('Churn Rate & Insights Category values :', ChurnRateInsightscategory)
#         print('Churn Rate & Insights  series values :', ChurnRateInsightsseries)
#         print('Churn Rate & Insights total values :', ChurnRateInsightstotal)
#
#         return (ChurnRateInsightsseries)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#
#  def Churn_Rate_AND_Insights_Chart_Data_total(self):
#     try:
#         msg = ["{\"id\":\"insightsChurnInsights\",\"msg\":\"method\",\"method\":\"insightsChurnInsights\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         ChurnRateInsights = ws.recv()
#         print('Churn Rate & Insights Chart Data Response: {}'.format(ChurnRateInsights))
#
#         # Removing a
#         sliceresult = ChurnRateInsights[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         ChurnRateInsightscategory = json.loads(string_input)['result']['categories']
#         ChurnRateInsightsseries = json.loads(string_input)['result']['series']
#         ChurnRateInsightstotal = json.loads(string_input)['result']['series'][0]['data']
#         print('Churn Rate & Insights Category values :', ChurnRateInsightscategory)
#         print('Churn Rate & Insights  series values :', ChurnRateInsightsseries)
#         print('Churn Rate & Insights total values :', ChurnRateInsightstotal)
#
#         return (ChurnRateInsightstotal)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#
#  def Churn_Rate_AND_Insights_Table_Data(self):
#     try:
#         msg = ["{\"msg\":\"method\",\"method\":\"marketingTargetSegmentationChurnInsightDetail\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\",\"start\":\"2020-03-01\",\"end\":\"2020-03-31\",\"tier\":\"300M+\",\"page\":1,\"size\":10}],\"id\":\"marketingTargetSegmentationChurnInsightDetail\"}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         churnrate = ws.recv()
#         print('WHF Subscribers Table Data: {}'.format(churnrate))
#
#         # Removing a
#         sliceresult = churnrate[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         churnrateTable1 = json.loads(string_input)['result'][1]
#         churnrateTable2 = json.loads(string_input)['result'][1]
#         churnrateTable3 = json.loads(string_input)['result'][2]
#         print('Churn Rate & Insights Table Data Column 1 values :', churnrateTable1)
#         print('Churn Rate & Insights Table Data Column 2 values :', churnrateTable2)
#         print('Churn Rate & Insights Table Data Column 3 values :', churnrateTable3)
#
#         return (churnrateTable1)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Retention_Table_Data(self):
#     try:
#         msg = ["{\"id\":\"marketingTargetSegementationRetentionInsights\",\"msg\":\"method\",\"method\":\"marketingTargetSegementationRetentionInsights\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         RetentionTable = ws.recv()
#         print('Retention  Table Data: {}'.format(RetentionTable))
#
#         # Removing a
#         sliceresult = RetentionTable[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#
#         ListAll = []
#
#         for i in range(8):
#          name = json.loads(string_input)['result'][i]['name']
#          RetentionTable2 = json.loads(string_input)['result'][i]['downstreamServiceLimit']
#          RetentionTable3 = json.loads(string_input)['result'][i]['upstreamServiceLimit']
#          downUpStream = str(RetentionTable2) + '/' + str(RetentionTable3)
#          speedTest = json.loads(string_input)['result'][i]['speedTest']
#          list_RetentionData = [name, downUpStream, speedTest]
#          ListAll.append(list_RetentionData)
#
#         # RetentionTable1 = json.loads(string_input)['result'][0]['name']
#         # RetentionTable2 = json.loads(string_input)['result'][0]['downstreamServiceLimit']
#         # RetentionTable3 = json.loads(string_input)['result'][0]['upstreamServiceLimit']
#         # RetentionTable4 = str(RetentionTable2) + '/' + str(RetentionTable3)
#         # RetentionTable5 = json.loads(string_input)['result'][0]['speedTest']
#         # list_RetentionData = [RetentionTable1, RetentionTable4, RetentionTable5]
#
#         return (ListAll)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Churn_Risk_Table_Data(self):
#     try:
#         msg = ["{\"id\":\"marketingChurnCandidatesInsights\",\"msg\":\"method\",\"method\":\"marketingChurnCandidatesInsights\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         ChurnRiskTable = ws.recv()
#         print('Churn Risk  Table Data: {}'.format(ChurnRiskTable))
#
#         # Removing a
#         sliceresult = ChurnRiskTable[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#
#         ListAllChrunRisk = []
#
#         for j in range(8):
#           ChurnRiskTable1 = json.loads(string_input)['result']['data'][j]['name']
#           ChurnRiskTable2 = 'High'
#           ListChrunRisk = [ChurnRiskTable1,ChurnRiskTable2]
#           ListAllChrunRisk.append(ListChrunRisk)
#
#         return (ListAllChrunRisk)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#
#  def Top_Applications_Table_Data(self):
#     try:
#         msg = ["{\"id\":\"marketingInsightsTopApplications\",\"msg\":\"method\",\"method\":\"marketingInsightsTopApplications\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         ApplicationsTable = ws.recv()
#         print('Top Applications  Table Data: {}'.format(ApplicationsTable))
#
#         # Removing a
#         sliceresult = ApplicationsTable[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#
#         # ApplicationsTableTable0 = json.loads(string_input)['result'][0]
#         # ApplicationsTableTable1 = json.loads(string_input)['result'][0]['Amazon'][0]
#         # ApplicationsTableTable4 = format(ApplicationsTableTable1,',d')
#         # ApplicationsTableTable2 = json.loads(string_input)['result'][0]['Amazon'][1]
#         # ApplicationsTableTable5 = format(ApplicationsTableTable2,'.2%')
#         # list_TopApplicationData = [ApplicationsTableTable0, ApplicationsTableTable4 , ApplicationsTableTable5]
#         ListAll = []
#         for i in range(8):
#             Applications = json.loads(string_input)['result'][0]
#         ApplicationsTableTable1 = json.loads(string_input)['result'][0]['Amazon'][0]
#         AverageSubscribers = format(ApplicationsTableTable1, ',d')
#         ApplicationsTableTable2 = json.loads(string_input)['result'][0]['Amazon'][1]
#         Percentage = format(ApplicationsTableTable2, '.1%')
#         list_TopApplicationData = [Applications, AverageSubscribers, Percentage]
#         ListAll.append(list_TopApplicationData)
#
#         return (ListAll)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#
#  def Top_Gaming_Applications_Table_Data(self):
#     try:
#         msg = ["{\"id\":\"marketingInsightsTopGamingApplications\",\"msg\":\"method\",\"method\":\"marketingInsightsTopGamingApplications\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         TopGamingTable = ws.recv()
#         print('Top Gaming Applications Table Data: {}'.format(TopGamingTable))
#
#         # Removing a
#         sliceresult = TopGamingTable[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         # TopGamingTableTable1 = json.loads(string_input)['result'][0]
#         # TopGamingTableTable2 = json.loads(string_input)['result'][0]['Xbox Live'][0]
#         # TopGamingTableTable3 = format(TopGamingTableTable2,',d')
#         # TopGamingTableTable4 = json.loads(string_input)['result'][0]['Xbox Live'][1]
#         # TopGamingTableTable4 = format(TopGamingTableTable4,'.2%')
#         #
#         # list_TopGamingData = [TopGamingTableTable1, TopGamingTableTable3, TopGamingTableTable4]
#
#         ListAll = []
#         for i in range(8):
#           Applications = json.loads(string_input)['result'][0]
#         TopGamingTableTable2 = json.loads(string_input)['result'][0]['Xbox Live'][0]
#         AverageSubscribers = format(TopGamingTableTable2, ',d')
#         TopGamingTableTable4 = json.loads(string_input)['result'][0]['Xbox Live'][1]
#         Percentage = format(TopGamingTableTable4, '.2%')
#         list_TopApplicationData = [Applications, AverageSubscribers, Percentage]
#         ListAll.append(list_TopApplicationData)
#
#         return (ListAll)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def CommandIQ_Insights_Table_Data(self):
#     try:
#         msg = ["{\"id\":\"marketingSmartHomeInsights\",\"msg\":\"method\",\"method\":\"marketingSmartHomeInsights\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         CommandIQTable = ws.recv()
#         print('CommandIQ Insights Table Data: {}'.format(CommandIQTable))
#
#         # Removing a
#         sliceresult = CommandIQTable[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         CommandIQTableTable1 = json.loads(string_input)['result']
#         CommandIQTableTable2 = json.loads(string_input)['result'][1]
#         CommandIQTableTable3 = json.loads(string_input)['result'][2]
#         print('CommandIQ Insights Table Data Column 1 values :', CommandIQTableTable1)
#         print('CommandIQ Insights Table Data Column 2 values :', CommandIQTableTable2)
#         print('CommandIQ Insights Table Data Column 3 values :', CommandIQTableTable3)
#
#         return (CommandIQTableTable1)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#
#  def Usage_by_Application_Type_Chart_Data(self):
#     try:
#         msg = ["{\"id\":\"insightsAppGroupUsage\",\"msg\":\"method\",\"method\":\"insightsAppGroupUsage\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         Usageapplication = ws.recv()
#         print('Usage by Application Type Chart Data: {}'.format(Usageapplication))
#
#         # Removing a
#         sliceresult = Usageapplication[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         StreamingMedia = json.loads(string_input)['result'][0][1]
#         Web_Cloud_Storage_Hosting = json.loads(string_input)['result'][1][1]
#         Amazon = json.loads(string_input)['result'][2][1]
#         Social = json.loads(string_input)['result'][3][1]
#         Other = json.loads(string_input)['result'][4][1]
#         list_UsageApplicationData = [StreamingMedia, Web_Cloud_Storage_Hosting, Amazon,Social,Other]
#
#         return (list_UsageApplicationData)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Acquisition_Rate_AND_Insights_Chart_Data(self):
#     try:
#         msg = ["{\"id\":\"marketingAcquisitionRateInsights\",\"msg\":\"method\",\"method\":\"marketingAcquisitionRateInsights\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         Acquisition = ws.recv()
#         print('Acquisition Rate & Insights Data: {}'.format(Acquisition))
#
#         # Removing a
#         sliceresult = Acquisition[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         Acquisitiondata = json.loads(string_input)['result']
#         print('Acquisition Rate & Insights Data values :', Acquisitiondata)
#
#         return (Acquisitiondata)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Acquisition_Revenue_And_Insights_Chart_Data(self):
#     try:
#         msg = ["{\"id\":\"marketingAcquisitionRevenueInsights\",\"msg\":\"method\",\"method\":\"marketingAcquisitionRevenueInsights\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         Acquisitionrevenue = ws.recv()
#         print('Acquisition Revenue And Insights chart Data: {}'.format(Acquisitionrevenue))
#
#         # Removing a
#         sliceresult = Acquisitionrevenue[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         Acquisitionrevenuedata = json.loads(string_input)['result'][0]
#         print('Acquisition Revenue And Insights chart Data values :', Acquisitionrevenuedata)
#
#         return (Acquisitionrevenuedata)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def New_Subscribers_by_Service_Tier_AND_Technology(self):
#     try:
#         msg = ["{\"id\":\"marketingTargetSegmentationNewTechnologyCountByServiceTier\",\"msg\":\"method\",\"method\":\"marketingTargetSegmentationNewTechnologyCountByServiceTier\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         Newsubscribers = ws.recv()
#         print('Acquisition Revenue And Insights chart Data: {}'.format(Newsubscribers))
#
#         # Removing a
#         sliceresult = Newsubscribers[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         Newsubscribersdata = json.loads(string_input)['result']
#         print('Acquisition Revenue And Insights chart Data values :', Newsubscribersdata)
#
#         return ( Newsubscribersdata)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def  Devices_per_Household_Chart_devices(self):
#     try:
#         msg = ["{\"id\":\"marketingInsightsDeviceInghts\",\"msg\":\"method\",\"method\":\"marketingInsightsDeviceInghts\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         DataUsage = ws.recv()
#         print('Devices per Household chart Data: {}'.format(DataUsage))
#
#         # Removing a
#         sliceresult = DataUsage[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         Devicedata1 = json.loads(string_input)['result'][0]['0-4']
#         Devicedata2 = json.loads(string_input)['result'][1]['5-9']
#         Devicedata3 = json.loads(string_input)['result'][2]['10-14']
#         Devicedata4 = json.loads(string_input)['result'][3]['15-19']
#         Devicedata5 = json.loads(string_input)['result'][4]['20+']
#         list_DevicesHousHoldData = [Devicedata1, Devicedata2, Devicedata3, Devicedata4, Devicedata5]
#         print('Devices per Household chart Data values :', list_DevicesHousHoldData)
#
#         return (list_DevicesHousHoldData)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def  Devices_per_Household_Chart_subcribers(self):
#     try:
#         msg = ["{\"id\":\"marketingInsightsDeviceInghts\",\"msg\":\"method\",\"method\":\"marketingInsightsDeviceInghts\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         DataUsage = ws.recv()
#         print('Devices per Household chart Data: {}'.format(DataUsage))
#
#         # Removing a
#         sliceresult = DataUsage[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         Devicedata = json.loads(string_input)['result']
#         print('Devices per Household chart Data values :', Devicedata)
#
#         return (Devicedata)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Data_Usage_Trends_Charts(self):
#     try:
#         msg = ["{\"id\":\"marketingInsightsTotalStreamingUsageTrend\",\"msg\":\"method\",\"method\":\"marketingInsightsTotalStreamingUsageTrend\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         DataUsage = ws.recv()
#         print('Data Usage Trends chart Data: {}'.format(DataUsage))
#
#         # Removing a
#         sliceresult = DataUsage[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         DataUsagedata = json.loads(string_input)['result']
#         print('Data Usage Trends chart Data values :', DataUsagedata)
#
#         return (DataUsagedata)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Data_Usage_Trends_Charts_categories(self):
#         try:
#             msg = ["{\"id\":\"marketingInsightsTotalStreamingUsageTrend\",\"msg\":\"method\",\"method\":\"marketingInsightsTotalStreamingUsageTrend\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#             ws.send(json.dumps(msg, sort_keys=True))
#             result = ws.recv()
#             DataUsage = ws.recv()
#             print('Data Usage Trends chart Data: {}'.format(DataUsage))
#
#             # Removing a
#             sliceresult = DataUsage[1:]
#             sliceresult = json.loads(sliceresult)
#             print(sliceresult)
#             print('Result After slice: {}'.format(sliceresult))
#
#             string_input = ''.join(str(s) for s in sliceresult)
#             print(string_input)
#             DataUsagedata = json.loads(string_input)['result']['categories']
#             print('Data Usage Trends chart Data values :', DataUsagedata)
#
#             return (DataUsagedata)
#         except  Exception  as e:
#             return ("Oops!", e.__class__, "occured")
#
#  def Data_Usage_Trends_Charts_total(self):
#         try:
#             msg = ["{\"id\":\"marketingInsightsTotalStreamingUsageTrend\",\"msg\":\"method\",\"method\":\"marketingInsightsTotalStreamingUsageTrend\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#             ws.send(json.dumps(msg, sort_keys=True))
#             result = ws.recv()
#             DataUsage = ws.recv()
#             print('Data Usage Trends chart Data: {}'.format(DataUsage))
#
#             # Removing a
#             sliceresult = DataUsage[1:]
#             sliceresult = json.loads(sliceresult)
#             print(sliceresult)
#             print('Result After slice: {}'.format(sliceresult))
#
#             string_input = ''.join(str(s) for s in sliceresult)
#             print(string_input)
#             DataUsagedata = json.loads(string_input)['result']['series'][0]['data']
#             print('Data Usage Trends chart Data values :', DataUsagedata)
#
#             return (DataUsagedata)
#         except  Exception  as e:
#             return ("Oops!", e.__class__, "occured")
#
#  def Data_Usage_Trends_Charts_streaming(self):
#      try:
#          msg = ["{\"id\":\"marketingInsightsTotalStreamingUsageTrend\",\"msg\":\"method\",\"method\":\"marketingInsightsTotalStreamingUsageTrend\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#          ws.send(json.dumps(msg, sort_keys=True))
#          result = ws.recv()
#          DataUsage = ws.recv()
#          print('Data Usage Trends chart Data: {}'.format(DataUsage))
#
#          # Removing a
#          sliceresult = DataUsage[1:]
#          sliceresult = json.loads(sliceresult)
#          print(sliceresult)
#          print('Result After slice: {}'.format(sliceresult))
#
#          string_input = ''.join(str(s) for s in sliceresult)
#          print(string_input)
#          DataUsagedata = json.loads(string_input)['result']['series'][1]['data']
#          print('Data Usage Trends chart Data values :', DataUsagedata)
#
#          return (DataUsagedata)
#      except  Exception  as e:
#          return ("Oops!", e.__class__, "occured")
#
#  def Household_Device_Trends_Charts(self):
#     try:
#         msg = ["{\"id\":\"marketingInsightsSubscriberDistribution\",\"msg\":\"method\",\"method\":\"marketingInsightsSubscriberDistribution\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         DataUsage = ws.recv()
#         print('Household Device Trends chart Data: {}'.format(DataUsage))
#
#         # Removing a
#         sliceresult = DataUsage[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         HouseDevicedata = json.loads(string_input)['result']
#         print('Household Device Trends chart Data values :', HouseDevicedata)
#
#         return (HouseDevicedata)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Household_Device_Trends_Charts_wifiscore(self):
#     try:
#         msg = ["{\"id\":\"marketingInsightsSubscriberDistribution\",\"msg\":\"method\",\"method\":\"marketingInsightsSubscriberDistribution\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         DataUsage = ws.recv()
#         print('Household Device Trends chart Data: {}'.format(DataUsage))
#
#         # Removing a
#         sliceresult = DataUsage[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         HouseDevicedata = json.loads(string_input)['result']['wifiScore']
#         print('Household Device Trends chart Data values :', HouseDevicedata)
#
#         return (HouseDevicedata)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def Household_Device_Trends_Charts_AverageDeviceCount(self):
#     try:
#         msg = ["{\"id\":\"marketingInsightsSubscriberDistribution\",\"msg\":\"method\",\"method\":\"marketingInsightsSubscriberDistribution\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         DataUsage = ws.recv()
#         print('Household Device Trends chart Data: {}'.format(DataUsage))
#
#         # Removing a
#         sliceresult = DataUsage[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         HouseDevicedata = json.loads(string_input)['result']['numberOfDevices']
#         print('Household Device Trends chart Data values :', HouseDevicedata)
#
#         return (HouseDevicedata)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#
#  def Service_Module_Adoption_Rate(self):
#     try:
#         msg = ["{\"id\":\"marketingInsightsServiceAdoptionTrend\",\"msg\":\"method\",\"method\":\"marketingInsightsServiceAdoptionTrend\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         DataUsage = ws.recv()
#         print('Service Module Adoption Rate chart Data: {}'.format(DataUsage))
#
#         # Removing a
#         sliceresult = DataUsage[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         ServiceDevicedata = json.loads(string_input)['result']
#         print('Service Module Adoption Rate chart Data values :', ServiceDevicedata)
#
#         return (ServiceDevicedata)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def WiFi_Device_Category_Trends_Charts(self):
#     try:
#         msg = ["{\"id\":\"marketingInsightsDeviceCategoryTrend\",\"msg\":\"method\",\"method\":\"marketingInsightsDeviceCategoryTrend\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         DataUsage = ws.recv()
#         print('Wi-Fi Device Category Trends chart Data: {}'.format(DataUsage))
#
#         # Removing a
#         sliceresult = DataUsage[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         WIFIDevicedata = json.loads(string_input)['result']
#         print('Wi-Fi Device Category Trends chart Data values :', WIFIDevicedata)
#
#         return (WIFIDevicedata)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def WiFi_Device_Category_Trends_Charts(self):
#     try:
#         msg = ["{\"id\":\"marketingInsightsDeviceCategoryTrend\",\"msg\":\"method\",\"method\":\"marketingInsightsDeviceCategoryTrend\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         DataUsage = ws.recv()
#         print('Wi-Fi Device Category Trends chart Data: {}'.format(DataUsage))
#
#         # Removing a
#         sliceresult = DataUsage[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         WIFIDevicedata = json.loads(string_input)['result']
#         print('Wi-Fi Device Category Trends chart Data values :', WIFIDevicedata)
#
#         return (WIFIDevicedata)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def WiFi_Device_Category_Trends_Charts_Computer(self):
#     try:
#         msg = ["{\"id\":\"marketingInsightsDeviceCategoryTrend\",\"msg\":\"method\",\"method\":\"marketingInsightsDeviceCategoryTrend\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         DataUsage = ws.recv()
#         print('Wi-Fi Device Category Trends chart Data: {}'.format(DataUsage))
#
#         # Removing a
#         sliceresult = DataUsage[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         WIFIDevicedata = json.loads(string_input)['result']['series'][0]['data']
#         print('Wi-Fi Device Category Trends chart Data values :', WIFIDevicedata)
#
#         return (WIFIDevicedata)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#  def WiFi_Device_Category_Trends_Charts_phone(self):
#     try:
#         msg = ["{\"id\":\"marketingInsightsDeviceCategoryTrend\",\"msg\":\"method\",\"method\":\"marketingInsightsDeviceCategoryTrend\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
#         ws.send(json.dumps(msg, sort_keys=True))
#         result = ws.recv()
#         DataUsage = ws.recv()
#         print('Wi-Fi Device Category Trends chart Data: {}'.format(DataUsage))
#
#         # Removing a
#         sliceresult = DataUsage[1:]
#         sliceresult = json.loads(sliceresult)
#         print(sliceresult)
#         print('Result After slice: {}'.format(sliceresult))
#
#         string_input = ''.join(str(s) for s in sliceresult)
#         print(string_input)
#         WIFIDevicedata = json.loads(string_input)['result']['series'][3]['data']
#         print('Wi-Fi Device Category Trends chart Data values :', WIFIDevicedata)
#
#         return (WIFIDevicedata)
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
#
#  def websocket_close(self):
#     try:
#         ws.close()
#     except  Exception  as e:
#         return ("Oops!", e.__class__, "occured")
#
# connectionObj = sample()
#
#
# # def (self):
# #     try:
# #
# #         return ()
# #     except  Exception  as e:
# #         return ("Oops!", e.__class__, "occured")
#
