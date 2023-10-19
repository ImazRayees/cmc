*** Settings ***
Suite Setup  Launch the Application and navigate to cmc
Suite Teardown  Close the browsers
Resource   ../../../TestSuites/Base.robot


*** Test Cases ***
Creation of campaign by selecting single channel - Mobile notification single - Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with Mobile Notification only - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creation of campaign by selecting single channel - mailchimp single - Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with mailchimp - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creation of campaign by selecting single channel - hubspot single - Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with hubspot - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creation of campaign by selecting single channel - csv single - Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with CSV - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creation of campaign by selecting single channel - facebook single - Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with facebook - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - MobileNoti & Hubspot - Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    New Campaign with MobileNoti & Hubspot - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - MobileNoti & MailChimp - Retention Segment
    [Tags]  Campaign_Regression
    [Template]  Check the Retention are Presents in Recommended Segments
    New Campaign with MobileNoti & MailChimp - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - Mailchimp & CSV - Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with Mailchimp $ CSV - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - MobileNoti & Mailchimp - Retention Segment
    [Tags]  Campaign_Regression
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with mobile noti and csv - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - Mailchimp & Facebook - Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    new campaign with mailchimp and facebook - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - MobileNoti & Facebook - Retention Segment
    [Tags]  Campaign_Regression
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with mobilenoti and facebook - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with all channels - Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with All Channels - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combination - MobileNoti, mailchimp and hubspot - Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with MobileNoti, mailchimp and hubspot - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combination - mailchimp, hubspot and csv - Retention Segment
    [Tags]  Campaign_Regression
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with mChimp, hubspot and csv - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combination - malichimp, facebook and csv - Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with malichimp, facebook and csv - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combination - mobilenoti, csv and hubspot - Retention Segment
    [Tags]  Campaign_Regression
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with mobilenoti, csv and hubspot - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page


