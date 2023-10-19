*** Settings ***
Library    SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Resource    ../PO/CommonWrapper.robot
Resource    ../PO/ExploreDataPO_subscriber.robot


*** Variables ***
${servicesTab}=   //a[contains(.,"Services")]
${services_SubscribersBySSTlabeltxt}=   Service Tier & Technology
${services_SubscribersBySStChart}=  //*[@id='subscriber-tier-tech-chart']
${services_SubscribersBySST_quesBtn}=   id=serviceTierModelOpen
${services_SubscribersBySST_quesBtn_stringAttrubute}=   The distribution of subscribers among the service tiers and technology types.
${services_SubscribersBySST_downloadBtn}=   id=serviceTierDownloadSection
${services_SubscribersBySST_expandBtn}=    id=serviceTierExpandSection
${acquisition_SubscribersBySST_barDataList}=  //*[@id='subscriber-tier-tech-chart']//*[contains(@class,'label highcharts-stack-labels')]//*[@class='highcharts-text-outline']
${services_SubscribersBySST_yaxis_0}=  //*[@id='subscriber-tier-tech-chart']//*[contains(@class,'yaxis-labels')]//*[text()='0']
${services_fullView_quesBtn}=   id=serviceChartModelFullView
${services_fullView_downloadBtn}=   //*[@title='Export Options']
${services_SubscribersBySSt_xaxis}=   (//*[@class="highcharts-axis-labels highcharts-xaxis-labels"])[1]//*
${services_SubscribersBySSt_yaxis}=   (//*[@class="highcharts-axis-labels highcharts-yaxis-labels"])[1]//*
${services_SubscribersBySSt_Fiberbtn}=   //*[text()='Fiber']
${services_SubscribersBySSt_fullView_5thBar}=   //*[@id='Service Tier & Technology']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect'][9]
${services_SubscribersBySSt_fullView_1stBar}=   //*[@id='Service Tier & Technology']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect'][7]


${services_householdDevTrendslabeltxt}=   Household Device Trends
${services_householdDevTrendsChart}=  //*[@id='household-device-trends-chart']
${services_householdDevTrends_csc&GigaFamCount}=   //*[@class='greyaa mb0 heading-subtitle']
${services_householdDevTrends_quesBtn}=   id=houseHoldModelOpen
${services_householdDevTrends_quesBtn_stringAttrubute}=   A comparative monthly trend in average home device count and Wi-Fi score.
${services_householdDevTrends_downloadBtn}=    id=houseHoldDownloadSection
${services_householdDevTrends_expandBtn}=    id=houseHoldExpandSection
${services_householdDevTrends_yaxis_0}=  (//*[@id='household-device-trends-chart']//*[contains(@class,'yaxis-labels')]//*[text()='0'])[1]
${services_householdDevTrends_xaxis}=    (//*[@class="highcharts-axis-labels highcharts-xaxis-labels"])[3]//*
${services_householdDevTrends_yaxis}=    (//*[@class="highcharts-axis-labels highcharts-yaxis-labels"])[3]//*
${services_householdDevTrends_avgDevCountbtn}=   //*[@id='household-device-trends-chart']//*[contains(text(),'Average Home Device Count')]
${services_householdDevTrends_wifiScorebtn}=   //*[@id='household-device-trends-chart']//*[contains(text(),'Wi-Fi Score')]

${Managedservices_labeltxt}=   Subscribers with Managed Services
${services_Managedservices_downloadBtn}=   id=serviceModuleDownloadSection
${services_managedservices_expandBtn}=   id=serviceModuleExpandSection
${services_managedservices_yaxis_subscriber}=   //*[@id='service-module-adoption-rate-chart']//*[contains(text(),'Subscribers')]
${services_managedservices_yaxis_0}=  //*[@id='service-module-adoption-rate-chart']//*[contains(@class,'yaxis-labels')]//*[text()='0']
${services_managedservices_expIQBtn}=   //*[@id='service-module-adoption-rate-chart']//*[contains(text(),'ExperienceIQ')]
${services_managedservices_protectIQBtn}=    //*[@id='service-module-adoption-rate-chart']//*[@class='highcharts-legend highcharts-no-tooltip']//*[contains(text(),'ProtectIQ')]
${services_managedservices_ArloBtn}=    //*[@id='service-module-adoption-rate-chart']//*[text()='Arlo']
${services_managedservices_ServifyBtn}=    //*[@id='service-module-adoption-rate-chart']//*[text()='Servify']
${services_managedservices_BarkBtn}=    //*[@id='service-module-adoption-rate-chart']//*[text()='Bark']


${services_ecosystem_arloBtn}=  //*[@id='eco-rate-chart']//*[contains(text(),'Arlo')]
${services_ecosystem_servifyBtn}=  //*[@id='eco-rate-chart']//*[contains(text(),'Servify')]
${services_ecosystem_BarkBtn}=  //*[@id='eco-rate-chart']//*[@class='highcharts-legend highcharts-no-tooltip']//*[contains(text(),'Bark')]


${services_wifiDevCategoryTrndslabelTxt}=   Wi-Fi Device Category Trends
${services_wifiDevCategoryTrnds_quesBtn}=   id=wifiModelOpen
${services_wifiDevCategoryTrnds_quesBtn_stringAttrubute}=   The total WFH subscribers and non-WFH subscribers for each service tier.
${services_wifiDevCategoryTrnds_downloadBtn}=   id=wifiDownloadSection
${services_wifiDevCategoryTrnds_expandBtn}=   id=wifiExpandSection



${services_blockdThreatInsightsLabeltxt}=   Blocked Threats Insights
${services_blockdThreatInsights_quesBtn}=   id=blockThreatModelOpen
${services_blockdThreatInsights_quesBtn_stringAttrubute}=   ProtectIQ insights into blocked threats
${services_blockdThreatInsights_downloadBtn}=     id=blockThreatDownloadSection
${services_blockdThreatInsights_expandBtn}=   id=blockThreatExpandSection



${services_smartHomeInsightsLabeltxt}=   Smart Home Insights
${services_smartHomeinsightsChart}=  //*[@id='serviceCommandInsightTable']
${services_smartHomeinsights_quesBtn}=    id=commandInModelOpen
${services_smartHomeinsights_quesBtn_stringAttrubute}=   This widget provides insights into candidates for upsell of CommandIQ products and services, including Gigaspire devices. CommandIQ Insights are sorted by the number of devices followed by their upstream usage. Subscribers at the top of the list have the most connected devices.
${services_smartHomeinsights_downloadBtn}=    id=commandInDownloadSection
${services_smartHomeinsights_expandBtn}=    id=commandInExpandSection
${services_smartHomeinsights_thName}=  //*[@id='serviceCommandInsightTable']//th[contains(text(),'Name')]
${services_smartHomeinsights_thDevices}=  //*[@id='serviceCommandInsightTable']//th[contains(text(),'Devices')]
${services_smartHomeinsights_thUsage}=  //*[@id='serviceCommandInsightTable']//th[contains(text(),'Usage Down/Up (GB)')]
${services_smartHomeinsights_thWiFiScore}=  //*[@id='serviceCommandInsightTable']//th[contains(text(),'Wi-Fi Score')]
${services_smartHomeinsights_tRow}=    //*[@class="table-responsive row-border hover table-alter smal table-striped"]//tbody//tr
${services_smartHomeinsights_tCol}=    //*[@class="table-responsive row-border hover table-alter smal table-striped"]//tbody//tr[1]//td

${servicesScreen}=  servicesScreen

*** Keywords ***
navigate to services under basic tab
    click element until enabled  ${servicestab}
    verify elements on services screen


verify elements on services screen
    [Documentation]   Validate the Services screen elements
    log  CCL-42486,CCL-47858,CCL-52983
    @{multitxt}=  Create List  ${services_subscribersbysstlabeltxt}   ${services_householddevtrendslabeltxt}   ${Managedservices_labeltxt}
    ...   ${services_wifidevcategorytrndslabeltxt}   ${services_smartHomeinsightslabeltxt}
    wait until page contains multiple text  @{multitxt}

    @{multiElements}=  Create List   ${services_subscribersbysst_downloadbtn}  ${services_subscribersbysst_expandbtn}
    ...  ${services_householddevtrends_downloadbtn}   ${services_managedservices_expIQBtn}   ${services_managedservices_ArloBtn}
    ...  ${services_householddevtrends_expandbtn}   ${services_householddevtrends_avgdevcountbtn}  ${services_householddevtrends_wifiscorebtn}
    ...  ${services_managedservices_expandBtn}   ${services_managedservices_protectIQBtn}   ${services_managedservices_ServifyBtn}  ${services_managedservices_BarkBtn}
    ...  ${services_smartHomeinsights_quesbtn}  ${services_smartHomeinsights_downloadbtn}   ${services_smartHomeinsights_expandbtn}
    wait until page contain elements  @{multiElements}
    capture the screen  ExploreData-ServicesTab
    get the text from the element  ${services_householddevtrends_csc&gigafamcount}


validating widget icons data with mouse over in services tab
    [Arguments]  ${testData}  ${webElement}  ${comparingString}
    set selenium implicit wait  10 seconds
    Mouse Over  ${webElement}
    ${tooltipData}=  Get WebElement   ${webElement}
    ${tooltipTitle}=   Call Method   ${tooltipData}   get_attribute   title
    should be equal as strings  ${tooltipTitle}  ${comparingString}

validate clicking widget icons in services screen
    [Arguments]   ${testName}  ${downloadBtn}  ${expand}  ${headerlbl}  ${fullViewdLoad}
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
    sleep  2
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
    capture the screen  ${testName}-fullview


validate download button fuction by clicking any bar from subscriber by STT widget in services screen
    ${status}=  Run Keyword And Return Status  element should be visible  //*[@id='subscriber-tier-tech-chart']//*[contains(text(),'No data')]
    Run Keyword Unless  ${status}  Validate export list button when clicked a bar from subscriber by STT widget in services screen

Validate export list button when clicked a bar from subscriber by STT widget in services screen
    sleep  2
    click element until visible  ${services_subscribersbysst_expandbtn}
    sleep  3
    click element until visible  ${services_subscribersbysst_fullview_1stbar}
    wait until page contains element  ${fullview_dropdowndloadbtn}
    click element until visible  ${fullview_dropdowndloadbtn}
    click element until visible  ${exportsubscriberlistbtn}
    sleep  2
    click element until visible  ${expandinvertbtn}


Click download and verify the chart should still be visible - Service Tier Technology
    [Documentation]  This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible  ${services_SubscribersBySST_downloadBtn}
    Verify expected elements on Service Tier Technology

Verify expected elements on Service Tier Technology
#    scroll element into view  ${subscribers_subscriberDataUsageDownloadbtnChart}
    @{elements}=  create list  ${services_SubscribersBySST_quesBtn}   ${services_SubscribersBySST_downloadBtn}
    ...  ${services_SubscribersBySST_expandBtn}  ${services_SubscribersBySST_yaxis_0}
    wait until page contain elements  @{elements}
    capture the screen  serviceTierTech-afterDownloadClick


Click download and verify the chart should still be visible - Household Dev Trends
    [Documentation]  This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible  ${services_householdDevTrends_downloadBtn}
    Verify expected elements on Household Dev Trends

Verify expected elements on Household Dev Trends
#    scroll element into view  ${services_householdDevTrendsChart}
    @{elements}=  create list  ${services_householdDevTrends_quesBtn}   ${services_householdDevTrends_downloadBtn}
    ...  ${services_householdDevTrends_expandBtn}  ${services_householdDevTrends_yaxis_0}
    wait until page contain elements  @{elements}
    capture the screen  householdDev-afterDownloadClick


Click download and verify the chart should still be visible - Subscribers with Managed Services
    [Documentation]  CCL-47858,CCL-52983,CCL-54369 This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible   ${services_Managedservices_downloadBtn}
    Verify expected elements on Subscribers with Managed Services

Verify expected elements on Subscribers with Managed Services
    [Documentation]  CCL-52983,CCL-54369  Validate the basic elements in  Subscribers with Managed Services
    scroll element into view    ${services_Managedservices_downloadBtn}
    @{elements}=  create list  ${services_Managedservices_downloadBtn}   ${services_managedservices_yaxis_subscriber}   ${services_managedservices_ArloBtn}     ${services_managedservices_ServifyBtn}
    ...  ${services_managedservices_expandBtn}  ${services_managedservices_yaxis_0}   ${services_managedservices_expIQBtn}   ${services_managedservices_protectIQBtn}  ${services_managedservices_BarkBtn}
    wait until page contain elements  @{elements}
    capture the screen  Subscribers with Managed Services-afterDownloadClick

Click download and verify the chart should still be visible - Smart Home Insights
    [Documentation]  This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible  ${services_smartHomeinsights_downloadBtn}
    Verify expected elements on Smart Home Insights

Verify expected elements on Smart Home Insights
#    scroll element into view  ${services_smartHomeinsightsChart}
    @{elements}=  create list  ${services_smartHomeinsights_quesBtn}   ${services_smartHomeinsights_downloadBtn}
    ...  ${services_smartHomeinsights_expandBtn}
    ...  ${services_smartHomeinsights_thName}  ${services_smartHomeinsights_thDevices}
    ...  ${services_smartHomeinsights_thUsage}  ${services_smartHomeinsights_thWiFiScore}
    wait until page contain elements  @{elements}
    capture the screen  smartHomeInsights-afterDownloadClick