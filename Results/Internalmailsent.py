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
from datetime import datetime
import pathlib
import mysql.connector
import shutil
from configparser import ConfigParser
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
import os
import ntpath
from smtplib import SMTP
from pretty_html_table import build_table
import pandas as pd

class outputdata():

    def testcases(self):

        global Pass
        global Fail
        global total
        # data_file = OutputXMLfile
        data_file = os.path.abspath('output.xml')
        tree = ET.parse(data_file)
        root = tree.getroot()
        for i in root.iter("stat"):
            Pass = i.attrib['pass']
            Fail = i.attrib['fail']
        print(Pass, Fail)
        total = int(Pass) + int(Fail)
        print(total)
        return (Pass)

    def duration(self):
        import datetime
        global Finalstarttime
        global FinalEndtime
        global FinalDurationtime
        # data_file = OutputXMLfile
        data_file = os.path.abspath('output.xml')
        tree = ET.parse(data_file)
        root = tree.getroot()
        for i in root.iter("status"):
            starttime = i.attrib['starttime']
            endtime = i.attrib['endtime']
        print(starttime, endtime)
        date_time_obj_1 = datetime.datetime.strptime(starttime, '%Y%m%d %H:%M:%S.%f')
        # dt_object = datetime.fromtimestamp(date_time_obj_1 / 1000)
        # print(dt_object)
        Starttime = str(date_time_obj_1).split('.')
        Finalstarttime = Starttime[0]
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
        data_file = os.path.abspath('output.xml')
        # data_file = OutputXMLfile
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
            if message.text.startswith('running'):
                argnode1 = message.text
                print('*\t', message.text)
                spllit = argnode1[8:]
                spllit1 = spllit.split(".")
                Environmenttext = spllit1[0]
        print(Environmenttext)
        # Environmenttext = 'Stage'
        # print(Environmenttext)
        Name = Appication
        return (Environmenttext)

    def S3bucketupload(self):
        import boto3
        from datetime import datetime
        global Sysadmin_LogUrl
        global Sysadmin_ReportUrl
        foldername = "CSC" + datetime.now().strftime('%Y-%m-%d_%H-%M-%S')
        s3 = boto3.client('s3')
        file_name1 = foldername + '/' + 'report.html'
        file_name = foldername + '/' + 'log.html'
        bucket_name = "occ-ui-automation-results"
        directory_name = foldername  # it's name of your folders
        s3.put_object(Bucket=bucket_name, Key=(directory_name + '/'))
        s3.upload_file('log.html', bucket_name, file_name, ExtraArgs={'ACL': 'public-read'})
        # s3.upload_file('log.html', bucket_name, file_name2, ExtraArgs={'ACL': 'public-read'})
        Sysadmin_LogUrl = 'https://' + bucket_name + '.s3.us-west-2.amazonaws.com/' + foldername + '/log.html'
        print(Sysadmin_LogUrl)

    def SendEmail(self):
        fromaddr = "calixcloud.automation@gmail.com"
        toaddr = ["rajamohammed@elitecorpusa.com", "mahendravengalam.ind@gmail.com" ,"manoj@elitecorpusa.com"]
        # instance of MIMEMultipart
        msg = MIMEMultipart()
        # storing the senders email address
        msg['From'] = fromaddr

        # storing the receivers email address
        msg['To'] = ','.join(toaddr)

        # storing the subject
        msg['Subject'] = "CSC Test Automation Stage Report - " + datetime.now().strftime('%d/%m/%Y')

        gdp_dict = {'APP': ['CSC'],
                    'Total': [str(total)],
                    'Pass': [str(Pass)],
                    'Fail': [str(Fail)]}

        data = pd.DataFrame(gdp_dict)
        output = build_table(data, 'blue_light')
        body_content =output
        msg.attach(MIMEText(body_content, "html"))

        # string to store the body of the mail
        body = "Please find the CSC test automation stage report attached with this email."

        # attach the body with the msg instance
        msg.attach(MIMEText(body, 'plain'))
        html_message = '<a href="' + Sysadmin_LogUrl + '">click here to download & visit the report</a>'
        msg.attach(MIMEText(html_message, 'html'))

        # creates SMTP session
        s = smtplib.SMTP('smtp.gmail.com', 587)

        # start TLS for security
        s.starttls()
        # Authentication
        s.login(fromaddr, "elite@123")
        # Converts the Multipart msg into a string
        text = msg.as_string()
        # sending the mail
        s.sendmail(fromaddr, toaddr, text)
        # terminating the session
        s.quit()

    def mysql_allFunctions(self):
        readxmlfile.testcases()
        readxmlfile.duration()
        # readxmlfile.application()
        readxmlfile.S3bucketupload()
        readxmlfile.SendEmail()

readxmlfile = outputdata()
readxmlfile.mysql_allFunctions()