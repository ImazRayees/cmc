*** Settings ***
Suite Setup  Launch the Application and navigate to cmc
Suite Teardown  Close the browsers
Resource   ../../../TestSuites/Base.robot

*** Test Cases ***
Creating campaign with 3 channels combination - MobileNoti, mailchimp and hubspot
    [Documentation]  CCL-39080-29, CCL-39080-51
    [Tags]  Campaign_Regression  Campaign_Sanity
     New campaign with MobileNoti, mailchimp and hubspot
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combination - mailchimp, hubspot and csv
    [Documentation]  CCL-39080-45
    [Tags]  Campaign_Regression
     New campaign with mChimp, hubspot and csv
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combination - malichimp, facebook and csv
    [Documentation]  CCL-39080-35, CCL-39080-39, CCL-39080-44, CCL-39080-46
    [Tags]  Campaign_Regression  Campaign_Sanity
     New campaign with malichimp, facebook and csv
     [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combination - mobilenoti, csv and hubspot
    [Documentation]  CCL-39080-30, CCL-39080-34, CCL-39080-38, CCL-39080-42, CCL-39080-61
    [Tags]  Campaign_Regression
     New campaign with mobilenoti, csv and hubspot
     [Teardown]  Logout & Login to the Application and Navigate to CMC


#Creating campaign with 3 channels combination - mailchimp, facebook and hubspot
#    [Documentation]  CCL-39080-28, CCL-39080-33, CCL-39080-37, CCL-39080-41, CCL-39080-47
#    [Tags]  campaignsTab  campCreate  3combinations
#    New campaign with mobilenoti, mailchimp and facebook
#    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combination - mobile noti, facebook and hubspot
    [Documentation]  CCL-39080-40, CCL-39080-63
    [Tags]  Campaign_Regression
    New campaign with Mobile Noti, Fb and Hubspot
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combination - mobile noti, facebook and csv
    [Documentation]  CCL-39080-43, CCL-39080-55, CCL-39080-57, CCL-39080-58, CCL-39080-59, CCL-39080-60, CCL-39080-62, CCL-39080-70
    [Tags]  Campaign_Regression
    New campaign with Mobile Noti, Fb and CSV
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combination - facebook, hubspot and csv
    [Documentation]  CCL-39080-31, CCL-39080-48, CCL-39080-49, CCL-39080-53, CCL-39080-54, CCL-39080-56, CCL-39080-72
    [Tags]  campaignsTab  campCreate  3combinations
    New campaign with Fb, Hubspot and csv
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with 3 channels combination - mailchimp, facebook and hubspot
    [Documentation]  CCL-39080-32, CCL-39080-36, CCL-39080-50
    [Tags]  Campaign_Regression
    New campaign with mailchimp, fb and hubspot
    [Teardown]  Logout & Login to the Application and Navigate to CMC

Creating campaign with 3 channels combination - mobile noti, mailchimp and facebook
    [Documentation]  CCL-39080-29, CCL-39080-52,  CCL-39080-64
    [Tags]  Campaign_Regression
    New campaign with mobile noti, mailchimp and facebook
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Creating campaign with all channels
    [Documentation]   CCL-39080_5 to CCL-39080_16, CCL-39080-68, CCL-39080-69, CCL-39080-81, CCL-39080-85, CCL-39080-89, CCL-39080-92, CCL-39080-93, CCL-39080-94, CCL-39080-96, CCL-39080-98, CCL-39080-100,
    [Documentation]   CCL-39080-101 to 120
    [Tags]  Campaign_Regression  Campaign_Sanity
     new campaign with all channels
    [Teardown]  Run Keyword If Test Failed  To Reload Page