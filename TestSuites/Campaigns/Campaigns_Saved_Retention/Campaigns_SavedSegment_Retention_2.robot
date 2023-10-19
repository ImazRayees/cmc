*** Settings ***
Suite Setup  Launch the Application and navigate to cmc
Suite Teardown  Close the browsers
Resource   ../../../TestSuites/Base.robot

*** Test Cases ***
Creating campaign with 2 channels combination - MobileNoti & Hubspot - Saved Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
     New Campaign with MobileNoti & Hubspot - Saved Retention Segment
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - MobileNoti & MailChimp - Saved Retention Segment
    [Tags]  Campaign_Regression
     New Campaign with MobileNoti & MailChimp - Saved Retention Segment
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - Mailchimp & CSV - Saved Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
     New campaign with Mailchimp $ CSV - Saved Retention Segment
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - MobileNoti & Mailchimp - Saved Retention Segment
    [Tags]  Campaign_Regression
     New campaign with mobile noti and csv - Saved Retention Segment
     [Teardown]  Logout & Login to the Application and Navigate to CMC

Creating campaign with 2 channels combination - Mailchimp & Facebook - Saved Retention Segment
    [Tags]  Campaign_Regression
     new campaign with mailchimp and facebook - Saved Retention Segment
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - MobileNoti & Facebook - Saved Retention Segment
    [Tags]  Campaign_Regression
     New campaign with mobilenoti and facebook - Saved Retention Segment
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - MobileNoti and ConstantContact - Saved Retention Segment
    [Tags]  Campaign_Regression
    New campaign with MobileNoti and ConstantContact - Saved Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - Mailchimp and ConstantContact - Saved Retention Segment
    [Tags]  Campaign_Regression
    New campaign with Mailchimp and ConstantContact - Saved Retention Segment
    [Teardown]  Logout & Login to the Application and Navigate to CMC

Creating campaign with 2 channels combination - Fb and ConstantContact - Saved Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    New campaign with Fb and ConstantContact - Saved Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - Hubspot and ConstantContact - Saved Retention Segment
    [Tags]  Campaign_Regression
    New campaign with Hubspot and ConstantContact - Saved Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - csv and constantContact - Saved Retention Segment
    [Tags]  Campaign_Regression
    New campaign with CSV and ConstantContact - Saved Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page



