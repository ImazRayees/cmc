import json
import os

import requests
from configparser import ConfigParser
from datetime import datetime
import re

class CMC_API():

   def init_All_Varibles(self):
      global AccountNumber
      AccountNumber = []
      global Name
      Name = []
      global PhoneNumber
      PhoneNumber = []
      global serviceAddress
      serviceAddress = []
      global email
      email = []
      global region
      region = []
      global location
      location = []
      global customerType
      customerType = []
      global downloadSpeed
      downloadSpeed = []
      global uploadSpeed
      uploadSpeed = []
      global attainableRate
      attainableRate = []
      global Token
      global refresh_token
      global LoginUser
      global orgName
      global spId
      global roles
      global month
      global DatalistX

   def ConfigReaderDev(self):
        global base_url
        global user
        global password
        global onboard_url
        global onboardtoken
        global grant_type
        global client_secret
        global org_id
        global month
        global x_calix_clientID
        global content_type
        dir_path = os.path.dirname(os.path.realpath(__file__))
        config_file = os.path.join(dir_path, 'configAppData.ini')
        config = ConfigParser()
        print(config.sections())
        config.read(config_file)
        print(config.sections())
        base_url = config['RESTAPI']['base_url_dev']
        user = config['USERS']['username_dev']
        password = config['USERS']['password_dev']
        grant_type = config['RESTAPI']['grant_type_dev']
        client_secret = config['RESTAPI']['client_secret_dev']
        x_calix_clientID = config['RESTAPI']['x_calix_clientID_dev']
        content_type =  config['CONTENT_TYPE']['content_type']
        month = config['WIDGET_MONTH']['month']

   def ConfigReaderStage(self):
        global base_url
        global user
        global password
        global onboard_url
        global onboardtoken
        global grant_type
        global client_secret
        global org_id
        global month
        global x_calix_clientID
        global content_type
        dir_path = os.path.dirname(os.path.realpath(__file__))
        config_file = os.path.join(dir_path, 'configAppData.ini')
        config = ConfigParser()
        print(config.sections())
        config.read(config_file)
        print(config.sections())
        base_url = config['RESTAPI']['base_url_stage']
        user = config['USERS']['username_stage']
        password = config['USERS']['password_stage']
        grant_type = config['RESTAPI']['grant_type_stage']
        client_secret = config['RESTAPI']['client_secret_stage']
        x_calix_clientID = config['RESTAPI']['x_calix_clientID_stage']
        content_type =  config['CONTENT_TYPE']['content_type']
        month = config['WIDGET_MONTH']['month']

   def ConfigReaderProd(self):
        global base_url
        global user
        global password
        global onboard_url
        global onboardtoken
        global grant_type
        global client_secret
        global org_id
        global month
        global x_calix_clientID
        global content_type
        dir_path = os.path.dirname(os.path.realpath(__file__))
        config_file = os.path.join(dir_path, 'configAppData.ini')
        config = ConfigParser()
        print(config.sections())
        config.read(config_file)
        print(config.sections())
        base_url = config['RESTAPI']['base_url_prod']
        user = config['USERS']['username_prod']
        password = config['USERS']['password_prod']
        grant_type = config['RESTAPI']['grant_type_prod']
        client_secret = config['RESTAPI']['client_secret_prod']
        x_calix_clientID = config['RESTAPI']['x_calix_clientID_prod']
        content_type =  config['CONTENT_TYPE']['content_type']
        month = config['WIDGET_MONTH']['month']

   def end_url(self):
       try:
        global login_end_url
        global Subscribers_by_Service
        dir_path = os.path.dirname(os.path.realpath(__file__))
        config_file = os.path.join(dir_path, 'configEndUrl.ini')
        config = ConfigParser()
        print(config.sections())
        config.read(config_file)
        print(config.sections())
        login_end_url = config['END_URL']['login_end_url']
        Subscribers_by_Service = config['END_URL']['Subscribers_by_Service']
       except Exception as e:
            return ("Oops!", e.__class__, "occured")

   def post(self, end_url):
       try:
           data = {"grant_type": grant_type,
                   "username": user,
                   "password": password,
                   "client_secret": client_secret
                   }
           headers = {"Content-type": content_type,
                      "X-Calix-ClientID": x_calix_clientID
                      }
           url = base_url + end_url
           response = requests.post(url, headers=headers,  data=data)
           return (response)
       except Exception as e:
           return ("Oops!", e.__class__, "occured")

   def get(self, end_url):
       try:
           headers = {"Content-type": content_type,
                      "X-Calix-ClientID": x_calix_clientID,
                      "X-Calix-AccessToken": access_token
                      }
           url = base_url + end_url
           response = requests.get(url, headers=headers)
           return (response)
       except Exception as e:
           return ("Oops!", e.__class__, "occured")

   def delete(self, end_url):
       try:
           headers = {"Content-type": content_type,
                      "X-Calix-ClientID": x_calix_clientID,
                      "X-Calix-AccessToken": access_token
                      }
           url = base_url + end_url
           response = requests.delete(url, headers=headers)
           return (response)
       except Exception as e:
           return ("Oops!", e.__class__, "occured")

   def put(self, end_url):
       try:
           headers = {"Content-type": content_type,
                      "X-Calix-ClientID": x_calix_clientID,
                      "X-Calix-AccessToken": access_token
                      }
           url = base_url + end_url
           response = requests.put(url, headers=headers)
           return (response)
       except Exception as e:
           return ("Oops!", e.__class__, "occured")

   def loginAPI(self):
        try:
           global orgId
           global access_token
           end_url = login_end_url
           response = CMCconnectionObj.post(end_url)
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
           return (access_token,response.status_code)
        except Exception as e:
           return ("Oops!", e.__class__, "occured")

   def Subscribers_by_Service_Tier_And_Technology(self):
        try:
            end_url = Subscribers_by_Service + orgId + "&period=" + month
            response = CMCconnectionObj.get(end_url)
            print(response)
            assert response.status_code == 200
            data = response.json()
            print(data)
            return (response.status_code,DatalistX)
        except Exception as e:
            return ("Oops!", e.__class__, "occured")


CMCconnectionObj=CMC_API()
CMCconnectionObj.init_All_Varibles()
CMCconnectionObj.ConfigReaderStage()
CMCconnectionObj.end_url()
CMCconnectionObj.loginAPI()
CMCconnectionObj.Subscribers_by_Service_Tier_And_Technology()