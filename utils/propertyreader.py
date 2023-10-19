class commonvariables:

     def __init__(self):
        global environment
# select the Environment "Stage" "Prod" "Dev"
        self.environment="Stage"
        self.Application= "CMC"


#  MYSQl Reader file
        self.LatestReportFolder = "C:/OCC-Automation/CMC/Report/"
        self.BackUpReportFolder = "C:/OCC-Backup/CMC/"
        self.AdminReortFolder = "C:/wamp64/www/automation_reports_server/uploads/"
        self.ReportHTML = 'C:\OCC-Automation\CMC\Source-Code\cmc-robotframework\Results\\report.html'
        self.LogHTML = 'C:\OCC-Automation\CMC\Source-Code\cmc-robotframework\Results\\log.html'
        self.OutputXML = 'C:/OCC-Automation/CMC/Source-Code/cmc-robotframework/Results/output.xml'
        self.Mysql_UserName = 'root'
        self.Mysql_Password = ''
        self.Mysql_Host = '127.0.0.1'
        self.Mysql_DataBaseName_Stage = 'web_test_reports_stage'
        self.Mysql_DataBaseName_Dev = 'web_test_reports_dev'
        self.Mysql_DataBaseName_Prod = 'web_test_reports'
