*** Settings ***
Suite Setup  Launch the Application and navigate to AutomationFiono
Suite Teardown  Close the browsers
Resource   ../../../TestSuites/Base.robot

*** Test Cases ***
Create single channel campaign - Mailchimp - acquisition segment
    [Tags]  Campaign_Regression   Campaign_Sanity  testing
    [Template]   Check the Acquistion are Presents in Recommended Segments
    New campaign with the mailchimp only - acquisition segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create single channel campaign - Facebook - acquisition segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]   Check the Acquistion are Presents in Recommended Segments
    New campaign with the facebook only - acquisition segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create single channel campaign - Hubspot - acquisition segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]   Check the Acquistion are Presents in Recommended Segments
    New campaign with the hubspot only - acquisition segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create single channel campaign - ConstantContact - acquisition segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]   Check the Acquistion are Presents in Recommended Segments
    New campaign with ConstantContact only - Acquisition Segment
    [Teardown]  Logout & Login to the Application and Navigate to CMC

Create 2 channel cobination campaign - mailchimp and facebook - acquisition segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]   Check the Acquistion are Presents in Recommended Segments
    New campaign with mailchimp and facebook - acquisition segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create 2 channel cobination campaign - hubspot and facebook - acquisition segment
    [Tags]  Campaign_Regression
    [Template]   Check the Acquistion are Presents in Recommended Segments
    New campaign with hubspot and facebook - acquisition segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create 2 channel cobination campaign - mailchimp and hubspot - acquisition segment
    [Tags]  Campaign_Regression
    [Template]   Check the Acquistion are Presents in Recommended Segments
    New campaign with mailchimp and hubspot - acquisition segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create 2 channel cobination campaign - Fb and ConstantContact - acquisition segment
    [Tags]  Campaign_Regression
    [Template]   Check the Acquistion are Presents in Recommended Segments
    New campaign with Fb and ConstantContact - Acquisition Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

