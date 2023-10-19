*** Settings ***
Library    SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Resource    ../PO/CommonWrapper.robot
Resource    ../PO/ExploreDataPO_subscriber.robot


*** Variables ***
${retentionTab}=   id=retentionData-list-menu
${retention_ChurnRatesInsightslabelTxt}=   Churn Rate & Insights
${retention_ChurnRatesInsightsChart}=  //*[@id='churn-rate-insights-chart']
${retention_ChurnRatesInsights_totalChurnSubsCount}=  //*[@class='greyaa mb0 heading-subtitle']
${retention_ChurnRatesInsights_quesBtn}=   id=churnRateModelOpen
${retention_ChurnRatesInsights_quesBtn_stringAttrubute}=   The overall churn rate and deeper insights per subscriber.
${retention_ChurnRatesInsights_downloadBtn}=   id=churnRateDownloadSection
${retention_ChurnRatesInsights_expandBtn}=   id=churnRateExpandSection
${acquisition_ChurnRate&Insights_barDataList}=  //*[@id='churn-rate-insights-chart']//*[contains(@class,'label highcharts-stack-labels')]//*[@class='highcharts-text-outline']
${retention_ChurnRate&Insights_yaxis_0}=  //*[@id='churn-rate-insights-chart']//*[contains(@class,'yaxis-labels')]//*[text()='0']
${retention_fullView_quesBtn}=   id=retentionChartModalFullScreen
${retention_fullView_downloadBtn}=   id=retentionChartFullViewDownlod


