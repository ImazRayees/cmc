*** Settings ***
Suite Setup  Launch the Application and navigate to AutomationFiono
Suite Teardown  Close the browsers
Resource   ../../../TestSuites/Base.robot

*** Test Cases ***

Draft campaign with the mailchimp only - acquisition segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]   Check the Acquistion are Presents in Recommended Segments
    Draft and complete campaign with the mailchimp only - acquisition segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Draft campaign with the hubspot only - acquisition segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]   Check the Acquistion are Presents in Recommended Segments
    Draft and complete campaign with the hubspot only - acquisition segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Draft campaign with the facebook only - acquisition segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]   Check the Acquistion are Presents in Recommended Segments
    Draft and complete campaign with the facebook only - acquisition segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Draft campaign with the ConstantContact only - acquisition
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]   Check the Acquistion are Presents in Recommended Segments
    Draft and complete campaign with the ConstantContact only - acquisition segment
    [Teardown]  Logout & Login to the Application and Navigate to CMC

Draft campaign with mailchimp and facebook - acquisition segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]   Check the Acquistion are Presents in Recommended Segments
    Draft and complete campaign with mailchimp and facebook - acquisition segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Draft campaign with hubspot and facebook - acquisition segment
    [Tags]  Campaign_Regression
    [Template]   Check the Acquistion are Presents in Recommended Segments
    Draft and complete campaign with hubspot and facebook - acquisition segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Draft campaign with mailchimp and hubspot - acquisition segment
    [Tags]  Campaign_Regression
    [Template]   Check the Acquistion are Presents in Recommended Segments
    Draft and complete campaign with mailchimp and hubspot - acquisition segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Draft campaign with All Channels - acquisition segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]   Check the Acquistion are Presents in Recommended Segments
    Draft and complete campaign with All Channels - acquisition segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page