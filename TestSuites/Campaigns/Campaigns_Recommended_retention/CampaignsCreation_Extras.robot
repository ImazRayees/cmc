*** Settings ***
Suite Setup  Launch the Application and navigate to cmc
Suite Teardown  Close the browsers
Resource   ../../../TestSuites/Base.robot

*** Test Cases ***
##ConstantContact
##RetentionSegments
Creating campaign with 4 channels combination - mobile noti, mailchimp, hubspot and csv - Retention Segment
    [Documentation]
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with mobile noti, mailchimp, hubspot and csv - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 4 channels combination - mailchimp, facebook, hubspot and csv - Retention Segment
    [Documentation]
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with mailchimp, facebook, hubspot and csv - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 4 channels combination - MobileNoti, Facebook, hubspot and csv - Retention Segment
    [Documentation]
    [Tags]  Campaign_Regression
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with MobileNoti, Facebook, hubspot and csv - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 4 channels combination - MobileNoti, Mailchimp, Facebook and CSV - Retention Segment
    [Documentation]
    [Tags]  Campaign_Regression
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with MobileNoti, Mailchimp, Facebook and CSV - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 4 channels combination - MobileNoti, Mailchimp, Facebook and Hubspot - Retention Segment
    [Documentation]
    [Tags]  Campaign_Regression
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with MobileNoti, Mailchimp, Facebook and Hubspot - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page