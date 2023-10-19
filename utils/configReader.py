import sys
import os
from configparser import ConfigParser

dir_path = os.path.dirname(os.path.realpath(__file__))
config_file = os.path.join(dir_path, 'config.ini')
config = ConfigParser()
print(config.sections())
config.read(config_file)
print(config.sections())


class  configtes():

 def environment(self):
  return(config['ENVIRONMENT']['environment'])

 def userNameDev(self):
  return(config['APIDATA']['usernameDev'])

 def passwordDev(self):
  return(config['APIDATA']['passwordDev'])

 def stageurl(self):
  return(config['ApplicationUrl']['stageurl'])

 def devurl(self):
  return(config['ApplicationUrl']['devurl'])

 def userNameStage(self):
  return(config['APIDATA']['usernameStage'])

 def passwordStage(self):
  return(config['APIDATA']['passwordStage'])

 def userNameProd(self):
  return(config['APIDATA']['usernameProd'])

 def passwordProd(self):
  return(config['APIDATA']['passwordProd'])

 def mailChimpUsername(self):
  return(config['MAILCHIMP']['mcUsername'])

 def mailChimpPassword(self):
  return(config['MAILCHIMP']['mcPassword'])

 def fbApiKey(self):
  return(config['FACEBOOK']['apiKey'])

 def fbAccountId(self):
  return(config['FACEBOOK']['accountId'])

 def fbInvalidApiKey(self):
  return(config['FACEBOOK']['invalidApiKey'])

 def hubSpotUsername(self):
  return(config['HUBSPOT']['hsUsername'])

 def hubSpotPassword(self):
  return(config['HUBSPOT']['hsPassword'])

 def constantContactUsername(self):
  return(config['ConstantContact']['ccUsername'])

 def constantContactPassword(self):
  return(config['ConstantContact']['ccPassword'])

ObjconfigReader=configtes()


