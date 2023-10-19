*** Settings ***
Suite Setup  Launch the Application and navigate to cmc
Suite Teardown  Close the browsers
Resource   ../../../TestSuites/Base.robot

*** Test Cases ***
Creating campaign with 2 channels combination - MobileNoti & MailChimp
    [Documentation]  CCL-39080-26
    [Tags]  Campaign_Regression  Campaign_Sanity
     New Campaign with MobileNoti & MailChimp
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - Mailchimp & CSV
    [Tags]  Campaign_Regression
     New campaign with Mailchimp $ CSV
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - MobileNoti & Mailchimp
    [Tags]  Campaign_Regression
     New campaign with mobile noti and csv
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - Mailchimp & Facebook
    [Tags]  Campaign_Regression
     new campaign with mailchimp and facebook
     [Teardown]  Logout & Login to the Application and Navigate to CMC

Creating campaign with 2 channels combination - Facebook & CSV
    [Documentation]  CCL-39080-20
    [Tags]  Campaign_Regression  Campaign_Sanity
    New campaign with Facebook and csv
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - Hubspot and Facebook
    [Documentation]  CCL-39080-21
    [Tags]  Campaign_Regression  Campaign_Sanity
    New campaign with Hubspot and fb
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - MobileNoti and Hubspot
    [Documentation]  CCL-39080-22, CCL-39080-25
    [Tags]  Campaign_Regression
    New campaign with Mobile Noti and Hubspot
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - Hubspot and csv
    [Documentation]  CCL-39080-23
    [Tags]  Campaign_Regression
    New campaign with hubspot and csv
    [Teardown]  Logout & Login to the Application and Navigate to CMC

Creating campaign with 2 channels combination - MobileNoti & Facebook
    [Documentation]  CCL-39080-24
    [Tags]  Campaign_Regression
     New campaign with mobilenoti and facebook
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - Mailchimp and Hubspot
    [Documentation]  CCL-39080-27
    [Tags]  Campaign_Regression
    New campaign with mailchimp and hubspot
    [Teardown]  Run Keyword If Test Failed  To Reload Page