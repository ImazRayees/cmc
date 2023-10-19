*** Settings ***
Suite Setup  Launch the Application and navigate to cmc
Suite Teardown  Close the browsers
Resource   ../../../TestSuites/Base.robot

*** Test Cases ***
Drafted campaign with mobile noti and mailchimp
     [Tags]  Campaign_Regression
     Create and complete drafted campaign with mobile noti and mailchimp
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Drafted campaign with mobile noti and hubspot
     [Tags]  Campaign_Regression
     Create and complete drafted campaign with mobile noti and hubspot
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Drafted campaign with mobilenoti, mailchimp and hubspot
     [Tags]  Campaign_Regression  Campaign_Sanity
     Create and complete drafted campaign with mobilenoti, mailchimp and hubspot
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Drafted campaign with mailchimp, hubspot and csv
     [Tags]  Campaign_Regression
     Create and complete drafted campaign with mailchimp, hubspot and csv
     [Teardown]  Logout & Login to the Application and Navigate to CMC

Drafted campaign with mobilenoti, mailchimp and facebook
     [Tags]  Campaign_Regression
     Create and complete drafted campaign with mobilenoti, mailchimp and facebook
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Drafted campaign with mailchimp, facebook and csv
     [Tags]  Campaign_Regression  Campaign_Sanity
     Create and complete drafted campaign with mailchimp, facebook and csv
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Drafted campaign with mobilenoti, csv and hubspot
     [Tags]  Campaign_Regression
     Create and complete drafted campaign with mobilenoti, csv and hubspot
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Drafted campaign with all channels
     [Tags]  Campaign_Regression   Campaign_Sanity
     Create and complete drafted campaign with all channels
     [Teardown]  Run Keyword If Test Failed  To Reload Page