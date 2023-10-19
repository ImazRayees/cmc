*** Settings ***
Suite Setup  Run Keywords
#...        DB Call for Report update  AND
...        Initialize configuration parameters  AND
...        validate data in homescreen  AND
...        Launch the Application and navigate to cmc  AND
...        navigate to homescreen
Suite Teardown  Close the browsers
Resource   ../../TestSuites/Base.robot

*** Test Cases ***
validate data in homescreen
    [Tags]  HS_Regression  HS_Sanity
     verify elements in homescreen
     click on about calix and verify it opens up marketing cloud release notes

verify by clicking icons for all the widgets in home screen
   [Tags]  HS_Regression
   [Template]  validate clicking widget icons in home screen
   subscriber trends icons    ${home_subscribertrends_downloadbtn}
   Churn trends icons    ${home_churntrends_downloadbtn}
   Subscriber by STT icons    ${home_subscribersbystt_downloadbtn}
   Social Chanel Heatmp icons   ${home_sch_downloadbtn}

Validate the ECB Portal in Home page
    [Tags]  HS_Regression  HS_Sanity
    Verify the Electronic Content Builder

validate tooltip data for Subscriber by STT widget in home screen
    [Tags]  HS_Regression
    getting tooltip data from Subscriber By STT widget

validate navigation funcions in homescreen
    [Tags]  HS_Regression  HS_Sanity
    validate table data for campaigns
    click on new campaigns and verify it is navigated to Scheduled Campaign
    click on new campaigns and verify it is navigated to Triggered Campaign
    click on new segments and verify it is navigated
    segments validation in homescreen
    click on fiber button under subscriber by stt and validate
    Validate clicking dropdown list data in SCH lense
    validate the pendo Feedback
    Verify homescreen pendo validation - videoGuide
    click on Saved segments and verify the navigation for Retention
    navigate to homescreen Saved segments
    click on Saved segments and verify the navigation for Upsell
    navigate to homescreen Saved segments
    click on Saved segments and verify the navigation for Acquisition

##########################searchDiv

validate table data in search results
    [Tags]  HS_Regression
     enter 'Test' in search field and validate table data under subscribers Tab and campaigns tab

clicking search with special characters to validate toast message
    [Tags]  HS_Regression
     enter special characters on search and verify toast message
     navigate back to homescreen

clicking search with empty field to validate navigation to all subscribers results
    [Tags]  HS_Regression
     click on search with empty field and validate navigation to all subscribers results
     Match the subscribers count and campaigns count to the results count


###markINsightsSearchDiv


Marketing insights validation for subsriber in search results
    [Tags]  HS_Regression
     click on search to navigate to marketing insights subscriber list
     Validate marketing insights for subscriber in CMC search results

navigate to marketing insights in support cloud
    [Tags]  HS_Regression
     click on side menu icon
     go to support cloud

Navigating to support insights in support cloud
    [Tags]  HS_Regression
     validate the support insights for a subscriber in support cloud