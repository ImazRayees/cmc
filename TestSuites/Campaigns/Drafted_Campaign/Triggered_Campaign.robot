*** Settings ***
Suite Setup  Run Keywords
...          Launch the Application and navigate to cmc  AND
...          Naviagate to Campaigns Tab
Suite Teardown  Close the browsers
Resource   ../../../TestSuites/Base.robot

*** Test Cases ***
Validate the Service Limit Hits in Campaigns
   [Tags]   Campaign_Regression  Campaign_Sanity
   Verify the Service Limit Hits in Triggered Campaign

Validate the Competitor Visit Minutes in Campaigns
   [Tags]   Campaign_Regression  Campaign_Sanity
   Verify the Competitor Site Minutes in Triggered Campaign

Validate the Speed Test Minutes in Campaigns
   [Tags]   Campaign_Regression  Campaign_Sanity
   Verify the Speed Test Minutes in Triggered Campaign