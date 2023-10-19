*** Settings ***
Suite Setup  Launch the Application and navigate to cmc
Suite Teardown  Close the browsers
Resource   ../../../TestSuites/Base.robot

*** Test Cases ***
Drafted campaign - MobileNotification
     [Tags]  Campaign_Regression  Campaign_Sanity
     Create and complete drafted campaign - MobileNotification
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Drafted campaign - Facebook
     [Tags]  Campaign_Regression  Campaign_Sanity
     Create and complete drafted campaign - Facebook
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Drafted campaign - Mailchimp
     [Tags]  Campaign_Regression  Campaign_Sanity
     Create and complete drafted campaign - Mailchimp
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Drafted campaign - CsvDownload
     [Tags]  Campaign_Regression  Campaign_Sanity
     Create and complete drafted campaign - CsvDownload
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Drafted campaign - Hubspot
     [Tags]  Campaign_Regression  Campaign_Sanity
     Create and complete drafted campaign - Hubspot
     [Teardown]  Logout & Login to the Application and Navigate to CMC

Drafted campaign with facebook and mailchimp
     [Tags]  Campaign_Regression  Campaign_Sanity
     Create and complete drafted campaign with facebook and mailchimp
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Drafted campaign with mobile noti and facebook
     [Tags]  Campaign_Regression  Campaign_Sanity
     Create and complete drafted campaign with mobile noti and facebook
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Drafted campaign with mobile noti and csv
     [Tags]  Campaign_Regression
     Create and complete drafted campaign with mobile noti and csv
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Drafted campaign with mailchimp and csv
     [Tags]  Campaign_Regression  Campaign_Sanity
     Create and complete drafted campaign with mailchimp and csv
     [Teardown]  Run Keyword If Test Failed  To Reload Page
