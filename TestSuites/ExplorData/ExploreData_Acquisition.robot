*** Settings ***
Suite Setup   Run Keywords
...   Explore data api calls  AND
...   Launch the Application and navigate to cmc  AND
...   click on explore data  AND
...   Navigate to 2 Prior Months
Suite Teardown    Close the browsers
Resource     ../../TestSuites/Base.robot

*** Test Cases ***
navigate to acquisition and validate
    [Tags]  Explore_Regression  Explore_Sanity
     navigate to acquisition under basic tab
     verify elements on acquisition screen
     Match the total acquired count with labels combined on bar chart - NewSubsByServiceTier
     Match the total acquired count with labels combined on bar chart - AcqRevInsights
     Match the total acquired count with labels combined on bar chart - AcqRateInsights

validation of titles for widget icons in acquisition screen
    [Tags]  Explore_Regression
    [Template]  validating widget icons data with mouse over in acquisition tab
    New subscribers by STT download icon  ${acquisition_newsubsriberbysst_downloadbtn}  ${string_exportdata}
    New subscribers by STT expand icon  ${acquisition_newsubsriberbysst_expandbtn}  ${string_maximize}
    Acquisition Rev and Insights download icon  ${acquisition_acquisitionrevenue&insights_downloadbtn}  ${string_exportdata}
    Acquisition Rev and Insights expand icon  ${acquisition_acquisitionrevenue&insights_expandbtn}  ${string_maximize}
    Acquisition rates & Insights download icon  ${acquisition_acquisitionrate&insights_downloadbtn}  ${string_exportdata}
    Acquisition rates & Insights expand icon  ${acquisition_acquisitionrate&insights_expandbtn}  ${string_maximize}

Download button function - Acquisition Tab
    [Tags]  Explore_Regression
    Click download and verify the chart should still be visible - New Subs Service Tier
    Click download and verify the chart should still be visible - Acquisition Rev Insights
    Click download and verify the chart should still be visible - Acquisition Rate Insights

verify by clicking icons for all the widgets in acquisition screen
    [Tags]  Explore_Regression
    [Template]  validate clicking widget icons in acquisition screen
    New subscriber by sst icons   ${acquisition_newsubsriberbysst_downloadbtn}  ${acquisition_newsubsriberbysst_expandbtn}  ${acquisition_newsubsriberbysstlabeltxt}   ${acquisition_fullview_downloadbtn}
    Acquisition revenue& insights icons   ${acquisition_acquisitionrevenue&insights_downloadbtn}  ${acquisition_acquisitionrevenue&insights_expandbtn}  ${acquisition_acquisitionrevenue&insightslabeltxt}  ${acquisition_fullview_downloadbtn}
    Acquisition rate& insights icons   ${acquisition_acquisitionrate&insights_downloadbtn}  ${acquisition_acquisitionrate&insights_expandbtn}  ${acquisition_acquisitionrate&insightslabeltxt}  ${acquisition_fullview_downloadbtn}

validation of download button by clicking any bar for acquisition screen widgets
    [Tags]  Explore_Regression
    [Template]  validate download button fuction by clicking any bar from widget in Acquisition screen
    New sub by STT widget  ${acquisition_newsubsriberbysst_expandbtn}  ${acquisition_newsubsriberbysst_fullview_3rdbar}
    Acquisition Rev & Insights widget  ${acquisition_acquisitionrevenue&insights_expandbtn}  ${acquisition_acquisitionrevenue&insights_fullview_1stbar}
    Acquisition Rate & Insights Widget  ${acquisition_acquisitionrate&insights_expandbtn}   ${acquisition_acquisitionRate$Insights_color2_5thbar}

ARI expand and validate
    [Tags]  Explore_Regression
    expand ARI and validate data

disabling all legend buttons in ARI fullview
    [Tags]  Explore_Regression
     Disable all the legends in Acquisition Rate fullview

