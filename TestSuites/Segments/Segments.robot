*** Settings ***
Suite Setup  Launch the Application and navigate to cmc
Suite Teardown  Close the browsers
Resource   ../../TestSuites/Base.robot

*** Test Cases ***
Validate the Recommended Segments
    [Tags]  HS_Regression  HS_Sanity  test
    Verify the Recommended Segments
    Verify the Search and types in Recommended Segments

segments tab validation
    [Tags]  HS_Regression  HS_Sanity
     Navigate to segments and verify elements on the Saved screen
     click on a data from campaigns in progress and verify its navigating to campaigns results
     navigate to saved tab under segments and verify elements on the screen
     delete a segment and verify its deleted

click on Saved segments and verify the navigation
    [Tags]  HS_Regression
     verify the navigation for Retention
     Navigate to Saved Segments
     verify the navigation for Upsell
     Navigate to Saved Segments
     verify the navigation for Acquistion