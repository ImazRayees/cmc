*** Settings ***
Suite Setup  Launch the Application and navigate to cmc
Suite Teardown  Close the browsers
Resource   ../../../TestSuites/Base.robot

*** Test Cases ***
Creating campaign with 3 channels combination - MobileNoti, mailchimp and hubspot - Saved Upsell Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
     New campaign with MobileNoti, mailchimp and hubspot - Saved Upsell Segment
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combination - mailchimp, hubspot and csv - Saved Upsell Segment
    [Tags]  Campaign_Regression
     New campaign with mChimp, hubspot and csv - Saved Upsell Segment
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combination - malichimp, facebook and csv - Saved Upsell Segment
    [Tags]  Campaign_Regression
     New campaign with malichimp, facebook and csv - Saved Upsell Segment
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combination - mobilenoti, csv and hubspot - Saved Upsell Segment
    [Tags]  Campaign_Regression
     New campaign with mobilenoti, csv and hubspot - Saved Upsell Segment
     [Teardown]  Logout & Login to the Application and Navigate to CMC

Creating campaign with 3 channels combinations - MobileNoti, Mailchimp and ConstantContact - Saved Upsell Segment
    [Tags]  Campaign_Regression
    New campaign with MobileNoti, Mailchimp and ConstantContact - Saved Upsell Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combinations - MobileNoti, Fb and ConstantContact - Saved Upsell Segment
    [Tags]  Campaign_Regression
    New campaign with MobileNoti, Fb and ConstantContact - Saved Upsell Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combinations - MobileNoti, Hubspot and ConstantContact - Saved Upsell Segment
    [Tags]  Campaign_Regression
    New campaign with MobileNoti, Hubspot and ConstantContact - Saved Upsell Segment
    [Teardown]  Logout & Login to the Application and Navigate to CMC

Creating campaign with 3 channels combinations - Facebook, CSV and ConstantContact - Saved Upsell Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    New campaign with Facebook, CSV and ConstantContact - Saved Upsell Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combinations - Mailchimp, CSV and ConstantContact - Saved Upsell Segment
    [Tags]  Campaign_Regression
    New campaign with Mailchimp, CSV and ConstantContact - Saved Upsell Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page
