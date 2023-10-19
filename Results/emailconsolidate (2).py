import os
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
    global foldername
    foldername = datetime.now().strftime('%Y-%m-%d_%H-%M-%S')
    def getdatafromDB(self):
        global DBUsername
        global DBPassword
        global DBhost
        global DBDev
        DBUsername = 'root'
        DBPassword = 'elite@123'
        DBhost = '127.0.0.1'
        DBStage = 'web_test_reports_stage'
        DBDev = 'web_test_reports_dev'
        conn = mysql.connector.connect(
            user=DBUsername, password=DBPassword, port=3308, host=DBhost, database=DBDev)
        cursor = conn.cursor()
        selectQuery = "SELECT * FROM test_reports where name='SysAdmin' ORDER BY id DESC LIMIT 1"
        cursor.execute(selectQuery)
        myresult = cursor.fetchall()
        print(myresult)
        global totalcases_sysAdmin
        totalcases_sysAdmin=myresult[0][5]
        global passSystemAdmin
        passSystemAdmin=myresult[0][6]
        global failSystemAdmin
        failSystemAdmin=myresult[0][7]
        print(totalcases_sysAdmin)
        global usernameSys
        usernameSys = myresult[0][13]
        selectQuery = "SELECT * FROM test_reports where name='CMC' ORDER BY id DESC LIMIT 1"
        cursor.execute(selectQuery)
        myresult1 = cursor.fetchall()
        print(myresult1)
        global totalcases_CMC
        totalcases_CMC = myresult1[0][5]
        global passCMC
        passCMC = myresult1[0][6]
        global failCMC
        failCMC = myresult1[0][7]
        global usernameCMC
        usernameCMC = myresult1[0][13]
        print(usernameCMC)
        selectQuery = "SELECT * FROM test_reports where name='SHAD' ORDER BY id DESC LIMIT 1"
        cursor.execute(selectQuery)
        myresult1 = cursor.fetchall()
        print(myresult1)
        global totalcases_SHAD
        totalcases_SHAD = myresult1[0][5]
        global passSHAD
        passSHAD = myresult1[0][6]
        global failSHAD
        failSHAD = myresult1[0][7]
        global usernameSHAD
        usernameSHAD = myresult1[0][13]

    def SendEmail(self):
        fromaddr = "onecalixcloud.automation@gmail.com"
        conn = mysql.connector.connect(
            user=DBUsername, password=DBPassword, port=3308, host=DBhost, database=DBDev)
        cursor = conn.cursor(dictionary=True)
        sql_select_Query = "select * from user_subscriptions"
        # MySQLCursorDict creates a cursor that returns rows as dictionariesusername
        cursor.execute(sql_select_Query)
        records = cursor.fetchall()
        email = []
        for row in records:
            SHADData = row["sysorgadmin"]
            print(SHADData)
            if SHADData == 1:
                email.append(row["email"])
            else:
                print("No Need")
        print(email)
        toaddr = ["rajamohammed@elitecorpusa.com"]
        message = MIMEMultipart()
        message['Subject'] = "OCC Test Report - Dev - " + datetime.now().strftime('%d/%m/%Y')
        message['From'] = fromaddr
        message['To'] = ','.join(toaddr)
        body1 = 'Consolidated:\r\r\nPositive\r\r\n'
        gdp_dict = {'APP': ['CMC', 'SHAD', 'ADMIN'],
                    'User': [str(usernameCMC), str(usernameSHAD), str(usernameSys)],
                    'Total': [str(totalcases_CMC), str(totalcases_SHAD), str(totalcases_sysAdmin)],
                    'Pass': [str(passCMC), str(passSHAD), str(passSystemAdmin)],
                    'Fail': [str(failCMC), str(failSHAD), str(failSystemAdmin)]}

        data = pd.DataFrame(gdp_dict)
        output = build_table(data, 'blue_light')
        body_content = body1 + output
        message.attach(MIMEText(body_content, "html"))
        msg_body = message.as_string()

        server = SMTP('smtp.gmail.com', 587)
        server.starttls()
        server.login(message['From'], 'Password')
        server.sendmail(message['From'], message['To'], msg_body)
        server.quit()
readxmlfile = outputdata()
readxmlfile.getdatafromDB()
readxmlfile.SendEmail()