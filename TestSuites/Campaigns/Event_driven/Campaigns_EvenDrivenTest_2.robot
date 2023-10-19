*** Settings ***
Suite Setup  Launch the Application and navigate to cmc
Suite Teardown  Close the browsers
Resource   ../../../TestSuites/Base.robot

*** Test Cases ***
Create campaigns with event driven - speed test minutes(america/new_york)
    [Documentation]   CCL-66214 Event driven need to remove from Scheduled campaign(we didn't run in automation)
     New campaign with Mobile Notification event driven- speed test minutes(america/new_york)
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - speed test minutes(utc)
     New campaign with Mobile Notification event driven- speed test minutes(utc)
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - service limit hits(america/chicago)
     New campaign with Mobile Notification event driven- Service Limit Hits(america/chicago)
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - service limit hits(america/denver)
     New campaign with Mobile Notification event driven- Service Limit Hits(america/denver)
    [Teardown]  Logout & Login to the Application and Navigate to CMC

Create campaigns with event driven - service limit hits(america/la)
     New campaign with Mobile Notification event driven- Service Limit Hits(america/la)
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - service limit hits(america/new_york)
     New campaign with Mobile Notification event driven- Service Limit Hits(america/new_york)
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - service limit hits(utc)
     New campaign with Mobile Notification event driven- Service Limit Hits(utc)
     [Teardown]  Run Keyword If Test Failed  To Reload Page
