*** Settings ***
Suite Setup  Launch the Application and navigate to cmc
Suite Teardown  Close the browsers
Resource   ../../../TestSuites/Base.robot


*** Test Cases ***
Create campaigns with event driven - competitor visit minutes(america/chicago)- Retention Segment
    [Documentation]   CCL-66214 Event driven need to remove from Scheduled campaign(we didn't run in automation)
    [Template]  Check the Retention are Presents in Segments
    New campaign with Mobile Notification event driven- competitor visit minutes(america/chicago)- Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - competitor visit minutes(america/denver)- Retention Segment
    [Template]  Check the Retention are Presents in Segments
    New campaign with Mobile Notification event driven- competitor visit minutes(america/denver)- Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - competitor visit minutes(america/la)- Retention Segment
    [Template]  Check the Retention are Presents in Segments
    New campaign with Mobile Notification event driven- competitor visit minutes(america/la)- Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - competitor visit minutes(america/new_york)- Retention Segment
    [Template]  Check the Retention are Presents in Segments
    New campaign with Mobile Notification event driven- competitor visit minutes(america/new_york)- Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - competitor visit minutes(utc)- Retention Segment
    [Template]  Check the Retention are Presents in Segments
    New campaign with Mobile Notification event driven- competitor visit minutes(utc)- Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - speed test minutes(america/chicago)- Retention Segment
    [Template]  Check the Retention are Presents in Segments
    New campaign with Mobile Notification event driven- speed test minutes(america/chicago)- Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - speed test minutes(america/denver)- Retention Segment
    [Template]  Check the Retention are Presents in Segments
    New campaign with Mobile Notification event driven- speed test minutes(america/denver)- Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - speed test minutes(america/la)- Retention Segment
    [Template]  Check the Retention are Presents in Segments
    New campaign with Mobile Notification event driven- speed test minutes(america/la)- Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - speed test minutes(america/new_york)- Retention Segment
    [Template]  Check the Retention are Presents in Segments
    New campaign with Mobile Notification event driven- speed test minutes(america/new_york)- Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - speed test minutes(utc)- Retention Segment
    [Template]  Check the Retention are Presents in Segments
    New campaign with Mobile Notification event driven- speed test minutes(utc)- Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - service limit hits(america/chicago)- Retention Segment
    [Template]  Check the Retention are Presents in Segments
    New campaign with Mobile Notification event driven- Service Limit Hits(america/chicago)- Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - service limit hits(america/denver)- Retention Segment
    [Template]  Check the Retention are Presents in Segments
    New campaign with Mobile Notification event driven- Service Limit Hits(america/denver)- Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - service limit hits(america/la)- Retention Segment
    [Template]  Check the Retention are Presents in Segments
    New campaign with Mobile Notification event driven- Service Limit Hits(america/la)- Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - service limit hits(america/new_york)- Retention Segment
    [Template]  Check the Retention are Presents in Segments
    New campaign with Mobile Notification event driven- Service Limit Hits(america/new_york)- Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page

Create campaigns with event driven - service limit hits(utc)- Retention Segment
    [Template]  Check the Retention are Presents in Segments
    New campaign with Mobile Notification event driven- Service Limit Hits(utc)- Retention Segment
    [Teardown]  Run Keyword If Test Failed  To Reload Page
