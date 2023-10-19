*** Settings ***
Suite Setup  Launch the Application and navigate to cmc
Suite Teardown  Close the browsers
Resource   ../../../TestSuites/Base.robot

*** Test Cases ***
Creation of campaign by selecting single channel - Mobile notification single
    [Tags]  Campaign_Regression  Campaign_Sanity
     New campaign with Mobile Notification only
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creation of campaign by selecting single channel - mailchimp single
    [Tags]  Campaign_Regression  Campaign_Sanity
     New campaign with mailchimp
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creation of campaign by selecting single channel - hubspot single
    [Tags]  Campaign_Regression  Campaign_Sanity
     New campaign with hubspot
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creation of campaign by selecting single channel - csv single
    [Tags]  Campaign_Regression  Campaign_Sanity
     New campaign with CSV
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creation of campaign by selecting single channel - facebook single
    [Tags]  Campaign_Regression  Campaign_Sanity
     New campaign with facebook
     [Teardown]  Run Keyword If Test Failed  To Reload Page