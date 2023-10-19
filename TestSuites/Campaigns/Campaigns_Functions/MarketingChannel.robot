*** Settings ***
Suite Setup  Run Keywords
...     APIResponse Login_cmcAuto  AND
...     Launch the Application for cmc automation user and navigate to cmc  AND
...     go to marketing channel in campaigns
Suite Teardown  Close the browsers
Resource   ../../../TestSuites/Base.robot

*** Test Cases ***
navigating to marketingChannel and validating data with API
    [Tags]  Campaign_Regression  Campaign_Sanity
    Then Navigate to hubspot channel results
    Then Verify Hubspot Marketing Channels Results Name column data with API
    Then Verify Hubspot Marketing Channels Results Sent column data with API
    Then Verify Hubspot Marketing Channels Results Delivered column data with API
    Then Verify Hubspot Marketing Channels Results Opened column data with API
    Then Verify Hubspot Marketing Channels Results Processed column data with API

navigating to marketingChannel
    [Tags]  Campaign_Regression  Campaign_Sanity
    Given go to marketing channel in campaigns

validation of marketing channel screen
    [Tags]  Campaign_Regression  Campaign_Sanity
    Given verify elements on marketing channel screen

CommandIQ notification validation
    [Tags]  Campaign_Regression
    Then view CIQ channel results and validate

Mailchimp validation
    [Tags]  Campaign_Regression
    Then view mailchimp channel results and validate
    Then click on configuration settings for mailchimp and verify elements on the screen
    Then click on test connection in mailchimp and validate the popup
    Then click on update audience and verify visible elements
    Then select calix mailchimp audience and verify its saved
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Facebook validation
    [Tags]  Campaign_Regression
    Then view facebook channel results and validate
    Then click on configuration setting for facebook and verify elements
    Then click on test connection in facebook and validate popup
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Hubspot validation
    [Tags]  Campaign_Regression
    Then view hubspot channel results and validate
    Then click on configuration settings for hubspot and verify elements
    Then click on test connection in hubspot and validate the popup
    [Teardown]  Run Keyword If Test Failed  To Reload Page

ConstantContact Validation
    [Tags]  Campaign_Regression
    Then View ConstantContact channel results and validate
    Then Click on configuration settings for ConstantContact and verify elements
    Then click on test connection in constantcontact and validate the popup

Removed mailchimp, facebook, hubspot, and constantContact connection then verifying the cant be selected in campaigns step 2
    [Tags]  Campaign_Regression
    Then Removing mailchimp, facebook, hubspot, and constantContact connection then verify the cant be selected in campaigns step2
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Adding mailchimp, fb, hubspot and ConstantContact and verify they are added
    [Tags]  Campaign_Regression
    Given Add mailchimp, fb, hubspot and ConstantContact
    [Teardown]  Run Keyword If Test Failed  To Reload Page