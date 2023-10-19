*** Settings ***
Suite Setup  Launch the Application and navigate to cmc
Suite Teardown  Close the browsers
Resource   ../../../TestSuites/Base.robot

*** Test Cases ***

Creation of campaign by selecting single channel - ConstantContact single
    [Tags]  Campaign_Regression  Campaign_Sanity
    New campaign with ConstantContact
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - MobileNoti and ConstantContact
    [Tags]  Campaign_Regression  Campaign_Sanity
    New campaign with MobileNoti and ConstantContact
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - Mailchimp and ConstantContact
    [Tags]  Campaign_Regression
    New campaign with Mailchimp and ConstantContact
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - Fb and ConstantContact
    [Tags]  Campaign_Regression
    New campaign with Fb and ConstantContact
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - Hubspot and ConstantContact
    [Tags]  Campaign_Regression
    New campaign with Hubspot and ConstantContact
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - MobileNoti & MailChimp
    [Tags]  Campaign_Regression
    New campaign with CSV and ConstantContact
    [Teardown]  Logout & Login to the Application and Navigate to CMC

Creating campaign with 3 channels combinations - MobileNoti, Mailchimp and ConstantContact
    [Tags]  Campaign_Regression  Campaign_Sanity
    New campaign with MobileNoti, Mailchimp and ConstantContact
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combinations - MobileNoti, Fb and ConstantContact
    [Tags]  Campaign_Regression
    New campaign with MobileNoti, Fb and ConstantContact
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combinations - MobileNoti, Hubspot and ConstantContact
    [Tags]  Campaign_Regression
    New campaign with MobileNoti, Hubspot and ConstantContact
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combinations - Facebook, CSV and ConstantContact
    [Tags]  Campaign_Regression  Campaign_Sanity
    New campaign with Facebook, CSV and ConstantContact
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combinations - Mailchimp, CSV and ConstantContact
    [Tags]  Campaign_Regression
    New campaign with Mailchimp, CSV and ConstantContact
    [Teardown]  Run Keyword If Test Failed  To Reload Page