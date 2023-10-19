import xml.etree.ElementTree as ET
import os
from datetime import datetime
import pathlib
import shutil
from configparser import ConfigParser
import mysql.connector
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
import os
import ntpath
class outputdata():
    global foldername
    foldername = datetime.now().strftime('%Y-%m-%d_%H-%M-%S')
    def movefiles(self):
      global OutputXMLfile
      global DBUsername
      global DBPassword
      global DBhost
      global DBStage
      global DBDev
      global DBProd
      global Appication
      global srcfile_reporthtml
      global srcfile_loghtml
      dir_path = os.path.dirname(os.path.realpath(__file__))
      print(dir_path)
      config_file = os.path.join(dir_path, 'config.ini')
      config = ConfigParser()
      print(config.sections())
      config.read(config_file)
      srcfile_reporthtml = dir_path+'/report.html'
      srcfile_loghtml = dir_path+'/log.html'
      OutputXMLfile = dir_path+'/output.xml'
      DBUsername = 'elite'
      DBPassword = 'Elite@123'
      DBhost = '65.2.127.111'
      DBStage = 'web_test_reports_stage'
      DBDev = 'web_test_reports_dev'
      DBProd = 'web_test_reports'
      Appication = 'CMC'

    def testcases(self):
        global Pass
        global Fail
        global total
        data_file = OutputXMLfile
        tree = ET.parse(data_file)
        root = tree.getroot()
        for i in root.iter("stat"):
              Pass = i.attrib['pass']
              Fail = i.attrib['fail']
        print(Pass, Fail)
        total =int(Pass) + int(Fail)
        print(total)
        return (Pass)

    def duration(self):
        import datetime
        global Finalstarttime
        global FinalEndtime
        global FinalDurationtime
        data_file = OutputXMLfile
        tree = ET.parse(data_file)
        root = tree.getroot()
        for i in root.iter("status"):
         starttime = i.attrib['starttime']
         endtime = i.attrib['endtime']
        print(starttime, endtime)
        date_time_obj_1 = datetime.datetime.strptime(starttime, '%Y%m%d %H:%M:%S.%f')
        Starttime=str(date_time_obj_1).split('.')
        Finalstarttime=Starttime[0]
        print(Finalstarttime)
        date_time_obj_2 = datetime.datetime.strptime(endtime, '%Y%m%d %H:%M:%S.%f')
        Endtime = str(date_time_obj_2).split('.')
        FinalEndtime = Endtime[0]
        print(FinalEndtime)
        elapsed = date_time_obj_2 - date_time_obj_1
        Duration = str(elapsed).split('.')
        FinalDurationtime = Duration[0]
        print(FinalDurationtime)
        return (FinalDurationtime)

    def application(self):
        global Name
        global BROWSER
        global Environmenttext
        Environmenttext = "running Stage.."
        BROWSER = 'chrome'
        data_file = OutputXMLfile
        tree = ET.parse(data_file)
        root = tree.getroot()
        geoNode = root.findall('.//msg')
        for message in geoNode:
            if message.text.startswith('Opening browser'):
                geoNode1 = message.text
                print('*\t', message.text)
                spllit = geoNode1.split("'")
                BROWSER = spllit[1]
        print(BROWSER)
        argnode = root.findall('.//arg')
        for message in argnode:
            if message.text.startswith('running Stage..'):
                argnode1 = message.text
                print('*\t', message.text)
                spllit = argnode1[8:]
                spllit1 = spllit.split(".")
                Environmenttext = spllit1[0]
        print(Environmenttext)
        Name = Appication
        return (Environmenttext)

    def S3bucketupload(self):
        import boto3
        from datetime import datetime
        global Sysadmin_LogUrl
        global Sysadmin_ReportUrl
        foldername = "Automation" + datetime.now().strftime('%Y-%m-%d_%H-%M-%S')
        s3 = boto3.client('s3')
        file_name1 = foldername + '/' + 'report.html'
        file_name = foldername + '/' + 'log.html'
        bucket_name = "occ-ui-automation-results"
        directory_name = foldername  # it's name of your folders
        s3.put_object(Bucket=bucket_name, Key=(directory_name + '/'))
        s3.upload_file(srcfile_loghtml, bucket_name, file_name, ExtraArgs={'ACL': 'public-read'})
        Sysadmin_LogUrl = 'https://'+bucket_name+'.s3.us-west-2.amazonaws.com/'+foldername+'/log.html'
        print(Sysadmin_LogUrl)

    def imageapi(self):
        import requests
        import os
        global Report_url
        Report_url = Sysadmin_LogUrl
        print(Report_url)

    def mysql(self):
        if Environmenttext == "Dev":
            conn = mysql.connector.connect(
                user=DBUsername, password=DBPassword, port=3306, host=DBhost, database=DBDev)
            cursor = conn.cursor()
            selectQuery = "SELECT id FROM test_reports ORDER BY id DESC LIMIT 1"
            cursor.execute(selectQuery)
            myresult = cursor.fetchall()
            print(myresult[0][0])
            sql = "UPDATE test_reports SET name = %s,duration = %s,total_cases = %s, pass = %s, fail = %s,report_file = %s, browser_name = %s  WHERE id = %s"
            val = (Name, FinalDurationtime, total, Pass, Fail, Report_url, BROWSER, myresult[0][0])
            cursor.execute(sql, val)
            conn.commit()
        elif Environmenttext == "Prod":
            conn = mysql.connector.connect(
                user=DBUsername, password=DBPassword, port=3306, host=DBhost, database=DBProd)
            cursor = conn.cursor()
            selectQuery = "SELECT id FROM test_reports ORDER BY id DESC LIMIT 1"
            cursor.execute(selectQuery)
            myresult = cursor.fetchall()
            print(myresult[0][0])
            sql = "UPDATE test_reports SET name = %s,duration = %s,total_cases = %s, pass = %s, fail = %s,report_file = %s, browser_name = %s  WHERE id = %s"
            val = (Name, FinalDurationtime, total, Pass, Fail, Report_url, BROWSER, myresult[0][0])
            cursor.execute(sql, val)
            conn.commit()
        else:
            conn = mysql.connector.connect(
                user= DBUsername, password= DBPassword,port=3306, host= DBhost, database= DBStage)
            cursor = conn.cursor()
            selectQuery = "SELECT id FROM test_reports ORDER BY id DESC LIMIT 1"
            cursor.execute(selectQuery)
            myresult = cursor.fetchall()
            print(myresult[0][0])
            runStatusEnd = 'Completed'
            sql = "UPDATE test_reports SET name = %s,start_date = %s, end_date = %s,duration = %s,total_cases = %s, pass = %s, fail = %s,report_file = %s, browser_name = %s,run_status = %s   WHERE id = %s"
            val = (Name,Finalstarttime,FinalEndtime, FinalDurationtime,total, Pass, Fail, Report_url, BROWSER,runStatusEnd, myresult[0][0])
            cursor.execute(sql, val)
            conn.commit()

    def mysql_allFunctions(self):
        readxmlfile.movefiles()
        readxmlfile.testcases()
        readxmlfile.duration()
        readxmlfile.application()
        readxmlfile.S3bucketupload()
        readxmlfile.imageapi()
        readxmlfile.mysql()

readxmlfile = outputdata()
readxmlfile.mysql_allFunctions()