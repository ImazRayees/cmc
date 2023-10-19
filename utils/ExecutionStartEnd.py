import os
from datetime import datetime
from configparser import ConfigParser
import mysql.connector

class BeforeRunUpdate():
    global SysDateTime

    def ConfigRead(self):
      print('test')
      global OutputXMLfile
      global DBUsername
      global DBPassword
      global DBhost
      global DBStage
      global DBDev
      global DBProd
      global Appenvironment
      global Appication
      global runStatusStart
      global runStatusEnd
      dir_path = os.path.dirname(os.path.realpath(__file__))
      config_file = os.path.join(dir_path, 'config.ini')
      config = ConfigParser()
      print(config.sections())
      config.read(config_file)
      DBUsername = config['MYSQl']['Mysql_UserName']
      print(DBUsername)
      DBPassword = config['MYSQl']['Mysql_Password']
      print(DBPassword)
      DBhost = config['MYSQl']['Mysql_Host']
      print(DBhost)
      DBStage = config['MYSQl']['Mysql_DataBaseName_Stage']
      print(DBStage)
      DBDev = config['MYSQl']['Mysql_DataBaseName_Dev']
      DBProd = config['MYSQl']['Mysql_DataBaseName_Prod']
      Appenvironment = config['ENVIRONMENT']['environment']
      Appication = config['APPLICATION']['Application']
      runStatusStart = config['MYSQl']['RunStatusStart']
      runStatusEnd = config['MYSQl']['RunStatusEnd']

    def startTimeInsert_Stage(self):
         objBfrRun.ConfigRead()
         SysDateTime = datetime.now().strftime('%Y-%m-%d_%H-%M-%S')
         Name = 'CMC'
         global cursor
         global conn
         print('DB Start to Connecet')
         print(DBUsername)
         print(DBPassword)
         print(DBhost)
         print(DBStage)
         port = 3306
         conn = mysql.connector.connect(user=DBUsername, password=DBPassword, port=port, host=DBhost, database=DBStage)
         print('DB Connected')
         cursor = conn.cursor()
         sql = """INSERT INTO test_reports (Name, start_date, run_status)
                  VALUES (%s,%s,%s)"""
         insert_blob_tuple = (Name, SysDateTime, runStatusStart)
         cursor.execute(sql, insert_blob_tuple)
         conn.commit()
         print('Data inserted')

    def startTimeInsert_Dev(self):
        objBfrRun.ConfigRead()
        SysDateTime = datetime.now().strftime('%Y-%m-%d_%H-%M-%S')
        Name = 'CMC'
        global cursor
        global conn
        print('DB Start to Connecet')
        print(DBUsername)
        print(DBPassword)
        print(DBhost)
        print(DBDev)
        port = 3306
        conn = mysql.connector.connect(user=DBUsername, password=DBPassword, port=port, host=DBhost, database=DBDev)
        print('DB Connected')
        cursor = conn.cursor()
        sql = """INSERT INTO test_reports (Name, start_date, run_status)
                  VALUES (%s,%s,%s)"""
        insert_blob_tuple = (Name, SysDateTime, runStatusStart)
        cursor.execute(sql, insert_blob_tuple)
        conn.commit()
        print('Data inserted')

    def startTimeInsert_Prod(self):
        objBfrRun.ConfigRead()
        SysDateTime = datetime.now().strftime('%Y-%m-%d_%H-%M-%S')
        Name = 'CMC'
        global cursor
        global conn
        print('DB Start to Connecet')
        print(DBUsername)
        print(DBPassword)
        print(DBhost)
        print(DBProd)
        port = 3306
        conn = mysql.connector.connect(user=DBUsername, password=DBPassword, port=port, host=DBhost, database=DBProd)
        print('DB Connected')
        cursor = conn.cursor()
        sql = """INSERT INTO test_reports (Name, start_date, run_status)
                  VALUES (%s,%s,%s)"""
        insert_blob_tuple = (Name, SysDateTime, runStatusStart)
        cursor.execute(sql, insert_blob_tuple)
        conn.commit()
        print('Data inserted')

    def endTimeUpdate(self):
         SysDateTime = datetime.now().strftime('%Y-%m-%d_%H-%M-%S')
         cursor = conn.cursor()
         selectQuery = "SELECT id FROM test_reports ORDER BY id DESC LIMIT 1"
         cursor.execute(selectQuery)
         myresult = cursor.fetchall()
         print(myresult[0][0])
         sql = "UPDATE test_reports SET end_date = %s,run_status = %s  WHERE id = %s"
         val = (SysDateTime, runStatusEnd, myresult[0][0])
         cursor.execute(sql, val)
         conn.commit()
         print('Data Updated')
         sql = "SELECT * FROM test_reports"
         cursor.execute(sql)
         myresult = cursor.fetchall()
         for x in myresult:
             print(x)

objBfrRun = BeforeRunUpdate()
# objBfrRun.ConfigRead()
# objBfrRun.startTimeInsert_Stage()
# objBfrRun.endTimeUpdate()

