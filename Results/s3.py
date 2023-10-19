import boto3
from datetime import datetime
foldername = "CMC"+datetime.now().strftime('%Y-%m-%d_%H-%M-%S')
s3= boto3.client('s3')
file_name1=foldername+'/'+'report.html'
file_name2=foldername+'/'+'log.html'
bucket_name = "occ-ui-automation-results"
directory_name = foldername #it's name of your folders
s3.put_object(Bucket=bucket_name, Key=(directory_name+'/'))
# s3.upload_file('report.html','occ-ui-automation-results',file_name1,ExtraArgs={'ACL': 'public-read'})
s3.upload_file('report.html','occ-ui-automation-results',file_name1)
s3.upload_file('log.html','occ-ui-automation-results',file_name2)
# s3.upload_file('log.html','occ-ui-automation-results',file_name2,ExtraArgs={'ACL': 'public-read'})
Sysadmin_LogUrl= f'https://{"occ-ui-automation-results"}.s3.amazonaws.com/{foldername}/log.html'
print(Sysadmin_LogUrl)
Sysadmin_ReportUrl= f'https://{"occ-ui-automation-results"}.s3.amazonaws.com/{foldername}/report.html'
print(Sysadmin_ReportUrl)