*** Settings ***
Suite Setup  Run Keywords
...     Explore data api calls  AND
...     Launch the Application and navigate to cmc  AND
...     click on explore data  AND
...     Navigate to 2 Prior Months
Suite Teardown  Close the browsers
Resource   ../../TestSuites/Base.robot

*** Test Cases ***
navigate to retention and validate
    [Tags]  Explore_Regression  Explore_Sanity
     navigate to retention under basic tab
     verify elements on retention screen
     Floating values on bar charts should contain % icon - ChurnRateInsights
     Pendo question icons validation in retention tab -exploreDataBasic

validation of titles for widget icons in retention screen
    [Tags]  Explore_Regression
    [Template]  validating widget icons data with mouse over in retention tab
    Churn Rate & insights download icon  ${retention_churnratesinsights_downloadbtn}  ${string_exportdata}
    Churn Rate & insights expand icon  ${retention_churnratesinsights_expandbtn}  ${string_maximize}
    Churn Risk download icon  ${retention_churnrisk_downloadbtn}  ${string_exportdata}
    Churn Risk expand icon  ${retention_churnrisk_expandbtn}  ${string_maximize}
    Retention download icon  ${retention_downloadbtn}  ${string_exportdata}
    Retention expand icon  ${retention_expandbtn}  ${string_maximize}

Download button function - Retention Tab
    [Tags]  Explore_Regression
    Click download and verify the chart should still be visible - Churn Rate Insights
    Click download and verify the chart should still be visible - Churn Risk
    Click download and verify the chart should still be visible - Retention

Pendo hover validation - Retention Tab
    [Tags]  Explore_Regression
    [Template]  Click on pendo ques icon and verify the text
    ChurnRisk  ${retention_churnRisk_quesBtn}  ${retention_churnRisk_quesBtn_stringAttrubute}
    RetentionA  ${retention_quesBtn}  ${retention_retention_helpTxtA}
    RetentionB  ${retention_quesBtn}  ${retention_retention_helpTxtB}
    RetentionC  ${retention_quesBtn}  ${retention_retention_helpTxtC}
    RetentionC  ${retention_quesBtn}  ${retention_retention_helpTxtD}

verify by clicking icons for all the widgets in retention screen
    [Tags]  Explore_Regression
    [Template]  validate clicking widget icons in retention screen
    CRI icons  ${retention_churnratesinsights_downloadbtn}  ${retention_churnratesinsights_expandbtn}  ${retention_churnratesinsightslabeltxt}   ${retention_fullview_downloadbtn}
    Churn Risk icons  ${retention_churnrisk_downloadbtn}  ${retention_churnrisk_expandbtn}  ${retention_churnrisklabeltxt}  ${retention_fullview_downloadbtn}
    Retention icons  ${retention_downloadbtn}  ${retention_expandbtn}  ${retention_retentionlabeltxt}  ${retention_fullview_downloadbtn}

validation of download button fuction by clicking any bar for retention screen widgets
    [Tags]  Explore_Regression
     validate download button fuction by clicking any bar from widgets in retention screen

CRI expand and validate
    [Tags]  Explore_Regression
     expand CRI and validate data

disabling all legend buttons in CRI fullview
    [Tags]  Explore_Regression
     Disable all the legends in CRI fullview

getting data from CRI tooltip
     [Tags]  Explore_Regression
     [Template]  enable each legend btn and validate data from the bar in CRI fullview
     Enable <20M  ${retention_CRI_fullView_<20M}  ${retention_CRI_fullView_<20M_barS}  ${retention_CRI_fullView_tooltip_<20M}
     Enable 20M  ${retention_CRI_fullview_20M}  ${retention_CRI_fullView_20M_barS}  ${retention_CRI_fullview_tooltip_20M}
     Enable 50M  ${retention_CRI_fullview_50M}  ${retention_CRI_fullview_50M_barS}  ${retention_CRI_fullview_tooltip_50M}
     Enable 300M  ${retention_CRI_fullview_300M}  ${retention_CRI_fullview_300M_barS}  ${retention_CRI_fullview_tooltip_300M}
     Enable 1G  ${retention_CRI_fullview_1G}  ${retention_CRI_fullview_1G_barS}  ${retention_CRI_fullview_tooltip_1G}

navigate back to retention widgets screen
    [Tags]  Explore_Regression
     go back to retention widgets screen

CRI expand and validate drilldown data
    [Tags]  Explore_Regression
     expand CRI and validate data

validating bar charts under dropdown
    [Tags]  Explore_Regression
     validate dropdown by clicking any bar chart of CRI
     verify elements under dropdown of CRI

validating subscriber usage widget under cri
    [Tags]  Explore_Regression
     validating bar data from Subscriber Usage widget under CRI

validation of legends button for widgets under CRI dropdwon
    [Tags]  Explore_Regression
    [Template]  validate legends button for widgets under CRI dropdwon
    Comp Visit Btn  ${retention_ChurnRatesInsight_drillDown_compVisitBtn}  ${retention_ChurnRatesInsight_drillDown_compVisit_hidden}
    Speed test btn  ${retention_ChurnRatesInsight_drillDown_speedTestBtn}  ${retention_ChurnRatesInsight_drillDown_speedTest_hidden}
    Upstream btn  ${retention_ChurnRatesInsight_drillDown_serviceLimits_upstreamBtn}  ${retention_ChurnRatesInsight_drillDown_serviceLimits_upstreamBtn_hidden}
    Downstream btn  ${retention_ChurnRatesInsight_drillDown_serviceLimits_downstreamBtn}  ${retention_ChurnRatesInsight_drillDown_serviceLimits_downStreamBtn_hidden}
    wifi score btn  ${retention_ChurnRatesInsight_drillDown_devAndwifiTrend_wifiScore}  ${retention_ChurnRatesInsight_drillDown_devAndwifiTrend_wifiScore_hidden}
    Devices btn  ${retention_ChurnRatesInsight_drillDown_devAndwifiTrend_devices}  ${retention_ChurnRatesInsight_drillDown_devAndwifiTrend_devices_hidden}
    Service tier change btn  ${retention_ChurnRatesInsight_drillDown_serviceTierChangebtn}  ${retention_ChurnRatesInsight_drillDown_serviceTierChange_hidden}

navigate back to retention widgets screen
    [Tags]  Explore_Regression
     go back to retention widgets screen