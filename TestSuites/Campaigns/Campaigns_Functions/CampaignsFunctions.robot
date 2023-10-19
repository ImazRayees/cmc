*** Settings ***
Suite Setup  Run Keywords
...          Launch the Application and navigate to cmc  AND
...          Naviagate to Campaigns Tab
Suite Teardown  Close the browsers
Resource   ../../../TestSuites/Base.robot

*** Test Cases ***
Navigating to campaigns
    [Tags]  Campaign_Regression  Campaign_Sanity
     verify elements on campaigns screen
     Verify the Electronic Content Builder in Campaigns

Validate the Triggered Campaign
    [Tags]  Campaign_Regression  Campaign_Sanity
    Verify the Triggered Campaign page

Validate the Campaigns Screen
    [Tags]  Campaign_Regression  Campaign_Sanity
     click on delete icon and validate popup is showing
     click on delete icon and validate buttons in popup
     mouse over and verify titles for icons in campaigns list
     verify campaigns in progress should not contain edit option
     clicking next button with empty fields and validating help message
     clicking next with same campaign name and validate diplicate alert in campaigns step 1
    [Teardown]  Naviagate to Campaigns Tab

#Zipplusfour functions validation
#    [Tags]  campaignsTab Zipplusfour
#    [Documentation]
#    Selecting acquisition filter should show zipplusfour filter
#    Get list of selected values from zipplusfour filter
#    Clear the zipplusfour field

Mobile notification redeployment e2e
    [Tags]  Campaign_Regression  Campaign_Sanity
    Verify mobile notification redeployment  0329Steve-A
    [Teardown]  Naviagate to Campaigns Tab	

Verify the status dropdown - campaignsTab
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  validation of STATUS dropdown in campaigns screen
    1  Complete
    2  Draft
    3  In-Progress

Verify the type dropdown - campaignsTab
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  validation of TYPE dropdown in campaigns screen
    1  Acquisition
    2  Retention
    3  Upsell
    4  Upload

Validating both type and status dropdown - campaignsTab
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]  Validation of both Type and Status dropdown combinations
    1  Acquisition   Complete
    2  Retention     Draft
    3  Upsell        In-Progress
    4  Acquisition   In-Progress
    5  Retention        Complete
    6  Upsell     Draft


Validation of the campaigns steps
    [Tags]  Campaign_Regression  Campaign_Sanity
     Validation of campaigns steps

