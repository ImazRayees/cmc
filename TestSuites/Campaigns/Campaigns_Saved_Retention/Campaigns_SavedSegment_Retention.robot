*** Settings ***
Suite Setup  Launch the Application and navigate to cmc
Suite Teardown  Close the browsers
Resource   ../../../TestSuites/Base.robot

*** Test Cases ***
Creation of campaign by selecting single channel - Mobile notification single - Saved Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
     New campaign with Mobile Notification only - Saved Retention Segment
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creation of campaign by selecting single channel - mailchimp single - Saved Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
     New campaign with mailchimp - Saved Retention Segment
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creation of campaign by selecting single channel - hubspot single - Saved Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
     New campaign with hubspot - Saved Retention Segment
     [Teardown]  Logout & Login to the Application and Navigate to CMC

Creation of campaign by selecting single channel - csv single - Saved Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
     New campaign with CSV - Saved Retention Segment
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creation of campaign by selecting single channel - facebook single - Saved Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
     New campaign with facebook - Saved Retention Segment
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creation of campaign by selecting single channel - ConstantContact single - Saved Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    New campaign with ConstantContact - Saved Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page