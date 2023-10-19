import json
import ssl
import Apireposebody
from websocket import create_connection


ws = create_connection('wss://cloud-stg.calix.com/sockjs/888/q495vp66/websocket',sslopt={"cert_reqs": ssl.CERT_NONE})

class Acquisition:
    def WebsocketConnection(self):
        try:
            result = ws.recv()
            print('Result: {}'.format(result))
            result = ws.recv()
            print('Result: {}'.format(result))
            ws.send(json.dumps([json.dumps({'msg': 'connect', 'version': '1', 'support': ['1', 'pre2', 'pre1']})]))
            result = ws.recv()
            print('Result: {}'.format(result))
            return ('Result: {}'.format(result))
        except  Exception  as e:
            return ("Oops!", e.__class__, "occured")

    def login(self):
        try:
            msg = [
                "{\"msg\":\"method\",\"method\":\"cloudLogin\",\"params\":[{\"username\":\"implementation@allophone.net\",\"password\":\"Impl7583\",\"clientLocalTime\":1591687526276,\"offsetTimeZone\":-330,\"loginType\":\"local\",\"logoutUrl\":\"/login\"}],\"id\":\"cloudLogin\"}"]

            ws.send(json.dumps(msg, sort_keys=True))
            result = ws.recv()
            createsegment = ws.recv()
            print('login Response Response: {}'.format(createsegment))
            sliceresult = createsegment[1:]
            sliceresult = json.loads(sliceresult)
            print(sliceresult)
            print('Result After slice: {}'.format(sliceresult))
            as_dict = json.loads(sliceresult[0])
            global Clientid
            global orgId
            Clientid = as_dict['result']['data']['_id']
            orgId = as_dict['result']['data']['orgId']
            print('Result of ClientId: {}'.format(Clientid))
            print('Result of Orgid: {}'.format(orgId))
            return ('Result: {}'.format(as_dict))
        except  Exception  as e:
            return ("Oops!", e.__class__, "occured")

    def createprofile(self):
        try:
            msg = ["{\"msg\":\"method\",\"method\":\"createMarketingRetentionSegmentation\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":\"All\",\"location\":null,\"period\":\"last-28d\",\"name\":\"automation\",\"desc\":\"validation purpose for automation\",\"filter\":{\"name\":\"automation\",\"desc\":\"validation purpose for automation\",\"region\":\"All\",\"technologyType\":[],\"serviceTier\":[],\"userType\":[],\"customerType\":[],\"numOfDevices\":\"\",\"hasCalixSmartHomeApp\":true,\"configuredProfiles\":\"\"},\"countTimestamp\":\"2020-06-23\"}],\"id\":\"createMarketingRetentionSegmentation\"}"]
            ws.send(json.dumps(msg, sort_keys=True))
            result = ws.recv()
            createsegment = ws.recv()
            print('Retention Segmentation - Created Response Response: {}'.format(createsegment))
            sliceresult = createsegment[1:]
            sliceresult = json.loads(sliceresult)
            print(sliceresult)
            print('Result After slice: {}'.format(sliceresult))
            string_input = ''.join(str(s) for s in sliceresult)
            print(string_input)
            Leftmenulist = json.loads(string_input)['result']
            return (Leftmenulist)
            return ('Result: {}'.format(createsegment))
        except Exception as e:
           return ("Oops!", e.__class__, "occured")

    def AcquisitionData(self):
        try:
            # msg = ["{\"msg\":\"method\",\"method\":\"marketingRetentionSegmentationUserReport\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":\"all\",\"timezone\":\"05.30\",\"data\":{\"name\":\"automation\",\"desc\":\"validation purpose for automation\",\"region\":\"All\",\"technologyType\":[],\"serviceTier\":[],\"userType\":[],\"customerType\":[],\"numOfDevices\":\"\",\"hasCalixSmartHomeApp\":true,\"configuredProfiles\":\"\"},\"polygon\":null,\"attainableRate\":false}],\"id\":\"marketingRetentionSegmentationUserReport\"}"]
            msg= Apireposebody.Acquisitiondata
            ws.send(json.dumps(msg, sort_keys=True))
            result = ws.recv()
            print(result)
            Leftmenulistdata = ws.recv()
            sliceresult = Leftmenulistdata[1:]
            sliceresult = json.loads(sliceresult)
            string_input = ''.join(str(s) for s in sliceresult)
            Leftmenulist_Data = json.loads(string_input)['result'][0]
            print(Leftmenulist_Data)
            getaccountNumber=Leftmenulist_Data['accountNumber']
            getaccountName = Leftmenulist_Data['name']
            getphonenumber = Leftmenulist_Data['phoneNumber']
            Serviceaddress=Leftmenulist_Data['serviceAddress']
            # Billingaddress = Leftmenulist_Data['billingAddress']
            # email= Leftmenulist_Data['email']
            # usoc = Leftmenulist_Data['usoc']
            serviceTier = Leftmenulist_Data['serviceTier']
            region = Leftmenulist_Data['region']
            location = Leftmenulist_Data['location']
            # wifiScore = Leftmenulist_Data['wifiScore']
            # hasWap = Leftmenulist_Data['hasWap']
            # numOfDevices = Leftmenulist_Data['numOfDevices']
            technologyType = Leftmenulist_Data['technologyType']
            customerType = Leftmenulist_Data['customerType']
            # optOut = Leftmenulist_Data['optOut']
            downloadSpeed = Leftmenulist_Data['downloadSpeed']
            uploadSpeed = Leftmenulist_Data['uploadSpeed']
            # lat = Leftmenulist_Data['lat']
            # lng = Leftmenulist_Data['lng']
            attainableRate = Leftmenulist_Data['attainableRate']
            # curFee = Leftmenulist_Data['curFee']
            # maxFee = Leftmenulist_Data['maxFee']
            # upUsage = Leftmenulist_Data['upUsage']
            # downUsage = Leftmenulist_Data['downUsage']
            # totalUsage = Leftmenulist_Data['totalUsage']
            # streaming = Leftmenulist_Data['streaming']
            # social = Leftmenulist_Data['social']
            # gaming = Leftmenulist_Data['gaming']
            # wfh = Leftmenulist_Data['wfh']
            # streamingUsage = Leftmenulist_Data['streamingUsage']
            # gamingUsage = Leftmenulist_Data['gamingUsage']
            # wfh_usage = Leftmenulist_Data['wfh_usage']
            # field1 = Leftmenulist_Data['field1']
            # field2 = Leftmenulist_Data['field2']
            # field3 = Leftmenulist_Data['field3']
            # field4 = Leftmenulist_Data['field4']
            Check = 'N/A'
            Acquisitiondatalist = [getaccountNumber, getaccountName, getphonenumber, Serviceaddress, serviceTier,region, location, technologyType,customerType,downloadSpeed,uploadSpeed,attainableRate
                                   , Check]
            print(Acquisitiondatalist)
            return (Acquisitiondatalist)
        except  Exception  as e:
            return ("Oops!", e.__class__, "occured")
    def previewcount_Acquisition(self):
        try:
            msg = ["{\"msg\":\"method\",\"method\":\"marketingRetentionSegmentationUserCount\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":\"All\",\"location\":null,\"period\":\"last-28d\",\"name\":\"automation\",\"desc\":\"validation purpose for automation\",\"filter\":{\"name\":\"automation\",\"desc\":\"validation purpose for automation\",\"technologyType\":[],\"serviceTier\":[],\"userType\":[],\"customerType\":[],\"numOfDevices\":\"\",\"hasCalixSmartHomeApp\":true,\"configuredProfiles\":\"\"}}],\"id\":\"marketingRetentionSegmentationUserCount\"}"]
            print(msg)
            ws.send(json.dumps(msg, sort_keys=True))
            result = ws.recv()
            TargetSegmentationUser_count = ws.recv()
            print('Click Edit Icon -> Click Preview Response: {}'.format(TargetSegmentationUser_count))
            sliceresult = TargetSegmentationUser_count[1:]
            sliceresult = json.loads(sliceresult)
            print(sliceresult)
            print('Result After slice: {}'.format(sliceresult))
            string_input = ''.join(str(s) for s in sliceresult)
            print(string_input)
            countdata = json.loads(string_input)['result']
            return (countdata)
        except Exception as e:
           return ("Oops!", e.__class__, "occured")

connectionObj=Acquisition()
# connectionObj.WebsocketConnection()
# connectionObj.AcquisitionData()