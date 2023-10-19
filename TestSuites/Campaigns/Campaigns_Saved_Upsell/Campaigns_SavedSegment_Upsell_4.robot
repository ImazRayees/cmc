*** Settings ***
Suite Setup  Launch the Application and navigate to cmc
Suite Teardown  Close the browsers
Resource   ../../../TestSuites/Base.robot

*** Test Cases ***
Creating campaign with 4 channels combinations - MobileNoti,Mailchimp,Fb and ConstantContact - Saved Upsell Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    New campaign with MobileNoti,Mailchimp,Fb and ConstantContact - Saved Upsell Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 4 channels combinations - MobileNoti,Hubspot,Fb and ConstantContact - Saved Upsell Segment
    [Tags]  Campaign_Regression
    New campaign with MobileNoti,Hubspot,Fb and ConstantContact - Saved Upsell Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 4 channels combinations - MobileNoti,Mailchimp,Csv and ConstantContact - Saved Upsell Segment
    [Tags]  Campaign_Regression
    New campaign with MobileNoti,Mailchimp,Csv and ConstantContact - Saved Upsell Segment
    [Teardown]  Logout & Login to the Application and Navigate to CMC

Creating campaign with 4 channels combinations - Mailchimp,Hubspot,Csv and ConstantContact - Saved Upsell Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    New campaign with Mailchimp,Hubspot,Csv and ConstantContact - Saved Upsell Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with all channels - Saved Upsell Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
     New campaign with All Channels - Saved Upsell Segment
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 5 channels combinations - MobileNoti,Fb,Hubspot,CSV and ConstantContact - Saved Upsell Segment
    [Tags]  Campaign_Regression
    New campaign with MobileNoti,Fb,Hubspot,CSV and ConstantContact - Saved Upsell Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page