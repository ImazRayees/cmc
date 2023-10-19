*** Settings ***
Suite Setup  Run Keywords
...     Explore data api calls  AND
...     Launch the Application and navigate to cmc  AND
...     click on explore data
Suite Teardown  Close the browsers
Resource   ../../TestSuites/Base.robot

*** Test Cases ***
Validate the Filters
    [Tags]  Explore_Regression  Explore_Sanity
    Verify the Filters in Explore data

Explore data basic verification
     [Tags]  Explore_Regression  Explore_Sanity
     verify elements on exploreData basic
     getting data from kpv basic tab

Validate the Subscribers KPI datas with API
    [Tags]  Explore_Regression
     verify the Active subscribers data
     verify the Streaming subscribers total data
     verify the Gaming subscribers total data
     verify the Work_from_Home subscribers total data

Validate the Subscriber Data Usage widget
    [Tags]  Explore_Regression
     Navigate to the Subscribers menu
     Verify get Bar value in Subscriber Data Usage
     Click on Subscriberlense1 Maximize icon
     Verify get drill down Bar value in Subscriber Data Usage
     Click on Subscriberlense1 Drilldown Bar
     Verify the Subscriber Data Usage Data table
     Verify Subscriber Data Usage all bars header of drill down
     Click on Subscriberlense1 Minimize icon

Validate the Streaming subscribers widget
    [Tags]  Explore_Regression
     Navigate to the Subscribers menu
     Verify get Bar value in Streaming Subscriber
     Verify get Bar value in Non Streaming Subscriber
     Click on Subscriberlense2 Maximize icon
     Verify get drill down Bar value in Streaming Subscriber
     Click on Subscriberlense2 Minimize icon

Validate the Gaming subscribers widget
    [Tags]  Explore_Regression
     Navigate to the Subscribers menu
     Verify get Bar value in Gaming Subscriber
     Verify get Bar value in Non Gaming Subscriber
     Click on Subscriberlense3 Maximize icon
     Verify get drill down Bar value in Gaming Subscriber
     Click on Subscriberlense3 Minimize icon

Validate the New Subscribers by Service Tier Technology widget
    [Tags]  Explore_Regression
     Navigate to the Acquisition menu
     Verify get Bar value in New Subscribers by Service Tier
     Click on Acquisitionlense1 Maximize icon
     Verify get drill down Bar value in New Subscribers by Service Tier
     Click on Acquisitionlense1 Drilldown Bar
     Verify get drill down Table Data in New Subscribers by Service Tier
     Verify Subscribers by New Service Tier all bars header of drill down

Validate the Subscribers by Service Tier Technology widget
    [Tags]  Explore_Regression
     Navigate to the Service menu
     Verify get Bar value in Subscribers by Service Tier
     Click on Servicelense1 Maximize icon
     Verify get drill down Bar value in Subscribers by Service Tier
     Click on Servicelense1 Drilldown Bar
     Verify get drill down Table Data in Subscribers by Service Tier
     Verify Subscribers by Service Tier all bars header of drill down

Validate the Devices per household Insights widget
    [Tags]  Explore_Regression
     Navigate to the Subscribers menu
     Verify get Bar value in Devices per Household
     Click on Servicelense7 Maximize icon
     Verify get drill down Bar value in Devices per Household
     Click on Servicelense7 Drilldown Bar
     Verify get drill down Table Data in Devices per Household
     Verify Devices per Household all bars header of drill down

Validate the CommandIQ Insights widget
    [Tags]  Explore_Regression
     Navigate to the Service menu
     Validate CommandIQ Insights table data

Validate the TopApplication Insights widget
    [Tags]  Explore_Regression
     Navigate to the Application menu
     Validate Top Application table data

Validate the ChurnRisk Insights widget
    [Tags]  Explore_Regression
     Navigate to the Retention menu
     Validate Churn_Risk table data

Validate the Retention Insights widget
    [Tags]  Explore_Regression
     Navigate to the Retention menu
     Validate Retention table data