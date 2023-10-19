import os
import json
import pytz
import requests
import yaml
from datetime import date, datetime

class CMC():
    def DevYamlReader(self):
        # Base variables
        global Base_url
        global user
        global password
        global onboard_url
        global onboardtoken
        global grant_type
        global client_secret
        global org_id
        global month
        global X_Calix_ClientID
        global content_type
        global Qlik_Segment_Name
        global Qlik_Segment_Type
        global Qlik_Region
        global Qlik_Location
        global Qlik_Service
        global Qlik_Propensity
        with open('../Configure/env/dev.yml', 'r') as file:
        # with open('../cmc/Configure/env/dev.yml', 'r') as file:
            getdata = yaml.safe_load(file)
            print(getdata)
            Base_url = getdata['env']['RESTAPI']['Base_url_Dev']
            user = getdata['env']['RESTAPI']['username_Dev']
            password = getdata['env']['RESTAPI']['password_Dev']
            grant_type = getdata['env']['RESTAPI']['grant_type_Dev']
            client_secret = getdata['env']['RESTAPI']['client_secret_Dev']
            X_Calix_ClientID = getdata['env']['RESTAPI']['X_Calix_ClientID']
            content_type = getdata['env']['RESTAPI']['content_type']
            Qlik_Segment_Name = getdata['env']['Qlick_ObjId']['Segment_Name']
            Qlik_Segment_Type = getdata['env']['Qlick_ObjId']['Segment_Type']
            Qlik_Region = getdata['env']['Qlick_ObjId']['Region']
            Qlik_Location = getdata['env']['Qlick_ObjId']['Location']
            Qlik_Service = getdata['env']['Qlick_ObjId']['Service']
            Qlik_Propensity = getdata['env']['Qlick_ObjId']['Propensity']
            return (getdata['env']['RESTAPI']['Base_url_Dev'])

    def DevfuncYamlReader(self):
        global Base_url
        global user
        global password
        global onboard_url
        global onboardtoken
        global grant_type
        global client_secret
        global org_id
        global month
        global X_Calix_ClientID
        global content_type
        global Qlik_Segment_Name
        global Qlik_Segment_Type
        global Qlik_Region
        global Qlik_Location
        global Qlik_Service
        global Qlik_Propensity
        with open('../Configure/env/devfunc.yml', 'r') as file:
        # with open('../cmc/Configure/env/devfunc.yml', 'r') as file:
            getdata = yaml.safe_load(file)
            print(getdata)
            Base_url = getdata['env']['RESTAPI']['Base_url_DevFunc']
            user = getdata['env']['RESTAPI']['username_DevFunc']
            password = getdata['env']['RESTAPI']['Password_DevFunc']
            grant_type = getdata['env']['RESTAPI']['grant_type_DevFunc']
            client_secret = getdata['env']['RESTAPI']['client_secret_DevFunc']
            X_Calix_ClientID = getdata['env']['RESTAPI']['X_Calix_ClientID']
            content_type = getdata['env']['RESTAPI']['content_type']
            Qlik_Segment_Name = getdata['env']['Qlick_ObjId']['Segment_Name']
            Qlik_Segment_Type = getdata['env']['Qlick_ObjId']['Segment_Type']
            Qlik_Region = getdata['env']['Qlick_ObjId']['Region']
            Qlik_Location = getdata['env']['Qlick_ObjId']['Location']
            Qlik_Service = getdata['env']['Qlick_ObjId']['Service']
            Qlik_Propensity = getdata['env']['Qlick_ObjId']['Propensity']
            return (getdata['env']['RESTAPI']['Base_url_DevFunc'])

    def StageYamlReader(self):
        global Base_url
        global user
        global password
        global onboard_url
        global onboardtoken
        global grant_type
        global client_secret
        global org_id
        global month
        global X_Calix_ClientID
        global content_type
        global Qlik_Segment_Name
        global Qlik_Segment_Type
        global Qlik_Region
        global Qlik_Location
        global Qlik_Service
        global Qlik_Propensity
        with open('../Configure/env/stg.yml', 'r') as file:
        # with open('../cmc/Configure/env/stg.yml', 'r') as file:
            getdata = yaml.safe_load(file)
            print(getdata)
            Base_url = getdata['env']['RESTAPI']['Base_url_Stage']
            user = getdata['env']['RESTAPI']['username_stage']
            password = getdata['env']['RESTAPI']['password_stage']
            grant_type = getdata['env']['RESTAPI']['grant_type_stage']
            client_secret = getdata['env']['RESTAPI']['client_secret_stage']
            X_Calix_ClientID = getdata['env']['RESTAPI']['X_Calix_ClientID']
            content_type = getdata['env']['RESTAPI']['content_type']
            Qlik_Segment_Name = getdata['env']['Qlick_ObjId']['Segment_Name']
            Qlik_Segment_Type = getdata['env']['Qlick_ObjId']['Segment_Type']
            Qlik_Region = getdata['env']['Qlick_ObjId']['Region']
            Qlik_Location = getdata['env']['Qlick_ObjId']['Location']
            Qlik_Service = getdata['env']['Qlick_ObjId']['Service']
            Qlik_Propensity = getdata['env']['Qlick_ObjId']['Propensity']
            return (getdata['env']['RESTAPI']['Base_url_Stage'])

    def post(self, end_url, user, password):
        try:
            data = {"grant_type": grant_type,
                    "username": user,
                    "password": password,
                    "client_secret": client_secret
                    }
            headers = {"Content-type": content_type,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            url = Base_url + end_url
            print(url)
            response = requests.post(url, headers=headers, data=data)
            return (response)
        except Exception as e:
            return ("Oops!", e.__class__, "occured")

    def post_twoParam(self, end_url, data):
        try:
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            url = Base_url + end_url
            print(url)
            response = requests.post(url, headers=headers, json=data)
            return (response)
        except Exception as e:
            return ("Oops!", e.__class__, "occured")

    def get(self, end_url):
        try:
            headers = {"X-Calix-ClientID": X_Calix_ClientID,
                       "X-Calix-AccessToken": access_token
                       }
            url = Base_url + end_url
            print(url)
            response = requests.get(url, headers=headers)
            return (response)
        except Exception as e:
            return (response)

    def post_RefreshToken(self, end_url, refresh_token):
        try:
            data = {"grant_type": 'refresh_token',
                    "refresh_token": refresh_token,
                    "client_secret": client_secret
                    }
            headers = {"Content-type": content_type,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            url = Base_url + end_url
            print(url)
            response = requests.post(url, headers=headers, data=data)
            return (response)
        except Exception as e:
            return ("Oops!", e.__class__, "occured")

    def UserLogin_UserCMC(self):
        try:
            # Login variables
            global AccountNumber
            global Name
            global PhoneNumber
            global serviceAddress
            global email
            global region
            global location
            global customerType
            global downloadSpeed
            global uploadSpeed
            global attainableRate
            global Token
            global access_token
            global refresh_token
            global LoginUser
            global orgId
            global orgName
            global spId
            global roles
            global month
            global entitlementApptype
            AccountNumber = []
            Name = []
            PhoneNumber = []
            serviceAddress = []
            email = []
            region = []
            location = []
            customerType = []
            downloadSpeed = []
            uploadSpeed = []
            attainableRate = []
            entitlementApptype = []
            month = 'last-30d'
            end_url = '/v1/authentication/token'
            response = API_CMCObj.post(end_url, user, password)
            assert response.status_code == 200
            data = response.json()
            print(data)
            access_token = data['access_token']
            refresh_token = data['refresh_token']
            orgId = data['OrgId']
            for appType in data['entitlements']:
                entitlementApptype.append(appType['apptype'])
            print("enetilementApptype: ", entitlementApptype)
            return (access_token, response.status_code)
        except Exception as e:
            print(response.text)
            return (response.status_code)

    def loginAPI_RefreshToken(self):
        try:
            global orgId
            global access_token
            print('#####  Refresh Token  #####')
            end_url = "/v1/authentication/token"
            response = API_CMCObj.post_RefreshToken(end_url, refresh_token)
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            access_token = data['access_token']
            LoginUser = data['username']
            orgId = data['OrgId']
            orgName = data['OrgName']
            spId = data['SpId']
            roles = data['roles']
            return (access_token, response.status_code)
        except Exception as e:
            print(response.text)
            return (response.status_code)

    def Social_Channel_Heatmap_charts(self):
        # Documentation: We are checking social channel heatmap contains data or not
        try:
            print("**** Get SocialChannelHeatmapStatus *****")
            charturl = Base_url + "/v1/cmc/insights/social-channel-list?timezone=05.30&org-id="+orgId+"&period="+month
            headers = {"X-Calix-AccessToken": access_token,
                   "X-Calix-ClientID": X_Calix_ClientID
                   }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            if [] == data:
                chartData = 'No Properties'
            else:
                chartData = 'Data available'
            print("chartData: ",chartData)
            keySet = []
            for keys in data:
             json_str1 = str(keys).replace("\'", "\"")
             json_obj = json.loads(json_str1)
             keys_list = json_obj.keys()
             keySet.append(keys_list)
            print(keySet)

            return (response.status_code,chartData,keySet)
        except Exception as e:
            return(response.status_code)

    def Subscribers_Data_Usage(self):
        try:
            print("Subscribers_Data_Usage")
            DatalistX=[]
            DatalistY = []
            charturl = Base_url + "/v1/cmc/insights/total-bandwidth-consumed?categories=75-200-500-1000-2000-3000&org-id="+orgId+"&period="+month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            DatalistX.append(format(data[0]['0-75'],',d'))
            DatalistX.append(format(data[1]['76-200'],',d'))
            DatalistX.append(format(data[2]['201-500'],',d'))
            DatalistX.append(format(data[3]['501-1000'],',d'))
            DatalistX.append(format(data[4]['1001-2000'],',d'))
            DatalistX.append(format(data[5]['2001-3000'],',d'))
            DatalistX.append(format(data[6]['3001+'],',d'))
            print(DatalistX)

            DatalistY.append('0GB-75GB')
            DatalistY.append('76GB-200GB')
            DatalistY.append('201GB-500GB')
            DatalistY.append('501GB-1.00TB')
            DatalistY.append('1.01TB-2.00TB')
            DatalistY.append('2.01TB-3.00TB')
            DatalistY.append('3.01TB')
            print(DatalistY)
            return(response.status_code,DatalistX,DatalistY)
        except Exception as e:
            return(response.status_code)

    def Subscribers_Data_Usage_drilldown(self):
        try:
            AccountNumber = []
            Name = []
            PhoneNumber = []
            serviceAddress = []
            email = []
            serviceTier = []
            region = []
            technologyType = []
            Optout = []
            location = []
            customerType = []
            downloadSpeed = []
            uploadSpeed = []
            wifiScore = []
            attainableRate = []
            charturl = Base_url + "/v1/cmc/insights/user-list-by-usage?category=3001&page=1&size=10&refresh=true&org-id=" + orgId + "&period=" + month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Subscribers_Data_Usage_drilldown :")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("filter: ", data)

            for datalist in data:
                AccountNumber.append(datalist['accountNumber'])
            print("accountNumber", AccountNumber)
            for datalist in data:
                Name.append(datalist['name'])
            print("name", Name)
            for datalist in data:
                PhoneNumber.append(datalist['phoneNumber'])
            print("PhoneNumber", PhoneNumber)
            for datalist in data:
                serviceAddress.append(datalist['serviceAddress'])
            print("serviceAddress", serviceAddress)
            for datalist in data:
                if datalist['email']=="":
                    datalist['email'] = 'N/A'
                email.append(datalist['email'])
            print("email",email)
            for datalist in data:
                serviceTier.append(datalist['serviceTier'])
            print("serviceTier", serviceTier)
            for datalist in data:
                region.append(datalist['region'])
            print("region", region)
            for datalist in data:
                technologyType.append(datalist['technologyType'])
            print("technologyType", technologyType)
            for datalist in data:
                Optout.append(datalist['optOut'])
            print("optOut", Optout)

            for datalist in data:
                location.append(datalist['location'])
            print("location", location)
            for datalist in data:
                customerType.append(datalist['customerType'])
            print("customerType", customerType)
            for datalist in data:
                 s=datalist['downloadSpeed']
                 condata=str(s).split('.')[0]
                 downloadSpeed.append(condata)
            print("downloadSpeed",downloadSpeed)
            for datalist in data:
                s = datalist['uploadSpeed']
                condata1 = str(s).split('.')[0]
                uploadSpeed.append(condata1)
            print("uploadSpeed",uploadSpeed)
            for datalist in data:
                s = datalist['attainableRate']
                condata1 = str(s).split('.')[0]
                wifiScore.append(condata1)
            print("attainableRate",wifiScore)

            for datalist in data:
                s = datalist['totalUsage']
                attainableRate.append(s)
            print("totalUsage",attainableRate)
            combined_Table_all = [list(l) for l in
                                  zip(AccountNumber, Name, PhoneNumber, email, serviceAddress,serviceTier, region, location,technologyType,Optout,
                                      customerType, downloadSpeed, uploadSpeed,wifiScore,attainableRate)]
            print("Combined Data ", combined_Table_all)
            return(response.status_code,combined_Table_all)
        except Exception as e:
            return(response.status_code)

    def Streaming_Subscribers(self):
        try:
            DatalistX=[]
            DatalistY = []
            charturl = Base_url + "/v1/cmc/target-segmentation/service-tier-counts-by-user-type?type=streaming&org-id="+orgId+"&period="+month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Streaming_Subscribers")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)

            print(data['series'][0]['data'])
            DatalistX.append(format(data['series'][0]['data'][0], ',d'))
            DatalistX.append(format(data['series'][0]['data'][1], ',d'))
            DatalistX.append(format(data['series'][0]['data'][2], ',d'))
            DatalistX.append(format(data['series'][0]['data'][3], ',d'))
            DatalistX.append(format(data['series'][0]['data'][4], ',d'))
            print(DatalistX)
            TotalStreaming = int(data['series'][0]['data'][0]) + int(data['series'][0]['data'][1]) + data['series'][0]['data'][2] + data['series'][0]['data'][3] + data['series'][0]['data'][4]
            print('TotalStreaming: ',format(TotalStreaming,',d'))
            DatalistY.append('<20M / Streaming')
            DatalistY.append('20M+ / Streaming')
            DatalistY.append('50M+ / Streaming')
            DatalistY.append('300M+ / Streaming')
            DatalistY.append('1G / Streaming')

            return(response.status_code,DatalistX,DatalistY,format(TotalStreaming,',d'))
        except Exception as e:
            return(response.status_code)

    def Streaming_Subscribers_drilldown(self):
        try:
            charturl = Base_url + "/v1/cmc/insights/user-list-by-tier-and-group?org-id=" + orgId + "&period=" + month + "&tier=300M%2B&reverse=false&group=streaming&page=1&size=10&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Streaming_Subscribers_drilldown :")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("filter: ", data)
            lst = response.json()
            for i in range(len(lst)):
                x = lst[i]
            print(i)
            for datalist in data:
                AccountNumber.append(datalist['accountNumber'])
            print("accountNumber", AccountNumber)
            for datalist in data:
                Name.append(datalist['name'])
            print("name", Name)
            for datalist in data:
                PhoneNumber.append(datalist['phoneNumber'])
            print("PhoneNumber", PhoneNumber)
            for datalist in data:
                serviceAddress.append(datalist['serviceAddress'])
            print("serviceAddress", serviceAddress)
            for datalist in data:
                email.append(datalist['email'])
            print("SpeedTest", email)
            for datalist in data:
                region.append(datalist['region'])
            print("region", region)
            for datalist in data:
                location.append(datalist['location'])
            print("location", location)
            for datalist in data:
                customerType.append(datalist['customerType'])
            print("customerType", customerType)
            for datalist in data:
                downloadSpeed.append(datalist['downloadSpeed'])
            print("downloadSpeed", downloadSpeed)
            for datalist in data:
                uploadSpeed.append(datalist['uploadSpeed'])
            print("location", uploadSpeed)
            for datalist in data:
                attainableRate.append(datalist['attainableRate'])
            print("attainableRate", attainableRate)
            combined_Table_all = [list(l) for l in
                                  zip(AccountNumber, Name, PhoneNumber, serviceAddress, email, region, location,
                                      customerType, downloadSpeed, uploadSpeed, attainableRate)]
            print("Combined Data ", combined_Table_all)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Gaming_Subscribers(self):
        try:
            DatalistX=[]
            DatalistY=[]
            charturl = Base_url + "/v1/cmc/target-segmentation/service-tier-counts-by-user-type?org-id="+orgId+"&period="+month+"&type=gaming"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Gaming_Subscribers")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            print(data['series'][0]['data'])
            DatalistX.append(format(data['series'][0]['data'][0], ',d'))
            DatalistX.append(format(data['series'][0]['data'][1], ',d'))
            DatalistX.append(format(data['series'][0]['data'][2], ',d'))
            DatalistX.append(format(data['series'][0]['data'][3], ',d'))
            DatalistX.append(format(data['series'][0]['data'][4], ',d'))
            print(DatalistX)
            TotalGaming = int(data['series'][0]['data'][0]) + int(data['series'][0]['data'][1]) + data['series'][0]['data'][2] + data['series'][0]['data'][3] + data['series'][0]['data'][4]
            print('TotalStreaming: ',format(TotalGaming,',d'))
            DatalistY.append('<20M / Gaming')
            DatalistY.append('20M+ / Gaming')
            DatalistY.append('50M+ / Gaming')
            DatalistY.append('300M+ / Gaming')
            DatalistY.append('1G / Gaming')

            print(DatalistY)
            return (response.status_code, DatalistX, DatalistY,format(TotalGaming,',d'))
        except Exception as e:
            return(response.status_code)

    def Gaming_Subscribers_drilldown(self):
        try:
            charturl = Base_url + "/v1/cmc/insights/user-list-by-tier-and-group?org-id=" + orgId + "&period=" + month + "&tier=300M%2B&reverse=false&group=gaming&page=1&size=10&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            response = requests.get(charturl, headers=headers)
            print(charturl)
            print("Gaming_Subscribers_drilldown :")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("filter: ", data)
            lst = response.json()
            for i in range(len(lst)):
                x = lst[i]
            print(i)
            for datalist in data:
                AccountNumber.append(datalist['accountNumber'])
            print("accountNumber", AccountNumber)
            for datalist in data:
                Name.append(datalist['name'])
            print("name", Name)
            for datalist in data:
                PhoneNumber.append(datalist['phoneNumber'])
            print("PhoneNumber", PhoneNumber)
            for datalist in data:
                serviceAddress.append(datalist['serviceAddress'])
            print("serviceAddress", serviceAddress)
            for datalist in data:
                email.append(datalist['email'])
            print("SpeedTest", email)
            for datalist in data:
                region.append(datalist['region'])
            print("region", region)
            for datalist in data:
                location.append(datalist['location'])
            print("location", location)
            for datalist in data:
                customerType.append(datalist['customerType'])
            print("customerType", customerType)
            for datalist in data:
                downloadSpeed.append(datalist['downloadSpeed'])
            print("downloadSpeed", downloadSpeed)
            for datalist in data:
                uploadSpeed.append(datalist['uploadSpeed'])
            print("location", uploadSpeed)
            for datalist in data:
                attainableRate.append(datalist['attainableRate'])
            print("attainableRate", attainableRate)
            combined_Table_all = [list(l) for l in
                                  zip(AccountNumber, Name, PhoneNumber, serviceAddress, email, region, location,
                                      customerType, downloadSpeed, uploadSpeed, attainableRate)]
            print("Combined Data ", combined_Table_all)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Work_from_Home_WFH_Subscribers(self):
        try:
            DatalistX=[]
            charturl = Base_url + "/v1/cmc/target-segmentation/service-tier-counts-by-user-type?type=wfh&org-id="+orgId+"&period="+month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            response = requests.get(charturl, headers=headers)
            print(charturl)
            print("Work_from_Home_WFH_Subscribers")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            DatalistX.append(format(data['series'][0]['data'][0], ',d'))
            DatalistX.append(format(data['series'][0]['data'][1], ',d'))
            DatalistX.append(format(data['series'][0]['data'][2], ',d'))
            DatalistX.append(format(data['series'][0]['data'][3], ',d'))
            DatalistX.append(format(data['series'][0]['data'][4], ',d'))
            TotalStreaming = int(data['series'][0]['data'][0]) + int(data['series'][0]['data'][1]) + data['series'][0]['data'][2] + data['series'][0]['data'][3] + data['series'][0]['data'][4]
            print('TotalStreaming: ',format(TotalStreaming,',d'))
            print(DatalistX)
            return(response.status_code,DatalistX,format(TotalStreaming,',d'))
        except Exception as e:
            return(response.status_code)

    def Work_from_Home_WFH_Subscribers_drilldown(self):
        try:
            charturl = Base_url + "/v1/cmc/insights/user-list-by-tier-and-group?org-id=" + orgId + "&period=" + month + "&tier=300M%2B&reverse=false&group=wfh&page=1&size=10&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            response = requests.get(charturl, headers=headers)
            print(charturl)
            print("Work_from_Home_WFH_Subscribers_drilldown :")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("filter: ", data)
            lst = response.json()
            for i in range(len(lst)):
                x = lst[i]
                # print(x)
            print(i)
            for datalist in data:
                AccountNumber.append(datalist['accountNumber'])
            print("accountNumber", AccountNumber)
            for datalist in data:
                Name.append(datalist['name'])
            print("name", Name)
            for datalist in data:
                PhoneNumber.append(datalist['phoneNumber'])
            print("PhoneNumber", PhoneNumber)
            for datalist in data:
                serviceAddress.append(datalist['serviceAddress'])
            print("serviceAddress", serviceAddress)
            for datalist in data:
                email.append(datalist['email'])
            print("SpeedTest", email)
            for datalist in data:
                region.append(datalist['region'])
            print("region", region)
            for datalist in data:
                location.append(datalist['location'])
            print("location", location)
            for datalist in data:
                customerType.append(datalist['customerType'])
            print("customerType", customerType)
            for datalist in data:
                downloadSpeed.append(datalist['downloadSpeed'])
            print("downloadSpeed", downloadSpeed)
            for datalist in data:
                uploadSpeed.append(datalist['uploadSpeed'])
            print("location", uploadSpeed)
            for datalist in data:
                attainableRate.append(datalist['attainableRate'])
            print("attainableRate", attainableRate)
            combined_Table_all = [list(l) for l in
                                  zip(AccountNumber, Name, PhoneNumber, serviceAddress, email, region, location,
                                      customerType, downloadSpeed, uploadSpeed, attainableRate)]
            print("Combined Data ", combined_Table_all)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def churn_rate_And_insights(self):
        try:
            DatalistX=[]
            charturl = Base_url + "/v1/cmc/insights/churn-user-count-by-month?org-id="+orgId+"&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("churn_rate_And_insights")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            lst=response.json()
            for i in range(len(lst)):
                x = lst[i]
                print(x)
            print(i)
            print(DatalistX)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def churn_rate_And_insights_drilldown(self):
        try:
            charturl = Base_url + "/v1/cmc/insights/churn-user-report-overall?org-id=" + orgId +"&start=2020-07-01&end=2020-07-31&tier=300M%2B&page=1&size=10&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("churn_rate_And_insights_drilldown :")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("filter: ", data)
            lst = response.json()
            for i in range(len(lst)):
                x = lst[i]
                # print(x)
            print(i)
            for datalist in data:
                AccountNumber.append(datalist['accountNumber'])
            print("accountNumber", AccountNumber)
            for datalist in data:
                Name.append(datalist['name'])
            print("name", Name)
            for datalist in data:
                PhoneNumber.append(datalist['phoneNumber'])
            print("PhoneNumber", PhoneNumber)
            for datalist in data:
                serviceAddress.append(datalist['serviceAddress'])
            print("serviceAddress", serviceAddress)
            for datalist in data:
                email.append(datalist['email'])
            print("SpeedTest", email)
            for datalist in data:
                region.append(datalist['region'])
            print("region", region)
            for datalist in data:
                location.append(datalist['location'])
            print("location", location)
            for datalist in data:
                customerType.append(datalist['customerType'])
            print("customerType", customerType)
            for datalist in data:
                downloadSpeed.append(datalist['downloadSpeed'])
            print("downloadSpeed", downloadSpeed)
            for datalist in data:
                uploadSpeed.append(datalist['uploadSpeed'])
            print("location", uploadSpeed)
            for datalist in data:
                attainableRate.append(datalist['attainableRate'])
            print("attainableRate", attainableRate)
            combined_Table_all = [list(l) for l in
                                  zip(AccountNumber, Name, PhoneNumber, serviceAddress, email, region, location,
                                      customerType, downloadSpeed, uploadSpeed, attainableRate)]
            print("Combined Data ", combined_Table_all)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Retention(self):
        try:
            competitor=[]
            DownstreamServiceLimit=[]
            UpstreamServiceLimit=[]
            AccountNumber=[]
            Name=[]
            SpeedTest=[]
            DatalistX=[]
            charturl = Base_url + "/v1/cmc/target-segmentation/retention-insights-report?org-id="+orgId+"&period="+month+"&page=1&size=10&output=json"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Retention :")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("filter: ",data)
            lst=response.json()
            for i in range(len(lst)):
                x = lst[i]
                # print(x)
            print(i)
            for mac in data:
                AccountNumber.append(mac['accountNumber'])
            print("accountNumber",AccountNumber)
            for name in data:
                Name.append(name['name'])
            print("name",Name)
            for speedTest in data:
                SpeedTest.append(speedTest['speedTest'])
            print("SpeedTest",SpeedTest)
            for Competitor in data:
                competitor.append(Competitor['competitor'])
            print("competitor",competitor)
            for getList in data:
                ServiceLimitdown = getList['downstreamServiceLimit']
                ServiceLimitUp = getList['upstreamServiceLimit']
                downUpStream = str(ServiceLimitdown) + ' / ' + str(ServiceLimitUp)
                DownstreamServiceLimit.append(downUpStream)
            print("DownstreamServiceLimit",DownstreamServiceLimit)
            combined_Table_all = [list(l) for l in zip(Name,DownstreamServiceLimit,SpeedTest,competitor)]
            print("Combined Data ",combined_Table_all)
            return(response.status_code,combined_Table_all)
        except Exception as e:
            return(response.status_code)

    def Churn_Risk(self):
        try:
            High = 3
            DownstreamServiceLimit=[]
            UpstreamServiceLimit=[]
            AccountNumber=[]
            Name=[]
            WifiScore=[]
            DatalistX=[]
            testData = []
            charturl = Base_url + "/v1/cmc/marketing/churn-candidate?org-id="+orgId+"&period="+month+"&page=1&size=10&output=json"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Churn_Risk :")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("filter: ",data)
            lst=response.json()
            for i in range(len(lst)):
                x = lst[i]
                # print(x)
            print(i)
            for mac in data:
                AccountNumber.append(mac['accountNumber'])
            print("accountNumber",AccountNumber)
            for name in data:
                Name.append(name['name'])
            print("name",Name)
            for wifiScore in data:
                testData = wifiScore['churnScore']
                if wifiScore['churnScore'] == 3:
                    testData = 'High'
                WifiScore.append(testData)
            print("churnScore",WifiScore)
            for getList in data:
                RetentionTable2 = getList['downstreamServiceLimit']
                RetentionTable3 = getList['upstreamServiceLimit']
                downUpStream = str(RetentionTable2) + '/' + str(RetentionTable3)
                DownstreamServiceLimit.append(downUpStream)
            print("DownstreamServiceLimit",DownstreamServiceLimit)
            combined_Table_all = [list(l) for l in zip(Name,WifiScore)]
            print("Combined Data ",combined_Table_all)
            return(response.status_code,combined_Table_all)
        except Exception as e:
            return(response.status_code)

    def Subscriber_Activity_Trends(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/subscriber-trends-by-application-group?org-id=" + orgId + "&period=" + month + "&month=6"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("New_Subscribers_by_Service_Tier_And_Technology_filter")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("All Data: ", data)
            lst = response.json()
            print("Data Customize ",data['streaming'][0]['2020-03'])
            DatalistX.append(data['streaming'][0]['2020-03'])
            DatalistX.append(data['streaming'][1]['2020-04'])
            DatalistX.append(data['streaming'][2]['2020-05'])
            DatalistX.append(data['streaming'][3]['2020-06'])
            DatalistX.append(data['streaming'][4]['2020-07'])
            DatalistX.append(data['streaming'][5]['2020-08'])
            print("Streaming ",DatalistX)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Data_Usage_Trends(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/total-and-streaming-usage-trend?org-id=" + orgId + "&period=" + month + "&month=6"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Data_Usage_Trends")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("All Data: ", data)
            lst = response.json()
            print("Data Customize ", data['total'][0]['2020-03'])
            DatalistX.append(data['total'][0]['2020-03'])
            DatalistX.append(data['total'][1]['2020-04'])
            DatalistX.append(data['total'][2]['2020-05'])
            DatalistX.append(data['total'][3]['2020-06'])
            DatalistX.append(data['total'][4]['2020-07'])
            DatalistX.append(data['total'][5]['2020-08'])
            print("total ", DatalistX)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Household_Device_Trends(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/connected-device-number-distribution?org-id=" + orgId + "&period=" + month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Household_Device_Trends")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("All Data: ", data)
            lst = response.json()
            print("Data Customize ", data['numberOfDevices'][0]['2020-03'])
            DatalistX.append(data['numberOfDevices'][0]['2020-03'])
            DatalistX.append(data['numberOfDevices'][1]['2020-04'])
            DatalistX.append(data['numberOfDevices'][2]['2020-05'])
            DatalistX.append(data['numberOfDevices'][3]['2020-06'])
            DatalistX.append(data['numberOfDevices'][4]['2020-07'])
            DatalistX.append(data['numberOfDevices'][5]['2020-08'])
            print("total ", DatalistX)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Blocked_Threats_Insights(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/marketing/subscriber-protectiq-insight?org-id=" + orgId + "&period=" + month + "&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Blocked_Threats_Insights")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("All Data: ", data)
            lst = response.json()
            DatalistX.append(data[0]['WG'])
            DatalistX.append(data[1]['AV'])
            DatalistX.append(data[2]['IPS'])
            print(DatalistX)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Usage_by_Application_Type(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/application-group-usage?org-id=" + orgId + "&period=" + month + "&limit=4&others=true"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Usage_by_Application_Type")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("All Data: ",data[0]['Streaming Media'])
            data1= float(data[0]['Streaming Media'])
            print(format(data1, ',d'))
            # data2=format(data1, ',d')
            # print(data2.replace(',','.'))
            DatalistX.append(format(data[0]['Streaming Media'], ',d'))
            DatalistX.append(data[1]['Web, Cloud, Storage Hosting'])
            DatalistX.append(data[2]['Amazon'])
            DatalistX.append(data[3]['Unknown and Other'])
            DatalistX.append(data[4]['Other'])
            print(DatalistX)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Usage_by_Application_Type_drilldown(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/app-info-by-group?org-id=" + orgId + "&period=" + month + "&group=Streaming%20Media&page=1&size=100&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Usage_by_Application_Type_drilldown")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("All Data: ", data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Wi_Fi_Device_Category_Trends(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/marketing/subscriber-protectiq-insight?org-id=" + orgId + "&period=" + month + "&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Wi_Fi_Device_Category_Trends")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("All Data: ", data)
            lst = response.json()
            print("Data Customize ", data[0]['WG'])
            DatalistX.append(data[0]['WG'])
            DatalistX.append(data[1]['AV'])
            DatalistX.append(data[2]['IPS'])
            print("total ", DatalistX)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Devices_per_Household(self):
        try:
            DatalistX=[]
            DatalistY=[]
            charturl = Base_url + "/v1/cmc/insights/connected-device-number-distribution?org-id="+orgId+"&period="+month+"&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Devices_per_Household")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("filter: ",data)
            lst=response.json()
            for i in range(len(lst)):
                x = lst[i]
                print(x)
            print(i)
            DatalistX.append(format(data[0]['0-4'],',d'))
            DatalistX.append(format(data[1]['5-9'],',d'))
            DatalistX.append(format(data[2]['10-14'],',d'))
            DatalistX.append(format(data[3]['15-19'],',d'))
            DatalistX.append(format(data[4]['20+'],',d'))
            print(DatalistX)

            DatalistY.append('0-4 Devices')
            DatalistY.append('5-9 Devices')
            DatalistY.append('10-14 Devices')
            DatalistY.append('15-19 Devices')
            DatalistY.append('20+ Devices')
            print(DatalistY)
            return(response.status_code,DatalistX,DatalistY)
        except Exception as e:
            return(response.status_code)

    def Devices_per_Household_drilldown(self):
        try:
            AccountNumber = []
            Name = []
            PhoneNumber = []
            serviceAddress = []
            email = []
            region = []
            customerType = []
            downloadSpeed = []
            uploadSpeed = []
            attainableRate = []
            serviceTier = []
            technologyType = []
            Optout = []
            wifiScore = []
            charturl = Base_url + "/v1/cmc/insights/user-list-by-connected-device-number?org-id=" + orgId + "&period=" + month + "&category=5-9&page=1&size=10&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Subscribers_Data_Usage_drilldown :")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("filter: ", data)
            lst = response.json()
            for i in range(len(lst)):
                x = lst[i]
                print(x)
            print(i)
            for datalist in data:
                AccountNumber.append(datalist['accountNumber'])
            print("accountNumber", AccountNumber)
            for datalist in data:
                Name.append(datalist['name'])
            print("name", Name)
            for datalist in data:
                PhoneNumber.append(datalist['phoneNumber'])
            print("PhoneNumber", PhoneNumber)
            for datalist in data:
                serviceAddress.append(datalist['serviceAddress'])
            print("serviceAddress", serviceAddress)
            for datalist in data:
                if datalist['email']=="":
                    datalist['email'] = 'N/A'
                email.append(datalist['email'])
            print("email",email)
            for datalist in data:
                serviceTier.append(datalist['serviceTier'])
            print("serviceTier", serviceTier)
            for datalist in data:
                region.append(datalist['region'])
            print("region", region)
            for datalist in data:
                technologyType.append(datalist['technologyType'])
            print("technologyType", technologyType)
            for datalist in data:
                Optout.append(datalist['optOut'])
            print("optOut", Optout)

            for datalist in data:
                location.append(datalist['location'])
            print("location", location)
            for datalist in data:
                customerType.append(datalist['customerType'])
            print("customerType", customerType)
            for datalist in data:
                 s=datalist['downloadSpeed']
                 condata=str(s).split('.')[0]
                 downloadSpeed.append(condata)
            print("downloadSpeed",downloadSpeed)
            for datalist in data:
                s = datalist['uploadSpeed']
                condata1 = str(s).split('.')[0]
                uploadSpeed.append(condata1)
            print("uploadSpeed",uploadSpeed)
            for datalist in data:
                s = datalist['wifiScore']
                condata1 = str(s).split('.')[0]
                wifiScore.append(condata1)
            print("wifiScore",wifiScore)

            for datalist in data:
                s = datalist['wirelessDeviceNumber']
                condata1 = str(s).split('.')[0]
                attainableRate.append(condata1)
            print("wirelessDeviceNumber",attainableRate)
            combined_Table_all = [list(l) for l in
                                  zip(AccountNumber, Name, PhoneNumber, email, serviceAddress,serviceTier, region, location,technologyType,Optout,
                                      customerType, downloadSpeed, uploadSpeed,attainableRate)]
            print("Combined Data ", combined_Table_all)
            return(response.status_code,combined_Table_all)
        except Exception as e:
            return(response.status_code)

    def getTriggerType(self):
        try:
            print("**** Competitor visit minutes *****")
            charturl = Base_url + "/v1/cmc-campaigns/triggered_campaign/estimate_next_audience/Competitor%20Visit%20Minutes/50/90?segmentId=&campaignId=&segmentCategory="
            headers = {"X-Calix-AccessToken": access_token,
                   "X-Calix-ClientID": X_Calix_ClientID
                   }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print(response)
            assert response.status_code == 200
            CompetitorVisitRes = response.json()
            print(CompetitorVisitRes)


            print("**** service limit hit *****")
            charturl = Base_url + "/v1/cmc-campaigns/triggered_campaign/estimate_next_audience/Service%20Limit%20Hit/99/125?segmentId=&campaignId=&segmentCategory="
            headers = {"X-Calix-AccessToken": access_token,
                   "X-Calix-ClientID": X_Calix_ClientID
                   }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print(response)
            assert response.status_code == 200
            serviceLimitRes = response.json()
            print(serviceLimitRes)



            print("**** speed test minutes *****")
            charturl = Base_url + "/v1/cmc-campaigns/triggered_campaign/estimate_next_audience/Speed%20Test%20Minutes/58/97?segmentId=&campaignId=&segmentCategory="
            headers = {"X-Calix-AccessToken": access_token,
                   "X-Calix-ClientID": X_Calix_ClientID
                   }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print(response)
            assert response.status_code == 200
            speedTestMinRes = response.json()
            print(speedTestMinRes)


            return (response.status_code,CompetitorVisitRes, serviceLimitRes, speedTestMinRes )
        except Exception as e:
            return(response.status_code)


    def getTriggerd_CompetitorImpactedCampn(self):
        try:
            competitorName = []
            competitorStatus = []

            print("**** getTriggerd_CompetitorImpactedCampn *****")
            charturl = Base_url + "/v1/cmc-campaigns/campaign/campaign-list/Triggered/Competitor%20Visit%20Minutes"
            headers = {"X-Calix-AccessToken": access_token,
                   "X-Calix-ClientID": X_Calix_ClientID
                   }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print(response)
            assert response.status_code == 200
            CompetitorVisitRes = response.json()

            for datalist in CompetitorVisitRes:
                competitorStatus.append(datalist['status'])
            print("competitorName: ", competitorName)

            for datalist in CompetitorVisitRes:
                competitorName.append(datalist['name'])
            print("competitorStatus: ", competitorStatus)

            combined_Table_all = [list(l) for l in
                                  zip(competitorName, competitorStatus)]
            print('combined_Table_all: ',combined_Table_all)
            return (response.status_code,combined_Table_all )
        except Exception as e:
            return(response.status_code)


    def getTriggerd_ServiceImpactedCampn(self):
        try:
            ServiceName = []
            ServiceStatus = []

            print("**** getTriggerd_ServiceImpactedCampn *****")
            charturl = Base_url + "/v1/cmc-campaigns/campaign/campaign-list/Triggered/Service%20Limit%20Hit"
            headers = {"X-Calix-AccessToken": access_token,
                   "X-Calix-ClientID": X_Calix_ClientID
                   }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print(response)
            assert response.status_code == 200
            CompetitorVisitRes = response.json()

            for datalist in CompetitorVisitRes:
                ServiceName.append(datalist['status'])
            print("ServiceName: ", ServiceName)

            for datalist in CompetitorVisitRes:
                ServiceStatus.append(datalist['name'])
            print("ServiceStatus: ", ServiceStatus)

            combined_Table_all = [list(l) for l in
                                  zip(ServiceName, ServiceStatus)]
            print('combined_Table_all: ',combined_Table_all)
            return (response.status_code,combined_Table_all )
        except Exception as e:
            return(response.status_code)


    def getTriggerd_SpeedImpactedCampn(self):
        try:
            SpeedName = []
            SpeedStatus = []

            print("**** getTriggerd_SpeedImpactedCampn *****")
            charturl = Base_url + "/v1/cmc-campaigns/campaign/campaign-list/Triggered/Speed%20Test%20Minutes"
            headers = {"X-Calix-AccessToken": access_token,
                   "X-Calix-ClientID": X_Calix_ClientID
                   }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print(response)
            assert response.status_code == 200
            CompetitorVisitRes = response.json()

            for datalist in CompetitorVisitRes:
                SpeedName.append(datalist['status'])
            print("SpeedName: ", SpeedName)

            for datalist in CompetitorVisitRes:
                SpeedStatus.append(datalist['name'])
            print("SpeedStatus: ", SpeedStatus)

            combined_Table_all = [list(l) for l in
                                  zip(SpeedName, SpeedStatus)]
            print('combined_Table_all: ',combined_Table_all)
            return (response.status_code,combined_Table_all )
        except Exception as e:
            return(response.status_code)

    def Active_Subscriber_Count(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/total-active-subscribers?org-id=" + orgId + "&period=" + month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            response = requests.get(charturl, headers=headers)
            print("Active_Subscriber_Count")
            print(response)
            assert response.status_code == 200
            data = response.json()
            activeSubscribers = data['activeSubscribers']
            dataFormatChange= format(activeSubscribers, ',d')
            print(dataFormatChange)
            return(response.status_code,dataFormatChange)
        except Exception as e:
            return(response.status_code)

    def userCount_streamingSubscribers(self):
        try:
            DatalistX=[]
            DatalistY = []
            charturl = Base_url + "/v1/cmc/target-segmentation/user-counts?org-id="+orgId+"&period="+month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("userCount_streamingSubscribers")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            DatalistX.append(format(data['streamingUsers'], ',d'))
            streamingUsers = format(data['streamingUsers'], ',d')
            print('streamingUsers: ',streamingUsers)
            gamingUsers = format(data['gamingUsers'], ',d')
            print('gamingUsers: ',gamingUsers)
            wfhUsers = format(data['wfhUsers'], ',d')
            print('wfhUsers: ',wfhUsers)
            return(DatalistX,gamingUsers,wfhUsers)
        except Exception as e:
            return(response.status_code)

    def Streaming_Subscribers(self):
        try:
            DatalistX=[]
            DatalistY = []
            charturl = Base_url + "/v1/cmc/target-segmentation/service-tier-counts-by-user-type?type=streaming&org-id="+orgId+"&period="+month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Streaming_Subscribers")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            print(data['series'][0]['data'])
            DatalistX.append(format(data['series'][0]['data'][0], ',d'))
            DatalistX.append(format(data['series'][0]['data'][1], ',d'))
            DatalistX.append(format(data['series'][0]['data'][2], ',d'))
            DatalistX.append(format(data['series'][0]['data'][3], ',d'))
            DatalistX.append(format(data['series'][0]['data'][4], ',d'))
            print(DatalistX)
            TotalStreaming = int(data['series'][0]['data'][0]) + int(data['series'][0]['data'][1]) + data['series'][0]['data'][2] + data['series'][0]['data'][3] + data['series'][0]['data'][4]
            print('TotalStreaming: ',format(TotalStreaming,',d'))
            DatalistY.append('<20M / Streaming')
            DatalistY.append('20M+ / Streaming')
            DatalistY.append('50M+ / Streaming')
            DatalistY.append('300M+ / Streaming')
            DatalistY.append('1G / Streaming')
            return(response.status_code,DatalistX,DatalistY,format(TotalStreaming,',d'))
        except Exception as e:
            return(response.status_code)

    def Streaming_Subscribers_NonStreaming(self):
        try:
            DatalistX=[]
            DatalistY = []
            charturl = Base_url + "/v1/cmc/target-segmentation/service-tier-counts-by-user-type?org-id="+orgId+"&period="+month+"&type=streaming&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Non-Streaming_Subscribers")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            print(data['series'])
            DatalistX.append(format(data['series'][1]['data'][0], ',d'))
            DatalistX.append(format(data['series'][1]['data'][1], ',d'))
            DatalistX.append(format(data['series'][1]['data'][2], ',d'))
            DatalistX.append(format(data['series'][1]['data'][3], ',d'))
            DatalistX.append(format(data['series'][1]['data'][4], ',d'))
            print(DatalistX)
            DatalistY.append('<20M / Non-Streaming')
            DatalistY.append('20M+ / Non-Streaming')
            DatalistY.append('50M+ / Non-Streaming')
            DatalistY.append('300M+ / Non-Streaming')
            DatalistY.append('1G / Non-Streaming')
            return(response.status_code,DatalistX,DatalistY)
        except Exception as e:
            return(response.status_code)

    def Gaming_Subscribers(self):
        try:
            DatalistX=[]
            DatalistY=[]
            charturl = Base_url + "/v1/cmc/target-segmentation/service-tier-counts-by-user-type?org-id="+orgId+"&period="+month+"&type=gaming"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Gaming_Subscribers")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            print(data['series'][0]['data'])
            DatalistX.append(format(data['series'][0]['data'][0], ',d'))
            DatalistX.append(format(data['series'][0]['data'][1], ',d'))
            DatalistX.append(format(data['series'][0]['data'][2], ',d'))
            DatalistX.append(format(data['series'][0]['data'][3], ',d'))
            DatalistX.append(format(data['series'][0]['data'][4], ',d'))
            print(DatalistX)
            TotalGaming = int(data['series'][0]['data'][0]) + int(data['series'][0]['data'][1]) + data['series'][0]['data'][2] + data['series'][0]['data'][3] + data['series'][0]['data'][4]
            print('TotalStreaming: ',format(TotalGaming,',d'))
            DatalistY.append('<20M / Gaming')
            DatalistY.append('20M+ / Gaming')
            DatalistY.append('50M+ / Gaming')
            DatalistY.append('300M+ / Gaming')
            DatalistY.append('1G / Gaming')
            print(DatalistY)
            return (response.status_code, DatalistX, DatalistY,format(TotalGaming,',d'))
        except Exception as e:
            return(response.status_code)


    def NonGaming_Subscribers(self):
        try:
            DatalistX=[]
            DatalistY = []
            charturl = Base_url + "/v1/cmc/target-segmentation/service-tier-counts-by-user-type?org-id="+orgId+"&period="+month+"&type=gaming"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("NonGaming_Subscribers")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            DatalistX.append(format(data['series'][1]['data'][0], ',d'))
            DatalistX.append(format(data['series'][1]['data'][1], ',d'))
            DatalistX.append(format(data['series'][1]['data'][2], ',d'))
            DatalistX.append(format(data['series'][1]['data'][3], ',d'))
            DatalistX.append(format(data['series'][1]['data'][4], ',d'))
            print(DatalistX)
            DatalistY.append('<20M / Non-Gaming')
            DatalistY.append('20M+ / Non-Gaming')
            DatalistY.append('50M+ / Non-Gaming')
            DatalistY.append('300M+ / Non-Gaming')
            DatalistY.append('1G / Non-Gaming')
            print(DatalistY)
            return(response.status_code,DatalistX,DatalistY)
        except Exception as e:
            return(response.status_code)

    def Subscribers_by_Service_Tier_And_Technology(self):
        try:
            print("-- Subscribers_by_Service_Tier_And_Technology --")
            DatalistX=[]
            DatalistY = []
            categories_serviceTier = []
            charturl = Base_url + "/v1/cmc/target-segmentation/service-tier-counts?org-id="+orgId+"&period="+month
            print(charturl)
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            response = requests.get(charturl, headers=headers)
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            print(data['series'][3]['data'][0])
            DatalistX.append(format(data['series'][3]['data'][0], ',d'))
            DatalistX.append(format(data['series'][3]['data'][1], ',d'))
            DatalistX.append(format(data['series'][3]['data'][2], ',d'))
            DatalistX.append(format(data['series'][3]['data'][3], ',d'))
            DatalistX.append(format(data['series'][3]['data'][4], ',d'))
            DatalistX.append(format(data['series'][3]['data'][5], ',d'))
            DatalistX.append(format(data['series'][3]['data'][6], ',d'))
            DatalistX.append(format(data['series'][3]['data'][7], ',d'))
            DatalistX.append(format(data['series'][3]['data'][8], ',d'))
            DatalistX.append(format(data['series'][3]['data'][9], ',d'))
            print(DatalistX)
            print(data['categories'][0])
            categories_serviceTier.append(data['categories'][0])
            categories_serviceTier.append(data['categories'][1])
            categories_serviceTier.append(data['categories'][2])
            categories_serviceTier.append(data['categories'][3])
            categories_serviceTier.append(data['categories'][4])
            categories_serviceTier.append(data['categories'][5])
            categories_serviceTier.append(data['categories'][6])
            categories_serviceTier.append(data['categories'][7])
            categories_serviceTier.append(data['categories'][8])
            categories_serviceTier.append(data['categories'][9])
            print(categories_serviceTier)
            return(response.status_code,DatalistX,categories_serviceTier)
        except Exception as e:
            return (response.status_code)

    def New_Subscribers_by_Service_Tier_And_Technology_drilldown(self):
        try:
            AccountNumber = []
            Name = []
            PhoneNumber = []
            serviceAddress = []
            email = []
            region = []
            location = []
            customerType = []
            downloadSpeed = []
            uploadSpeed = []
            attainableRate = []
            charturl = Base_url + "/v1/cmc/acquisition/new-user-list?tier=60M&tech=DSL&page=1&size=10&org-id=" + orgId + "&period=" + month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("New_Subscribers_by_Service_Tier_And_Technology_drilldown   :")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("filter: ", data)
            lst = response.json()
            for i in range(len(lst)):
                x = lst[i]
                # print(x)
            print(i)
            for datalist in data:
                AccountNumber.append(datalist['accountNumber'])
            print("accountNumber", AccountNumber)
            for datalist in data:
                Name.append(datalist['name'])
            print("name", Name)
            for datalist in data:
                PhoneNumber.append(datalist['phoneNumber'])
            print("PhoneNumber", PhoneNumber)
            for datalist in data:
                serviceAddress.append(datalist['serviceAddress'])
            print("serviceAddress", serviceAddress)
            for datalist in data:
                if datalist['email'] in '':
                    email.append('N/A')
                else:
                 email.append(datalist['email'])
            print("email", email)
            for datalist in data:
                region.append(datalist['region'])
            print("region", region)
            for datalist in data:
                location.append(datalist['location'])
            print("location", location)
            for datalist in data:
                customerType.append(datalist['customerType'])
            print("customerType", customerType)
            for datalist in data:
                downloadSpeed.append(datalist['downloadSpeed'])
            print("downloadSpeed", downloadSpeed)
            for datalist in data:
                uploadSpeed.append(datalist['uploadSpeed'])
            print("location", uploadSpeed)
            for datalist in data:
                attainableRate.append(datalist['attainableRate'])
            print("attainableRate", attainableRate)
            combined_Table_all = [list(l) for l in
                                  zip(AccountNumber, Name, PhoneNumber, serviceAddress, email, region, location,
                                      customerType, downloadSpeed, uploadSpeed, attainableRate)]
            print("Combined Data ", combined_Table_all)
            return(response.status_code,combined_Table_all)
        except Exception as e:
            return(response.status_code)

    def CommandIQ_Insights(self):
        try:
            DownstreamServiceLimit=[]
            UpstreamServiceLimit=[]
            AccountNumber=[]
            Name=[]
            WiFi=[]
            DatalistX=[]
            charturl = Base_url + "/v1/cmc/marketing/smart-home-candidate?page=1&size=10&output=json&org-id="+orgId+"&period="+month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Top Gaming :")
            print(response.status_code )
            assert response.status_code == 200
            data = response.json()
            print("filter: ",data)
            lst=response.json()
            for i in range(len(lst)):
                x = lst[i]
                # print(x)
            print(i)
            for mac in data:
                AccountNumber.append(mac['numOfDevices'])
            print("numOfDevices", AccountNumber)
            for name in data:
                Name.append(name['name'])
            print("name",Name)
            for wifiScore in data:
                WiFi.append(wifiScore['wifiScore'])
            print("wifiScore", WiFi)
            for getList in data:
                DownUsage = getList['downUsage']
                UpUsage = getList['upUsage']
                downUpStream = str(DownUsage) + ' / ' + str(UpUsage)
                DownstreamServiceLimit.append(downUpStream)
            print("DownstreamServiceLimit", DownstreamServiceLimit)
            combined_Table_all = [list(l) for l in zip(Name, AccountNumber, DownstreamServiceLimit, WiFi)]
            print("Combined Data ",combined_Table_all)
            return(response.status_code,combined_Table_all)
        except Exception as e:
            return(response.status_code)

    def New_Subscribers_by_Service_Tier_And_Technology(self):
        try:
            DatalistX=[]
            DatalistY=[]
            charturl = Base_url + "/v1/cmc/acquisition/new-service-tier-counts?org-id="+orgId+"&period="+month
            print(charturl)
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            response = requests.get(charturl, headers=headers)
            print("New_Subscribers_by_Service_Tier_And_Technology")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            print(data['series'][0]['data'])
            DatalistX.append(format(data['series'][0]['data'][0], ',d'))
            DatalistX.append(format(data['series'][0]['data'][1], ',d'))
            DatalistX.append(format(data['series'][0]['data'][2], ',d'))
            DatalistX.append(format(data['series'][0]['data'][3], ',d'))
            print(DatalistX)
            DatalistY.append('60M / DSL')
            print(DatalistY)
            return(response.status_code,DatalistX,DatalistY)
        except Exception as e:
            return(response.status_code)

    def Subscribers_by_Service_Tier_And_Technology_drilldown(self):
        try:
            AccountNumber = []
            Name = []
            PhoneNumber = []
            serviceAddress = []
            email = []
            region = []
            customerType = []
            downloadSpeed = []
            uploadSpeed = []
            attainableRate = []
            charturl = Base_url + "/v1/cmc/insights/user-list?tier=40M&tech=Fiber&page=1&size=10&org-id="+orgId+"&period="+month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Subscribers_by_Service_Tier_And_Technology_drilldown :")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("filter: ",data)
            lst=response.json()
            for i in range(len(lst)):
                x = lst[i]
                # print(x)
            print(i)
            for datalist in data:
                AccountNumber.append(datalist['accountNumber'])
            print("accountNumber",AccountNumber)
            for datalist in data:
                Name.append(datalist['name'])
            print("name",Name)
            for datalist in data:
                PhoneNumber.append(datalist['phoneNumber'])
            print("PhoneNumber",PhoneNumber)
            for datalist in data:
                serviceAddress.append(datalist['serviceAddress'])
            print("serviceAddress",serviceAddress)
            for datalist in data:
                if datalist['email']=="":
                    datalist['email'] = 'N/A'
                email.append(datalist['email'])
            print("SpeedTest",email)
            for datalist in data:
                region.append(datalist['region'])
            print("region",region)
            for datalist in data:
                location.append(datalist['location'])
            print("location",location)
            for datalist in data:
                customerType.append(datalist['customerType'])
            print("customerType",customerType)
            for datalist in data:
                 s=datalist['downloadSpeed']
                 condata=str(s).split('.')[0]
                 downloadSpeed.append(condata)
            print("downloadSpeed",downloadSpeed)
            for datalist in data:
                s = datalist['uploadSpeed']
                condata1 = str(s).split('.')[0]
                uploadSpeed.append(condata1)
            print("uploadSpeed",uploadSpeed)
            for datalist in data:
                s = datalist['attainableRate']
                condata1 = str(s).split('.')[0]
                attainableRate.append(condata1)
            print("attainableRate",attainableRate)
            combined_Table_all = [list(l) for l in zip(AccountNumber,Name,PhoneNumber,serviceAddress,email,region,location,customerType,downloadSpeed,uploadSpeed,attainableRate)]
            print("Combined Data ",combined_Table_all)
            return(response.status_code,combined_Table_all)
        except Exception as e:
            return (response.status_code)

    def Top_Applications(self):
        try:
            DatalistX = []
            DatalistY = []
            Amazon = []
            Google = []
            Facebook = []
            Apple =[]
            Netflix = []
            Messaging = []
            Gougle = []
            Twitter = []
            NetflixCache = []
            Instagram = []
            AllData = []
            charturl = Base_url + "/v1/cmc/insights/top-applications?org-id=" + orgId + "&period=" + month + "&limit=10"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Top_Applications")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(format(data[0]['Google'][0],',d'))
            print("All Data: ", data)
            Google = ['Google',format(data[0]['Google'][0],',d'),format(data[0]['Google'][1],'.1%')]
            Amazon = ['Amazon',format(data[1]['Amazon'][0],',d'),format(data[1]['Amazon'][1],'.1%')]
            Facebook =  ['Facebook',format(data[2]['Facebook'][0],',d'),format(data[2]['Facebook'][1],'.1%')]
            Apple =  ['Apple iCloud',format(data[3]['Apple iCloud'][0],',d'),format(data[3]['Apple iCloud'][1],'.1%')]
            Gougle =  ['Gougle Cache Allo',format(data[4]['Gougle Cache Allo'][0],',d'),format(data[4]['Gougle Cache Allo'][1],'.1%')]
            Messaging =  ['Messaging (Yahoo)',format(data[5]['Messaging (Yahoo)'][0],',d'),format(data[5]['Messaging (Yahoo)'][1],'.1%')]
            Netflix =  ['Netflix',format(data[6]['Netflix'][0],',d'),format(data[6]['Netflix'][1],'.1%')]
            NetflixCache =  ['Netflix Cache Allo',format(data[7]['Netflix Cache Allo'][0],',d'),format(data[7]['Netflix Cache Allo'][1],'.1%')]
            Twitter =  ['Twitter',format(data[8]['Twitter'][0],',d'),format(data[8]['Twitter'][1],'.1%')]
            Instagram =  ['Instagram',format(data[9]['Instagram'][0],',d'),format(data[9]['Instagram'][1],'.1%')]
            AllData = [Google,Amazon,Facebook,Apple,Gougle,Messaging,Netflix,NetflixCache,Twitter,Instagram]
            print(AllData)
            return(response.status_code,AllData)
        except Exception as e:
            return(response.status_code)

    def Top_Applications_drilldown(self):
        try:
            charturl = Base_url + "/v1/cmc/insights/user-count-by-app?org-id=" + orgId + "&period=" + month + "&app=Amazon&page=1&size=100&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            response = requests.get(charturl, headers=headers)
            print(charturl)
            print("Top_Applications_drilldown :")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("filter: ", data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Top_Gaming_Applications(self):
        try:
            DatalistX = []
            Xbox = []
            Playstation = []
            Twitch = []
            Valve = []
            Battlenet = []
            Electronic = []
            Minecraft = []
            Steam = []
            League = []
            Quake = []
            charturl = Base_url + "/v1/cmc/insights/top-gaming-applications?org-id=" + orgId + "&period=" + month + "&limit=10"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("New_Subscribers_by_Service_Tier_And_Technology_filter")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("All Data: ", data)
            Xbox = ['Gaming Xbox Live',format(data[0]['Gaming (Xbox Live)'][0],',d'),format(data[0]['Gaming (Xbox Live)'][1],'.1%')]
            Playstation = ['Gaming Playstation',format(data[1]['Gaming (Playstation)'][0],',d'),format(data[1]['Gaming (Playstation)'][1],'.1%')]
            Twitch =  ['Gaming Twitch TV',format(data[2]['Gaming (Twitch TV)'][0],',d'),format(data[2]['Gaming (Twitch TV)'][1],'.1%')]
            Valve =  ['Gaming Valve Net',format(data[3]['Gaming (Valve Net)'][0],',d'),format(data[3]['Gaming (Valve Net)'][1],'.1%')]
            Battlenet =  ['Gaming Battlenet',format(data[4]['Gaming (Battlenet)'][0],',d'),format(data[4]['Gaming (Battlenet)'][1],'.1%')]
            Electronic =  ['Gaming Electronic Arts',format(data[5]['Gaming (Electronic Arts)'][0],',d'),format(data[5]['Gaming (Electronic Arts)'][1],'.1%')]
            Minecraft =  ['Gaming Minecraft',format(data[6]['Gaming (Minecraft)'][0],',d'),format(data[6]['Gaming (Minecraft)'][1],'.1%')]
            Steam =  ['Gaming Steam',format(data[7]['Gaming (Steam)'][0],',d'),format(data[7]['Gaming (Steam)'][1],'.1%')]
            League =  ['Gaming League Of Legends',format(data[8]['Gaming (League Of Legends)'][0],',d'),format(data[8]['Gaming (League Of Legends)'][1],'.1%')]
            Quake =  ['Gaming Quake Based Games',format(data[9]['Gaming (Quake Based Games)'][0],',d'),format(data[9]['Gaming (Quake Based Games)'][1],'.1%')]
            AllData = [Xbox,Playstation,Twitch,Valve,Battlenet,Electronic,Minecraft,Steam,League,Quake]
            print(AllData)
            return(response.status_code,AllData)
        except Exception as e:
            return(response.status_code)

    def Top_Gaming_Applications_drilldown(self):
        try:
            charturl = Base_url + "/v1/cmc/insights/user-count-by-app?org-id=" + orgId + "&period=" + month + "&app=gaming%20(xbox%20live)&group=gaming&page=1&size=100&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Top_Gaming_Applications_drilldown :")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("filter: ", data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Acquisition_Revenue_And_Insights(self):
        try:
            DatalistX=[]
            charturl = Base_url + "/v1/cmc/acquisition/acquisition-and-potential-revenue?org-id="+orgId+"&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Acquisition_Revenue_And_Insights")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("Aq: ",data)
            lst=response.json()
            for i in range(len(lst)):
                x = lst[i]
                print(x)
            print(i)
            print(DatalistX)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Acquisition_Revenue_And_Insights_drilldown(self):
        try:
            charturl = Base_url + "/v1/cmc/acquisition/acquisition-user-report-overall?org-id=" + orgId + "&start=2020-07-01&end=2020-07-31&page=1&size=10&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Acquisition_Revenue_And_Insights_drilldown :")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("filter: ", data)
            lst = response.json()
            for i in range(len(lst)):
                x = lst[i]
                # print(x)
            print(i)
            for datalist in data:
                AccountNumber.append(datalist['accountNumber'])
            print("accountNumber", AccountNumber)
            for datalist in data:
                Name.append(datalist['name'])
            print("name", Name)
            for datalist in data:
                PhoneNumber.append(datalist['phoneNumber'])
            print("PhoneNumber", PhoneNumber)
            for datalist in data:
                serviceAddress.append(datalist['serviceAddress'])
            print("serviceAddress", serviceAddress)
            for datalist in data:
                email.append(datalist['email'])
            print("SpeedTest", email)
            for datalist in data:
                region.append(datalist['region'])
            print("region", region)
            for datalist in data:
                location.append(datalist['location'])
            print("location", location)
            for datalist in data:
                customerType.append(datalist['customerType'])
            print("customerType", customerType)
            for datalist in data:
                downloadSpeed.append(datalist['downloadSpeed'])
            print("downloadSpeed", downloadSpeed)
            for datalist in data:
                uploadSpeed.append(datalist['uploadSpeed'])
            print("location", uploadSpeed)
            for datalist in data:
                attainableRate.append(datalist['attainableRate'])
            print("attainableRate", attainableRate)
            combined_Table_all = [list(l) for l in
                                  zip(AccountNumber, Name, PhoneNumber, serviceAddress, email, region, location,
                                      customerType, downloadSpeed, uploadSpeed, attainableRate)]
            print("Combined Data ", combined_Table_all)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Acquisition_rate_And_Insights(self):
        try:
            DatalistX=[]
            charturl = Base_url + "/v1/cmc/acquisition/acquisition-user-count-by-month?org-id="+orgId+"&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Acquisition_rate_And_Insights")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("Aq: ",data)
            lst=response.json()
            for i in range(len(lst)):
                x = lst[i]
                print(x)
            print(i)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Acquisition_rate_And_Insights_drilldown(self):
        try:
            charturl = Base_url + "/v1/cmc/acquisition/acquisition-user-report-overall?org-id=" + orgId + "&start=2020-07-01&end=2020-07-31&tier=300M%2B&page=1&size=10&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Acquisition_rate_And_Insights_drilldown :")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("filter: ", data)
            lst = response.json()
            for i in range(len(lst)):
                x = lst[i]
                # print(x)
            print(i)
            for datalist in data:
                AccountNumber.append(datalist['accountNumber'])
            print("accountNumber", AccountNumber)
            for datalist in data:
                Name.append(datalist['name'])
            print("name", Name)
            for datalist in data:
                PhoneNumber.append(datalist['phoneNumber'])
            print("PhoneNumber", PhoneNumber)
            for datalist in data:
                serviceAddress.append(datalist['serviceAddress'])
            print("serviceAddress", serviceAddress)
            for datalist in data:
                email.append(datalist['email'])
            print("SpeedTest", email)
            for datalist in data:
                region.append(datalist['region'])
            print("region", region)
            for datalist in data:
                location.append(datalist['location'])
            print("location", location)
            for datalist in data:
                customerType.append(datalist['customerType'])
            print("customerType", customerType)
            for datalist in data:
                downloadSpeed.append(datalist['downloadSpeed'])
            print("downloadSpeed", downloadSpeed)
            for datalist in data:
                uploadSpeed.append(datalist['uploadSpeed'])
            print("location", uploadSpeed)
            for datalist in data:
                attainableRate.append(datalist['attainableRate'])
            print("attainableRate", attainableRate)
            combined_Table_all = [list(l) for l in
                                  zip(AccountNumber, Name, PhoneNumber, serviceAddress, email, region, location,
                                      customerType, downloadSpeed, uploadSpeed, attainableRate)]
            print("Combined Data ", combined_Table_all)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Device_CommandIQ_Status(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/foundation/dashboard/ciq/" + orgId +"?days=30"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Device_CommandIQ_Status")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Device_Revenue_Edge_Suite_Status_ExperienceIQ(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/foundation//dashboard/iqsuite/" + orgId +"?name=CIEP&days=30"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Device_Revenue_Edge_Suite_Status_ExperienceIQ")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Device_Revenue_Edge_Suite_Status_ProtectIQ(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/foundation//dashboard/iqsuite/" + orgId +"?name=CIES&days=30"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Device_Revenue_Edge_Suite_Status_ProtectIQ")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Device_Revenue_Edge_Suite_Status_Arlo(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/foundation//dashboard/iqsuite/" + orgId +"?name=CIES&days=30"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Device_Revenue_Edge_Suite_Status_Arlo")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Device_Trends(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/foundation/dashboard/system-model/" + orgId +"?productType=all&limit=30"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Device_Trends")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data[0])
            return(response.status_code,data[0])
        except Exception as e:
            return(response.status_code)

    def Services_Smart_Home_Insights(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/marketing/smart-home-candidate?page=1&size=10&output=json&org-id=" + orgId +"&period="+month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Services_Smart_Home_Insights")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Services_Wifi_Device_Category_Trends(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/marketing/device-category-trend?month=6&org-id=" + orgId +"&period="+month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Services_Wifi_Device_Category_Trends")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Services_Edge_Suites_Tresnds(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/parental-control-and-network-security-usage-trend?org-id=" + orgId +"&period="+month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Services_Edge_Suites_Tresnds")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Services_Household_Device_Trends(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/parental-control-and-network-security-usage-trend?org-id=" + orgId +"&period="+month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Services_Household_Device_Trends")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def MarketingCloudProfessionalEntitlement(self):
        # Documentation: We are getting apptype list in this api loginAPI(), and validating apptype
        try:
          if 209 in entitlementApptype:
            MarketingCloudProStatus = True
          else:
            MarketingCloudProStatus = False
        except Exception as e:
          MarketingCloudProStatus = False
        print(MarketingCloudProStatus)
        return (MarketingCloudProStatus)

    def organizationConfig(self):
        try:
            charturl = Base_url + "/v1/cmc-campaigns/organizationConfig"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get organizationConfig")
            print(response)
            assert response.status_code == 200
            data = response.json()
            Status = data['thoughtspotSupported']
            print(Status)
            return(response.status_code,Status)
        except Exception as e:
            return(response.status_code)

API_CMCObj = CMC()

"-- Stage --"
# API_CMCObj.StageYamlReader()
# API_CMCObj.UserLogin_UserCMC()

"-- Devfunc --"
# API_CMCObj.DevfuncYamlReader()
# API_CMCObj.UserLogin_UserCMC()

"-- Dev --"
# API_CMCObj.DevYamlReader()
# API_CMCObj.UserLogin_UserCMC()

"-- Explore Data --"
# API_CMCObj.loginAPI_RefreshToken()
# API_CMCObj.Social_Channel_Heatmap_charts()
# API_CMCObj.Subscribers_Data_Usage()
# API_CMCObj.Subscribers_Data_Usage_drilldown()
# API_CMCObj.Streaming_Subscribers()
# API_CMCObj.Streaming_Subscribers_drilldown()
# API_CMCObj.Gaming_Subscribers()
# API_CMCObj.Gaming_Subscribers_drilldown()
# API_CMCObj.Work_from_Home_WFH_Subscribers()
# API_CMCObj.Work_from_Home_WFH_Subscribers_drilldown()
# API_CMCObj.churn_rate_And_insights()
# API_CMCObj.churn_rate_And_insights_drilldown()
# API_CMCObj.Retention()
# API_CMCObj.Churn_Risk()
# API_CMCObj.Subscriber_Activity_Trends()
# API_CMCObj.Data_Usage_Trends()
# API_CMCObj.Household_Device_Trends()
# API_CMCObj.Blocked_Threats_Insights()
# API_CMCObj.Usage_by_Application_Type()
# API_CMCObj.Usage_by_Application_Type_drilldown()
# API_CMCObj.Wi_Fi_Device_Category_Trends()
# API_CMCObj.Devices_per_Household()
# API_CMCObj.Devices_per_Household_drilldown()
# API_CMCObj.get_CampaignThresholdValues()
# API_CMCObj.getTriggerType()
# API_CMCObj.Active_Subscriber_Count()
# API_CMCObj.userCount_streamingSubscribers()
# API_CMCObj.Streaming_Subscribers()
# API_CMCObj.Streaming_Subscribers_NonStreaming()
# API_CMCObj.Gaming_Subscribers()
# API_CMCObj.NonGaming_Subscribers()
# API_CMCObj.Subscribers_by_Service_Tier_And_Technology()
# API_CMCObj.New_Subscribers_by_Service_Tier_And_Technology_drilldown()
# API_CMCObj.CommandIQ_Insights()
# API_CMCObj.Subscribers_by_Service_Tier_And_Technology_drilldown()
# API_CMCObj.New_Subscribers_by_Service_Tier_And_Technology()
# API_CMCObj.Top_Applications()
# API_CMCObj.Top_Applications_drilldown()
# API_CMCObj.Top_Gaming_Applications()
# API_CMCObj.Top_Gaming_Applications_drilldown()
# API_CMCObj.Acquisition_Revenue_And_Insights()
# API_CMCObj.Acquisition_Revenue_And_Insights_drilldown()
# API_CMCObj.Acquisition_rate_And_Insights()
# API_CMCObj.Acquisition_rate_And_Insights_drilldown()
# API_CMCObj.Device_CommandIQ_Status()
# API_CMCObj.Device_Revenue_Edge_Suite_Status_ExperienceIQ()
# API_CMCObj.Device_Revenue_Edge_Suite_Status_ProtectIQ()
# API_CMCObj.Device_Revenue_Edge_Suite_Status_Arlo()
# API_CMCObj.Device_Trends()
# API_CMCObj.Services_Smart_Home_Insights()
# API_CMCObj.Services_Wifi_Device_Category_Trends()
# API_CMCObj.Services_Edge_Suites_Tresnds()
# API_CMCObj.Services_Household_Device_Trends()
# API_CMCObj.MarketingCloudProfessionalEntitlement()
# API_CMCObj.organizationConfig()