getting data from ARI tooltip
     [Tags]  Explore_Regression
     [Template]  enable each legend btn and validate data from the bar in ARI fullview
     Enable <20M  ${acquisition_ARI_fullView_<20M}  ${retention_CRI_fullView_<20M_barS}  ${retention_CRI_fullView_tooltip_<20M}
     Enable 20M  ${acquisition_ARI_fullview_20M}  ${retention_CRI_fullView_20M_barS}  ${retention_CRI_fullview_tooltip_20M}
     Enable 50M  ${acquisition_ARI_fullview_50M}  ${retention_CRI_fullview_50M_barS}  ${retention_CRI_fullview_tooltip_50M}
     Enable 300M  ${acquisition_ARI_fullview_300M}  ${retention_CRI_fullview_300M_barS}  ${retention_CRI_fullview_tooltip_300M}
     Enable 1G  ${acquisition_ARI_fullview_1G}  ${retention_CRI_fullview_1G_barS}  ${retention_CRI_fullview_tooltip_1G}

navigate back to acquisition widgets screen
    [Tags]  Explore_Regression
     go back to acquisition widgets page

ARI expand and validate drilldown data
    [Tags]  Explore_Regression
    expand ARI and validate data

Validating data under dropdown of ARI
    [Tags]  Explore_Regression
     validate dropdown by clicking any bar chart of ARI

disabling legend buttons and getting graph data from subscriber usage table
     [Tags]  Explore_Regression
     [Template]  disable legend buttons and get tooltip data for subscriber usage under dropdown value
     Disabled streaming & gaming  ${acquisition_acquisitionrate&insights_drilldown_streamingusagebtn}  ${acquisition_acquisitionrate&insights_drilldown_gamingusagebtn}  ${acquisition_acquisitionrate&insights_drilldown_subusage_barlocation1}   ${acquisition_acquisitionRate&Insights_drillDown_subUsage_tooltipLocation}  ${acquisition_acquisitionrate&insights_drilldown_streamingusagebtndisabled}  ${acquisition_acquisitionrate&insights_drilldown_gamingusagebtndisabled}
     Disabled gaming & other  ${acquisition_acquisitionrate&insights_drilldown_gamingusagebtn}  ${acquisition_acquisitionrate&insights_drilldown_otherusagebtn}  ${acquisition_acquisitionrate&insights_drilldown_subusage_barlocation2}   ${acquisition_acquisitionRate&Insights_drillDown_subUsage_tooltipLocation}   ${acquisition_acquisitionrate&insights_drilldown_gamingusagebtndisabled}  ${acquisition_acquisitionrate&insights_drilldown_otherusagebtndisabled}
     Disabled other & streaming  ${acquisition_acquisitionrate&insights_drilldown_otherusagebtn}  ${acquisition_acquisitionrate&insights_drilldown_streamingusagebtn}   ${acquisition_acquisitionrate&insights_drilldown_subusage_barlocation3}   ${acquisition_acquisitionRate&Insights_drillDown_subUsage_tooltipLocation}   ${acquisition_acquisitionrate&insights_drilldown_otherusagebtndisabled}  ${acquisition_acquisitionrate&insights_drilldown_streamingusagebtndisabled}

scroll to pie chart and validate
    [Tags]  Explore_Regression
     scrolling to Usage by application pie under drilldown and validate

validating legend buttons and Top applications data under ARI
    [Tags]  Explore_Regression
     validate legend buttons for service limits widget under ARI dropdwon
     validate legend buttons for dev and wifi score widget under ARI dropdwon
     validate the table data for Top applications

validation of download buttons for lenses under ARI dropdown
    [Tags]  Explore_Regression
    [Template]  click and validate download buttons for lenses under ARI dropdwon
    Subscriber Revenue dLoad btn  ${acquisition_acquisitionrate&insights_drilldown_lens1downloadbtn}
    Subscriber Usage dLoad btn  ${acquisition_acquisitionrate&insights_drilldown_lens2downloadbtn}
    Usage by application dLoad btn  ${acquisition_acquisitionrate&insights_drilldown_lens3downloadbtn}
    Service Limits dLoad btn  ${acquisition_acquisitionrate&insights_drilldown_lens4downloadbtn}
    Devices and Wifi score dLoad btn  ${acquisition_acquisitionrate&insights_drilldown_lens5downloadbtn}
    Top Applications dLoad btn  ${acquisition_acquisitionrate&insights_drilldown_lens6downloadbtn}

navigate back to acquisition widgets screen from lenses
    [Tags]  Explore_Regression
     go back to acquisition widgets page

Decimal point should not be present for upstream and downstream in acquisition revenue drilldown table
    [Tags]  Explore_Regression
     Drilldown acquisition revenue chart and validate upstream and downstream data should not contain decimal points