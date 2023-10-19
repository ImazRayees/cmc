*** Settings ***
Suite Setup  Run Keywords
...     Explore data api calls  AND
...     Launch the Application and navigate to cmc  AND
...     click on explore data  AND
...     Navigate to 2 Prior Months
Suite Teardown  Close the browsers
Resource   ../../TestSuites/Base.robot

*** Test Cases ***
navigate to services and validate
    [Tags]  Explore_Regression  Explore_Sanity
     navigate to services under basic tab
     Floating values on bar charts should contain % icon  SubscriberByServiceTierChart  ${acquisition_SubscribersBySST_barDataList}

validation of titles for widget icons in services screen
    [Tags]  Explore_Regression
    [Template]  validating widget icons data with mouse over in services tab
    Suscribers by Stt download icon  ${services_subscribersbysst_downloadbtn}  ${string_exportdata}
    Suscribers by Stt expand  ${services_subscribersbysst_expandbtn}  ${string_maximize}
    Household Dev trends download icon  ${services_householddevtrends_downloadbtn}  ${string_exportdata}
    Household Dev trends expand  ${services_householddevtrends_expandbtn}  ${string_maximize}
    Subscribers with Managed Services download icon  ${services_Managedservices_downloadBtn}  ${string_exportdata}
    Subscribers with Managed Services rate expand  ${services_managedservices_expandBtn}  ${string_maximize}
    wifi dev category download icon  ${services_wifidevcategorytrnds_downloadbtn}  ${string_exportdata}
    wifi dev category expand  ${services_wifidevcategorytrnds_expandbtn}  ${string_maximize}
#    Blockd threat insightz ques icon  ${services_blockdthreatinsights_quesbtn}  ${services_blockdthreatinsights_quesbtn_stringattrubute}
#    Blockd threat insightz download icon  ${services_blockdthreatinsights_downloadbtn}  ${string_exportdata}
#    Blockd threat insightz expand  ${services_blockdthreatinsights_expandbtn}  ${string_maximize}
    SmartHome insightz download icon  ${services_SmartHomeinsights_downloadbtn}  ${string_exportdata}
    SmartHome insightz expand  ${services_SmartHomeinsights_expandbtn}  ${string_maximize}

Download button function - Services Tab
    [Tags]  Explore_Regression
    Click download and verify the chart should still be visible - Service Tier Technology
    Click download and verify the chart should still be visible - Household Dev Trends
    Click download and verify the chart should still be visible - Subscribers with Managed Services
    Click download and verify the chart should still be visible - Smart Home Insights

verify by clicking icons for all the widgets in services screen
    [Tags]  Explore_Regression
    [Template]  validate clicking widget icons in services screen
    Subscriber by service tier icons   ${services_subscribersbysst_downloadbtn}  ${services_subscribersbysst_expandbtn}  ${services_subscribersbysstlabeltxt}   ${services_fullview_downloadbtn}
    Household dev trends icons   ${services_householddevtrends_downloadbtn}   ${services_householddevtrends_expandbtn}  ${services_householddevtrendslabeltxt}  ${services_fullview_downloadbtn}
    Subscribers with Managed Services icons   ${services_Managedservices_downloadBtn}  ${services_managedservices_expandBtn}  ${Managedservices_labeltxt}  ${services_fullview_downloadbtn}
    Wifi dev category icons  ${services_wifidevcategorytrnds_downloadbtn}   ${services_wifidevcategorytrnds_expandbtn}  ${services_wifidevcategorytrndslabeltxt}  ${services_fullview_downloadbtn}
#    Blocked threat insights  ${services_blockdthreatinsights_downloadbtn}   ${services_blockdthreatinsights_expandbtn}  ${services_blockdthreatinsightslabeltxt}  ${services_fullview_downloadbtn}
    CommandIQ insights   ${services_smartHomeinsights_downloadbtn}   ${services_smartHomeinsights_expandbtn}  ${services_smarthomeinsightslabeltxt}  ${services_fullview_downloadbtn}


validation of download button function by clicking any bar in services screen
    [Tags]  Explore_Regression
     validate download button fuction by clicking any bar from subscriber by STT widget in services screen