${retention_ChurnRatesInsights_/fullview_color3_1stbar}=  //*[@id='Churn Rate & Insights']//*[contains(@class,'highcharts-color-2 highcharts-tracker')]//*[2]
${retention_ChurnRatesInsights_fullView_ExportAllSubsHistoryBtn}=   //button[contains(.,'Export All Subscriber History')]
${retention_CRI_fullView_<20M}=  (//*[text()='<20M'])[2]
${retention_CRI_fullView_<20M_barS}=  //*[@class='subscriber-details d-block']//*[@class='highcharts-point highcharts-color-0']
${retention_CRI_fullView_<20M_bar1}=  //*[@class='subscriber-details d-block']//*[@class='highcharts-point highcharts-color-0'][]
${retention_CRI_fullView_<20M_bar2}=  //*[@class='highcharts-point highcharts-color-0'][]
${retention_CRI_fullView_<20M_bar3}=  //*[@class='highcharts-point highcharts-color-0'][]
${retention_CRI_fullView_<20M_bar4}=  //*[@class='highcharts-point highcharts-color-0'][]
${retention_CRI_fullView_<20M_bar5}=  //*[@class='highcharts-point highcharts-color-0'][]
${retention_CRI_fullView_<20M_bar6}=  //*[@class='highcharts-point highcharts-color-0'][]
${retention_CRI_fullView_tooltip_<20M}=  //*[@class='highcharts-label highcharts-tooltip highcharts-color-0']

${retention_CRI_fullview_20M+}=  (//*[text()='20M+'])[2]
${retention_CRI_fullView_20M+_barS}=  //*[@class='subscriber-details d-block']//*[@class='highcharts-point highcharts-color-1']
${retention_CRI_fullView_20M+_bar1}=  //*[@class='highcharts-point highcharts-color-1'][]
${retention_CRI_fullView_20M+_bar2}=  //*[@class='highcharts-point highcharts-color-1'][]
${retention_CRI_fullView_20M+_bar3}=  //*[@class='highcharts-point highcharts-color-1'][]
${retention_CRI_fullView_20M+-bar4}=  //*[@class='highcharts-point highcharts-color-1'][]
${retention_CRI_fullView_20M+_bar5}=  //*[@class='highcharts-point highcharts-color-1'][]
${retention_CRI_fullView_20M+_bar6}=  //*[@class='highcharts-point highcharts-color-1'][]
${retention_CRI_fullview_tooltip_20M+}=  //*[@class='highcharts-label highcharts-tooltip highcharts-color-1']

${retention_CRI_fullview_20M}=  (//*[text()='20M'])[2]
${retention_CRI_fullView_20M_barS}=  //*[@class='subscriber-details d-block']//*[@class='highcharts-point highcharts-color-1']
${retention_CRI_fullView_20M_bar1}=  //*[@class='highcharts-point highcharts-color-1'][]
${retention_CRI_fullView_20M_bar2}=  //*[@class='highcharts-point highcharts-color-1'][]
${retention_CRI_fullView_20M_bar3}=  //*[@class='highcharts-point highcharts-color-1'][]
${retention_CRI_fullView_20M-bar4}=  //*[@class='highcharts-point highcharts-color-1'][]
${retention_CRI_fullView_20M_bar5}=  //*[@class='highcharts-point highcharts-color-1'][]
${retention_CRI_fullView_20M_bar6}=  //*[@class='highcharts-point highcharts-color-1'][]
${retention_CRI_fullview_tooltip_20M}=  //*[@class='highcharts-label highcharts-tooltip highcharts-color-1']

${retention_CRI_fullview_50M+}=  (//*[text()='50M+'])[2]
${retention_CRI_fullview_50M+_barS}=   //*[@class='subscriber-details d-block']//*[@class='highcharts-point highcharts-color-2']
${retention_CRI_fullview_50M+_bar1}=  //*[@class='highcharts-point highcharts-point-select highcharts-color-2'])
${retention_CRI_fullview_50M+_bar2}=  //*[@class='highcharts-point highcharts-color-2'][]
${retention_CRI_fullview_50M+_bar3}=  //*[@class='highcharts-point highcharts-color-2'][]
${retention_CRI_fullview_50M+_bar4}=  //*[@class='highcharts-point highcharts-color-2'][]
${retention_CRI_fullview_50M+_bar5}=  //*[@class='highcharts-point highcharts-color-2'][]
${retention_CRI_fullview_50M+_bar6}=  //*[@class='highcharts-point highcharts-color-2'][]
${retention_CRI_fullview_tooltip_50M+}=  //*[@class='highcharts-label highcharts-tooltip highcharts-color-2']

${retention_CRI_fullview_50M}=  (//*[text()='50M'])[2]
${retention_CRI_fullview_50M_barS}=   //*[@class='subscriber-details d-block']//*[@class='highcharts-point highcharts-color-2']
${retention_CRI_fullview_50M_bar1}=  //*[@class='highcharts-point highcharts-point-select highcharts-color-2'])
${retention_CRI_fullview_50M_bar2}=  //*[@class='highcharts-point highcharts-color-2'][]
${retention_CRI_fullview_50M_bar3}=  //*[@class='highcharts-point highcharts-color-2'][]
${retention_CRI_fullview_50M_bar4}=  //*[@class='highcharts-point highcharts-color-2'][]
${retention_CRI_fullview_50M_bar5}=  //*[@class='highcharts-point highcharts-color-2'][]
${retention_CRI_fullview_50M_bar6}=  //*[@class='highcharts-point highcharts-color-2'][]
${retention_CRI_fullview_tooltip_50M}=  //*[@class='highcharts-label highcharts-tooltip highcharts-color-4']

${retention_CRI_fullview_300M+}=  (//*[text()='300M+'])[2]
${retention_CRI_fullview_300M+_barS}=  //*[@class='subscriber-details d-block']//*[@class='highcharts-point highcharts-color-3']
${retention_CRI_fullview_300M+_bar1}=  //*[@class='highcharts-point highcharts-color-3'][]
${retention_CRI_fullview_300M+_bar2}=  //*[@class='highcharts-point highcharts-color-3'][]
${retention_CRI_fullview_300M+_bar3}=  //*[@class='highcharts-point highcharts-color-3'][]
${retention_CRI_fullview_300M+_bar4}=  //*[@class='highcharts-point highcharts-color-3'][]
${retention_CRI_fullview_300M+_bar5}=  //*[@class='highcharts-point highcharts-color-3'][]
${retention_CRI_fullview_300M+_bar6}=  //*[@class='highcharts-point highcharts-color-3'][]
${retention_CRI_fullview_tooltip_300M+}=  //*[@class='highcharts-label highcharts-tooltip highcharts-color-3']

${retention_CRI_fullview_300M}=  (//*[text()='80M'])[2]
${retention_CRI_fullview_300M_barS}=  //*[@class='subscriber-details d-block']//*[@class='highcharts-point highcharts-color-7']
${retention_CRI_fullview_300M_bar1}=  //*[@class='highcharts-point highcharts-color-3'][]
${retention_CRI_fullview_300M_bar2}=  //*[@class='highcharts-point highcharts-color-3'][]
${retention_CRI_fullview_300M_bar3}=  //*[@class='highcharts-point highcharts-color-3'][]
${retention_CRI_fullview_300M_bar4}=  //*[@class='highcharts-point highcharts-color-3'][]
${retention_CRI_fullview_300M_bar5}=  //*[@class='highcharts-point highcharts-color-3'][]
${retention_CRI_fullview_300M_bar6}=  //*[@class='highcharts-point highcharts-color-3'][]
${retention_CRI_fullview_tooltip_300M}=  //*[@class='highcharts-label highcharts-tooltip highcharts-color-7']

${retention_CRI_fullview_1G}=  (//*[text()='1000M'])[2]
${retention_CRI_fullview_1G_barS}=  //*[@class='subscriber-details d-block']//*[@class='highcharts-point highcharts-color-8']
${retention_CRI_fullview_1G_bar1}=  //*[@class='highcharts-point highcharts-color-4'][]
${retention_CRI_fullview_1G_bar2}=  //*[@class='highcharts-point highcharts-color-4'][]
${retention_CRI_fullview_1G_bar3}=  //*[@class='highcharts-point highcharts-color-4'][]
${retention_CRI_fullview_1G_bar4}=  //*[@class='highcharts-point highcharts-color-4'][]
${retention_CRI_fullview_1G_bar5}=  //*[@class='highcharts-point highcharts-color-4'][]
${retention_CRI_fullview_1G_bar6}=  //*[@class='highcharts-point highcharts-color-4'][]
${retention_CRI_fullview_tooltip_1G}=  //*[@class='highcharts-label highcharts-tooltip highcharts-color-8']

${retention_CRI_fullview_group}=  (//*[text()='group'])[2]


${retention_ChurnRatesInsights_color2_1stbar}=   //*[@id='churn-rate-insights-chart']//*[contains(@class,'highcharts-color-2 highcharts-tracker')]//*[2]
${retention_ChurnRatesInsights_color2_HoverData}=   //*[@class="highcharts-label highcharts-tooltip highcharts-color-2"]
${retention_ChurnRatesInsights_color3_1stbar}=  (//*[@class="highcharts-series highcharts-series-3 highcharts-column-series highcharts-color-3 highcharts-tracker"])[2]//*[1]
${retention_ChurnRatesInsights_color3_HoverData}=   //*[@class="highcharts-label highcharts-tooltip highcharts-color-3"]
${retention_ChurnRatesInsights_color4_1stbar}=   (//*[@class="highcharts-series highcharts-series-4 highcharts-column-series highcharts-color-4 highcharts-tracker"])[2]//*[1]
${retention_ChurnRatesInsights_color4_HoverData}=   //*[@class="highcharts-label highcharts-tooltip highcharts-color-4"]


${retention_ChurnRatesInsights_color2_2ndbar}=   (//*[@class="highcharts-series highcharts-series-2 highcharts-column-series highcharts-color-2 highcharts-tracker"])[2]//*[2]
${retention_ChurnRatesInsights_color3_2ndbar}=   (//*[@class="highcharts-series highcharts-series-3 highcharts-column-series highcharts-color-3 highcharts-tracker"])[2]//*[2]
${retention_ChurnRatesInsights_color4_2ndbar}=   (//*[@class="highcharts-series highcharts-series-4 highcharts-column-series highcharts-color-4 highcharts-tracker"])[2]//*[2]

${retention_ChurnRatesInsights_color2_3rdbar}=   (//*[@class="highcharts-series highcharts-series-2 highcharts-column-series highcharts-color-2 highcharts-tracker"])[2]//*[3]
${retention_ChurnRatesInsights_color3_3rdbar}=   (//*[@class="highcharts-series highcharts-series-3 highcharts-column-series highcharts-color-3 highcharts-tracker"])[2]//*[3]
${retention_ChurnRatesInsights_color4_3rdbar}=   (//*[@class="highcharts-series highcharts-series-4 highcharts-column-series highcharts-color-4 highcharts-tracker"])[2]//*[3]

${retention_ChurnRatesInsights_color2_4thbar}=   (//*[@class="highcharts-series highcharts-series-2 highcharts-column-series highcharts-color-2 highcharts-tracker"])[2]//*[4]
${retention_ChurnRatesInsights_color3_4thbar}=   (//*[@class="highcharts-series highcharts-series-3 highcharts-column-series highcharts-color-3 highcharts-tracker"])[2]//*[4]
${retention_ChurnRatesInsights_color4_4thbar}=   (//*[@class="highcharts-series highcharts-series-4 highcharts-column-series highcharts-color-4 highcharts-tracker"])[2]//*[4]

${retention_ChurnRatesInsights_color2_5thbar}=   (//*[@class="highcharts-series highcharts-series-2 highcharts-column-series highcharts-color-2 highcharts-tracker"])[2]//*[5]
${retention_ChurnRatesInsights_color3_5thbar}=   (//*[@class="highcharts-series highcharts-series-3 highcharts-column-series highcharts-color-3 highcharts-tracker"])[2]//*[5]
${retention_ChurnRatesInsights_color4_5thbar}=   (//*[@class="highcharts-series highcharts-series-4 highcharts-column-series highcharts-color-4 highcharts-tracker"])[2]//*[5]


${retention_ChurnRatesInsights_color2_6thbar}=   (//*[@class="highcharts-series highcharts-series-2 highcharts-column-series highcharts-color-2 highcharts-tracker"])[2]//*[6]
${retention_ChurnRatesInsights_color3_6thbar}=   (//*[@class="highcharts-series highcharts-series-3 highcharts-column-series highcharts-color-3 highcharts-tracker"])[2]//*[6]
${retention_ChurnRatesInsights_color4_6thbar}=   (//*[@class="highcharts-series highcharts-series-4 highcharts-column-series highcharts-color-4 highcharts-tracker"])[2]//*[6]



${retention_ChurnRateInsights_color2_1stbar_drillDowntable}=   id=retentionInsightsChartFullview
${retention_ChurnRatesInsights_color2_1stBar_1stvalueDropdown}=   //*[@id='retentionInsightsChartFullview']//tbody//tr[1]//td[1]//i
${retention_ChurnRatesInsight_drillDown_subscriberUsagetxt}=   Subscriber Usage
${retention_drillDown_subscriberUsage_totalUsage}=   id=churn-subscriber-usage-total
${retention_ChurnRatesInsight_drillDown_streamingUsageBtn}=   //*[text()='Streaming Usage']
${retention_ChurnRatesInsight_drillDown_gamingUsageBtn}=   //*[text()='Gaming Usage']
${retention_ChurnRatesInsight_drillDown_otherUsageBtn}=   //*[text()='Other Usage']
${retention_ChurnRatesInsight_drillDown_subscriberUsage_xaxis}=   (//*[@class="highcharts-axis-labels highcharts-xaxis-labels"])[3]
${retention_ChurnRatesInsight_drillDown_subscriberUsage_yaxis}=   (//*[@class="highcharts-axis-labels highcharts-yaxis-labels"])[3]
${retention_ChurnRatesInsight_drillDown_subscriberUsageBarPath}=  //*[@id='churn-subscriber-usage']//*[contains(@class,'highcharts-point highcharts')]
${retention_ChurnRatesInsight_drillDown_subscriberUsageTooltip}=  //*[@id='churn-subscriber-usage']//*[contains(@class,'highcharts-tooltip')]//span
${retention_ChurnRatesInsight_drillDown_subscriberUsageBar1Path}=  (//*[@id='churn-subscriber-usage']//*[@class='highcharts-point highcharts-color-0'])[1]
${retention_ChurnRatesInsight_drillDown_subscriberUsageBar2Path}=  (//*[@id='churn-subscriber-usage']//*[@class='highcharts-point highcharts-color-0'])[2]
${retention_ChurnRatesInsight_drillDown_subscriberUsageBar_tooltip1}=  (//*[@class='highcharts-label highcharts-tooltip highcharts-color-1'])[2]
${retention_ChurnRatesInsight_drillDown_subscriberUsageBar_tooltip2}=  (//*[@class='highcharts-label highcharts-tooltip highcharts-color-0'])[2]
${retention_ChurnRatesInsight_drillDown_subscriberUsageBar_tooltip3}=  (//*[@class='highcharts-label highcharts-tooltip highcharts-color-0'])[2]

${retention_ChurnRatesInsight_drillDown_compVisitAndTestMinutestxt}=   Competitor Visit and Speed Test Minutes
${retention_ChurnRatesInsight_drillDown_subscriberUsage_speedTestMinutes}=   id=churn-speed-test-total
${retention_ChurnRatesInsight_drillDown_compVisitBtn}=   //*[text()='Competitor Visit']
${retention_ChurnRatesInsight_drillDown_compVisit_hidden}=  //*[@class='highcharts-legend-item highcharts-column-series highcharts-color-0 highcharts-series-0 highcharts-legend-item-hidden']
${retention_ChurnRatesInsight_drillDown_speedTestBtn}=   //*[text()='Speed Test']
${retention_ChurnRatesInsight_drillDown_speedTest_hidden}=  //*[@class='highcharts-legend-item highcharts-column-series highcharts-color-1 highcharts-series-1 highcharts-legend-item-hidden']
${retention_ChurnRatesInsight_drillDown_compvisitandTest_xaxis}=   (//*[@class="highcharts-axis-labels highcharts-xaxis-labels"])[5]
${retention_ChurnRatesInsight_drillDown_compvisitandText_yaxis}=   (//*[@class="highcharts-axis-labels highcharts-yaxis-labels"])[5]
${retention_ChurnRatesInsight_drillDown_serviceTierChangetxt}=   Service Tier Change Events
${retention_ChurnRatesInsight_drillDown_serviceTierChangebtn}=   //*[@class="highcharts-legend-item highcharts-scatter-series highcharts-color-0 highcharts-series-0"]
${retention_ChurnRatesInsight_drillDown_serviceTierChange_hidden}=  //*[@class='highcharts-legend-item highcharts-scatter-series highcharts-color-0 highcharts-series-0 highcharts-legend-item-hidden']
${retention_ChurnRatesInsight_drillDown_serviceLimitstxt}=   Service Limits
${retention_ChurnRatesInsight_drillDown_serviceLimits_xaxis}=   (//*[@class="highcharts-axis-labels highcharts-xaxis-labels"])[4]
${retention_ChurnRatesInsight_drillDown_serviceLimits_yaxis}=   (//*[@class="highcharts-axis-labels highcharts-yaxis-labels"])[4]
${retention_ChurnRatesInsight_drillDown_serviceLimits_upstreamBtn}=   (//*[@class="highcharts-legend-item highcharts-line-series highcharts-color-1 highcharts-series-1"])[1]
${retention_ChurnRatesInsight_drillDown_serviceLimits_downstreamBtn}=   (//*[@class="highcharts-legend-item highcharts-line-series highcharts-color-0 highcharts-series-0"])[1]
${retention_ChurnRatesInsight_drillDown_devAndwifiTrendtxt}=   Devices and Wi-Fi Score Trend
${retention_ChurnRatesInsight_drillDown_devAndwifiTrend_wifiScore}=   (//*[@class="highcharts-legend-item highcharts-column-series highcharts-color-0 highcharts-series-0"])[5]
${retention_ChurnRatesInsight_drillDown_devAndwifiTrend_wifiScore_hidden}=  //*[@class='highcharts-legend-item highcharts-column-series highcharts-color-0 highcharts-series-0 highcharts-legend-item-hidden']
${retention_ChurnRatesInsight_drillDown_devAndwifiTrend_barPath}=  (//*[@class='highcharts-series highcharts-series-0 highcharts-column-series highcharts-color-0 highcharts-tracker'])[5]//*
${retention_ChurnRatesInsight_drillDown_devAndwifiTrend_barTooltip}=  (//*[@class='highcharts-label highcharts-tooltip highcharts-color-0'])[5]
${retention_ChurnRatesInsight_drillDown_devAndwifiTrend_devices}=   (//*[@class="highcharts-legend-item highcharts-line-series highcharts-color-1 highcharts-series-1"])[2]
${retention_ChurnRatesInsight_drillDown_devAndwifiTrend_devices_hidden}=  //*[@class='highcharts-legend-item highcharts-line-series highcharts-color-1 highcharts-series-1 highcharts-legend-item-hidden']
${retention_ChurnRatesInsight_drillDown_devAndwifiTrend_xaxis}=   (//*[@class="highcharts-axis-labels highcharts-xaxis-labels"])[6]
${retention_ChurnRatesInsight_drillDown_devAndwifiTrend_yaxis}=   (//*[@class="highcharts-axis-labels highcharts-yaxis-labels"])[6]
${retention_ChurnRatesInsight_drillDown_serviceLimits_upstreamBtn_hidden}=   //*[@class='highcharts-legend-item highcharts-line-series highcharts-color-1 highcharts-series-1 highcharts-legend-item-hidden']
${retention_ChurnRatesInsight_drillDown_serviceLimits_downStreamBtn_hidden}=   //*[@class='highcharts-legend-item highcharts-line-series highcharts-color-0 highcharts-series-0 highcharts-legend-item-hidden']
${exportChartData}=  //button[contains(.,"Export Chart Data")]

${retention_churnRiskLabelTxt}=   Churn Risk
${retention_ChurnRiskChart}=  //*[@id='retentionChurnTable']
${retention_churnRisk_pendo_helpTxt}=  Subscribers who may churn in the next 3 months with a 50% or higher confidence level. Confidence scores are categorized by High, Medium, and Low.
${retention_churnRisk_quesBtn}=   //*[@id='_pendo-badge_uJlxg04yKfOf6NZUPAk147wHHKQ']//*[contains(@id,'pendo')]
${retention_churnRisk_quesBtn_stringAttrubute}=   Subscribers who may churn in the next 3 months with a 50% or higher confidence level. Confidence scores are categorized by High, Medium, and Low.
${retention_churnRisk_downloadBtn}=   id=churnRiskDownloadSection
${retention_churnRisk_expandBtn}=   id=churnRiskExpandSection
${retention_churnRisk_thName}=  //*[@id='retentionChurnTable']//th[contains(text(),'Name')]
${retention_churnRisk_thScore}=  //*[@id='retentionChurnTable']//th[contains(text(),'Score')]


${retention_retentionLabeltxt}=   Retention
${retention_retentionChart}=  //*[@id='retentionTable']
${retention_quesBtn}=   //*[@id='_pendo-badge_VoNMNQHXrjpLjuPtRJLLpFiRVuI']//*[contains(@id,'pendo')]
${retention_quesBtn_stringAttrubute}=  Data on subscriber behavior and the overall subscriber service experience.
${retention_downloadBtn}=   id=RetentionDownloadSection
${retention_expandBtn}=   id=RetentionExpandSection
${retention_retention_helpTxtA}=  This widget provides data on subscriber behavior and the overall subscriber service experience. The following three behavioral insights are available:
${retention_retention_helpTxtB}=  Service Limit: Provides the number of times the subscriber's traffic usage reaches 90% of the max service rate.
${retention_retention_helpTxtC}=  Speed Test: Provides the minutes visiting the speed test website from Ookla in the last time period selected (30 days, prior month, or 2 prior months).
${retention_retention_helpTxtD}=  Competitor Visits: Provides the minutes visiting a competitor's website in the last time period selected.
${retention_retention_thName}=  //*[@id='retentionTable']//th[contains(text(),'Name')]
${retention_retention_thServLimit}=  //*[@id='retentionTable']//th[contains(text(),'Service Limit Down / Up')]
${retention_retention_thSpeedTest}=  //*[@id='retentionTable']//th[contains(text(),'Speed Tests')]
${retention_retention_thCompVisits}=  //*[@id='retentionTable']//th[contains(text(),'Competitor Visits')]


${retentionscreen}=  retentionScreen
${drilldownCRIscreen}=  drilldownCRI_Screen


*** Keywords ***

navigate to retention under basic tab
    click element until enabled  ${retentiontab}
    sleep  5


verify elements on retention screen
    set selenium implicit wait   10 seconds
    @{multitxt}=  Create List   ${retention_churnratesinsightslabeltxt}  ${retention_churnrisklabeltxt}  ${retention_retentionlabeltxt}
    ...  ${retention_retentionlabeltxt}
    wait until page contains multiple text  @{multitxt}

    @{elements}=  Create List   ${retention_churnratesinsights_downloadbtn}   ${retention_churnratesinsights_expandbtn}   ${retention_churnratesinsights_quesbtn}
    ...  ${retention_churnrisk_downloadbtn}   ${retention_churnrisk_expandbtn}   ${retention_churnrisk_quesbtn}
    ...   ${retention_downloadbtn}   ${retention_expandbtn}   ${retention_quesbtn}
    wait until page contain elements  @{elements}
    capture the screen  retentionScreen
    Run Keyword And Ignore Error  validate legend buttons on the screen
    get the text from the element  ${retention_ChurnRatesInsights_totalChurnSubsCount}

Pendo question icons validation in retention tab -exploreDataBasic
    [Documentation]   Verify the pendo icons in Retention tab
    click element until visible   (${exploreData_pendo_questionIcons})[3]
    wait until page contains   ${retention_retention_helptxta}
    wait until page contains   ${retention_retention_helptxtb}
    wait until page contains   ${retention_retention_helptxtc}
    wait until page contains   ${retention_retention_helptxtd}
    Click on pendo ques icon and verify the text  chrunRisk  (${exploreData_pendo_questionIcons})[2]  ${retention_churnrisk_pendo_helptxt}

Floating values on bar charts should contain % icon - ChurnRateInsights
    [Documentation]   Churn Rate & Insights Charts should contains Percentage
    @{elements}=  get webelements  ${acquisition_ChurnRate&Insights_barDataList}
    FOR  ${element}  IN  @{elements}
    ${label}=  get text  ${element}
    should contain  ${label}    %
    END
    page should contain   Total Churn Subscribers:


validating widget icons data with mouse over in retention tab
    [Arguments]  ${testData}  ${webElement}  ${comparingString}
    set selenium implicit wait  10 seconds
    Mouse Over  ${webElement}
    ${tooltipData}=  Get WebElement   ${webElement}
    ${tooltipTitle}=   Call Method   ${tooltipData}   get_attribute   title
    should be equal as strings  ${tooltipTitle}  ${comparingString}


validate clicking widget icons in retention screen
    [Arguments]   ${testName}  ${downloadBtn}  ${expand}  ${headerlbl}   ${fullViewdLoad}
    set selenium implicit wait   10
#    click element until enabled  ${quesBtn}
#    page should contain the element  ${headerlbl}
#    click element until enabled  ${cancel_btn}
#    click element until enabled  ${quesBtn}
#    page should contain the element  ${headerlbl}
#    click element until enabled  ${close_btn}
    click element until enabled   ${downloadBtn}
    sleep  2
    click element until enabled  ${expand}
    capture the screen  ${widgetfullviewscreen}
    page should contain the element  ${headerlbl}
#    click element until enabled  ${fullViewQues}
#    page should contain the element  ${headerlbl}
#    sleep  1
#    click element until enabled  ${cancel_btn}
#    click element until enabled  ${fullViewQues}
#    page should contain the element  ${headerlbl}
#    click element until enabled  ${close_btn}
    click element until enabled  ${fullViewdLoad}
    sleep  2
    click element until enabled  ${expandinvertbtn}
    capture the screen  ${retentionscreen}


validate download button fuction by clicking any bar from widgets in retention screen
#    click element until enabled  ${retention_churnratesinsights_expandbtn}
#    sleep  3
#    execute javascript  window.scrollTo(0, document.body.scrollHeight)
#    sleep  1
    click element until visible  ${retention_churnratesinsights_color2_1stbar}
    click element until visible   ${fullview_dropdowndloadbtn}
    click element until visible   ${exportsubscriberlistbtn}
#    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    click element until visible  ${retention_ChurnRatesInsights_/fullview_color3_1stbar}
    click element until visible  ${fullview_dropdowndloadbtn}
    click element until visible  ${retention_churnratesinsights_fullview_exportallsubshistorybtn}
    click element until visible  ${expandinvertbtn}


expand CRI and validate data
    click element until enabled  ${retention_churnratesinsights_expandbtn}
    sleep  5
    capture the screen  ${widgetfullviewscreen}


Disable all the legends in CRI fullview
    @{elements}=  Get Webelements  //*[@id='Churn Rate & Insights']//*[contains(@class,'legend-item')]//*[1]
    FOR  ${element}  IN  @{elements}
    click element  ${element}
    sleep  1
    END

disable all legend buttons in CRI fullview
    [Arguments]  ${testName}  ${legendBtn}
    sleep  1
    click element  ${legendBtn}


enable each legend btn and validate data from the bar in CRI fullview
    [Arguments]  ${testData}  ${legendBtn}  ${barLocation}  ${tooltipXpath}
    set selenium implicit wait  10 seconds
    click element  ${legendBtn}
    sleep  2
    @{Get_tooltip}=   Get WebElements  ${barLocation}
    FOR  ${barLocation}  IN   @{Get_tooltip}
    mouse over    ${barLocation}
    ${TooltipText}=   get text   ${tooltipXpath}
    sleep  2
    END
    click element  ${legendBtn}


validate dropdown by clicking any bar chart of CRI
    set selenium implicit wait   10 seconds
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    click element until enabled   ${retention_ChurnRatesInsights_/fullview_color3_1stbar}
    wait until page contains element  ${retention_churnrateinsights_color2_1stbar_drilldowntable}
    click element until visible  ${retention_churnratesinsights_color2_1stbar_1stvaluedropdown}

verify elements under dropdown of CRI
    @{multiTxt}=  Create List  ${retention_churnratesinsight_drilldown_compvisitandtestminutestxt}
    ...  ${retention_churnratesinsight_drilldown_servicetierchangetxt}   ${retention_churnratesinsight_drilldown_subscriberusagetxt}
    ...  ${retention_churnratesinsight_drilldown_servicelimitstxt}   ${retention_churnratesinsight_drilldown_devandwifitrendtxt}
    page should contain multiple text  @{multiTxt}

    @{elements}=  Create List  ${retention_churnratesinsight_drilldown_streamingusagebtn}  ${retention_churnratesinsight_drilldown_gamingusagebtn}
    ...  ${retention_churnratesinsight_drilldown_otherusagebtn}  ${retention_churnratesinsight_drilldown_speedtestbtn}  ${retention_churnratesinsight_drilldown_compvisitbtn}
    ...  ${retention_churnratesinsight_drilldown_servicetierchangebtn}  ${retention_churnratesinsight_drilldown_servicelimits_downstreambtn}
    ...  ${retention_churnratesinsight_drilldown_servicelimits_upstreambtn}   ${retention_churnratesinsight_drilldown_devandwifitrend_wifiscore}   ${retention_churnratesinsight_drilldown_devandwifitrend_devices}
    wait until page contain elements  @{elements}
    get the text from the element  ${retention_drilldown_subscriberusage_totalusage}


validating bar data from Subscriber Usage widget under CRI
    set selenium implicit wait  10 seconds
    sleep  2
    @{Bars}=   Get WebElements  ${retention_ChurnRatesInsight_drillDown_subscriberUsageBarPath}
    FOR  ${bar}  IN   @{Bars}
    mouse over    ${bar}
    ${TooltipText}=   get text    ${retention_ChurnRatesInsight_drillDown_subscriberUsageTooltip}
    sleep  2
    END


validate legends button for widgets under CRI dropdwon
    [Arguments]  ${testName}  ${button}  ${buttonHidden}
    set selenium implicit wait  10 seconds
    click element until enabled  ${button}
    sleep  1
    page should contain element  ${buttonHidden}
    click element until enabled  ${buttonHidden}
    sleep  1
    page should contain element  ${button}


go back to retention widgets screen
    click element until enabled  ${expandinvertbtn}
    sleep  2
    capture the screen  ${retentionscreen}

Click download and verify the chart should still be visible - Churn Rate Insights
    [Documentation]  This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible  ${retention_ChurnRatesInsights_downloadBtn}
    Verify expected elements on Churn Rate Insights

Verify expected elements on Churn Rate Insights
#    scroll element into view  ${retention_ChurnRatesInsightsChart}
    @{elements}=  create list  ${retention_ChurnRatesInsights_quesBtn}   ${retention_ChurnRatesInsights_downloadBtn}
    ...  ${retention_ChurnRatesInsights_expandBtn}  ${retention_ChurnRate&Insights_yaxis_0}
    wait until page contain elements  @{elements}
    capture the screen  cri-afterDownloadClick


Click download and verify the chart should still be visible - Churn Risk
    [Documentation]  This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible  ${retention_churnRisk_downloadBtn}
    Verify expected elements on Churn Risk

Verify expected elements on Churn Risk
#    scroll element into view  ${retention_ChurnRiskChart}
    @{elements}=  create list  ${retention_churnRisk_quesBtn}   ${retention_churnRisk_downloadBtn}
    ...  ${retention_churnRisk_expandBtn}
    ...  ${retention_churnRisk_thName}  ${retention_churnRisk_thScore}
    wait until page contain elements  @{elements}
    capture the screen  cRisk-afterDownloadClick


Click download and verify the chart should still be visible - Retention
    [Documentation]  This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible  ${retention_downloadBtn}
    Verify expected elements on Retention

Verify expected elements on Retention
    scroll element into view  ${retention_retentionChart}
    @{elements}=  create list  ${retention_quesBtn}   ${retention_downloadBtn}
    ...  ${retention_expandBtn}
    ...  ${retention_retention_thName}  ${retention_retention_thServLimit}
    ...  ${retention_retention_thSpeedTest}  ${retention_retention_thCompVisits}
    wait until page contain elements  @{elements}
    capture the screen  retention-afterDownloadClick