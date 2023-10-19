*** Settings ***
Suite Setup  Launch the Application and navigate to cmc
Suite Teardown  Close the browsers
Resource   ../../../TestSuites/Base.robot

*** Test Cases ***
##ConstantContact
Creating campaign with 4 channels combinations - MobileNoti,Mailchimp,Fb and ConstantContact
    [Tags]  Campaign_Regression  Campaign_Sanity
    New campaign with MobileNoti,Mailchimp,Fb and ConstantContact
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 4 channels combinations - MobileNoti,Hubspot,Fb and ConstantContact
    [Tags]  Campaign_Regression
    New campaign with MobileNoti,Hubspot,Fb and ConstantContact
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 4 channels combinations - MobileNoti,Mailchimp,Csv and ConstantContact
    [Tags]  Campaign_Regression
    New campaign with MobileNoti,Mailchimp,Csv and ConstantContact
    [Teardown]  Logout & Login to the Application and Navigate to CMC

Creating campaign with 4 channels combinations - Mailchimp,Hubspot,Csv and ConstantContact
    [Tags]  Campaign_Regression
    New campaign with Mailchimp,Hubspot,Csv and ConstantContact
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 5 channels combinations - MobileNoti,Fb,Hubspot,CSV and ConstantContact
    [Tags]  Campaign_Regression  Campaign_Sanity
    New campaign with MobileNoti,Fb,Hubspot,CSV and ConstantContact
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 5 channels combinations - MobileNoti,Mailchimp,Hubspot,CSV and ConstantContact
    [Tags]  Campaign_Regression
    New campaign with MobileNoti,Mailchimp,Hubspot,CSV and ConstantContact
    [Teardown]  Logout & Login to the Application and Navigate to CMC

Creating campaign with 5 channels combinations - MobileNoti,Mailchimp,Fb,Hubspot and ConstantContact
    [Tags]  Campaign_Regression
    New campaign with MobileNoti,Mailchimp,Fb,Hubspot and ConstantContact
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 5 channels combinations - Mailchimp,Fb,Hubspot,CSV and ConstantContact
    [Tags]  Campaign_Regression
    New campaign with Mailchimp,Fb,Hubspot,CSV and ConstantContact
    [Teardown]  Run Keyword If Test Failed  To Reload Page

##CampaignsUpsell
Creating campaign with 4 channels combination - mobile noti, mailchimp, hubspot and csv
    [Documentation]
    [Tags]  Campaign_Regression  Campaign_Sanity
    New campaign with mobile noti, mailchimp, hubspot and csv
    [Teardown]  Logout & Login to the Application and Navigate to CMC

Creating campaign with 4 channels combination - mailchimp, facebook, hubspot and csv
    [Documentation]  CCL-39080-73, CCL-39080-76, CCL-39080-80, CCL-39080-84, CCL-39080-86, CCL-39080-91
    [Tags]  Campaign_Regression  Campaign_Sanity
    New campaign with mailchimp, facebook, hubspot and csv
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 4 channels combination - MobileNoti, Facebook, hubspot and csv
    [Documentation]  CCL-39080-67, CCL-39080-75, CCL-39080-77, CCL-39080-88, CCL-39080-90
    [Tags]  Campaign_Regression
    New campaign with MobileNoti, Facebook, hubspot and csv
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 4 channels combination - MobileNoti, Mailchimp, Facebook and CSV
    [Documentation]  CCL-39080-66, CCL-39080-71, CCL-39080-74, CCL-39080-78, CCL-39080-79, CCL-39080-82, CCL-39080-95, CCL-39080-97, CCL-39080-99
    [Tags]  Campaign_Regression
    New campaign with MobileNoti, Mailchimp, Facebook and CSV
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 4 channels combination - MobileNoti, Mailchimp, Facebook and Hubspot
    [Documentation]  CCL-39080-65, CCL-39080-83, CCL-39080-87
    [Tags]  Campaign_Regression
    New campaign with MobileNoti, Mailchimp, Facebook and Hubspot
    [Teardown]  Run Keyword If Test Failed  To Reload Page