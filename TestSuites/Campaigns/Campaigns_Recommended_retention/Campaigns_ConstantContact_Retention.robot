*** Settings ***
Suite Setup  Launch the Application and navigate to cmc
Suite Teardown  Close the browsers
Resource   ../../../TestSuites/Base.robot

*** Test Cases ***

###retentionSEgments
Creation of campaign by selecting single channel - ConstantContact single - Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with ConstantContact - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - MobileNoti and ConstantContact - Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with MobileNoti and ConstantContact - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - Mailchimp and ConstantContact - Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with Mailchimp and ConstantContact - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - Fb and ConstantContact
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with Fb and ConstantContact - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - Hubspot and ConstantContact - Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with Hubspot and ConstantContact - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 2 channels combination - csv and constantContact - Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with CSV and ConstantContact - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combinations - MobileNoti, Mailchimp and ConstantContact - Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with MobileNoti, Mailchimp and ConstantContact - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combinations - MobileNoti, Fb and ConstantContact - Retention Segment
    [Tags]  Campaign_Regression
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with MobileNoti, Fb and ConstantContact - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combinations - MobileNoti, Hubspot and ConstantContact - Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with MobileNoti, Hubspot and ConstantContact - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combinations - Facebook, CSV and ConstantContact - Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with Facebook, CSV and ConstantContact - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combinations - Mailchimp, CSV and ConstantContact - Retention Segment
    [Tags]  Campaign_Regression
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with Mailchimp, CSV and ConstantContact - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 4 channels combinations - MobileNoti,Mailchimp,Fb and ConstantContact - Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with MobileNoti,Mailchimp,Fb and ConstantContact - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 4 channels combinations - MobileNoti,Hubspot,Fb and ConstantContact - Retention Segment
    [Tags]  Campaign_Regression
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with MobileNoti,Hubspot,Fb and ConstantContact - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 4 channels combinations - MobileNoti,Mailchimp,Csv and ConstantContact - Retention Segment
    [Tags]  Campaign_Regression
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with MobileNoti,Mailchimp,Csv and ConstantContact - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 4 channels combinations - Mailchimp,Hubspot,Csv and ConstantContact - Retention Segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Check the Retention are Presents in Recommended Segments
    New campaign with Mailchimp,Hubspot,Csv and ConstantContact - Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

#Creating campaign with 5 channels combinations - MobileNoti,Fb,Hubspot,CSV and ConstantContact - Retention Segment
#    [Tags]  campaignsTab  campCreate  3combinations
#    New campaign with MobileNoti,Fb,Hubspot,CSV and ConstantContact - Retention Segment
#    [Teardown]  Run Keyword If Test Failed  To Reload Page

#Creating campaign with 5 channels combinations - MobileNoti,Mailchimp,Hubspot,CSV and ConstantContact - Retention Segment
#    [Tags]  campaignsTab  campCreate  3combinations  SanitySkip
#    New campaign with MobileNoti,Mailchimp,Hubspot,CSV and ConstantContact - Retention Segment
#    [Teardown]  Run Keyword If Test Failed  To Reload Page

#Creating campaign with 5 channels combinations - MobileNoti,Mailchimp,Fb,Hubspot and ConstantContact - Retention Segment
#    [Tags]  campaignsTab  campCreate  3combinations  SanitySkip
#    New campaign with MobileNoti,Mailchimp,Fb,Hubspot and ConstantContact - Retention Segment
#    [Teardown]  Run Keyword If Test Failed  To Reload Page

#Creating campaign with 5 channels combinations - Mailchimp,Fb,Hubspot,CSV and ConstantContact - Retention Segment
#    [Tags]  campaignsTab  campCreate  3combinations  SanitySkip
#    New campaign with Mailchimp,Fb,Hubspot,CSV and ConstantContact - Retention Segment
#    [Teardown]  Run Keyword If Test Failed  To Reload Page
