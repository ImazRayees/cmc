*** Settings ***
Library    SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Resource    ../PO/CommonWrapper.robot
Resource    ../PO/ExploreDataPO_subscriber.robot
Resource    ../PO/ExploreDataPO_retention.robot


*** Variables ***
${acquisitionTab}=   //*[@id='acquisitionData-list-menu']//*[contains(text(),'Acquisition')]
${acquisition_newSubsriberbySSTlabelTxt}=   New Subscribers by Service Tier & Technology
${acquisition_newSubsriberbySSTChart}=  //*[@id='new-subscriber-tier-tech-chart']
${acquisition_newSubsriberbySST_totalAcquiredCount}=  (//*[@class='greyaa mb0 heading-subtitle'])[1]
${acquisition_newSubsriberbySST_quesBtn}=   id=subscriberNewModelOpen
${acquisition_newSubsriberbySST_quesBtn_stringAttrubute}=   The distribution of new subscribers among the service tiers and technology types.
${acquisition_newSubsriberbySST_downloadBtn}=   id=subscriberNewDownloadSection
${acquisition_newSubsriberbySST_expandBtn}=   id=subscriberNewExpandSection
${acquisition_newSubsriberbySST_barDataList}=  //*[@id='new-subscriber-tier-tech-chart']//*[contains(@class,'label highcharts-stack-labels')]//*[@class='highcharts-text-outline']
${acquisition_newSubsriberbySST_yaxis_0}=  //*[@id='new-subscriber-tier-tech-chart']//*[contains(@class,'yaxis-labels')]//*[text()='0']
${acquisition_fullView_quesBtn}=   id=acquisitionModelChart
${acquisition_fullView_downloadBtn}=   id=acquisitionModelChartDownlod
${acquisition_newSubsriberbySST_fullView_3rdBar}=   (//*[@id='New Subscribers by Service Tier & Technology']//*[contains(@class,'highcharts-point')])[1]

${acquisition_acquisitionRevenue&InsightslabelTxt}=  Acquisition Revenue & Insights
${acquisition_acquisitionRevenue&InsightsChart}=  //*[@id='acquisition-revenue-insights-chart']
${acquisition_acquisitionRevenue&Insights_maxRev&ActualRevCount}=  (//*[@class='greyaa mb0 heading-subtitle'])[2]
${acquisition_acquisitionRevenue&Insights_quesBtn}=   id=revenueInsigtModelOpen
${acquisition_acquisitionRevenue&Insights_quesBtn_stringAttrubute}=   Acquisition revenue and insights for the last 6 months.
${acquisition_acquisitionRevenue&Insights_downloadBtn}=   id=revenueInsigtDownloadSection
${acquisition_acquisitionRevenue&Insights_expandBtn}=   id=revenueInsigtExpandSection
${acquisition_acquisitionRevenue&Insights_yaxis_0}=  //*[@id='acquisition-revenue-insights-chart']//*[contains(@class,'yaxis-labels')]//*[text()='0']
${acquisition_acquisitionRevenue&Insights_barDataList}=  //*[@id='acquisition-revenue-insights-chart']//*[contains(@class,'label highcharts-stack-labels')]//*[@class='highcharts-text-outline']
${acquisition_acquisitionRevenue&Insights_fullView_6thBar}=   //*[@id='Acquisition Revenue & Insights']//*[@class='highcharts-point highcharts-color-0'][2]
${acquisition_acquisitionRevenue&Insights_fullView_1stBar}=   //*[@id='Acquisition Revenue & Insights']//*[@class='highcharts-point highcharts-color-0'][5]
${acquisition_acquisitionRevenue&Insights_drilldownTable_upStreamData}=  //*[@id='tableAquisationTier']//tbody//tr//td[16]
${acquisition_acquisitionRevenue&Insights_drilldownTable_downStreamData}=  //*[@id='tableAquisationTier']//tbody//tr//td[17]

${acquisition_ARI_fullView_<20M}=  //*[@id='Acquisition Rate & Insights']//*[text()='<20M']
${acquisition_ARI_fullview_20M+}=  //*[@id='Acquisition Rate & Insights']//*[text()='20M+']
${acquisition_ARI_fullview_20M}=  //*[@id='Acquisition Rate & Insights']//*[text()='20M']
${acquisition_ARI_fullview_50M+}=  //*[@id='Acquisition Rate & Insights']//*[text()='50M+']
${acquisition_ARI_fullview_50M}=  //*[@id='Acquisition Rate & Insights']//*[text()='50M']
${acquisition_ARI_fullview_300M+}=  //*[@id='Acquisition Rate & Insights']//*[text()='300M+']
${acquisition_ARI_fullview_300M}=  //*[@id='Acquisition Rate & Insights']//*[text()='80M']
${acquisition_ARI_fullview_1G}=  //*[@id='Acquisition Rate & Insights']//*[text()='1000M']
${acquisition_ARI_fullview_group}=  //*[@id='Acquisition Rate & Insights']//*[text()='group']

${acquisition_acquisitionRate&InsightslabelTxt}=   Acquisition Rate & Insights
${acquisition_acquisitionRate&InsightsChart}=  //*[@id='acquisition-rate-insights-chart']
${acquisition_acquisitionRate&Insights_totalAcquiredLast6Monthsount}=   (//*[@class='greyaa mb0 heading-subtitle'])[3]
${acquisition_acquisitionRate&Insights_quesBtn}=   id=acquisitionModelOpen
${acquisition_acquisitionRate&Insights_quesBtn_stringAttrubute}=   Acquisition rate and insights for the last 6 months.
${acquisition_acquisitionRate&Insights_downloadBtn}=   id=acquisitionDownloadSection
${acquisition_acquisitionRate&Insights_expandBtn}=   id=acquisitionExpandSection
${acquisition_acquisitionRate&Insights_yaxis_0}=  //*[@id='acquisition-rate-insights-chart']//*[contains(@class,'yaxis-labels')]//*[text()='0']
${acquisition_acquisitionRate&Insights_barDataList}=  //*[@id='acquisition-rate-insights-chart']//*[contains(@class,'label highcharts-stack-labels')]//*[@class='highcharts-text-outline']
${acquisition_acquisitionRate$Insights_fullView_quesBtn}=
${acquisition_acquisitionRate$Insights_fullView_downloadBtn}=   id=acquisitionModelChartDownlod
${acquisition_acquisitionRate$Insights_color2_1stbar}=   (//*[@class="highcharts-series highcharts-series-2 highcharts-column-series highcharts-color-2 highcharts-tracker"])[2]//*[1]
${acquisition_acquisitionRate&Insights_color3_1stbar}=  (//*[@id='Acquisition Rate & Insights']//*[contains(@class,'color-3')])[1]//*[1]
${acquisition_acquisitionRate$Insights_color2_5thbar}=  (//*[@id='Acquisition Rate & Insights']//*[contains(@class,'color-2')])[1]//*[5]
${acquisition_acquisitionRate&Insights_drilldownTable_upStreamData}=  //*[@id='tableAquisationTier']//tbody//tr//td[16]
${acquisition_acquisitionRate&Insights_drilldownTable_downStreamData}=  //*[@id='tableAquisationTier']//tbody//tr//td[17]
${acquisition_acquisitionRate&Insights_color2_1stBar_1stvalueDropdown}=  //*[@id='tableAquisationTier']//tbody//tr[1]//i
${acquisition_acquisitionRate&Insights_drillDown_lens1labeltxt}=  Subscriber Revenue
${acquisition_acquisitionRate&Insights_drillDown_lens1DownloadBtn}=  id=download-subscriber-revenue
${acquisition_acquisitionRate&Insights_drillDown_lens2labeltxt}=  Subscriber Usage
${acquisition_acquisitionRate&Insights_drillDown_lens2DownloadBtn}=  id=download-subscriber-usage
${acquisition_acquisitionRate&Insights_drillDown_lens3labeltxt}=  Usage By Application
${acquisition_acquisitionRate&Insights_drillDown_lens3DownloadBtn}=  id=download-usage-by-application
${acquisition_acquisitionRate&Insights_drillDown_lens4labeltxt}=  Service Limits
${acquisition_acquisitionRate&Insights_drillDown_lens4DownloadBtn}=  id=download-service-limits
${acquisition_acquisitionRate&Insights_drillDown_lens5labeltxt}=  Devices and Wi-Fi Score Trend
${acquisition_acquisitionRate&Insights_drillDown_lens5DownloadBtn}=  id=download-devices-wifi-score
${acquisition_acquisitionRate&Insights_drillDown_lens6labeltxt}=  Top Applications
${acquisition_acquisitionRate&Insights_drillDown_lens6DownloadBtn}=  download-top-applications
${acquisition_acquisitionRate&Insights_drillDown_streamingUsagebtn}=   //*[text()='Streaming Usage']
${acquisition_acquisitionRate&Insights_drillDown_streamingUsagebtndisabled}=   (//*[@class="highcharts-legend-item highcharts-column-series highcharts-color-0 highcharts-series-0 highcharts-legend-item-hidden"])[1]
${acquisition_acquisitionRate&Insights_drillDown_subUsage_barLocation1}=  //*[@id='acquisition-subscriber-usage']//*[contains(@class,'color-2 highcharts-tracker')]//*
${acquisition_acquisitionRate&Insights_drillDown_subUsage_barLocation2}=  //*[@id='acquisition-subscriber-usage']//*[contains(@class,'color-0 highcharts-tracker')]//*
${acquisition_acquisitionRate&Insights_drillDown_subUsage_barLocation3}=  //*[@id='acquisition-subscriber-usage']//*[contains(@class,'color-1 highcharts-tracker')]//*
${acquisition_acquisitionRate&Insights_drillDown_subUsage_tooltipLocation}=  (//*[@id='acquisition-subscriber-usage']//*[contains(@class,'tooltip')]//*)[5]
${acquisition_acquisitionRate&Insights_drillDown_subUsage_tooltipData2}=   (//*[@class='highcharts-label highcharts-tooltip highcharts-color-0'])[2]//span
${acquisition_acquisitionRate&Insights_drillDown_gamingUsagebtn}=   //*[text()='Gaming Usage']
${acquisition_acquisitionRate&Insights_drillDown_gamingUsagebtndisabled}=   (//*[@class="highcharts-legend-item highcharts-column-series highcharts-color-1 highcharts-series-1 highcharts-legend-item-hidden"])[1]
${acquisition_acquisitionRate&Insights_drillDown_otherUsagebtn}=  //*[text()='Other Usage']
${acquisition_acquisitionRate&Insights_drillDown_otherUsagebtndisabled}=   (//*[@class="highcharts-legend-item highcharts-column-series highcharts-color-2 highcharts-series-2 highcharts-legend-item-hidden"])[1]
${acquisition_acquisitionRate&Insights_drillDown_dsLimitsbtn}=   (//*[@class="highcharts-legend-item highcharts-line-series highcharts-color-1 highcharts-series-1"])[1]
${acquisition_acquisitionRate&Insights_drillDown_dsLimitsbtn_hidden}=   //*[@class='highcharts-legend-item highcharts-line-series highcharts-color-1 highcharts-series-1 highcharts-legend-item-hidden']
${acquisition_acquisitionRate&Insights_drillDown_usLimitsbtn}=   (//*[@class="highcharts-legend-item highcharts-line-series highcharts-color-0 highcharts-series-0"])[1]
${acquisition_acquisitionRate&Insights_drillDown_usLimitsbtn_hidden}=   //*[@class='highcharts-legend-item highcharts-line-series highcharts-color-0 highcharts-series-0 highcharts-legend-item-hidden']
${acquisition_acquisitionRate&Insights_drillDown_wifiScorebtn}=   (//*[@class="highcharts-legend-item highcharts-column-series highcharts-color-0 highcharts-series-0"])[5]
${acquisition_acquisitionRate&Insights_drillDown_wifiScorebtn_hidden}=  //*[@class='highcharts-legend-item highcharts-column-series highcharts-color-0 highcharts-series-0 highcharts-legend-item-hidden']
${acquisition_acquisitionRate&Insights_drillDown_devicesBtn}=   (//*[@class="highcharts-legend-item highcharts-line-series highcharts-color-1 highcharts-series-1"])[2]
${acquisition_acquisitionRate&Insights_drillDown_devicesBtn_hidden}=  //*[@class='highcharts-legend-item highcharts-line-series highcharts-color-1 highcharts-series-1 highcharts-legend-item-hidden']

${acquisition_acquisitionRate&Insights_drillDown_usageByApps_streamingMedia_location}=   (//*[@class="highcharts-label highcharts-data-label highcharts-data-label-color-0"])[2]
${acquisition_acquisitionRate&Insights_drillDown_usageByApps_streamingMedia_toolTiplocation}=   (//*[@class='highcharts-label highcharts-tooltip highcharts-color-0'])[3]
${acquisition_acquisitionRate&Insights_drillDown_usageByApps_storageHosting_location}=   //*[@class='highcharts-label highcharts-data-label highcharts-data-label-color-1']
${acquisition_acquisitionRate&Insights_drillDown_usageByApps_storageHosting_toolTiplocation}=   (//*[@class='highcharts-label highcharts-tooltip highcharts-color-1'])[1]
${acquisition_acquisitionRate&Insights_drillDown_usageByApps_amazon_location}=  //*[@class="highcharts-label highcharts-data-label highcharts-data-label-color-2"]
${acquisition_acquisitionRate&Insights_drillDown_usageByApps_amazon_toolTiplocation}=   (//*[@class='highcharts-label highcharts-tooltip highcharts-color-2'])[2]
${acquisition_acquisitionRate&Insights_drillDown_usageByApps_newGlobal_location}=   //*[@class='highcharts-label highcharts-data-label highcharts-data-label-color-3']
${acquisition_acquisitionRate&Insights_drillDown_usageByApps_newGlobal_toolTiplocation}=   (//*[@class='highcharts-label highcharts-tooltip highcharts-color-3'])[1]
${acquisition_acquisitionRate&Insights_drillDown_usageByApps_other_location}=   //*[@class='highcharts-label highcharts-data-label highcharts-data-label-color-4']
${acquisition_acquisitionRate&Insights_drillDown_usageByApps_other_toolTiplocation}=   //*[@class='highcharts-label highcharts-tooltip highcharts-color-4']
${drilldown_UBA_pie}=  (//*[@id='acquisition-usage-by-application']//*[contains(@class,'highcharts-pie-series')])[3]//*[contains(@class,'highcharts-label')]
${drilldown_UBA_tooltip}=  (//*[contains(@class,'highcharts-label highcharts-tooltip highcharts-color')])[4]//*[5]

${acquisition_acquisitionRate&Insights_drillDown_topApps_tableRow}=   //*[@id='acquisition-top-applications']//tbody//tr
${acquisition_acquisitionRate&Insights_drillDown_topApps_tablecol}=   //*[@id='acquisition-top-applications']//tbody//tr[1]//td

${acquisition_acquisitionRate&Insights_fullView_ExportAllSubsHistoryBtn}=   //button[contains(.,'Export All Subscriber History')]

${acquisition_acquisitionRate&Insights_drillDown_devAndWifiScore_1stbarXbath}=   (//*[@class='highcharts-series highcharts-series-0 highcharts-column-series highcharts-color-0 highcharts-tracker'])[6]//*[1]
${acquisition_acquisitionRate&Insights_drillDown_devAndWifiScore_2ndbarXbath}=   (//*[@class='highcharts-series highcharts-series-0 highcharts-column-series highcharts-color-0 highcharts-tracker'])[6]//*[2]
${acquisition_acquisitionRate&Insights_drillDown_devAndWifiScore_3rdbarXbath}=   (//*[@class='highcharts-series highcharts-series-0 highcharts-column-series highcharts-color-0 highcharts-tracker'])[6]//*[3]
${acquisition_acquisitionRate&Insights_drillDown_devAndWifiScore_4thbarXbath}=   (//*[@class='highcharts-series highcharts-series-0 highcharts-column-series highcharts-color-0 highcharts-tracker'])[6]//*[4]
${acquisition_acquisitionRate&Insights_drillDown_devAndWifiScore_5thbarXbath}=   (//*[@class='highcharts-series highcharts-series-0 highcharts-column-series highcharts-color-0 highcharts-tracker'])[6]//*[5]
${acquisition_acquisitionRate&Insights_drillDown_devAndWifiScore_6thbarXbath}=   (//*[@class='highcharts-series highcharts-series-0 highcharts-column-series highcharts-color-0 highcharts-tracker'])[6]//*[6]
${acquisition_acquisitionRate&Insights_drillDown_devAndWifiScore_tooltipLocation}=   //*[@class='highcharts-label highcharts-tooltip highcharts-color-0']

${acquisitionScreen}=  acquisitionScreen
${drilldownAriScreen}=  drilldown_ARI_screen

*** Keywords ***

navigate to acquisition under basic tab
    click element until enabled  ${acquisitiontab}
    sleep  2
    capture the screen  ${acquisitionscreen}


verify elements on acquisition screen
    @{multitxt}=  Create List  ${acquisition_acquisitionrate&insightslabeltxt}   ${acquisition_acquisitionrevenue&insightslabeltxt}   ${acquisition_newsubsriberbysstlabeltxt}
    page should contain multiple text  @{multitxt}

    @{elements}=  Create List  ${acquisition_acquisitionrate&insights_downloadbtn}   ${acquisition_acquisitionrate&insights_expandbtn}   ${acquisition_acquisitionrate&insights_quesbtn}
    ...  ${acquisition_acquisitionrevenue&insights_downloadbtn}   ${acquisition_acquisitionrevenue&insights_expandbtn}   ${acquisition_acquisitionrevenue&insights_quesbtn}
    ...   ${acquisition_newsubsriberbysst_downloadbtn}   ${acquisition_newsubsriberbysst_expandbtn}   ${acquisition_newsubsriberbysst_quesbtn}
    wait until page contain elements  @{elements}

    @{elementss}=  Create List  ${acquisition_newSubsriberbySST_totalAcquiredCount}  ${acquisition_acquisitionRevenue&Insights_maxRev&ActualRevCount}  ${acquisition_acquisitionRate&Insights_totalAcquiredLast6Monthsount}
    get text from multiple element  @{elements}
    Run Keyword And Ignore Error  validate legend buttons on the screen

Match the total acquired count with labels combined on bar chart - NewSubsByServiceTier
    @{elements}=  get webelements  ${acquisition_newSubsriberbySST_barDataList}
    @{numList}=  Create List
    FOR  ${element}  IN  @{elements}
    ${label}=  get text  ${element}
    ${labelA}=  remove string  ${label}  ,
    Append to list  ${numList}  ${labelA}
    END
    ${Total} =    Evaluate    sum(map(int, ${numList}))
    ${TotalValue}=  Convert to coma separated Int value  ${Total}
    page should contain  ${test_data_config['env']['Explore_data']}[Subscriber_txt]
    page should contain  ${TotalValue}


Match the total acquired count with labels combined on bar chart - AcqRevInsights
    @{elements}=  get webelements  ${acquisition_acquisitionRevenue&Insights_barDataList}
    @{numList}=  Create List
    FOR  ${element}  IN  @{elements}
    ${label}=  get text  ${element}
    ${labelA}=  remove string  ${label}  ,  $
    Append to list  ${numList}  ${labelA}
    END
    ${Total} =    Evaluate    sum(map(int, ${numList}))
    ${TotalValue}=  Convert to coma separated Int value  ${Total}
    page should contain  ${test_data_config['env']['Explore_data']}[Revenue_insights_txt]
    page should contain  $${TotalValue}

Match the total acquired count with labels combined on bar chart - AcqRateInsights
    @{elements}=  get webelements  ${acquisition_acquisitionRate&Insights_barDataList}
    @{numList}=  Create List
    FOR  ${element}  IN  @{elements}
    ${label}=  get text  ${element}
    ${labelA}=  remove string  ${label}  ,
    Append to list  ${numList}  ${labelA}
    END
    ${Total} =    Evaluate    sum(map(int, ${numList}))
    ${TotalValue}=  Convert to coma separated Int value  ${Total}
    page should contain  ${test_data_config['env']['Explore_data']}[Rate_insights_txt]
    page should contain  ${TotalValue}

Drilldown acquisition revenue chart and validate upstream and downstream data should not contain decimal points
    click element until visible  ${acquisition_acquisitionRevenue&Insights_expandBtn}
    wait until page contains element   ${acquisition_acquisitionRevenue&Insights_fullView_6thBar}  30s
    click element until enabled  ${acquisition_acquisitionRevenue&Insights_fullView_6thBar}
    sleep   8
    @{upstreamDataElements}=  get webelements  ${acquisition_acquisitionRevenue&Insights_drilldownTable_upStreamData}
    FOR  ${element}  IN  @{upstreamDataElements}
    ${data}=  get text  ${element}
    should not contain  "${data}"  "."
    END
    @{downstreamDataElements}=  get webelements  ${acquisition_acquisitionRevenue&Insights_drilldownTable_downStreamData}
    FOR  ${element}  IN  @{downstreamDataElements}
    ${data}=  get text  ${element}
    should not contain  "${data}"  "."
    END
    click element until enabled  ${expandinvertbtn}
    sleep  5


validating widget icons data with mouse over in acquisition tab
    [Arguments]  ${testData}  ${webElement}  ${comparingString}
    set selenium implicit wait  10 seconds
    Mouse Over  ${webElement}
    ${tooltipData}=  Get WebElement   ${webElement}
    ${tooltipTitle}=   Call Method   ${tooltipData}   get_attribute   title
    should be equal as strings  ${tooltipTitle}  ${comparingString}


validate clicking widget icons in acquisition screen
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
    sleep  2
    capture the screen  ${acquisitionscreen}


validate download button fuction by clicking any bar from widget in Acquisition screen
    [Arguments]  ${testName}  ${expand}  ${barXpath}
    sleep  2
    click element until enabled  ${expand}
    sleep  5
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    ${height_value}=   Get Element Attribute  ${barXpath}    height
    log    ${height_value}
    Run Keyword If    ${height_value} <= 3    dont validate the expand bar1
    ...    ELSE    validate bar expand bar1    ${testName}  ${expand}  ${barXpath}
    sleep  2
    click element until enabled  ${expandinvertbtn}

dont validate the expand bar1
    log    not able to click less data

validate bar expand bar1
    [Arguments]  ${testName}  ${expand}  ${barXpath}
    click element until enabled  ${barXpath}
    sleep  3
    click element until enabled  ${fullview_dropdowndloadbtn}
    sleep  5
    click element until enabled  ${exportsubscriberlistbtn}



expand ARI and validate data
    click element until visible  ${retentionTab}
    click element until visible  ${acquisitionTab}
    click element until enabled  ${acquisition_acquisitionrate&insights_expandbtn}
    sleep  3
    capture the screen  ${widgetfullviewscreen}

Disable all the legends in Acquisition Rate fullview
    @{elements}=  Get Webelements  //*[@id='Acquisition Rate & Insights']//*[contains(@class,'legend-item')]//*[1]
    FOR  ${element}  IN  @{elements}
    click element  ${element}
    sleep  1
    END


disable all legend buttons in ARI fullview
    [Arguments]  ${testName}  ${legendBtn}
    sleep  1
    click element  ${legendBtn}


enable each legend btn and validate data from the bar in ARI fullview
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


validate dropdown by clicking any bar chart of ARI
    set selenium implicit wait  8 seconds
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    sleep  2

    ${height_value}=   Get Element Attribute  ${acquisition_acquisitionRate&Insights_color3_1stbar}    height
    log    ${height_value}
    Run Keyword If    ${height_value} <= 3    dont validate the expand bar1
    ...    ELSE    validate bar expand bar2




validate bar expand bar2
    click element until enabled  ${acquisition_acquisitionRate&Insights_color3_1stbar}
    sleep   8
    scroll element into view  ${acquisition_acquisitionrate&insights_color2_1stbar_1stvaluedropdown}
    click element until enabled  ${acquisition_acquisitionrate&insights_color2_1stbar_1stvaluedropdown}
    sleep  15
    capture the screen  ${drilldownariscreen}
    @{multitxt}=  Create List  ${acquisition_acquisitionrate&insights_drilldown_lens1labeltxt}  ${acquisition_acquisitionrate&insights_drilldown_lens2labeltxt}  ${acquisition_acquisitionrate&insights_drilldown_lens3labeltxt}
    ...  ${acquisition_acquisitionrate&insights_drilldown_lens4labeltxt}   ${acquisition_acquisitionrate&insights_drilldown_lens5labeltxt}  ${acquisition_acquisitionrate&insights_drilldown_lens6labeltxt}
    page should contain multiple text  @{multitxt}

    @{elements}=  Create List  ${acquisition_acquisitionrate&insights_drilldown_streamingusagebtn}  ${acquisition_acquisitionrate&insights_drilldown_gamingusagebtn}  ${acquisition_acquisitionrate&insights_drilldown_otherusagebtn}
    ...  ${acquisition_acquisitionrate&insights_drilldown_dslimitsbtn}  ${acquisition_acquisitionrate&insights_drilldown_uslimitsbtn}  ${acquisition_acquisitionrate&insights_drilldown_wifiscorebtn}
    ...  ${acquisition_acquisitionrate&insights_drilldown_devicesbtn}  ${acquisition_acquisitionrate&insights_drilldown_lens1downloadbtn}  ${acquisition_acquisitionrate&insights_drilldown_lens2downloadbtn}
    ...  ${acquisition_acquisitionrate&insights_drilldown_lens3downloadbtn}  ${acquisition_acquisitionrate&insights_drilldown_lens4downloadbtn}  ${acquisition_acquisitionrate&insights_drilldown_lens5downloadbtn}
    ...  ${acquisition_acquisitionrate&insights_drilldown_lens6downloadbtn}
    page should contain multiple element  @{elements}


disable legend buttons and get tooltip data for subscriber usage under dropdown value
    [Arguments]  ${testData}  ${legendBtn1}  ${legendBtn2}  ${tooltipLocation}  ${tooltipDataXpath}  ${legendBtnDisabled1}  ${legendBtnDisabled2}
    set selenium implicit wait  10 seconds

    ${height_value}=   Get Element Attribute  ${acquisition_acquisitionRate&Insights_color3_1stbar}    height
    log    ${height_value}
    Run Keyword If    ${height_value} <= 3    dont validate the expand bar1
    ...    ELSE    validate bar expand bar3    ${testData}  ${legendBtn1}  ${legendBtn2}  ${tooltipLocation}  ${tooltipDataXpath}  ${legendBtnDisabled1}  ${legendBtnDisabled2}


validate bar expand bar3
    [Arguments]  ${testData}  ${legendBtn1}  ${legendBtn2}  ${tooltipLocation}  ${tooltipDataXpath}  ${legendBtnDisabled1}  ${legendBtnDisabled2}
    click element  ${legendBtn1}
    click element  ${legendBtn2}
    sleep  2
    @{Get_tooltip}=   Get WebElements  ${tooltipLocation}
    FOR  ${tooltiplocation}  IN   @{Get_tooltip}
    mouse over    ${tooltiplocation}
    ${TooltipText}=   get text    ${tooltipDataXpath}
    sleep  2
    END
    click element  ${legendBtnDisabled1}
    click element  ${legendBtnDisabled2}


scrolling to Usage by application pie under drilldown and validate
    scroll horizontal and then vertical  700  600
    ${status}=  Run Keyword And Return Status  element should be visible  (//*[@id='acquisition-usage-by-application']//*[contains(@class,'highcharts-pie-series')])[3]//*[contains(@class,'highcharts-label')]
    Run Keyword if  ${status}  validate uba pie under drilldown



validate UBA pie under drilldown
    get the data from circle widgets  ${drilldown_uba_pie}  ${drilldown_uba_tooltip}


validate legend buttons for service limits widget under ARI dropdwon
    set selenium implicit wait  10 seconds

    ${height_value}=   Get Element Attribute  ${acquisition_acquisitionRate&Insights_color3_1stbar}    height
    log    ${height_value}
    Run Keyword If    ${height_value} <= 3    dont validate the expand bar1
    ...    ELSE    validate bar expand bar4

validate bar expand bar4
    click element until enabled  ${acquisition_acquisitionrate&insights_drilldown_dslimitsbtn}
    page should contain element  ${acquisition_acquisitionrate&insights_drilldown_dslimitsbtn_hidden}
    click element  ${acquisition_acquisitionrate&insights_drilldown_dslimitsbtn_hidden}
    page should contain element  ${acquisition_acquisitionrate&insights_drilldown_dslimitsbtn}

    click element until enabled  ${acquisition_acquisitionrate&insights_drilldown_uslimitsbtn}
    page should contain element  ${acquisition_acquisitionrate&insights_drilldown_uslimitsbtn_hidden}
    click element  ${acquisition_acquisitionrate&insights_drilldown_uslimitsbtn_hidden}
    page should contain element  ${acquisition_acquisitionrate&insights_drilldown_uslimitsbtn}


validate legend buttons for dev and wifi score widget under ARI dropdwon
    set selenium implicit wait  10 seconds

    ${height_value}=   Get Element Attribute  ${acquisition_acquisitionRate&Insights_color3_1stbar}    height
    log    ${height_value}
    Run Keyword If    ${height_value} <= 3    dont validate the expand bar1
    ...    ELSE    validate bar expand bar5

validate bar expand bar5
    click element until enabled  ${acquisition_acquisitionRate&Insights_drillDown_wifiScorebtn}
    page should contain element  ${acquisition_acquisitionRate&Insights_drillDown_wifiScorebtn_hidden}
    click element  ${acquisition_acquisitionRate&Insights_drillDown_wifiScorebtn_hidden}
    page should contain element  ${acquisition_acquisitionRate&Insights_drillDown_wifiScorebtn}

    click element until enabled  ${acquisition_acquisitionrate&insights_drilldown_devicesbtn}
    page should contain element  ${acquisition_acquisitionrate&insights_drilldown_devicesbtn_hidden}
    click element  ${acquisition_acquisitionrate&insights_drilldown_devicesbtn_hidden}
    page should contain element  ${acquisition_acquisitionrate&insights_drilldown_devicesbtn}



validate the table data for Top applications
    ${height_value}=   Get Element Attribute  ${acquisition_acquisitionRate&Insights_color3_1stbar}    height
    log    ${height_value}
    Run Keyword If    ${height_value} <= 3    dont validate the expand bar1
    ...    ELSE    validate bar expand bar6

validate bar expand bar6
     @{Tablelist}=    Create List
     ${rows}=    get element count  ${acquisition_acquisitionrate&insights_drilldown_topapps_tablerow}
     FOR    ${row}  IN RANGE  1  ${rows}
     ${data_table}=    Handle Table Data for topApps    ${row}
     append to list    ${Tablelist}     ${data_table}
     END


Handle Table Data for topApps
       [Arguments]    ${test_row}
       @{Tablelist}=    Create List
       ${columns}=    get element count  ${acquisition_acquisitionrate&insights_drilldown_topapps_tablecol}
       FOR   ${column}    IN RANGE   1    ${columns}
       ${data_table}    get text   xpath=//*[@id='acquisition-top-applications']//tbody/tr[${test_row}]/td[${column}]
       log to console    ${data_table}
       END



click and validate download buttons for lenses under ARI dropdwon
    [Arguments]  ${testData}  ${dLoadBtn}
    set selenium implicit wait  10 seconds
        ${height_value}=   Get Element Attribute  ${acquisition_acquisitionRate&Insights_color3_1stbar}    height
    log    ${height_value}
    Run Keyword If    ${height_value} <= 3    dont validate the expand bar1
    ...    ELSE    validate bar expand bar7   ${testData}  ${dLoadBtn}

validate bar expand bar7
    [Arguments]  ${testData}  ${dLoadBtn}
    click element until enabled  ${dLoadBtn}


go back to acquisition widgets page
    click element until enabled  ${expandinvertbtn}
    capture the screen  ${acquisitionscreen}


Click download and verify the chart should still be visible - New Subs Service Tier
    [Documentation]  This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible  ${acquisition_newSubsriberbySST_downloadBtn}
    Verify expected elements on New Subs Service Tier

Verify expected elements on New Subs Service Tier
#    scroll element into view  ${acquisition_newSubsriberbySSTChart}
    @{elements}=  create list  ${acquisition_newSubsriberbySST_quesBtn}   ${acquisition_newSubsriberbySST_downloadBtn}
    ...  ${acquisition_newSubsriberbySST_expandBtn}  ${acquisition_newSubsriberbySST_yaxis_0}
    wait until page contain elements  @{elements}
    capture the screen  newSst-afterDownloadClick


Click download and verify the chart should still be visible - Acquisition Rev Insights
    [Documentation]  This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible  ${acquisition_acquisitionRevenue&Insights_downloadBtn}
    Verify expected elements on Acquisition Rev Insights

Verify expected elements on Acquisition Rev Insights
#    scroll element into view  ${acquisition_acquisitionRevenue&InsightsChart}
    @{elements}=  create list  ${acquisition_acquisitionRevenue&Insights_quesBtn}   ${acquisition_acquisitionRevenue&Insights_downloadBtn}
    ...  ${acquisition_acquisitionRevenue&Insights_expandBtn}  ${acquisition_acquisitionRevenue&Insights_yaxis_0}
    wait until page contain elements  @{elements}
    capture the screen  acqRevInsights-afterDownloadClick


Click download and verify the chart should still be visible - Acquisition Rate Insights
    [Documentation]  This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible  ${acquisition_acquisitionRate&Insights_downloadBtn}
    Verify expected elements on Acquisition Rate Insights

Verify expected elements on Acquisition Rate Insights
    scroll element into view  ${acquisition_acquisitionRate&InsightsChart}
    @{elements}=  create list  ${acquisition_acquisitionRate&Insights_quesBtn}   ${acquisition_acquisitionRate&Insights_downloadBtn}
    ...  ${acquisition_acquisitionRate&Insights_expandBtn}  ${acquisition_acquisitionRate&Insights_yaxis_0}
    wait until page contain elements  @{elements}
    capture the screen  acqRateInsights-afterDownloadClick