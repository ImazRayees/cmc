*** Settings ***
Suite Setup  Run Keywords
...     Login to the Application and Navigate to usercmc for Pendo  AND
...     click on explore data
Suite Teardown  Close the browsers
Resource   ../../TestSuites/Base.robot

*** Test Cases ***

Validate Pendo in subscribers tab
    [Tags]  HS_Regression  HS_Sanity
    Pendo question icons validation in subscribers tab -exploreDataBasic

Validate Pendo in Retention tab
    [Tags]  HS_Regression  HS_Sanity
    navigate to retention under basic tab
    Pendo question icons validation in retention tab -exploreDataBasic