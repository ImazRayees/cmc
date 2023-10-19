import json
import os
import sys

import pytz
import requests
from configparser import ConfigParser
from datetime import datetime
from robot.libraries.BuiltIn import BuiltIn
import re

class CMCAPI():
    def ConfigReader(self):
        global Base_url
        global user
        global password
        global onboard_url
        global onboardtoken
        dir_path = os.path.dirname(os.path.realpath(__file__))
        config_file = os.path.join(dir_path, 'config.ini')
        config = ConfigParser()
        config.read(config_file)
        if config['ENVIRONMENT']['environment'] == 'Dev':
            Base_url = config['APIDATA']['Base_url_Stage']
            user = config['APIDATA']['user_stage']
            password = config['APIDATA']['password_stage']
        else:
            if config['ENVIRONMENT']['environment'] == 'Stage':
                Base_url = config['APIDATA']['Base_url_Stage']
                user = config['APIDATA']['user_stage']
                password = config['APIDATA']['password_stage']
            else:
                if config['ENVIRONMENT']['environment'] == 'Prod':
                    Base_url = config['APIDATA']['Base_url_Stage']
                    user = config['APIDATA']['user_stage']
                    password = config['APIDATA']['password_stage']

        return (config['APIDATA']['password_stage'])

    def ConfigReaderDev(self):
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
        global Qlik_Segment_Name
        global Qlik_Segment_Type
        global Qlik_Region
        global Qlik_Location
        global Qlik_Service
        global Qlik_Propensity
        dir_path = os.path.dirname(os.path.realpath(__file__))
        config_file = os.path.join(dir_path, 'config.ini')
        config = ConfigParser()
        print(config.sections())
        config.read(config_file)
        print(config.sections())
        Base_url = config['RESTAPI']['Base_url_Dev']
        user = config['RESTAPI']['username_Dev']
        password = config['RESTAPI']['Password_Dev']
        grant_type = config['RESTAPI']['grant_type_Dev']
        client_secret = config['RESTAPI']['client_secret_Dev']
        Qlik_Segment_Name = config['Qlick_ObjId']['Segment_Name']
        Qlik_Segment_Type = config['Qlick_ObjId']['Segment_Type']
        Qlik_Region = config['Qlick_ObjId']['Region']
        Qlik_Location = config['Qlick_ObjId']['Location']
        Qlik_Service = config['Qlick_ObjId']['Service']
        Qlik_Propensity = config['Qlick_ObjId']['Propensity']
        return (config['RESTAPI']['Base_url_Dev'])

    def ConfigReaderDevFunc(self):
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
        global Qlik_Segment_Name
        global Qlik_Segment_Type
        global Qlik_Region
        global Qlik_Location
        global Qlik_Service
        global Qlik_Propensity
        dir_path = os.path.dirname(os.path.realpath(__file__))
        config_file = os.path.join(dir_path, 'config.ini')
        config = ConfigParser()
        print(config.sections())
        config.read(config_file)
        print(config.sections())
        Base_url = config['RESTAPI']['Base_url_DevFunc']
        user = config['RESTAPI']['username_DevFunc']
        password = config['RESTAPI']['Password_DevFunc']
        grant_type = config['RESTAPI']['grant_type_DevFunc']
        client_secret = config['RESTAPI']['client_secret_DevFunc']
        return (config['RESTAPI']['Base_url_Dev'])


    def ConfigReaderStage(self):
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
        global Qlik_Segment_Name
        global Qlik_Segment_Type
        global Qlik_Region
        global Qlik_Location
        global Qlik_Service
        global Qlik_Propensity
        dir_path = os.path.dirname(os.path.realpath(__file__))
        config_file = os.path.join(dir_path, 'config.ini')
        config = ConfigParser()
        print(config.sections())
        config.read(config_file)
        print(config.sections())
        Base_url = config['RESTAPI']['Base_url_Stage']
        user = config['RESTAPI']['username_stage']
        password = config['RESTAPI']['password_stage']
        grant_type = config['RESTAPI']['grant_type_stage']
        client_secret = config['RESTAPI']['client_secret_stage']
        Qlik_Segment_Name = config['Qlick_ObjId']['Segment_Name']
        Qlik_Segment_Type = config['Qlick_ObjId']['Segment_Type']
        Qlik_Region = config['Qlick_ObjId']['Region']
        Qlik_Location = config['Qlick_ObjId']['Location']
        Qlik_Service = config['Qlick_ObjId']['Service']
        Qlik_Propensity = config['Qlick_ObjId']['Propensity']
        return (config['RESTAPI']['Base_url_Stage'])

    def ConfigReaderProd(self):
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
        global Qlik_Segment_Name
        global Qlik_Segment_Type
        global Qlik_Region
        global Qlik_Location
        global Qlik_Service
        global Qlik_Propensity
        dir_path = os.path.dirname(os.path.realpath(__file__))
        config_file = os.path.join(dir_path, 'config.ini')
        config = ConfigParser()
        print(config.sections())
        config.read(config_file)
        print(config.sections())
        Base_url = config['RESTAPI']['Base_url_Prod']
        user = config['RESTAPI']['username_Prod']
        password = config['RESTAPI']['password_Prod']
        grant_type = config['RESTAPI']['grant_type_Prod']
        client_secret = config['RESTAPI']['client_secret_Prod']
        Qlik_Segment_Name = config['Qlick_ObjId']['Segment_Name']
        Qlik_Segment_Type = config['Qlick_ObjId']['Segment_Type']
        Qlik_Region = config['Qlick_ObjId']['Region']
        Qlik_Location = config['Qlick_ObjId']['Location']
        Qlik_Service = config['Qlick_ObjId']['Service']
        Qlik_Propensity = config['Qlick_ObjId']['Propensity']
        return (config['RESTAPI']['Password_Prod'])

    def wrongdata(self):
        try:
            data ={
                'email': 'test@gmail.com',
                'password': password
            }
            loginurl = Base_url + "/v1/authentication/token"
            response = requests.post(loginurl, json=data)
            print(response)
            invalidemail_response = response
            errorDes = response.reason
            print(errorDes)
            assert response.status_code == 404
            assert response.reason == "Not Found"
            data1 = {
                'email': user,
                'password': 'check'
            }
            jsondata = json.dumps(data1, sort_keys=True)
            loginurl = Base_url + "/account/login"
            response = requests.post(loginurl, json=jsondata)
            print(response)
            invalidpassword_response = response
            errorDes = response.reason
            print(errorDes)
            assert response.status_code == 400
            assert response.reason == "Bad Request"
            return (invalidemail_response)
        except Exception as e:
            return ("Oops!", e.__class__, "occured")

    def loginAPI(self):
        try:
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
           month = 'last-2m'
           X_Calix_ClientID = 'kK1cJ0mRp7iSmTFt3vAGO44vobsu36op'
           data = {"grant_type": grant_type,
                    "username": user,
                    "password": password,
                "client_secret": client_secret
                   }
           headers = {"Content-type": "application/x-www-form-urlencoded",
                      "X-Calix-ClientID": X_Calix_ClientID
                     }
           loginurl = Base_url + "/v1/authentication/token"
           print(loginurl)
           response = requests.post(loginurl, headers=headers,  data=data)
           print(response)
           assert response.status_code == 200
           data = response.json()
           print(data)
           access_token = data['access_token']
           print("access_token : ",access_token)
           refresh_token = data['refresh_token']
           print("refresh_token : ",refresh_token)
           LoginUser = data['username']
           print('LoginUser: ', LoginUser)
           orgId = data['OrgId']
           print('OrgId', orgId)
           orgName = data['OrgName']
           print('OrgName', orgName)
           spId = data['SpId']
           print('SpId', spId)
           roles = data['roles']
           print('roles', roles)
           for appType in data['entitlements']:
               entitlementApptype.append(appType['apptype'])
           print("entitlementApptype: ", entitlementApptype)
           return (access_token,response.status_code)
        except Exception as e:
             return ("Oops!", e.__class__, "occured")

    def loginAPIDevFunc(self):
        try:
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
           month = 'last-2m'
           X_Calix_ClientID = 'izQyerEezkAMcFGZfVLb55wO6LmzvnkG'
           data = {"grant_type": grant_type,
                    "username": user,
                    "password": password,
                "client_secret": client_secret
                   }
           headers = {"Content-type": "application/x-www-form-urlencoded",
                      "X-Calix-ClientID": X_Calix_ClientID
                     }
           loginurl = Base_url + "/v1/authentication/token"
           print(loginurl)
           response = requests.post(loginurl, headers=headers,  data=data)
           print(response)
           assert response.status_code == 200
           data = response.json()
           print(data)
           access_token = data['access_token']
           print("access_token : ",access_token)
           refresh_token = data['refresh_token']
           print("refresh_token : ",refresh_token)
           LoginUser = data['username']
           print('LoginUser: ', LoginUser)
           orgId = data['OrgId']
           print('OrgId', orgId)
           orgName = data['OrgName']
           print('OrgName', orgName)
           spId = data['SpId']
           print('SpId', spId)
           roles = data['roles']
           print('roles', roles)
           for appType in data['entitlements']:
               entitlementApptype.append(appType['apptype'])
           print("entitlementApptype: ", entitlementApptype)
           return (access_token,response.status_code)
        except Exception as e:
             return ("Oops!", e.__class__, "occured")



    def loginAPI_cmcAuto(self):
        try:
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
           month = 'last-2m'
           X_Calix_ClientID = 'kK1cJ0mRp7iSmTFt3vAGO44vobsu36op'
           data = {"grant_type": grant_type,
                    "username": 'cmcautomation',
                    "password": '12345678',
                "client_secret": client_secret
                   }
           headers = {"Content-type": "application/x-www-form-urlencoded",
                      "X-Calix-ClientID": X_Calix_ClientID
                     }
           loginurl = Base_url + "/v1/authentication/token"
           print(loginurl)
           response = requests.post(loginurl, headers=headers,  data=data)
           print(response)
           assert response.status_code == 200
           data = response.json()
           print(data)
           access_token = data['access_token']
           print("access_token : ",access_token)
           refresh_token = data['refresh_token']
           print("refresh_token : ",refresh_token)
           LoginUser = data['username']
           print('LoginUser: ', LoginUser)
           orgId = data['OrgId']
           print('OrgId', orgId)
           orgName = data['OrgName']
           print('OrgName', orgName)
           spId = data['SpId']
           print('SpId', spId)
           roles = data['roles']
           print('roles', roles)
           return (access_token,response.status_code)
        except Exception as e:
             return ("Oops!", e.__class__, "occured")


    def loginAPI_cmcFiano(self):
        try:
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
           month = 'last-2m'
           X_Calix_ClientID = 'kK1cJ0mRp7iSmTFt3vAGO44vobsu36op'
           data = {"grant_type": grant_type,
                    "username": 'AutomationFiono',
                    "password": '12345678',
                "client_secret": client_secret
                   }
           headers = {"Content-type": "application/x-www-form-urlencoded",
                      "X-Calix-ClientID": X_Calix_ClientID
                     }
           loginurl = Base_url + "/v1/authentication/token"
           print(loginurl)
           response = requests.post(loginurl, headers=headers,  data=data)
           print(response)
           assert response.status_code == 200
           data = response.json()
           print(data)
           access_token = data['access_token']
           print("access_token : ",access_token)
           refresh_token = data['refresh_token']
           print("refresh_token : ",refresh_token)
           LoginUser = data['username']
           print('LoginUser: ', LoginUser)
           orgId = data['OrgId']
           print('OrgId', orgId)
           orgName = data['OrgName']
           print('OrgName', orgName)
           spId = data['SpId']
           print('SpId', spId)
           roles = data['roles']
           print('roles', roles)
           return (access_token,response.status_code)
        except Exception as e:
             return ("Oops!", e.__class__, "occured")



    def getEntitlements(self):
        try:
           global entitlementNames
           entitlementNames = []
           month = 'last-2m'
           X_Calix_ClientID = 'kK1cJ0mRp7iSmTFt3vAGO44vobsu36op'
           data = {"grant_type": grant_type,
                    "username": user,
                    "password": password,
                "client_secret": client_secret
                   }
           headers = {"Content-type": "application/x-www-form-urlencoded",
                      "X-Calix-ClientID": X_Calix_ClientID
                     }
           loginurl = Base_url + "/v1/authentication/token"
           response = requests.post(loginurl, headers=headers,  data=data)
           print(response)
           assert response.status_code == 200
           data = response.json()
           entitlementData = data['entitlements']
           for datalist in entitlementData:
               entitlementNames.append(datalist['apptype'])
           print("entitlementNames", entitlementNames)
           return (entitlementNames,response.status_code)
        except Exception as e:
            return ("Oops!", e.__class__, "occured")

    def getScope(self):
        try:
           global getScopeData
           getScopeData = []
           month = 'last-2m'
           X_Calix_ClientID = 'kK1cJ0mRp7iSmTFt3vAGO44vobsu36op'
           data = {"grant_type": grant_type,
                    "username": user,
                    "password": password,
                "client_secret": client_secret
                   }
           headers = {"Content-type": "application/x-www-form-urlencoded",
                      "X-Calix-ClientID": X_Calix_ClientID
                     }
           loginurl = Base_url + "/v1/authentication/token"
           response = requests.post(loginurl, headers=headers,  data=data)
           print(response)
           assert response.status_code == 200
           data = response.json()
           getScopeData = data['scopes']

           print("scopes: ",data['scopes'])
           print(len(getScopeData))
           return (getScopeData,response.status_code)
        except Exception as e:
            return ("Oops!", e.__class__, "occured")

    def getScopeCount(self):
        try:
           global getScopeData
           getScopeData = []
           month = 'last-2m'
           X_Calix_ClientID = 'kK1cJ0mRp7iSmTFt3vAGO44vobsu36op'
           data = {"grant_type": grant_type,
                    "username": user,
                    "password": password,
                "client_secret": client_secret
                   }
           headers = {"Content-type": "application/x-www-form-urlencoded",
                      "X-Calix-ClientID": X_Calix_ClientID
                     }
           loginurl = Base_url + "/v1/authentication/token"
           response = requests.post(loginurl, headers=headers,  data=data)
           print(response)
           assert response.status_code == 200
           data = response.json()
           getScopeData = data['scopes']

           print("scopes: ",data['scopes'])
           print(len(getScopeData))
           return (len(getScopeData),response.status_code)
        except Exception as e:
            return ("Oops!", e.__class__, "occured")


    def getRoles(self):
        try:
           global rolesData
           getScopeData = []
           month = 'last-2m'
           X_Calix_ClientID = 'kK1cJ0mRp7iSmTFt3vAGO44vobsu36op'
           data = {"grant_type": grant_type,
                    "username": user,
                    "password": password,
                "client_secret": client_secret
                   }
           headers = {"Content-type": "application/x-www-form-urlencoded",
                      "X-Calix-ClientID": X_Calix_ClientID
                     }
           loginurl = Base_url + "/v1/authentication/token"
           response = requests.post(loginurl, headers=headers,  data=data)
           print(response)
           assert response.status_code == 200
           data = response.json()
           rolesData = data['roles']
           print("scopes: ",data['scopes'],response.status_code)
           return (rolesData )
        except Exception as e:
            return ("Oops!", e.__class__, "occured")


    def getRolesCount(self):
        try:
           global getRolesCount
           getScopeData = []
           month = 'last-2m'
           X_Calix_ClientID = 'kK1cJ0mRp7iSmTFt3vAGO44vobsu36op'
           data = {"grant_type": grant_type,
                    "username": user,
                    "password": password,
                "client_secret": client_secret
                   }
           headers = {"Content-type": "application/x-www-form-urlencoded",
                      "X-Calix-ClientID": X_Calix_ClientID
                     }
           loginurl = Base_url + "/v1/authentication/token"
           response = requests.post(loginurl, headers=headers,  data=data)
           print(response)
           assert response.status_code == 200
           data = response.json()
           getRolesCount = data['roles']
           print(len(getRolesCount))
           return (len(getRolesCount),response.status_code)
        except Exception as e:
            return ("Oops!", e.__class__, "occured")

    def post_RefreshToken(self, end_url, refresh_token):
        try:
            X_Calix_ClientID = 'kK1cJ0mRp7iSmTFt3vAGO44vobsu36op'
            data = {"grant_type": 'refresh_token',
                    "refresh_token": refresh_token,
                    "client_secret": client_secret
                    }
            headers = {"Content-type": "application/x-www-form-urlencoded",
                       "X-Calix-ClientID": X_Calix_ClientID
                       }
            url = Base_url + end_url
            print('URL: ',url)
            response = requests.post(url, headers=headers, data=data)
            return (response)
        except Exception as e:
            return ("Oops!", e.__class__, "occured")

    def loginAPI_refreshToken(self):
        try:
            global orgId
            global access_token
            print('#####  Refresh Token  #####')
            end_url = "/v1/authentication/token"
            print(refresh_token)
            response = CMCconnectionObj.post_RefreshToken(end_url, refresh_token)
            print('RefreshToken:  ',response)
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


    def Subscribers_by_Service_Tier_And_Technology(self):
        try:
            print("-- Subscribers_by_Service_Tier_And_Technology --")
            DatalistX=[]
            DatalistY = []
            categories_serviceTier = []
            charturl = Base_url + "/v1/cmc/target-segmentation/service-tier-counts?org-id="+orgId+"&period="+month
            print(charturl)
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            print(data['series'][0]['data'][0])
            DatalistX.append(format(data['series'][0]['data'][0], ',d'))
            DatalistX.append(format(data['series'][0]['data'][1], ',d'))
            DatalistX.append(format(data['series'][0]['data'][2], ',d'))
            DatalistX.append(format(data['series'][0]['data'][3], ',d'))
            DatalistX.append(format(data['series'][0]['data'][4], ',d'))
            print(DatalistX)

            print(data['categories'][0])
            categories_serviceTier.append(data['categories'][0])
            categories_serviceTier.append(data['categories'][1])
            categories_serviceTier.append(data['categories'][2])
            categories_serviceTier.append(data['categories'][3])
            categories_serviceTier.append(data['categories'][4])
            print(categories_serviceTier)

            return(response.status_code,DatalistX,categories_serviceTier)
        except Exception as e:
            return (response.status_code)

    def Subscribers_by_Service_Tier_And_Technology_filter(self):
            try:
                print("-- Subscribers_by_Service_Tier_And_Technology filter --")
                DatalistX = []
                DatalistY = []
                charturl = Base_url + "/v1/cmc/target-segmentation/filter-options?org-i=" + orgId + "&period=" + month
                headers = {"X-Calix-AccessToken": access_token,
                           "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                           }
                print(charturl)
                response = requests.get(charturl, headers=headers)
                print(response)
                assert response.status_code == 200
                data = response.json()
                print(data)
                lst = response.json()
                for i in range(len(lst)):
                    x = lst[i]
                    print(x)
                print(i)
                return (response.status_code)
            except Exception as e:
                return (response.status_code)

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
            charturl = Base_url + "/v1/cmc/insights/user-list?org-id="+orgId+"&period="+month+"&tier=300M%2B&tech=Fiber&page=1&size=10&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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


    def Subscribers_Data_Usage_test(self):
        # try:
            DatalistX = []
            print("Subscribers_Data_Usage")
            Datalist = []
            charturl = Base_url + "/v1/cmc/insights/total-bandwidth-consumed?categories=75-200-500-1000-2000-3000&org-id="+orgId+"&period="+month+"&region=ALLIANCE"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            DatalistX.append(format(data[0]['0-75']))
            DatalistX.append(format(data[1]['76-200']))
            DatalistX.append(format(data[2]['201-500']))
            DatalistX.append(format(data[3]['501-1000']))
            DatalistX.append(format(data[4]['1001-2000']))
            DatalistX.append(format(data[5]['2001-3000']))
            DatalistX.append(format(data[6]['3001+']))
            print(DatalistX)
            #
            # # data = data[0]['0-5']
            # if int(DatalistX[0]) >= 1000:
            #   Convert_Data = int(DatalistX[0]) / 1000
            #   print('TB Data: ', str(round(Convert_Data, 2)) + ' TB')
            # else:
            #   Convert_Data = data
            #   print('GB Data: ', str(Convert_Data) + ' GB')
            # Datalist.append(Convert_Data)

    def Subscribers_Data_Usage(self):
        try:
            print("Subscribers_Data_Usage")
            DatalistX=[]
            DatalistY = []
            charturl = Base_url + "/v1/cmc/insights/total-bandwidth-consumed?categories=75-200-500-1000-2000-3000&org-id="+orgId+"&period="+month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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
            global serviceTier
            serviceTier = []
            global technologyType
            technologyType = []
            global Optout
            Optout = []
            global wifiScore
            wifiScore = []
            charturl = Base_url + "/v1/cmc/insights/user-list-by-usage?category=3000&page=1&size=10&refresh=true&org-id=" + orgId + "&period=" + month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Subscribers_Data_Usage_drilldown :")
            print(charturl)
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
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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


    def userCount_streamingSubscribers(self):
        try:
            DatalistX=[]
            DatalistY = []
            charturl = Base_url + "/v1/cmc/target-segmentation/user-counts?org-id="+orgId+"&period="+month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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


    def userCount_gamingSubscribers(self):
        try:
            DatalistX=[]
            DatalistY = []
            charturl = Base_url + "/v1/cmc/target-segmentation/user-counts?org-id="+orgId+"&period="+month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("userCount_streamingSubscribers")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            DatalistX.append(format(data['gamingUsers'], ',d'))
            print(format(data['gamingUsers'], ',d'))
            return(DatalistX)
        except Exception as e:
            return(response.status_code)



    def userCount_wfhSubricers(self):
        try:
            DatalistX=[]
            DatalistY = []
            charturl = Base_url + "/v1/cmc/target-segmentation/user-counts?org-id="+orgId+"&period="+month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("userCount_wfhSubricers")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            DatalistX.append(format(data['wfhUsers'], ',d'))
            print(format(data['wfhUsers'], ',d'))
            return(DatalistX)
        except Exception as e:
            return(response.status_code)


    def Streaming_Subscribers_drilldown(self):
        try:
            charturl = Base_url + "/v1/cmc/insights/user-list-by-tier-and-group?org-id=" + orgId + "&period=" + month + "&tier=300M%2B&reverse=false&group=streaming&page=1&size=10&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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

    def Gaming_Subscribers(self):
        try:
            DatalistX=[]
            DatalistY=[]
            charturl = Base_url + "/v1/cmc/target-segmentation/service-tier-counts-by-user-type?org-id="+orgId+"&period="+month+"&type=gaming"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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


    def Gaming_Subscribers_drilldown(self):
        try:
            charturl = Base_url + "/v1/cmc/insights/user-list-by-tier-and-group?org-id=" + orgId + "&period=" + month + "&tier=300M%2B&reverse=false&group=gaming&page=1&size=10&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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


    def Work_from_Home_WFH_Subscribers(self):
        try:
            DatalistX=[]
            charturl = Base_url + "/v1/cmc/target-segmentation/service-tier-counts-by-user-type?type=wfh&org-id="+orgId+"&period="+month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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

    def NonWork_from_Home_WFH_Subscribers(self):
        try:
            DatalistX=[]
            charturl = Base_url + "/v1/cmc/target-segmentation/service-tier-counts-by-user-type?org-id="+orgId+"&period="+month+"&type=wfh"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("NonWork_from_Home_WFH_Subscribers")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            lst=response.json()
            for i in range(len(lst)):
                x = lst[i]
                print(x)
            print(i)
            DatalistX.append(format(data[0]['<20M'][1], ',d'))
            DatalistX.append(format(data[1]['20M+'][1], ',d'))
            DatalistX.append(format(data[2]['50M+'][1], ',d'))
            DatalistX.append(format(data[3]['300M+'][1], ',d'))
            DatalistX.append(format(data[4]['1G'][1], ',d'))
            print(DatalistX)
            return(response.status_code,DatalistX)
        except Exception as e:
            return(response.status_code)


    def Work_from_Home_WFH_Subscribers_drilldown(self):
        try:
            charturl = Base_url + "/v1/cmc/insights/user-list-by-tier-and-group?org-id=" + orgId + "&period=" + month + "&tier=300M%2B&reverse=false&group=wfh&page=1&size=10&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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
            # DatalistX.append(data[0]['0-5'])
            # DatalistX.append(data[1]['5-15'])
            # DatalistX.append(data[2]['15-35'])
            # DatalistX.append(data[3]['35-75'])
            # DatalistX.append(data[4]['75-150'])
            # DatalistX.append(data[5]['150-300'])
            # DatalistX.append(data[6]['300+'])
            print(DatalistX)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def churn_rate_And_insights_drilldown(self):
        try:
            charturl = Base_url + "/v1/cmc/insights/churn-user-report-overall?org-id=" + orgId +"&start=2020-07-01&end=2020-07-31&tier=300M%2B&page=1&size=10&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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


    def Acquisition_rate_And_Insights(self):
        try:
            DatalistX=[]
            charturl = Base_url + "/v1/cmc/acquisition/acquisition-user-count-by-month?org-id="+orgId+"&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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
            # DatalistX.append(data[0]['0-5'])
            # DatalistX.append(data[1]['5-15'])
            # DatalistX.append(data[2]['15-35'])
            # DatalistX.append(data[3]['35-75'])
            # DatalistX.append(data[4]['75-150'])
            # DatalistX.append(data[5]['150-300'])
            # DatalistX.append(data[6]['300+'])
            # print(DatalistX)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Acquisition_rate_And_Insights_drilldown(self):
        try:
            charturl = Base_url + "/v1/cmc/acquisition/acquisition-user-report-overall?org-id=" + orgId + "&start=2020-07-01&end=2020-07-31&tier=300M%2B&page=1&size=10&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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


    def Acquisition_Revenue_And_Insights(self):
        try:
            DatalistX=[]
            charturl = Base_url + "/v1/cmc/acquisition/acquisition-and-potential-revenue?org-id="+orgId+"&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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
            # DatalistX.append(data[0]['0-5'])
            # DatalistX.append(data[1]['5-15'])
            # DatalistX.append(data[2]['15-35'])
            # DatalistX.append(data[3]['35-75'])
            # DatalistX.append(data[4]['75-150'])
            # DatalistX.append(data[5]['150-300'])
            # DatalistX.append(data[6]['300+'])
            print(DatalistX)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Acquisition_Revenue_And_Insights_drilldown(self):
        try:
            charturl = Base_url + "/v1/cmc/acquisition/acquisition-user-report-overall?org-id=" + orgId + "&start=2020-07-01&end=2020-07-31&page=1&size=10&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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


    def Acquisition_Revenue_And_Insights_drilldown_single_subscriber_service_limit(self):
        try:
            charturl = Base_url + "/v1/cmc/subscriber/single-subscriber-service-limit?org-id=" + orgId + "&endpoint-id=200716180&start-date=4&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Acquisition_Revenue_And_Insights_drilldown_single_subscriber_service_limit :")
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
                AccountNumber.append(datalist['month'])
            print("month", AccountNumber)
            for datalist in data:
                Name.append(datalist['upstreamServiceLimit'])
            print("upstreamServiceLimit", Name)
            for datalist in data:
                PhoneNumber.append(datalist['downstreamServiceLimit'])
            print("downstreamServiceLimit", PhoneNumber)
            combined_Table_all = [list(l) for l in
                                  zip(AccountNumber, Name, PhoneNumber)]
            print("Combined Data ", combined_Table_all)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Acquisition_Revenue_And_Insights_drilldown_single_subscriber_usage(self):
        try:
            charturl = Base_url + "/v1/cmc/subscriber/single-subscriber-usage?org-id=" + orgId + "&endpoint-id=200716180&start-date=4&"
            print(charturl)
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Acquisition_Revenue_And_Insights_drilldown_single_subscriber_usage :")
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
                AccountNumber.append(datalist['month'])
            print("month", AccountNumber)
            for datalist in data:
                Name.append(datalist['totalUsage'])
            print("totalUsage", Name)
            for datalist in data:
                PhoneNumber.append(datalist['streamingUsage'])
            print("streamingUsage", PhoneNumber)
            for datalist in data:
                downloadSpeed.append(datalist['gamingUsage'])
            print("gamingUsage", downloadSpeed)
            combined_Table_all = [list(l) for l in
                                  zip(AccountNumber, Name, PhoneNumber,downloadSpeed)]
            print("Combined Data ", combined_Table_all)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def Acquisition_Revenue_And_Insights_drilldown_single_subscriber_device_trends(self):
        try:
            charturl = Base_url + "/v1/cmc/subscriber/single-subscriber-device-trends?org-id=" + orgId + "&endpoint-id=200716180&start-date=4&"
            print(charturl)
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Acquisition_Revenue_And_Insights_drilldown_single_subscriber_device_trends :")
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
                AccountNumber.append(datalist['month'])
            print("month", AccountNumber)
            for datalist in data:
                Name.append(datalist['wifiScore'])
            print("wifiScore", Name)
            for datalist in data:
                PhoneNumber.append(datalist['numOfDevices'])
            print("numOfDevices", PhoneNumber)
            combined_Table_all = [list(l) for l in
                                  zip(AccountNumber, Name, PhoneNumber)]
            print("Combined Data ", combined_Table_all)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Acquisition_Revenue_And_Insights_drilldown_single_subscriber_usage_by_app_type(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/subscriber/single-subscriber-usage-by-app-type?org-id=" + orgId + "&endpoint-id=711478805&start-date=4&"
            print(charturl)
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Acquisition_Revenue_And_Insights_drilldown_single_subscriber_usage_by_app_type :")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("filter: ", data)
            DatalistX.append(data[0]['Streaming Media'])
            DatalistX.append(data[1]['Web, Cloud, Storage Hosting'])
            DatalistX.append(data[2]['Amazon'])
            DatalistX.append(data[3]['Social'])
            DatalistX.append(data[4]['Other'])
            print(DatalistX)
            lst = response.json()
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Acquisition_Revenue_And_Insights_drilldown_single_subscriber_top_apps(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/subscriber/single-subscriber-top-apps?org-id=" + orgId + "&endpoint-id=711478805&start-date=4&"
            print(charturl)
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Acquisition_Revenue_And_Insights_drilldown_single_subscriber_top_apps :")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("filter: ", data)
            DatalistX.append(data[0]['Streaming Media'])
            DatalistX.append(data[1]['Web, Cloud, Storage Hosting'])
            DatalistX.append(data[2]['Amazon'])
            DatalistX.append(data[3]['Social'])
            DatalistX.append(data[4]['Other'])
            print(DatalistX)
            lst = response.json()
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def New_Subscribers_by_Service_Tier_And_Technology(self):
        try:
            DatalistX=[]
            DatalistY=[]
            charturl = Base_url + "/v1/cmc/acquisition/new-service-tier-counts?org-id="+orgId+"&period="+month
            print(charturl)
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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
            DatalistX.append(format(data['series'][0]['data'][4], ',d'))
            print(DatalistX)

            DatalistY.append('<20M / Fiber')
            DatalistY.append('20M+ / Fiber')
            DatalistY.append('50M+ / Fiber')
            DatalistY.append('300M+ / Fiber')
            DatalistY.append('1G / Fiber')
            return(response.status_code,DatalistX,DatalistY)

        except Exception as e:
            return(response.status_code)



    def New_Subscribers_by_Service_Tier_And_Technology_filter(self):
        try:
            global chartData
            DatalistX=[]
            charturl = Base_url + "/v1/cmc/target-segmentation/filter-options?org-id="+orgId+"&period="+month+"&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("New_Subscribers_by_Service_Tier_And_Technology_filter")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("filter: ",data)
            lst=response.json()
            # for i in range(len(lst)):
            #     x = lst[i]
            #     print(x)
            # print(i)
            # DatalistX.append(data[0]['0-5'])
            # DatalistX.append(data[1]['5-15'])
            # DatalistX.append(data[2]['15-35'])
            # DatalistX.append(data[3]['35-75'])
            # DatalistX.append(data[4]['75-150'])
            # DatalistX.append(data[5]['150-300'])
            # DatalistX.append(data[6]['300+'])
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def New_Subscribers_by_Service_Tier_And_Technology_drilldown(self):
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
            charturl = Base_url + "/v1/cmc/acquisition/new-user-list?tier=300M%2B&tech=Fiber&page=1&size=10&org-id=" + orgId + "&period=" + month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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



    def Usage_by_Application_Type(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/application-group-usage?org-id=" + orgId + "&period=" + month + "&limit=4&others=true"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Usage_by_Application_Type_drilldown")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("All Data: ", data)
            # lst = response.json()
            # for i in range(len(lst)):
            #     x = lst[i]
            #     print(x)
            # print(i)
            # DatalistX.append(data[0]['Streaming Media'])
            # DatalistX.append(data[1]['Web, Cloud, Storage Hosting'])
            # DatalistX.append(data[2]['Amazon'])
            # DatalistX.append(data[3]['Social'])
            # DatalistX.append(data[4]['Other'])
            # print(DatalistX)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)



    def Blocked_Threats_Insights(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/marketing/subscriber-protectiq-insight?org-id=" + orgId + "&period=" + month + "&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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

    def Devices_per_Household(self):
        try:
            DatalistX=[]
            DatalistY=[]
            charturl = Base_url + "/v1/cmc/insights/connected-device-number-distribution?org-id="+orgId+"&period="+month+"&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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
            global serviceTier
            serviceTier = []
            global technologyType
            technologyType = []
            global Optout
            Optout = []
            global wifiScore
            wifiScore = []
            charturl = Base_url + "/v1/cmc/insights/user-list-by-connected-device-number?org-id=" + orgId + "&period=" + month + "&category=5-9&page=1&size=10&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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


    def Blocked_Threats_Insights_drilldown(self):
        try:
            charturl = Base_url + "/v1/cmc/marketing/protectiq-user-report-overall?org-id=" + orgId + "&period=" + month + "&protectiqtype=IPS&page=1&size=10&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Blocked_Threats_Insights_drilldown :")
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
            print("email", email)
            for datalist in data:
                region.append(datalist['totalUsage'])
            print("totalUsage", region)
            for datalist in data:
                location.append(datalist['mac_address'])
            print("mac_address", location)
            for datalist in data:
                customerType.append(datalist['serviceAddress'])
            print("serviceAddress", customerType)
            for datalist in data:
                downloadSpeed.append(datalist['serviceTier'])
            print("serviceTier", downloadSpeed)
            for datalist in data:
                uploadSpeed.append(datalist['threat_count'])
            print("threat_count", uploadSpeed)
            combined_Table_all = [list(l) for l in
                                  zip(AccountNumber, Name, PhoneNumber, serviceAddress, email, region, location,
                                      customerType, downloadSpeed, uploadSpeed)]
            print("Combined Data ", combined_Table_all)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def Subscriber_Revenue_drilldown(self):
        try:
            charturl = Base_url + "/v1/cmc/acquisition/acquisition-user-report-overall?org-id=" + orgId +"&start=2020-07-01&end=2020-07-31&page=1&size=10&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Subscriber_Revenue_drilldown :")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("filter: ", data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def Subscriber_Usage_drilldown(self):
        try:
            charturl = Base_url + "/v1/cmc/subscriber/single-subscriber-usage?org-id=" + orgId +"&endpoint-id=200716180&start-date=4&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Subscriber_Usage_drilldown :")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("filter: ", data)
            for datalist in data:
                AccountNumber.append(datalist['month'])
            print("month", AccountNumber)
            for datalist in data:
                Name.append(datalist['totalUsage'])
            print("totalUsage", Name)
            for datalist in data:
                PhoneNumber.append(datalist['streamingUsage'])
            print("streamingUsage", PhoneNumber)
            for datalist in data:
                serviceAddress.append(datalist['gamingUsage'])
            print("gamingUsage", serviceAddress)
            combined_Table_all = [list(l) for l in
                                  zip(AccountNumber, Name, PhoneNumber, serviceAddress)]
            print("Combined Data ", combined_Table_all)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Service_Limits_drilldown(self):
        try:
            charturl = Base_url + "/v1/cmc/subscriber/single-subscriber-service-limit?org-id=" + orgId +"&&endpoint-id=200716180&start-date=4&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print(charturl)
            print("Service_Limits_drilldown :")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("filter: ", data)
            for datalist in data:
                AccountNumber.append(datalist['month'])
            print("month", AccountNumber)
            for datalist in data:
                Name.append(datalist['upstreamServiceLimit'])
            print("upstreamServiceLimit", Name)
            for datalist in data:
                PhoneNumber.append(datalist['downstreamServiceLimit'])
            print("downstreamServiceLimit", PhoneNumber)
            combined_Table_all = [list(l) for l in
                                  zip(AccountNumber, Name, PhoneNumber)]
            print("Combined Data ", combined_Table_all)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Competitor_Visit_and_Speed_Test_Minutes_drilldown(self):
        try:
            charturl = Base_url + "/v1/cmc/insights/single-churn-user-history?org-id=" + orgId +"&churn-date=2020-07&endpoint-id=2214176"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Competitor_Visit_and_Speed_Test_Minutes_drilldown :")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print("filter: ", data)
            for datalist in data:
                AccountNumber.append(datalist['month'])
            print("month", AccountNumber)
            for datalist in data:
                Name.append(datalist['upstreamServiceLimit'])
            print("upstreamServiceLimit", Name)
            for datalist in data:
                PhoneNumber.append(datalist['downstreamServiceLimit'])
            print("downstreamServiceLimit", PhoneNumber)
            combined_Table_all = [list(l) for l in
                                  zip(AccountNumber, Name, PhoneNumber)]
            print("Combined Data ", combined_Table_all)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def Top_Applications_drilldown(self):
        try:
            charturl = Base_url + "/v1/cmc/insights/user-count-by-app?org-id=" + orgId + "&period=" + month + "&app=Amazon&page=1&size=100&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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


    def Top_Gaming_Applications_drilldown(self):
        try:
            charturl = Base_url + "/v1/cmc/insights/user-count-by-app?org-id=" + orgId + "&period=" + month + "&app=gaming%20(xbox%20live)&group=gaming&page=1&size=100&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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

    def Retention(self):
        try:
            global AccountNumber
            global Name
            global PhoneNumber
            global DownstreamServiceLimit
            global UpstreamServiceLimit
            global competitor
            competitor=[]
            DownstreamServiceLimit=[]
            UpstreamServiceLimit=[]
            AccountNumber=[]
            Name=[]
            SpeedTest=[]
            DatalistX=[]
            charturl = Base_url + "/v1/cmc/target-segmentation/retention-insights-report?org-id="+orgId+"&period="+month+"&page=1&size=10&output=json"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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


            # Instagram.append('Instagram')
            # Instagram.append(data[9]['Instagram'][0])
            # combined_Table_all = [list(l) for l in zip(Amazon,Google)]
            # print("Combined Data ",combined_Table_all)

            return(response.status_code,AllData)
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
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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

    def Subscriber_Activity_Trends(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/subscriber-trends-by-application-group?org-id=" + orgId + "&period=" + month + "&month=6"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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

    def Wi_Fi_Device_Category_Trends(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/marketing/subscriber-protectiq-insight?org-id=" + orgId + "&period=" + month + "&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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


    def CommandIQ_Insights(self):
        try:
            DownstreamServiceLimit=[]
            UpstreamServiceLimit=[]
            AccountNumber=[]
            Name=[]
            PhoneNumber=[]
            DatalistX=[]
            charturl = Base_url + "/v1/cmc/marketing/smart-home-candidate?page=1&size=10&output=json&org-id="+orgId+"&period="+month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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
            print("numOfDevices",AccountNumber)
            for name in data:
                Name.append(name['name'])
            print("name",Name)
            for phoneNumber in data:
                data1 = phoneNumber['wifiScore']
                data2 = int(round(float(data1)))
                PhoneNumber.append(data2)
            print("wifiScore",PhoneNumber)
            for getList in data:
                DownUsage = getList['downUsage']
                UpUsage = getList['upUsage']
                downUpStream = str(DownUsage) + ' / ' + str(UpUsage)
                DownstreamServiceLimit.append(downUpStream)
            print("DownstreamServiceLimit",DownstreamServiceLimit)
            combined_Table_all = [list(l) for l in zip(Name,AccountNumber,DownstreamServiceLimit,PhoneNumber)]
            print("Combined Data ",combined_Table_all)
            return(response.status_code,combined_Table_all)
        except Exception as e:
            return(response.status_code)

    def Social_Channel_Heatmap(self):
        try:
            DownstreamServiceLimit=[]
            UpstreamServiceLimit=[]
            AccountNumber=[]
            Name=[]
            PhoneNumber=[]
            DatalistX=[]
            charturl = Base_url + "/v1/cmc/insights/application-heatmap?org-id="+orgId+"&period="+month+"&social-channel-name=YouTube&timezone=05.30&interval=2"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Social Channel Heatmap :")
            print(response.status_code )
            assert response.status_code == 200
            data = response.json()
            print("filter: ",data)
            lst=response.json()
            # for i in range(len(lst)):
            #     x = lst[i]
            #     # print(x)
            # print(i)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Social_Channel_List_for_Dropdown(self):
        try:
            DownstreamServiceLimit=[]
            UpstreamServiceLimit=[]
            AccountNumber=[]
            Name=[]
            PhoneNumber=[]
            DatalistX=[]
            charturl = Base_url + "/v1/cmc/insights/social-channel-list?org-id="+orgId+"&period="+month+"&timezone=05.30&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Social_Channel_List_for_Dropdown")
            print(response.status_code )
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code,data)
        except Exception as e:
            return(response.status_code)


    def Active_Subscriber_Count(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/total-active-subscribers?org-id=" + orgId + "&period=" + month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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

    def Config_for_Widget_hide_show(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/cloud/configuration?org-id=" + orgId + "&period=" + month+"&startdate=2020-03-15&enddate=2020-04-11&social-channel-name=YouTube&timezone=05.30&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Config_for_Widget_hide_show")
            print(response)
            assert response.status_code == 200
            data = response.json()
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Location_Region_List(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/cloud/region-location-hierarchy?org-id=" + orgId + "&period=" + month +"&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Location_Region_List")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def UPSELL_MAP_VIEW_user_counts(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/target-user-counts?org-id=" + orgId + "&period=" + month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("UPSELL_MAP_VIEW_user_counts")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def UPSELL_MAP_VIEW_user_report(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/user-report?org-id=" + orgId + "&period=" + month +"&attainable-rate=false"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("UPSELL_MAP_VIEW_user_report")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def UPSELL_MAP_VIEW_acquisition_wire_center_report(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/acquisition-wire-center-report?org-id=" + orgId + "&period=" + month +"&attainable-rate=false"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("UPSELL_MAP_VIEW_acquisition_wire_center_report")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def UPSELL_MAP_VIEW_Form_Creation_Field_Drop_Down_Data(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/cloud/locations?org-id=" + orgId + "&period=" + month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("UPSELL_MAP_VIEW_acquisition_wire_center_report")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def UPSELL_MAP_VIEW_TABLE_VIEW(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/user-report?org-id=" + orgId + "&period=" + month+"&attainable-rate=false"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("UPSELL_MAP_VIEW_acquisition_wire_center_report")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def UPSELL_MAP_VIEW_EXPORT(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/user-report?org-id=" + orgId + "&period=" + month+"&attainable-rate=false"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("UPSELL_MAP_VIEW_acquisition_wire_center_report")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def UPSELL_MAP_VIEW_CREATE_TARGET_SEGMENTATION(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/user-report?org-id=" + orgId + "&period=" + month+"&attainable-rate=false"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("UPSELL_MAP_VIEW_acquisition_wire_center_report")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def RETENTION_MAP_VIEW_retention_insights_report(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/retention-insights-report?org-id=" + orgId + "&period=" + month+"&attainable-rate=false&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("RETENTION_MAP_VIEW_retention_insights_report")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def RETENTION_MAP_VIEW_acquisition_wire_center_report(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/acquisition-wire-center-report?org-id=" + orgId + "&period=" + month+"&attainablerate=false&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("RETENTION_MAP_VIEW_acquisition_wire_center_report")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def RETENTION_MAP_VIEW_Form_Creation_Field_Drop_Down_Data(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/cloud/locations?org-id=" + orgId + "&period=" + month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("RETENTION_MAP_VIEW_retention_insights_report")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def RETENTION_TABLE_VIEW(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/retention-insights-report?org-id=" + orgId + "&period=" + month +"&attainable-rate=false&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("RETENTION_MAP_VIEW_retention_insights_report")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def RETENTION_EXPORT(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/retention-insights-report?org-id=" + orgId + "&period=" + month +"&attainable-rate=false&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("RETENTION_MAP_VIEW_retention_insights_report")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Service_Module_Adoption_Rate(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/parental-control-and-network-security-usage-trend?org-id=" + orgId
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Service_Module_Adoption_Rate")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def RETENTION_MAP_VIEW_retention_insights_report(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/retention-insights-report?org-id=" + orgId + "&period=" + month +"&attainable-rate=false&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("RETENTION_MAP_VIEW_retention_insights_report")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def RETENTION_MAP_VIEW_acquisition_wire_center_report(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/acquisition-wire-center-report?org-id=" + orgId + "&period=" + month +"&attainablerate=false&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("RETENTION_MAP_VIEW_acquisition_wire_center_report")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def RETENTION_Form_Creation_Field_Drop_Down_Data(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/cloud/locations?org-id=" + orgId + "&period=" + month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("RETENTION_Form_Creation_Field_Drop_Down_Data")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def RETENTION_TABLE_VIEW(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/retention-insights-report?org-id=" + orgId + "&period=" + month +"&attainable-rate=false&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("RETENTION_TABLE_VIEW")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def RETENTION_EXPORT(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/retention-insights-report?org-id=" + orgId + "&period=" + month +"&attainable-rate=false&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("RETENTION_EXPORT")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def RETENTION_CREATE_TARGET_SEGMENTATION(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/retention-insights-report?org-id=" + orgId + "&period=" + month +"&attainable-rate=false&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("RETENTION_CREATE_TARGET_SEGMENTATION")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def ACQUISITION_MAP_VIEW_acquisition_existing_report(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/acquisition-existing-report?org-id=" + orgId + "&period=" + month +"&attainable-rate=false&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("ACQUISITION_MAP_VIEW_acquisition_existing_report")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def ACQUISITION_MAP_VIEW_acquisition_prospect_report(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/acquisition-prospect-report?org-id=" + orgId + "&period=" + month +"&attainable-rate=false&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("ACQUISITION_MAP_VIEW_acquisition_prospect_report")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def ACQUISITION_MAP_VIEW_acquisition_wire_center_report(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/acquisition-wire-center-report?org-id=" + orgId + "&period=" + month +"&attainable-rate=false&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("ACQUISITION_MAP_VIEW_acquisition_wire_center_report")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def ACQUISITION_Form_Creation_Field_Drop_Down_Data(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/cloud/locations?org-id=" + orgId+ "&period=" + month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("ACQUISITION_Form_Creation_Field_Drop_Down_Data")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def ACQUISITION_TABLE_VIEW(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/acquisition-existing-report?org-id=" + orgId + "&period=" + month +"&attainable-rate=false&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("ACQUISITION_TABLE_VIEW")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def ACQUISITION_EXPORT(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/acquisition-existing-report?org-id=" + orgId + "&period=" + month +"&attainable-rate=false&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("ACQUISITION_EXPORT")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def ACQUISITION_CREATE_TARGET_SEGMENTATION(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/acquisition-existing-report?org-id=" + orgId + "&period=" + month +"&attainable-rate=false&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("ACQUISITION_CREATE_TARGET_SEGMENTATION")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def MOBILE_NOTIFICATIONS_CREATE_NEW_NOTIFICATION(self):
        try:
            DatalistX = []
            global ScheduledId
            data = { "orgId":""+orgId+"" , "campaignName": "Comcast", "imageUrl":"https://www.calix.com/content/dam/calix/images/home/calix_logo.png", "embbededUrl": "https://www.calix.com", "type": "S", "promoType":"PROMO_WEB_IMAGE", "segmentType":"1e3ssx441-4321-bd9c-e3426e9ef1xs", "timeZone":"GMT-8", "segmentId": "1e3612be-4441-4321-bd9c-e3426e9ef139", "schedule":1607533620000}
            charturl = Base_url + "/v1/cmc/promotion/add"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.put(charturl, headers=headers, json=data)
            print("MOBILE_NOTIFICATIONS_CREATE_NEW_NOTIFICATION")
            print(response)
            assert response.status_code == 200
            data = response.json()
            ScheduledId = data['scheduleId']
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def MOBILE_NOTIFICATIONS_SCHEDULED_LIST(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/promotion/list?orgId=" + orgId
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("MOBILE_NOTIFICATIONS_SCHEDULED_LIST")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            for name in data:
                campaignName = name['campaignName']
                SheduleDate = name['schedule']
                dt_object = datetime.fromtimestamp(SheduleDate / 1000.0)
                Date = dt_object.strftime('%Y-%m-%d')
                time = dt_object.strftime("%X")
                d = datetime.strptime(time, "%H:%M:%S")
                NotificationTime = d.strftime("%I:%M %p")
                TimeZone = name['timeZone']
                DatalistX.append(campaignName)
                DatalistX.append(Date)
                DatalistX.append(NotificationTime)
                DatalistX.append(TimeZone)
            print(DatalistX)
            return(DatalistX,response.status_code)
        except Exception as e:
            return(response.status_code)

    def MOBILE_NOTIFICATIONS_DELETE_SCHEDULED_LIST(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/promotion/remove?orgId=" + orgId +"&scheduleId="+ScheduledId
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.delete(charturl, headers=headers)
            print("MOBILE_NOTIFICATIONS_DELETE_SCHEDULED_LIST")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def MOBILE_NOTIFICATIONS_Segment_API(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/smarthome/api/v1/segment?type=Upsell&orgId=" + orgId
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("MOBILE_NOTIFICATIONS_Segment_API")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def MOBILE_NOTIFICATIONS_Campaign_Event_history_view_by_orgid(self):
        try:
            DatalistX = []
            global campaignId
            charturl = Base_url + "/v1/cmc/campaign/campaign-event/history/" + orgId
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("MOBILE_NOTIFICATIONS_Campaign_Event_history_view_by_orgid")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            campaignId = data[1]['campaignId']
            for name in data:
                NotificationName = name['campaignName']
                Subscriber = name['subscriberInfo']
                Optvalue = name['optOutSubscribers']
                Startdate1 = name['created']
                NotificationDate = Startdate1.split('T')[0]
                Enddate = name['schedule']
                d = datetime.strptime(Enddate, "%H:%M:%S")
                NotificationTime = d.strftime("%I:%M %p")
                TimeZone = name['timeZone']
                DatalistX.append(NotificationName)
                DatalistX.append(Subscriber)
                DatalistX.append(Optvalue)
                DatalistX.append(NotificationDate)
                DatalistX.append(NotificationTime)
                DatalistX.append(TimeZone)
            print(DatalistX)
            return(DatalistX,response.status_code)
        except Exception as e:
            return(response.status_code)


    def MOBILE_NOTIFICATIONS_Campaign_Event_history_view_by_campaign_id(self):
        try:
            DatalistX = []
            print("compignId",campaignId)
            charturl = Base_url + "/v1/cmc/campaign/campaign-event/history/view/"+campaignId
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("MOBILE_NOTIFICATIONS_Campaign_Event_history_view_by_campaign_id")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def MOBILE_NOTIFICATIONS_EVENT_LIST(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/campaign/campaign-event/dashboard/" + orgId
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("MOBILE_NOTIFICATIONS_EVENT_LIST")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            for name in data:
                CamaignName = name['campaignName']
                evenntType = name['eventType']
                Startdate1 = name['startDate']
                Startdate = Startdate1.split('T')[0]
                if "endDate" in name:
                    Enddate1 = name['endDate']
                    Enddate = Enddate1.split('T')[0]
                else:
                    Enddate = ""
                Monitoring = Startdate + " to " + Enddate
                Threshold = name['threshold']
                NotificationTime1 = name['schedule']
                d = datetime.strptime(NotificationTime1, "%H:%M:%S")
                NotificationTime = d.strftime("%I:%M %p")
                TimeZone = name['timeZone']
                DatalistX.append(CamaignName)
                DatalistX.append(evenntType)
                DatalistX.append(Monitoring)
                DatalistX.append(Threshold)
                DatalistX.append(NotificationTime)
                DatalistX.append(TimeZone)
            print(DatalistX,response.status_code)
            return(DatalistX,response.status_code)
        except Exception as e:
            return(response.status_code)

    def MOBILE_NOTIFICATIONS_EDIT_DELETE_EVENT_LIST(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/campaign/campaign-event/dashboard/" + orgId +"/be9ed9d8-0872-41c4-b4af-8f22c69b9ed4/Testing30July"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.delete(charturl, headers=headers)
            print("MOBILE_NOTIFICATIONS_EDIT_DELETE_EVENT_LIST")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def MOBILE_NOTIFICATIONS_HISTORY_LIST(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/promotion/history?orgId=" + orgId +"&from=0&size=10"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("MOBILE_NOTIFICATIONS_HISTORY_LIST")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            for name in data['datas']:
                CamaignName = name['campaignName']
                SegmentType = name['segmentType']
                timestamp = name['schedule']
                dt_object = datetime.fromtimestamp(timestamp / 1000.0)
                Date = dt_object.strftime('%Y-%m-%d')
                # timestamp1 = name['created']
                # dt_object = datetime.fromtimestamp(timestamp1 / 1000.0)
                time = dt_object.strftime("%X")
                d = datetime.strptime(time, "%H:%M:%S")
                NotificationTime = d.strftime("%I:%M %p")
                TimeZone = name['timeZone']
                successcount = name['success']
                failedscount = name['fail']
                DatalistX.append(CamaignName)
                DatalistX.append(SegmentType)
                DatalistX.append(Date)
                DatalistX.append(NotificationTime)
                DatalistX.append(TimeZone)
                DatalistX.append(successcount)
                DatalistX.append(failedscount)
            print(DatalistX)
            return(DatalistX,response.status_code)
        except Exception as e:
            return(response.status_code)


    def SEARCH_SEARCH_USER(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/subscriber/search?org=" + orgId +"&page_number=1&page_size=10&filter=mahendra"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("SEARCH_SEARCH_USER")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def SEARCH_SubscriberCount(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/subscriber/search?org=" + orgId +"&page_number=1&page_size=10&filter="
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print(charturl)
            print("## SEARCH_Subscriber Count ##")
            print(response)
            assert response.status_code == 200
            data = response.json()
            totalCount=data['matadata']['total_hits']
            print(data)
            print('totalCount: ',totalCount)
            return(response.status_code,totalCount)
        except Exception as e:
            return(response.status_code)


    def SEARCH_USER_INFORMATION_LIST_subscribers(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/csc/subscribers/364a8e98-f88d-4882-8539-59fd2b0ec30a?orgId=" + orgId
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("SEARCH_USER_INFORMATION_LIST_subscribers")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def SEARCH_USER_INFORMATION_LIST_prioritySearch(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/mapper/api/v1/search/prioritySearch?orgId=" + orgId +"&fields=serialNumber&filter=CXNK003E85F1"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("SEARCH_USER_INFORMATION_LIST_prioritySearch")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(data,response.status_code)
        except Exception as e:
            return(response.status_code)

    def SEARCH_WIDGET(self):
        try:
            DatalistX = []
            global TableData
            TableData = []
            charturl = Base_url + "/v1/cmc/subscriber/single-subscriber-insight?org-id=" + orgId +"&region=All&period=last-2m&endpoint-id=91427427&month=6"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("SEARCH_WIDGET")
            print(response)
            assert response.status_code == 200
            data = response.json()
            AccountNumber = data['subscriber']['account']
            TableData.append(AccountNumber)
            Name = data['subscriber']['name']
            TableData.append(Name)
            PhoneNumber = data['subscriber']['phone']
            TableData.append(PhoneNumber)
            EmailId = data['subscriber']['email']
            TableData.append(EmailId)
            ServiceAddress = data['subscriber']['serviceAddress']
            TableData.append(ServiceAddress)
            Servicetire = data['subscriber']['serviceTier']
            TableData.append(Servicetire)
            AttainableRate = data['subscriber']['attainableRate']
            TableData.append(AttainableRate)
            Sumdownload = 0
            SumUpload = 0
            SumSpeedTest= 0
            SumComp = 0
            SumStraming = 0
            Sumgaming = 0
            SumTotal= 0
            WifiScore = []
            Devices = []
            for name in data['lens']:
                DownloadStram = name['downstreamServiceLimit']
                Sumdownload = Sumdownload+DownloadStram
                UploadStram = name['downstreamServiceLimit']
                SumUpload = SumUpload+UploadStram
                SpeedTest = name['speedTest']
                SumSpeedTest = SumSpeedTest+SpeedTest
                competitorVisit = name['competitorVisit']
                SumComp = SumComp+competitorVisit
                streamingUsage = name['streamingUsage']
                SumStraming = SumStraming+streamingUsage
                gamingUsage = name['gamingUsage']
                Sumgaming = Sumgaming+gamingUsage
                totalUsage = name['totalUsage']
                SumTotal = SumTotal+totalUsage
                Score = name['wifiScore']
                WifiScore.append(Score)
                Device = name['connectDevicesCount']
                Devices.append(Device)
            TableData.append(Sumdownload)
            TableData.append(SumUpload)
            TableData.append(SumSpeedTest)
            TableData.append(SumComp)
            TableData.append(format(SumStraming,'.2f'))
            TableData.append(format(Sumgaming,'.2f'))
            TableData.append(format(SumTotal,'.2f'))
            sum_num = 0
            for t in WifiScore:
                sum_num = sum_num + t

            avg = sum_num / len(WifiScore)
            TableData.append(round(avg))
            sum = 0
            for i in Devices:
                sum = sum + i
            ConnectedDevices = sum / len(Devices)
            TableData.append(round(ConnectedDevices))
            print(TableData)
            return(TableData,response.status_code)
        except Exception as e:
            return(response.status_code)


    def SEARCH_Subscriber_usage(self):
        try:
            DatalistX = []

            charturl = Base_url + "/v1/cmc/subscriber/single-subscriber-insight?org-id=" + orgId +"&region=All&period=last-2m&endpoint-id=91427427&month=6"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("SEARCH_Subscriber_usage")
            print(response)
            assert response.status_code == 200
            data = response.json()
            for name in data['lens']:
                month = name['month']
                stramingusage = name['streamingUsage']
                gamingUsage = name['gamingUsage']
                totalusage = name['totalUsage']
                otherusage = totalusage - stramingusage - gamingUsage
                DatalistX.append(month)
                DatalistX.append("Streaming Usage: "+str(round(stramingusage))+" GB")
                DatalistX.append("Gaming Usage: " +str(round(gamingUsage))+ " GB")
                DatalistX.append("Other Usage: " + str(round(otherusage)) + " GB")
            print(DatalistX)
            return(DatalistX,response.status_code)
        except Exception as e:
            return(response.status_code)


    def SEARCH_Usage_By_Application(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/subscriber/single-subscriber-usage-by-app-type?org-id=" + orgId +"&region=All&period=last-2m&endpoint-id=91427427&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("SEARCH_Usage_By_Application")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            ApplicationData = data[0]['Unknown and Other']
            UnknowStatus = str(format(ApplicationData/1024,'.2f'))+ ' TB'
            print('Application Usage '+str(UnknowStatus))
            return(UnknowStatus,response.status_code)
        except Exception as e:
            return(response.status_code)


    def SEARCH_Top_Applications(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/subscriber/single-subscriber-top-apps?org-id=" + orgId +"&region=All&period=last-2m&endpoint-id=91427427&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("SEARCH_Top_Applications")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def SEARCH_Competitor_vist_and_Speed_test_mintues(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/subscriber/single-subscriber-insight?org-id=" + orgId +"&region=All&period=last-2m&endpoint-id=91427427&month=6"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("SEARCH_Competitor_vist_and_Speed_test_mintues")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            for name in data['lens']:
                month = name['month']
                stramingusage = name['competitorVisit']
                speedtest = name['speedTest']
                DatalistX.append(month)
                DatalistX.append("Competitor Visits: "+str(round(stramingusage))+" Minutes")
                DatalistX.append("Speed Tests: " + str(round(speedtest)) + " Minutes")
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def SEARCH_Service_Limits(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/subscriber/single-subscriber-insight?org-id=" + orgId + "&region=All&period" + month +"&endpoint-id=91427427&month=6"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("SEARCH_Service_Limits")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def Subscribers_by_Service_Tier_And_Technology_export1(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/filter-options?org-id=" + orgId+ "&period=" + month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Subscribers_by_Service_Tier_And_Technology_export1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def Subscribers_by_Service_Tier_And_Technology_export2(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/user-list?org-id=" + orgId+ "&period=" + month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Subscribers_by_Service_Tier_And_Technology_export1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def Subscribers_by_Service_Tier_And_Technology_export2(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/user-list?org-id=" + orgId+ "&period=" + month + "&tier=300M%2B&tech=Fiber&file=true&filename=subscribers-by-service-tier-technology-300m-fiber"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Subscribers_by_Service_Tier_And_Technology_export2")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Subscriber_Data_Usage_export1(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/total-active-subscribers?org-id=" + orgId+ "&period=" + month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Subscriber_Data_Usage_export1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Subscriber_Data_Usage_export2(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/user-list-by-usage?org-id=" + orgId+ "&period=" + month + "&category=300&page=1&size=10"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Subscriber_Data_Usage_export2")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def Social_Channel_Heatmap_export1(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/application-heatmap?org-id=" + orgId+ "&period=" + month + "&social-channel-name=YouTube&timezone=05.30&interval=2"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Social_Channel_Heatmap_export1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Streaming_Subscribers_export1(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/service-tier-counts-by-user-type?org-id=" + orgId+ "&period=" + month +"&type=streaming"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Streaming_Subscribers_export1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Streaming_Subscribers_export2(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/user-list-by-tier-and-group?org-id=" + orgId+ "&period=" + month + "&tier=300M%2B&reverse=false&group=streaming&file=true&filename=streaming-subscribers-300m-streaming"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Streaming_Subscribers_export2")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Streaming_Subscribers_export1(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/service-tier-counts-by-user-type?org-id=" + orgId+ "&period=" + month +"&type=streaming"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Streaming_Subscribers_export1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Streaming_Subscribers_export2(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/user-list-by-tier-and-group?org-id=" + orgId+ "&period=" + month + "&tier=300M%2B&reverse=false&group=streaming&file=true&filename=streaming-subscribers-300m-streaming"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Streaming_Subscribers_export2")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Gaming_Subscribers_export1(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/service-tier-counts-by-user-type?org-id=" + orgId+ "&period=" + month +"&type=gaming"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Gaming_Subscribers_export1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Gaming_Subscribers_export2(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/user-list-by-tier-and-group?org-id=" + orgId+ "&period=" + month + "&tier=300M%2B&reverse=false&group=gaming&file=true&filename=gaming-subscribers-300m-gaming"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Gaming_Subscribers_export2")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Work_from_Home_Subscribersexport1(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/service-tier-counts-by-user-type?org-id=" + orgId+ "&period=" + month + "&type=wfh"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Work_from_Home_Subscribersexport1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Work_from_Home_Subscribersexport2(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/connected-device-number-distribution?org-id=" + orgId+ "&period=" + month + "&startdate=2020-03-15&enddate=2020-04-11&social-channel-name=&timezone=05.30"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Work_from_Home_Subscribersexport2")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Churn_Rate_And_Insights_export1(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/churn-user-count-by-month?org-id=" + orgId
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Churn_Rate_And_Insights_export1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Churn_Rate_And_Insights_export_churn_user_report_overall(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/churn-user-report-overall?org-id=" + orgId +"&start=2020-08-01&end=2020-08-31&tier=300M%2B&file=true&filename=churn-rate-insights-aug-20-300m-"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Churn_Rate_And_Insights_export_churn_user_report_overall")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Churn_Rate_And_Insights_export_churn_user_history(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/churn-user-history?org-id=" + orgId +"&start=2020-08-01&end=2020-08-31&tier=300M%2B&file=true&filename=churn-rate-insights-aug-20-300m-history"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Churn_Rate_And_Insights_export_churn_user_history")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def Retention_export1(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/retention-insights-report?org-id=" + orgId +"&period=last-1m&file=true&output=csv"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.post(charturl, headers=headers)
            print("Retention_export1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Churn_Risk_export1(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/marketing/churn-candidate?org-id=" + orgId + "&period=" + month +"&file=true&output=csv"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Churn_Risk_export1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Acquisition_Rate_And_Insights_export1(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/acquisition/acquisition-user-count-by-month?org-id=" + orgId
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Acquisition_Rate_And_Insights_export1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def Acquisition_Rate_And_Insights_export2(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/acquisition/acquisition-user-report-overall?org-id=" + orgId +"&start=2020-08-01&end=2020-08-31&tier=300M%2B&file=true&filename=acquisition-rate-insights-aug-20-300m-"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Acquisition_Rate_And_Insights_export2")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Acquisition_Revenue_And_Insights_export1(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/acquisition/acquisition-and-potential-revenue?org-id=" + orgId
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Acquisition_Revenue_And_Insights_export1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def Acquisition_Revenue_And_Insights_export1(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/acquisition/acquisition-and-potential-revenue?org-id=" + orgId
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Acquisition_Revenue_And_Insights_export1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def Acquisition_Revenue_And_Insights_export2(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/acquisition/acquisition-user-report-overall?org-id=" + orgId +"&start=2020-08-01&end=2020-08-31&file=true&filename=acquisition-revenue-insights-aug-20-revenue-"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Acquisition_Revenue_And_Insights_export2")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def New_Subscribers_by_Service_Tier_And_Technology_export1(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/target-segmentation/filter-options?org-id=" + orgId + "&period=" + month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("New_Subscribers_by_Service_Tier_And_Technology_export1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def New_Subscribers_by_Service_Tier_And_Technology_export2(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/acquisition/new-user-list?org-id=" + orgId + "&period=" + month + "&tier=300M%2B&tech=Fiber&file=true&filename=new-subscribers-by-service-tier-technology-300m-fiber"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("New_Subscribers_by_Service_Tier_And_Technology_export2")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def Usage_by_Application_Type_export1(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/application-group-usage?org-id=" + orgId + "&period=" + month + "&limit=4&others=true"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Usage_by_Application_Type_export1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Top_Applications_export1(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/top-applications?org-id=" + orgId + "&period=" + month + "&limit=10"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Top_Applications_export1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Top_Applications_export2(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/user-count-by-app?org-id=" + orgId + "&period=" + month + "&app=Amazon&file=true&filename=top-applications-amazon-subscribers"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Top_Applications_export2")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def Top_Gaming_Applications_export1(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/top-gaming-applications?org-id=" + orgId + "&period=" + month + "&limit=10"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Top_Gaming_Applications_export1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def Top_Gaming_Applications_export2(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/user-count-by-app?org-id=" + orgId + "&period=" + month + "&app=gaming%20(playstation)&group=gaming&file=true&filename=top-gaming-applications-playstation-subscribers"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Top_Gaming_Applications_export2")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Subscriber_Activity_Trends_export1(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/subscriber-trends-by-application-group?org-id=" + orgId + "&period=" + month + "&month=6"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Subscriber_Activity_Trends_export1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def  Data_Usage_Trends_export1(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/total-and-streaming-usage-trend?org-id=" + orgId + "&period=" + month + "&month=6"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Data_Usage_Trends_export1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def  CommandIQ_Insights_export1(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/marketing/smart-home-candidate?org-id=" + orgId + "&period=" + month + "&file=true&output=csv"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("CommandIQ_Insights_export1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def  Devices_per_Household_export1_connected_device_number_distribution(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/connected-device-number-distribution?org-id=" + orgId + "&period=" + month + "&startdate=2020-03-15&enddate=2020-04-11&social-channel-name=YouTube&timezone=05.30"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Devices_per_Household_export1_connected_device_number_distribution")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def  Devices_per_Household_export1_user_list_by_connected_device_number(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/user-list-by-connected-device-number?org-id=" + orgId + "&period=" + month + "&category=5-9&file=true&filename=devices-per-household-5-9"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Devices_per_Household_export1_user_list_by_connected_device_number")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def  Service_Module_Adoption_Rate_export1(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/insights/parental-control-and-network-security-usage-trend?org-id=" + orgId + "&period=" + month + "&file=true&output=csv&month=6"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Service_Module_Adoption_Rate_export1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def  Wi_Fi_Device_Category_Trends_export1(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/marketing/device-category-trend?org-id=" + orgId + "&period=" + month + "&month=6"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Wi_Fi_Device_Category_Trends_export1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def  Blocked_Threats_Insights_export1(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/marketing/subscriber-protectiq-insight?org-id=" + orgId + "&period=" + month + "&"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.get(charturl, headers=headers)
            print("Blocked_Threats_Insights_export1")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def  Upsell_export_Export_in_Table_View_Subscribers_Table_View(self):
        try:
            DatalistX = []
            data = {"name":"Test Exp","desc":"","numOfDevices":"","hasCalixSmartHomeApp":"false","hasExosService":"protectiq"}
            charturl = Base_url + "/v1/cmc/target-segmentation/user-report?org-id=" + orgId + "&period=" + month + "&file=true&output=csv"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.post(charturl, headers=headers, json=data)
            print("Upsell_export_Export_in_Table_View_Subscribers_Table_View")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def  Upsell_export_Export_in_Table_View_Locations_Table_View(self):
        try:
            DatalistX = []
            data = {"name":"Test Exp","desc":"","numOfDevices":"","hasCalixSmartHomeApp":"false","hasExosService":"protectiq"}
            charturl = Base_url + "/v1/cmc/target-segmentation/acquisition-wire-center-report?org-id=" + orgId + "&period=" + month + "&file=true&output=csv"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.post(charturl, headers=headers, json=data)
            print("Upsell_export_Export_in_Table_View_Locations_Table_View")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def  Upsell_Export_Map_View_Subscribers(self):
        try:
            DatalistX = []
            data = {"name":"Test Exp","desc":"","numOfDevices":"","hasCalixSmartHomeApp":"false","hasExosService":"protectiq"}
            charturl = Base_url + "/v1/cmc/target-segmentation/user-report?org-id=" + orgId + "&period=" + month + "&file=true&output=csv"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.post(charturl, headers=headers, json=data)
            print("Upsell_Export_Map_View_Subscribers")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def  Upsell_Export_in_Table_Map_Locations(self):
        try:
            DatalistX = []
            data = {"name":"Test Exp","desc":"","numOfDevices":"","hasCalixSmartHomeApp":"false","hasExosService":"protectiq"}
            charturl = Base_url + "/v1/cmc/target-segmentation/acquisition-wire-center-report?org-id=" + orgId + "&period=" + month + "&file=true&output=csv"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.post(charturl, headers=headers, json=data)
            print("Upsell_Export_in_Table_Map_Locations")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def  Upsell_Export_in_Table_Map_Locations(self):
        try:
            DatalistX = []
            data = {"name":"Test Exp","desc":"","numOfDevices":"","hasCalixSmartHomeApp":"false","hasExosService":"protectiq"}
            charturl = Base_url + "/v1/cmc/target-segmentation/acquisition-wire-center-report?org-id=" + orgId + "&period=" + month + "&file=true&output=csv"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.post(charturl, headers=headers, json=data)
            print("Upsell_Export_in_Table_Map_Locations")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def  Retention_Export_in_Table_View_Subscribers_Table_View(self):
        try:
            DatalistX = []
            data = {"name":"Test 2","desc":"","downstreamServiceLimit":"","upstreamServiceLimit":"","speedTest":"","competitor":"","numOfDevices":"","hasCalixSmartHomeApp":"false","hasExosService":"experienceiq"}
            charturl = Base_url + "/v1/cmc/target-segmentation/retention-insights-report?org-id=" + orgId + "&period=" + month + "&file=true&output=csv"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.post(charturl, headers=headers, json=data)
            print("Retention_Export_in_Table_View_Subscribers_Table_View")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def  Retention_Export_in_Table_View_Locations_Table_View(self):
        try:
            DatalistX = []
            data = {"name":"Test 2","desc":"","downstreamServiceLimit":"","upstreamServiceLimit":"","speedTest":"","competitor":"","numOfDevices":"","hasCalixSmartHomeApp":"false","hasExosService":"experienceiq"}
            charturl = Base_url + "/v1/cmc/target-segmentation/acquisition-wire-center-report?org-id=" + orgId + "&period=" + month + "&file=true&output=csv"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.post(charturl, headers=headers, json=data)
            print("Retention_Export_in_Table_View_Locations_Table_View")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def  Retention_Export_Map_View_Subscribers(self):
        try:
            DatalistX = []
            data = {"name":"Test 2","desc":"","downstreamServiceLimit":"","upstreamServiceLimit":"","speedTest":"","competitor":"","numOfDevices":"","hasCalixSmartHomeApp":"false","hasExosService":"experienceiq"}
            charturl = Base_url + "/v1/cmc/target-segmentation/retention-insights-report?org-id=" + orgId + "&period=" + month + "&file=true&output=csv"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.post(charturl, headers=headers, json=data)
            print("Retention_Export_Map_View_Subscribers")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def  Retention_Export_in_Table_Map_Locations(self):
        try:
            DatalistX = []
            data = {"name":"Test 2","desc":"","downstreamServiceLimit":"","upstreamServiceLimit":"","speedTest":"","competitor":"","numOfDevices":"","hasCalixSmartHomeApp":"false","hasExosService":"experienceiq"}
            charturl = Base_url + "/v1/cmc/target-segmentation/acquisition-wire-center-report?org-id=" + orgId + "&period=" + month + "&file=true&output=csv"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.post(charturl, headers=headers, json=data)
            print("Retention_Export_in_Table_Map_Locations")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def  Acquisition_Export_in_Table_View_Existing_Subscribers_Table_View(self):
        try:
            DatalistX = []
            data ={"name":"Test acq","desc":"","hasExosService":"protectiq"}
            charturl = Base_url + "/v1/cmc/target-segmentation/acquisition-existing-report?org-id=" + orgId + "&period=" + month + "&file=true&output=csv"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.post(charturl, headers=headers, json=data)
            print("Export_in_Table_View_Existing_Subscribers_Table_View")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def  Acquisition_Export_in_Table_View_Prospect_Subscribers_Table_View(self):
        try:
            DatalistX = []
            data = {"name":"Test acq","desc":"","hasExosService":"protectiq"}
            charturl = Base_url + "/v1/cmc/target-segmentation/acquisition-prospect-report?org-id=" + orgId + "&period=" + month + "&file=true&output=csv"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.post(charturl, headers=headers, json=data)
            print("Acquisition_Export_in_Table_View_Prospect_Subscribers_Table_View")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def  Acquisition_Export_in_Table_View_Locations_Table_View(self):
        try:
            DatalistX = []
            data = {"name":"Test acq","desc":"","hasExosService":"protectiq"}
            charturl = Base_url + "/v1/cmc/target-segmentation/acquisition-wire-center-report?org-id=" + orgId + "&period=" + month + "&file=true&output=csv"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.post(charturl, headers=headers, json=data)
            print("Acquisition_Export_in_Table_View_Locations_Table_View")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def  Acquisition_Export_in_Map_View_Existing_subscribers(self):
        try:
            DatalistX = []
            data = {"name":"Test acq","desc":"","hasExosService":"protectiq"}
            charturl = Base_url + "/v1/cmc/target-segmentation/acquisition-existing-report?org-id=" + orgId + "&period=" + month + "&file=true&output=csv"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.post(charturl, headers=headers, json=data)
            print("Acquisition_Export_in_Map_View_Existing_subscribers")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def  Acquisition_Export_in_Table_Map_Prospect_Subscribers(self):
        try:
            DatalistX = []
            data = {"name":"Test acq","desc":"","hasExosService":"protectiq"}
            charturl = Base_url + "/v1/cmc/target-segmentation/acquisition-prospect-report?org-id=" + orgId + "&period=" + month + "&file=true&output=csv"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.post(charturl, headers=headers, json=data)
            print("Acquisition_Export_in_Table_Map_Prospect_Subscribers")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def  Acquisition_Export_in_Table_Map_Locations(self):
        try:
            DatalistX = []
            data = {"name":"Test acq","desc":"","hasExosService":"protectiq"}
            charturl = Base_url + "/v1/cmc/target-segmentation/acquisition-wire-center-report?org-id=" + orgId + "&period=" + month + "&file=true&output=csv"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            response = requests.post(charturl, headers=headers, json=data)
            print("Acquisition_Export_in_Table_Map_Locations")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def Campaign_New(self):
        try:
            global name
            name = []
            global status
            status = []
            global segmentType
            segmentType = []
            global segmentName
            segmentName = []
            global segmentSize
            segmentSize = []
            CMCconnectionObj.loginAPI_refreshToken()
            charturl = Base_url + "/v1/cmc-campaigns/campaign"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Campaign_New")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            for d in data:
                try:
                    name.append(d['name'])
                except Exception as e:
                    name.append('')
            print('name ', name)
            for d in data:
                try:
                    status.append(d['status'])
                except Exception as e:
                    status.append('')
            print('status ', status)
            for d in data:
                try:
                    segmentType.append(d['segmentType'])
                except Exception as e:
                    segmentType.append('')
            print('Type ', segmentType)
            for d in data:
                try:
                    segmentName.append(d['segmentName'])
                except Exception as e:
                    segmentName.append('')
            print('segmentName ', segmentName)
            for d in data:
                try:
                    segmentSize.append(d['segmentSize'])
                    # format(segmentSize, ',d')
                except Exception as e:
                    segmentSize.append('')
            print('segmentSize ', segmentSize)
            combined_Table_all = [list(l) for l in zip(name,status,segmentType,segmentName,segmentSize)]
            print(name[0])
            print("Combined Data ", sorted(combined_Table_all),)
            return(response.status_code,name[0])
        except Exception as e:
            return(response.status_code)

    def Campaign_Marketing(self):
        try:
            DatalistX = []
            CMCconnectionObj.loginAPI_refreshToken()
            charturl = Base_url + "/v1/cmc-mchannel/marketingChannel"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Campaign_Marketting")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)

            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Segments_Recommended(self):
        try:
            DatalistX = []
            segmentType= []
            CMCconnectionObj.loginAPI_cmcFiano()
            NoSegements = '204'
            charturl = Base_url + "/v1/cmc/segments/recommendedSegments?details=false&counts=false"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Segments_Recommended")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            try:
                data['status']
                NoSegements = data['status']
            except Exception as e:
                NoSegements = 'Segments Avaialable'
                print('Segments Avaialable')
            for d in data:
                try:
                    get_data = d['segmentType']
                except Exception as e:
                    get_data = '  '
                segmentType.append(get_data)
            print('Response data(segmentType): ', segmentType)
            return(response.status_code,NoSegements,segmentType)
        except Exception as e:
            return(response.status_code,NoSegements)

    def Segments_Recommended_Usercmc(self):
        try:
            DatalistX = []
            segmentType= []
            CMCconnectionObj.loginAPI_refreshToken()
            NoSegements = '204'
            charturl = Base_url + "/v1/cmc/segments/recommendedSegments?details=false&counts=false"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Segments_Recommended")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            try:
                data['status']
                NoSegements = data['status']
            except Exception as e:
                NoSegements = 'Segments Avaialable'
                print('Segments Avaialable')
            for d in data:
                try:
                    get_data = d['segmentType']
                except Exception as e:
                    get_data = '  '
                segmentType.append(get_data)
            print('Response data(segmentType): ', segmentType)
            return(response.status_code,NoSegements,segmentType)
        except Exception as e:
            return(response.status_code,NoSegements)

    def Segments_Saved(self):
        try:
            DatalistX = []
            CMCconnectionObj.loginAPI_refreshToken()
            charturl = Base_url + "/v1/cmc/segments/savedSegments"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Segments_Saved")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            SegmentName = data[0]['segmentName']
            print(SegmentName)
            return(response.status_code,SegmentName)
        except Exception as e:
            return(response.status_code)

    def Campaign_Subscriber_Search(self):
        try:
            DatalistX = []
            CMCconnectionObj.loginAPI_refreshToken()
            charturl = Base_url + "/v1/cmc/subscriber/search?org=" + orgId +"&page_number=1&page_size=10&filter="
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Campaign_Subscriber_Search")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def Campaign_MarketingChannels_Mailchimp(self):
        try:
            DatalistX = []
            CMCconnectionObj.loginAPI_refreshToken()
            charturl = Base_url + "/v1/cmc-mchannel/marketingChannel/authorization/Mailchimp"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Campaign_MarketingChannels_Mailchimp")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Campaign_MarketingChannels_Mailchimp(self):
        try:
            CMCconnectionObj.loginAPI_refreshToken()
            charturl = Base_url + "/v1/cmc-mchannel/marketingChannel/authorization/Mailchimp"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Campaign_MarketingChannels_Mailchimp")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Campaign_MobileNotification_History(self):
        try:
            CMCconnectionObj.loginAPI_refreshToken()
            campaignName = []
            segmentName = []
            status = []
            scheduleType = []
            subscribersCount = []
            sentNotificationCount = []
            startDate = []
            endDate = []
            charturl = Base_url + "/v1/cmc-campaigns/campaign/mobileNotificationHistory?months=1"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Campaign_MarketingChannels_Mailchimp")
            # print(response)
            assert response.status_code == 200
            data = response.json()
            # print(data)
            for d in data:
                try:
                    get_data = d['campaignName']
                except Exception as e:
                    get_data = '  '
                campaignName.append(get_data)
            print('Response data(campaignName): ', campaignName)
            for d in data:
                try:
                    get_data = d['segmentName']
                except Exception as e:
                    get_data = '  '
                segmentName.append(get_data)
            print('Response data(segmentName): ', segmentName)
            for d in data:
                try:
                    get_data = d['status']
                except Exception as e:
                    get_data = '  '
                status.append(get_data)
            print('Response data(status): ', status)
            for d in data:
                try:
                    get_data = d['scheduleType']
                except Exception as e:
                    get_data = '  '
                scheduleType.append(get_data)
            print('Response data(scheduleType): ', scheduleType)
            for d in data:
                try:
                    get_data = d['subscribersCount']
                except Exception as e:
                    get_data = '  '
                subscribersCount.append(format(get_data,',d'))
            print('Response data(subscribersCount): ', subscribersCount)
            for d in data:
                try:
                    get_data = d['sentNotificationCount']
                except Exception as e:
                    get_data = '  '
                sentNotificationCount.append(get_data)
            print('Response data(sentNotificationCount): ', sentNotificationCount)
            for d in data:
                try:
                    get_data = d['startDate']
                except Exception as e:
                    get_data = '  '
                startDate.append(get_data)
            print('Response data(startDate): ', startDate)
            for d in data:
                try:
                    get_data = d['endDate']
                except Exception as e:
                    get_data = '  '
                endDate.append(get_data)
            print('Response data(endDate): ', endDate)
            combined_Table_all = [list(l) for l in zip(campaignName,segmentName,status,scheduleType,subscribersCount,sentNotificationCount,startDate,endDate)]
            print(sorted(combined_Table_all))
            return(response.status_code,sorted(combined_Table_all))
        except Exception as e:
            return(response.status_code)

    def Campaign_MailChimp_Marketing_Channel_Results(self):
        try:
            CMCconnectionObj.loginAPI_refreshToken()
            campaignName = []
            campaignType = []
            sendTime = []
            notificationsSent = []
            notificationsOpened = []
            notificationsClicked = []
            notificationsBounced = []
            unsubscribed = []
            charturl = Base_url + "/v1/cmc-mchannel/marketingChannel/results/Mailchimp?months=1"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Campaign_MailChimp_Marketing_Channel_Results")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            # convertData = StringData
            for d in data['campaigns']:
                try:
                    get_data = d['campaign_name']
                except Exception as e:
                    get_data = '  '
                # if len(get_data) > 25:
                #     ConvertData = get_data[0:25] + '...'
                # else:
                #     ConvertData = get_data
                campaignName.append(get_data)
            print('Response data(campaignName): ', campaignName)
            for d in data['campaigns']:
                try:
                    get_data = d['campaignType']
                except Exception as e:
                    get_data = '  '
                campaignType.append(get_data)
            print('Response data(campaignType): ', campaignType)
            for d in data['campaigns']:
                try:
                    get_data = d['sendTime']
                except Exception as e:
                    get_data = '  '
                x = get_data.split("T")
                date_time = datetime.strptime(x[0].replace("-", "/"), '%Y/%m/%d').date()
                d = date_time.strftime("%b %-d, %Y")
                sendTime.append(d)
            print('Response data(sendTime): ',sendTime)
            for d in data['campaigns']:
                try:
                    get_data = d['notificationsSent']
                except Exception as e:
                    get_data = '  '
                notificationsSent.append(get_data)
            print('Response data(notificationsSent): ', notificationsSent)
            for d in data['campaigns']:
                try:
                    get_data = d['notificationsOpened']
                except Exception as e:
                    get_data = '  '
                notificationsOpened.append(get_data)
            print('Response data(notificationsOpened): ', notificationsOpened)
            for d in data['campaigns']:
                try:
                    get_data = d['notificationsClicked']
                except Exception as e:
                    get_data = '  '
                notificationsClicked.append(get_data)
            print('Response data(notificationsClicked): ', notificationsClicked)
            for d in data['campaigns']:
                try:
                    get_data = d['notificationsBounced']
                except Exception as e:
                    get_data = '  '
                notificationsBounced.append(get_data)
            print('Response data(notificationsBounced): ', notificationsBounced)
            for d in data['campaigns']:
                try:
                    get_data = d['unsubscribed']
                except Exception as e:
                    get_data = '  '
                unsubscribed.append(get_data)
            print('Response data(unsubscribed): ', unsubscribed)
            return(response.status_code,'Data Found',campaignName,campaignType,sendTime,notificationsSent,notificationsOpened,notificationsClicked,notificationsBounced,unsubscribed)
        except Exception as e:
            status = response.status_code
            if  '404'  in status.__str__():
               print('No Data Found')
               return (200,'No Data Found')
            else:
              return(response.status_code,'API Error')


    def Campaign_Hubspot_Marketing_Channel_Results(self):
        try:
            CMCconnectionObj.loginAPI()
            campaign_name = []
            notificationsSent = []
            notificationsDelivered = []
            notificationsSent = []
            notificationsOpened = []
            notificationsProcessed = []
            notificationsBounced = []
            unsubscribed = []
            charturl = Base_url + "/v1/cmc-mchannel/marketingChannel/results/Hubspot?months=1"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Campaign_MailChimp_Marketing_Channel_Results")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            StringData = data['campaigns'][0]['channelName']
            print(len(StringData))
            print(StringData[0:2] + '...')
            # convertData = StringData
            for d in data['campaigns']:
                try:
                    get_data = d['campaign_name']
                except Exception as e:
                    get_data = '  '
                # campaign_nameLength = len(get_data) - get_data.count('!') - get_data.count('(') - get_data.count(')')
                # if campaign_nameLength > 25:
                #     ConvertData = get_data[0:26] + '...'
                # else:
                #     ConvertData = get_data
                campaign_name.append(get_data )
            print('Response data(channelName): ', campaign_name)
            for d in data['campaigns']:
                try:
                    get_data = d['notificationsSent']
                except Exception as e:
                    get_data = '  '
                notificationsSent.append(get_data)
            print('Response data(notificationsSent): ', notificationsSent)

            for d in data['campaigns']:
                try:
                    get_data = d['notificationsDelivered']
                except Exception as e:
                    get_data = '  '
                notificationsDelivered.append(get_data)
            print('Response data(notificationsDelivered): ', notificationsDelivered)
            for d in data['campaigns']:
                try:
                    get_data = d['notificationsOpened']
                except Exception as e:
                    get_data = '  '
                notificationsOpened.append(get_data)
            print('Response data(notificationsOpened): ', notificationsOpened)
            for d in data['campaigns']:
                try:
                    get_data = d['notificationsProcessed']
                except Exception as e:
                    get_data = '  '
                notificationsProcessed.append(get_data)
            print('Response data(notificationsProcessed): ', notificationsProcessed)
            return(response.status_code,'Data Found',campaign_name,notificationsSent,notificationsDelivered,notificationsOpened,notificationsProcessed)
        except Exception as e:
            status = response.status_code
            if  '404'  in status.__str__():
               print('No Data Found')
               return (200,'No Data Found')
            else:
              return(response.status_code,'API Error')

    def Services_Smart_Home_Insights(self):
        try:
            CMCconnectionObj.loginAPI_refreshToken()
            DatalistX = []
            charturl = Base_url + "/v1/cmc/marketing/smart-home-candidate?page=1&size=10&output=json&org-id=" + orgId +"&period="+month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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



    def Device_CommandIQ_Status(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/foundation/dashboard/ciq/" + orgId +"?days=30"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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

    def Services_Wifi_Device_Category_Trends(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc/marketing/device-category-trend?month=6&org-id=" + orgId +"&period="+month
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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

    def Marketing_Channels_Facebook(self):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc-mchannel/marketingChannel/authorization/Facebook"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Marketing_Channels_Facebook")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)

    def Marketing_Channels_Hubspot(self):
        try:
            CMCconnectionObj.loginAPI_refreshToken()
            DatalistX = []
            charturl = Base_url + "/v1/cmc-mchannel/marketingChannel/authorization/HubSpot"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Marketing_Channels_Facebook")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return(response.status_code)
        except Exception as e:
            return(response.status_code)


    def Marketing_Channel(self):
        try:
            CMCconnectionObj.loginAPI_cmcAuto()
            mailchimpCount = []
            MobileNotification = []
            Facebook = []
            Hubspot = []
            ConstantContact = []
            charturl = Base_url + "/v1/cmc-mchannel/marketingChannel"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Marketing_Channels_Facebook")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            for d in data:
             channel = d['marketingChannel']
             if 'Mailchimp' in channel:
                 mailchimpCount=  d['scheduleCampaigns'] + d['inprogressCampaigns'] + d['completedCampaigns']
                 print('mailchimpCount: ',mailchimpCount)
             if 'Mobile Notification' in channel:
                MobileNotification = d['scheduleCampaigns'] + d['inprogressCampaigns'] + d['completedCampaigns']
                print('MobileNotification: ', MobileNotification)
             if 'Facebook' in channel:
                Facebook = d['scheduleCampaigns'] + d['inprogressCampaigns'] + d['completedCampaigns']
                print('Facebook: ', Facebook)
             if 'Hubspot' in channel:
                Hubspot = d['scheduleCampaigns'] + d['inprogressCampaigns'] + d['completedCampaigns']
                print('Hubspot: ', Hubspot)
             if 'ConstantContact' in channel:
                ConstantContact = d['scheduleCampaigns'] + d['inprogressCampaigns'] + d['completedCampaigns']
                print('ConstantContact: ', ConstantContact)
            return(response.status_code,mailchimpCount,MobileNotification,Facebook,Hubspot,ConstantContact)
        except Exception as e:
            return(response.status_code)

    def NewCampaign_Filter_Region(self):
        try:
            CMCconnectionObj.loginAPI_refreshToken()
            Region = []
            charturl = Base_url + "/v1/cmc/qlik/getFilters?Primary_Seg_Name=Casual%20users"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op",
                       "objId": Qlik_Region
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get NewCampaign Filter Region")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            for d in data['data']:
             get_data = d['Region']
             Region.append(get_data)
            print('Response data(Region): ', Region)
            return(response.status_code,Region)
        except Exception as e:
            return(response.status_code)

    def NewCampaign_Filter_Location(self):
        try:
            CMCconnectionObj.loginAPI_refreshToken()
            Location = []
            charturl = Base_url + "/v1/cmc/qlik/getFilters?Primary_Seg_Name=Casual%20users"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op",
                       "objId": Qlik_Location
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get NewCampaign Filter Location")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            for d in data['data']:
             get_data = d['Location']
             Location.append(get_data)
            print('Response data(Location): ', Location)
            return(response.status_code,Location)
        except Exception as e:
            return(response.status_code)

    def NewCampaign_Filter_Service(self):
        try:
            CMCconnectionObj.loginAPI_refreshToken()
            Service = []
            charturl = Base_url + "/v1/cmc/qlik/getFilters?Primary_Seg_Name=Casual%20users"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op",
                       "objId": Qlik_Service
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get NewCampaign Filter Service")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            for d in data['data']:
             get_data = d['Service']
             Service.append(get_data)
            print('Response data(Service): ', Service)
            return(response.status_code,Service)
        except Exception as e:
            return(response.status_code)

    def NewCampaign_Filter_Propensity(self):
        try:

            Propensity = []
            charturl = Base_url + "/v1/cmc/qlik/getFilters?Primary_Seg_Name=Casual%20users"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op",
                       "objId": Qlik_Propensity
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get NewCampaign Filter Propensity")
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            for d in data['data']:
             get_data = d['Propensity']
             Propensity.append(get_data)
            print('Response data(Propensity): ', Propensity)
            return(response.status_code,Propensity)
        except Exception as e:
            return(response.status_code)


    def getFacebookChannelExpirdStatus(self):
        try:
            CMCconnectionObj.loginAPI_refreshToken()
            print("**** Get FacebookChannelExpirdStatus *****")
            charturl = Base_url + "/v1/cmc-mchannel/marketingChannel/checkChannelTokenStatus/Facebook"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print(response)
            assert response.status_code == 200
            data = response.json()
            status = data['unReportedChannelExpiredStatus']
            print(status)
            return(response.status_code,status)
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

    def Social_channel_heatmap(self):
        # Documentation: We are checking social channel heatmap contains data or not
        try:
            print("**** Get SocialChannelHeatmapStatus *****")
            charturl = Base_url + "/v1/cmc/insights/social-channel-list?timezone=05.30&org-id=10009&period=last-30d"
            headers = {"X-Calix-AccessToken": access_token,
                   "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
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
            return (response.status_code,chartData)
        except Exception as e:
            return(response.status_code)
            
    def CampaignList(self,CampaignName):
        try:
            DatalistX = []
            charturl = Base_url + "/v1/cmc-campaigns/campaign/campaign-list/Scheduled?langId=1"
            headers = {"X-Calix-AccessToken": access_token,
                       "X-Calix-ClientID": "kK1cJ0mRp7iSmTFt3vAGO44vobsu36op"
                       }
            print(charturl)
            response = requests.get(charturl, headers=headers)
            print("Get Marketing_Channels_Facebook")
            print(response)
            assert response.status_code == 200
            data = response.json()
            # print(data)
            for datalist in data:
                if datalist['name'] == CampaignName:
                    campaignID= datalist['campaignId']
            print("campaignID: ", campaignID)
            charturl = Base_url + "/v1/cmc-campaigns/campaign/"+campaignID
            response = requests.get(charturl, headers=headers)
            data = response.json()
            print(data)
            segmentType = data['segmentType']
            print(segmentType)
            campaignType = data['campaignType']
            print(campaignType)
            return(response.status_code,segmentType,campaignType)
        except Exception as e:
            return(response.status_code)

CMCconnectionObj=CMCAPI()
# CMCconnectionObj.ConfigReaderDevFunc()
# CMCconnectionObj.ConfigReaderDev()
CMCconnectionObj.ConfigReaderStage()
CMCconnectionObj.loginAPI()
# CMCconnectionObj.loginAPIDevFunc()
# CMCconnectionObj.loginAPI_cmcAuto()
# CMCconnectionObj.loginAPI_cmcFiano()
# CMCconnectionObj.loginAPI_refreshToken()
# CMCconnectionObj.Subscribers_Data_Usage()
# CMCconnectionObj.Subscribers_Data_Usage_drilldown()
# CMCconnectionObj.Subscribers_by_Service_Tier_And_Technology()
# CMCconnectionObj.Subscribers_by_Service_Tier_And_Technology_filter()
# CMCconnectionObj.Subscribers_by_Service_Tier_And_Technology_drilldown()
# CMCconnectionObj.Streaming_Subscribers()
# CMCconnectionObj.userCount_streamingSubscribers()
# CMCconnectionObj.Streaming_Subscribers_NonStreaming()
# CMCconnectionObj.Streaming_Subscribers_drilldown()
# CMCconnectionObj.Gaming_Subscribers()
# CMCconnectionObj.NonGaming_Subscribers()
# CMCconnectionObj.Gaming_Subscribers_drilldown()
# CMCconnectionObj.Work_from_Home_WFH_Subscribers()
# CMCconnectionObj.NonWork_from_Home_WFH_Subscribers()
# CMCconnectionObj.Work_from_Home_WFH_Subscribers_drilldown()
# Need to work (churn_rate_And_insights)
# CMCconnectionObj.churn_rate_And_insights()
# CMCconnectionObj.churn_rate_And_insights_drilldown()
# Need to work (Acquisition_rate_And_Insights)
# CMCconnectionObj.Acquisition_rate_And_Insights()
# CMCconnectionObj.Acquisition_rate_And_Insights_drilldown()
# Need to work (Acquisition_Revenue_And_Insights)
# CMCconnectionObj.Acquisition_Revenue_And_Insights()
# CMCconnectionObj.Acquisition_Revenue_And_Insights_drilldown()
# CMCconnectionObj.Acquisition_Revenue_And_Insights_drilldown_single_subscriber_service_limit()
# CMCconnectionObj.Acquisition_Revenue_And_Insights_drilldown_single_subscriber_usage()
# CMCconnectionObj.Acquisition_Revenue_And_Insights_drilldown_single_subscriber_device_trends()
# CMCconnectionObj.Acquisition_Revenue_And_Insights_drilldown_single_subscriber_usage_by_app_type()
# CMCconnectionObj.Acquisition_Revenue_And_Insights_drilldown_single_subscriber_top_apps()
# CMCconnectionObj.New_Subscribers_by_Service_Tier_And_Technology()
# CMCconnectionObj.New_Subscribers_by_Service_Tier_And_Technology_filter()
# CMCconnectionObj.New_Subscribers_by_Service_Tier_And_Technology_drilldown()
# CMCconnectionObj.Usage_by_Application_Type()
# CMCconnectionObj.Usage_by_Application_Type_drilldown()
# CMCconnectionObj.Blocked_Threats_Insights()
# CMCconnectionObj.Top_Applications()
# CMCconnectionObj.Top_Gaming_Applications()
# CMCconnectionObj.Subscriber_Activity_Trends()
# CMCconnectionObj.Data_Usage_Trends()
# CMCconnectionObj.Household_Device_Trends()
# CMCconnectionObj.CommandIQ_Insights()
# CMCconnectionObj.Devices_per_Household()
# CMCconnectionObj.Devices_per_Household_drilldown()
# CMCconnectionObj.Retention()
# CMCconnectionObj.Churn_Risk()
# # Need to work (Social_Channel_Heatmap)
# CMCconnectionObj.Wi_Fi_Device_Category_Trends()
# CMCconnectionObj.Top_Gaming_Applications_drilldown()
# CMCconnectionObj.Top_Applications_drilldown()
# CMCconnectionObj.Competitor_Visit_and_Speed_Test_Minutes_drilldown()
# CMCconnectionObj.Service_Limits_drilldown()
# CMCconnectionObj.Subscriber_Usage_drilldown()
# CMCconnectionObj.Subscriber_Revenue_drilldown()
# CMCconnectionObj.Blocked_Threats_Insights_drilldown()
# CMCconnectionObj.Service_Module_Adoption_Rate()
# CMCconnectionObj.Social_Channel_Heatmap()
# CMCconnectionObj.Social_Channel_List_for_Dropdown()
# CMCconnectionObj.Config_for_Widget_hide_show()
# CMCconnectionObj.Location_Region_List()
# CMCconnectionObj.Active_Subscriber_Count()
# CMCconnectionObj.UPSELL_MAP_VIEW_user_counts()
# CMCconnectionObj.UPSELL_MAP_VIEW_user_report()
# CMCconnectionObj.UPSELL_MAP_VIEW_acquisition_wire_center_report()
# CMCconnectionObj.UPSELL_MAP_VIEW_Form_Creation_Field_Drop_Down_Data()
# CMCconnectionObj.UPSELL_MAP_VIEW_TABLE_VIEW()
# CMCconnectionObj.UPSELL_MAP_VIEW_EXPORT()
# CMCconnectionObj.UPSELL_MAP_VIEW_CREATE_TARGET_SEGMENTATION()
# CMCconnectionObj.RETENTION_MAP_VIEW_retention_insights_report()
# CMCconnectionObj.RETENTION_MAP_VIEW_acquisition_wire_center_report()
# CMCconnectionObj.RETENTION_Form_Creation_Field_Drop_Down_Data()
# CMCconnectionObj.RETENTION_TABLE_VIEW()
# CMCconnectionObj.RETENTION_EXPORT()
# CMCconnectionObj.RETENTION_CREATE_TARGET_SEGMENTATION()
# CMCconnectionObj.ACQUISITION_MAP_VIEW_acquisition_existing_report()
# CMCconnectionObj.ACQUISITION_MAP_VIEW_acquisition_prospect_report()
# CMCconnectionObj.ACQUISITION_MAP_VIEW_acquisition_wire_center_report()
# CMCconnectionObj.ACQUISITION_Form_Creation_Field_Drop_Down_Data()
# CMCconnectionObj.ACQUISITION_TABLE_VIEW()
# CMCconnectionObj.ACQUISITION_CREATE_TARGET_SEGMENTATION()
# # CMCconnectionObj.MOBILE_NOTIFICATIONS_CREATE_NEW_NOTIFICATION()
# CMCconnectionObj.MOBILE_NOTIFICATIONS_SCHEDULED_LIST()
# # CMCconnectionObj.MOBILE_NOTIFICATIONS_DELETE_SCHEDULED_LIST()
# CMCconnectionObj.MOBILE_NOTIFICATIONS_EVENT_LIST()
# # CMCconnectionObj.MOBILE_NOTIFICATIONS_EDIT_DELETE_EVENT_LIST()
# CMCconnectionObj.MOBILE_NOTIFICATIONS_HISTORY_LIST()
# CMCconnectionObj.SEARCH_WIDGET()
# CMCconnectionObj.SEARCH_USER_INFORMATION_LIST_prioritySearch()
# CMCconnectionObj.SEARCH_USER_INFORMATION_LIST_subscribers()
# CMCconnectionObj.SEARCH_SEARCH_USER()
# CMCconnectionObj.SEARCH_SubscriberCount()
# CMCconnectionObj.SEARCH_Subscriber_usage()
# CMCconnectionObj.SEARCH_Usage_By_Application()
# CMCconnectionObj.SEARCH_Top_Applications()
# CMCconnectionObj.SEARCH_Competitor_vist_and_Speed_test_mintues()
# CMCconnectionObj.SEARCH_Service_Limits()
# CMCconnectionObj.Subscribers_by_Service_Tier_And_Technology_export1()
# CMCconnectionObj.Subscribers_by_Service_Tier_And_Technology_export2()
# CMCconnectionObj.Subscriber_Data_Usage_export1()
# CMCconnectionObj.Subscriber_Data_Usage_export2()
# CMCconnectionObj.Social_Channel_Heatmap_export1()
# CMCconnectionObj.Streaming_Subscribers_export1()
# CMCconnectionObj.Streaming_Subscribers_export2()
# CMCconnectionObj.Gaming_Subscribers_export1()
# CMCconnectionObj.Gaming_Subscribers_export2()
# CMCconnectionObj.Work_from_Home_Subscribersexport1()
# CMCconnectionObj.Work_from_Home_Subscribersexport2()
# CMCconnectionObj.Churn_Rate_And_Insights_export1()
# CMCconnectionObj.Churn_Rate_And_Insights_export_churn_user_report_overall()
# CMCconnectionObj.Churn_Rate_And_Insights_export_churn_user_history()
# CMCconnectionObj.Retention_export1()
# CMCconnectionObj.Churn_Risk_export1()
# CMCconnectionObj.Acquisition_Rate_And_Insights_export1()
# CMCconnectionObj.Acquisition_Rate_And_Insights_export2()
# CMCconnectionObj.Acquisition_Revenue_And_Insights_export1()
# CMCconnectionObj.Acquisition_Revenue_And_Insights_export2()
# CMCconnectionObj.New_Subscribers_by_Service_Tier_And_Technology_export1()
# CMCconnectionObj.New_Subscribers_by_Service_Tier_And_Technology_export2()
# CMCconnectionObj.Usage_by_Application_Type_export1()
# CMCconnectionObj.Top_Applications_export1()
# CMCconnectionObj.Top_Applications_export2()
# CMCconnectionObj.Top_Gaming_Applications_export1()
# CMCconnectionObj.Top_Gaming_Applications_export2()
# CMCconnectionObj.Subscriber_Activity_Trends_export1()
# CMCconnectionObj.Data_Usage_Trends_export1()
# CMCconnectionObj.CommandIQ_Insights_export1()
# CMCconnectionObj.Devices_per_Household_export1_connected_device_number_distribution()
# CMCconnectionObj.Devices_per_Household_export1_user_list_by_connected_device_number()
# CMCconnectionObj.Service_Module_Adoption_Rate_export1()
# CMCconnectionObj.Wi_Fi_Device_Category_Trends_export1()
# CMCconnectionObj.Blocked_Threats_Insights_export1()
# CMCconnectionObj.Upsell_export_Export_in_Table_View_Subscribers_Table_View()
# CMCconnectionObj.Upsell_export_Export_in_Table_View_Locations_Table_View()
# CMCconnectionObj.Upsell_Export_Map_View_Subscribers()
# CMCconnectionObj.Upsell_Export_in_Table_Map_Locations()
# CMCconnectionObj.Retention_Export_in_Table_View_Subscribers_Table_View()
# CMCconnectionObj.Retention_Export_in_Table_View_Locations_Table_View()
# CMCconnectionObj.Retention_Export_Map_View_Subscribers()
# CMCconnectionObj.Retention_Export_in_Table_Map_Locations()
# CMCconnectionObj.Acquisition_Export_in_Table_View_Existing_Subscribers_Table_View()
# CMCconnectionObj.Acquisition_Export_in_Table_View_Prospect_Subscribers_Table_View()
# CMCconnectionObj.Acquisition_Export_in_Table_View_Locations_Table_View()
# CMCconnectionObj.Acquisition_Export_in_Map_View_Existing_subscribers()
# CMCconnectionObj.Acquisition_Export_in_Table_Map_Prospect_Subscribers()
# CMCconnectionObj.Acquisition_Export_in_Table_Map_Locations()

# CMCconnectionObj.Campaign_New()
# CMCconnectionObj.Campaign_Marketing()
# CMCconnectionObj.Segments_Recommended()
# CMCconnectionObj.Segments_Recommended_Usercmc()
# CMCconnectionObj.Segments_Saved()
# CMCconnectionObj.Campaign_Subscriber_Search()

# ##### 21.2 API's ######
# CMCconnectionObj.Campaign_MarketingChannels_Mailchimp()
# CMCconnectionObj.Campaign_MobileNotification_History()
# CMCconnectionObj.Campaign_MailChimp_Marketing_Channel_Results()

##### 21.3 API's ######
# CMCconnectionObj.Device_CommandIQ_Status()
# CMCconnectionObj.Device_Revenue_Edge_Suite_Status_ExperienceIQ()
# CMCconnectionObj.Device_Revenue_Edge_Suite_Status_ProtectIQ()
# CMCconnectionObj.Device_Revenue_Edge_Suite_Status_Arlo()
# CMCconnectionObj.Device_Trends()

# CMCconnectionObj.Services_Smart_Home_Insights()
# CMCconnectionObj.Services_Wifi_Device_Category_Trends()
# CMCconnectionObj.Services_Edge_Suites_Tresnds()
# CMCconnectionObj.Services_Household_Device_Trends()

# CMCconnectionObj.Marketing_Channels_Facebook()
# CMCconnectionObj.Marketing_Channel()

##### Hubspot ######
# CMCconnectionObj.Marketing_Channels_Hubspot()
# CMCconnectionObj.Campaign_Hubspot_Marketing_Channel_Results()

##### New Campaign Filters ######
# CMCconnectionObj.NewCampaign_Filter_Region()
# CMCconnectionObj.NewCampaign_Filter_Location()
# CMCconnectionObj.NewCampaign_Filter_Service()
# CMCconnectionObj.NewCampaign_Filter_Propensity()

# CMCconnectionObj.getFacebookChannelExpirdStatus()
# CMCconnectionObj.MarketingCloudProfessionalEntitlement()

#### Home ####
# CMCconnectionObj.Social_channel_heatmap()
# CMCconnectionObj.CampaignList()