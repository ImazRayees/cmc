*** Settings ***
Suite Setup  Run Keywords
...     Explore data api calls  AND
...     Launch the Application and navigate to cmc  AND
...     click on explore data  AND
...     Navigate to 2 Prior Months
Suite Teardown  Close the browsers
Resource   ../../TestSuites/Base.robot

*** Test Cases ***
Systems tab validation
    [Tags]  Explore_Regression  Explore_Sanity
     navigate to device under basic tab
     verify elements in the device tab

System tab widgets validation
     [Tags]  Explore_Regression
     validate commandIQ widget in fullview
     validate Managed Services widget in fullview
     validate system trends widget in fullview

Download button function - Systems Tab
    [Tags]  Explore_Regression
    Click download and verify the chart should still be visible - CIQ Trending
    Click download and verify the chart should still be visible - Rev EDGE Trending
    Click download and verify the chart should still be visible - Sys By Model

set filter to Region Lincoln and validate subscriber data usage and KPV data
    [Tags]  Explore_Regression
     navigate to subscribers tab under basic tab
     set filter to Lincoln region
     getting data from kpv basic tab
     getting data from Subscriber data usage widget with Lincoln region filter

navigate to prospects in exploreData tab
    [Tags]  Explore_Regression  Explore_Sanity
    Verify the Explore Data based on entitlements and Config API