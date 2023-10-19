*** Settings ***
Suite Setup  Launch the Application and navigate to cmc
Suite Teardown  Close the browsers
Resource   ../../../TestSuites/Base.robot


*** Test Cases ***
Create campaigns with event driven - competitor visit minutes(america/chicago)
    [Documentation]   CCL-66214 Event driven need to remove from Scheduled campaign(we didn't run in automation)
     New campaign with Mobile Notification event driven- competitor visit minutes(america/chicago)
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - competitor visit minutes(america/denver)
     New campaign with Mobile Notification event driven- competitor visit minutes(america/denver)
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - competitor visit minutes(america/la)
     New campaign with Mobile Notification event driven- competitor visit minutes(america/la)
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - competitor visit minutes(america/new_york)
     New campaign with Mobile Notification event driven- competitor visit minutes(america/new_york)
    [Teardown]  Logout & Login to the Application and Navigate to CMC

Create campaigns with event driven - competitor visit minutes(utc)
     New campaign with Mobile Notification event driven- competitor visit minutes(utc)
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - speed test minutes(america/chicago)
     New campaign with Mobile Notification event driven- speed test minutes(america/chicago)
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - speed test minutes(america/denver)
     New campaign with Mobile Notification event driven- speed test minutes(america/denver)
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - speed test minutes(america/la)
     New campaign with Mobile Notification event driven- speed test minutes(america/la)
    [Teardown]  Run Keyword If Test Failed  To Reload Page