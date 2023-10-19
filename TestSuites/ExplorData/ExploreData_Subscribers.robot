*** Settings ***
Suite Setup  Run Keywords
...     Explore data api calls  AND
...     Launch the Application and navigate to cmc  AND
...     click on explore data  AND
...     Navigate to 2 Prior Months
Suite Teardown  Close the browsers
Resource   ../../TestSuites/Base.robot

*** Test Cases ***
navigate to subscribers and validate
    [Tags]  Explore_Regression  Explore_Sanity
     navigate to subscribers tab under basic tab
     verify elements on subscribers tab

Filters validation - ExploreDataBasic
    [Tags]  Explore_Regression
    Filters validation for timeframe 30days - ExploreDataBasic
    Filters validation for timeframe PriorMonth - ExploreDataBasic
    Filters validation for timeframe 2PriorMonth - ExploreDataBasic
    [Teardown]  Navigate to 2 Prior Months

Pendo icons validation - subscribers tab
     [Tags]  Explore_Regression
     Pendo video icons validation in subscribers tab -exploreDataBasic
     Match kpi count with widgets count in subscribers tab -exploreDataBasic

Download button function - Subscribers Tab
    [Tags]  Explore_Regression
    Click download and verify the chart should still be visible - Subscriber data usage
    Click download and verify the chart should still be visible - Streaming subscribers
    Click download and verify the chart should still be visible - Gaming subscribers
    Click download and verify the chart should still be visible - WFH subscribers
    Click download and verify the chart should still be visible - Subscriber activity trends
    Click download and verify the chart should still be visible - Data usage trends
    Click download and verify the chart should still be visible - Dev per household trends

Pendo hover validation - Subscribers Tab
    [Tags]  Explore_Regression
    [Template]  Click on pendo ques icon and verify the text
    StreamingSubs  ${subscribers_streamingSubscribersQuesBtn}  ${subscribers_streamingSubscribersQuesBtn_stringAttribute}
    GamingSubs  ${subscribers_gamingSubscribersQuesBtn}  ${subscribers_gamingSubscribersQuesBtn_stringAttrubute}
    WfhSubs  ${subscribers_WFHsubscribersQuesbtn}  ${subscribers_WFHsubscribersQuesbtn_stringAttrubute}

Floating values validation for bar charts in subscribers tab
     [Tags]  Explore_Regression
     Floating values on bar charts should contain % icon  SubscriberDataUsageChart  ${acquisition_subscriberDataUsage_barDataList}
     Floating values on bar charts should contain % icon  StreamingSubscribersChart  ${acquisition_streamingSubscribers_barDataList}
     Floating values on bar charts should contain % icon  GamingSubscribersChart  ${acquisition_gamingSubscribers_barDataList}
     Floating values on bar charts should contain % icon  WfhSubscribersChart  ${acquisition_WFHsubscribers_barDataList}

validation of titles for widget icons in subscribers screen
    [Tags]  Explore_Regression
    [Template]  validating widget icons data with mouse over in subscribers tab
    Subscribers data usage download icon  ${subscribers_subscriberdatausagedownloadbtn}  ${string_exportdata}
    Subscribers data usage expand icon  ${subscribers_subscriberdatausageexpandbtn}  ${string_maximize}
    Streaming Subscribers download icon  ${subscribers_streamingsubscribersdownloadbtn}  ${string_exportdata}
    Streaming Subscribers expand icon   ${subscribers_streamingsubscribersexpandbtn}  ${string_maximize}
    Gaming Subscribers download icon  ${subscribers_gamingsubscribersdownloadbtn}  ${string_exportdata}
    Gaming Subscribers expand icon  ${subscribers_gamingsubscribersexpandbtn}  ${string_maximize}
    WFH subscribers download icon  ${subscribers_wfhsubscribersdownloadbtn}  ${string_exportdata}
    WFH subscribers expand icon  ${subscribers_wfhsubscribersexpandbtn}  ${string_maximize}
    Sub Activity Trends download icon  ${subscribers_subactivitytrenddownloadbtn}  ${string_exportdata}
    Sub Activity Trends expand icon  ${subscribers_subactivitytrendexpandbtn}  ${string_maximize}
    Data usage trends download icon  ${subscribers_datausagetrendsdownloadbtn}  ${string_exportdata}
    Data usage trends expand icon  ${subscribers_datausagetrendsexpandbtn}  ${string_maximize}
    Device per household download icon  ${subscribers_devperhouseholddownloadbtn}  ${string_exportdata}
    Device per household expand icon  ${subscribers_devperhouseholdexpandbtn}  ${string_maximize}


verify by clicking icons for all the widgets in subscribers screen
    [Tags]  Explore_Regression
    [Template]  validate clicking widget icons in subscribers screen
    Subscriber data usage icons   ${subscribers_subscriberdatausagedownloadbtn}   ${subscribers_subscriberdatausageexpandbtn}  ${subscribers_subscriberdatausagelabeltxt}  ${subscribers_fullView_downloadBtn}
    Streaming subscriber icons   ${subscribers_streamingsubscribersdownloadbtn}   ${subscribers_streamingsubscribersexpandbtn}  ${subscribers_streamingsubscriberslabeltxt}  ${subscribers_fullView_downloadBtn}
    Gaming subscribers icons   ${subscribers_gamingsubscribersdownloadbtn}  ${subscribers_gamingsubscribersexpandbtn}  ${subscribers_gamingsubscriberslabeltxt}   ${subscribers_fullView_downloadBtn}
    WFH subsribers icons   ${subscribers_wfhsubscribersdownloadbtn}   ${subscribers_wfhsubscribersexpandbtn}  ${subscribers_wfhsubscriberslabeltxt}  ${subscribers_fullView_downloadBtn}
    Subsriber act trends icons   ${subscribers_subactivitytrenddownloadbtn}   ${subscribers_subactivitytrendexpandbtn}  ${subscribers_subactivitytrendlabeltxt}   ${subscribers_fullView_downloadBtn}
    Data usage trnds icons   ${subscribers_datausagetrendsdownloadbtn}  ${subscribers_datausagetrendsexpandbtn}  ${subscribers_datausagetrendslabeltxt}  ${subscribers_fullView_downloadBtn}
    Dev per househld icons    ${subscribers_devperhouseholddownloadbtn}  ${subscribers_devperhouseholdexpandbtn}  ${subscribers_devperhouseholdlabeltxt}   ${subscribers_fullView_downloadBtn}


validation of download button by clicking any bar for subscribers screen widgets
    [Tags]  Explore_Regression
    [Template]  validate download button fuction by clicking any bar from widgets in subscribers screen
    Subscriber data usage widget  ${subscribers_subscriberdatausageexpandbtn}  ${subscribers_subscriberdatausage_fullview_7thbar}
    Streaming subscribers widget  ${subscribers_streamingsubscribersexpandbtn}  ${subscribers_streamingSubscribers_fullView_green_4thBar}
    Gaming subscribers widget  ${subscribers_gamingsubscribersexpandbtn}  ${subscribers_gamingSubscribers_fullView_4thGreenBar}
    WFH subscribers widget  ${subscribers_wfhsubscribersexpandbtn}  ${subscribers_WFHsubscribers_fullView_4thGreenBar}
    Devices per household widget  ${subscribers_devperhouseholdexpandbtn}  ${subscribers_devperhousehold_fullview_5thbar}