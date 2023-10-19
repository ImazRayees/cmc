*** Settings ***
Suite Setup  Launch the Application and navigate to AutomationFiono
Suite Teardown  Close the browsers
Resource   ../../../TestSuites/Base.robot

*** Test Cases ***
Create 2 channel cobination campaign - Mailchimp and ConstantContact - acquisition segment
    [Tags]  Campaign_Regression
    [Template]   Check the Acquistion are Presents in Recommended Segments
    New campaign with Mailchimp and ConstantContact - Acquisition Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create 2 channel cobination campaign - Hubspot and ConstantContact - acquisition segment
    [Tags]  Campaign_Regression
    [Template]   Check the Acquistion are Presents in Recommended Segments
    New campaign with Hubspot and ConstantContact - Acquisition Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create 3 channels combination campaign - Mailchimp, Fb, and ConstantContact - acquisition segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]   Check the Acquistion are Presents in Recommended Segments
    New campaign with Mailchimp, Fb, and ConstantContact - Acquisition Segment
    [Teardown]  Logout & Login to the Application and Navigate to CMC

Create 3 channels combination campaign - Hubspot,Fb, and ConstantContact - acquisition segment
    [Tags]  Campaign_Regression
    [Template]   Check the Acquistion are Presents in Recommended Segments
    New campaign with Hubspot,Fb, and ConstantContact - Acquisition Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create 3 channels combination campaign - Mailchimp, Hubspot, and, ConstantContact - acquisition segment
    [Tags]  Campaign_Regression
    [Template]   Check the Acquistion are Presents in Recommended Segments
    New campaign with Mailchimp, Hubspot, and, ConstantContact - Acquisition Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create all channel campaign - acquisition segment
    [Tags]  Campaign_Regression  Campaign_Sanity
    [Template]   Check the Acquistion are Presents in Recommended Segments
    New campaign with All Channels - acquisition segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page