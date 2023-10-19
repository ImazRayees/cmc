*** Settings ***
Library    SeleniumLibrary
Resource   ../PO/CommonWrapper.robot
Resource   ../PO/SearchPO.robot

*** Variables ***
${suppportCloud}=  //*[@id='menu-category']//*[contains(text(),'Service')]
${1stSubscriber}=  //*[@id='subscriber-table']//tbody//tr[1]//td[1]//span
${2ndSubscriber}=  //*[@id='subscriber-table']//tbody//tr[2]//td[1]//span
${CSC_search}=   id=supportSearchId
${CSC_searchBTN}=   id=performSearchId
${sub_buttonsList}=  //div[contains(@class,'text-right')]
${dropdownMenuBtn}=  id=dropdownMenuButton
${SuppportInsightsBtn}=  //*[contains(@class,'dropdown-menu')]//*[contains(text(),'Support Insights')]
${mi_supportInsightsHeadertxt}=  Support Insights
${mi_marketingInsightsHeadertxt}=  Engagement Insights
${mi_closeBtn}=  //*[@class='btn-no']
${mi_subscriberAddress}=  (//p[contains(@class,'listdata')])[1]
${mi_devices}=  (//*[@class='st-content flex']//div[contains(@class,'stcl-col')])[1]
${mi_wifiScore}=  (//*[@class='st-content flex']//div[contains(@class,'stcl-col')])[2]
${mi_attainableRates}=  (//*[@class='st-content flex']//div[contains(@class,'stcl-col')])[3]
${mi_upstreamLh}=  (//*[@class='st-content flex']//div[contains(@class,'stcl-col')])[4]
${mi_downstreamLh}=  (//*[@class='st-content flex']//div[contains(@class,'stcl-col')])[5]
${mi_strUsage}=  (//*[@class='st-content flex']//div[contains(@class,'stcl-col')])[8]
${mi_gamUsage}=  (//*[@class='st-content flex']//div[contains(@class,'stcl-col')])[9]
${mi_totusage}=  (//*[@class='st-content flex']//div[contains(@class,'stcl-col')])[10]
${mi_servTier}=  (//*[@class='st-content flex']//div[contains(@class,'stcl-col')])[12]
${mi_speedTst}=  (//*[@class='st-content flex']//div[contains(@class,'stcl-col')])[13]
${mi_compWebVis}=  (//*[@class='st-content flex']//div[contains(@class,'stcl-col')])[14]

${mi_downloadBtnPath}=  //button[contains(@class,'btn-dload')]

${mi_subUsageWidget_headerTxt}=  Subscriber Usage
${mi_subUsageWidget_dLoadBtn}=  (//button[contains(@class,'btn-dload')])[1]
${mi_subUsageWidget_totalUsage}=  (//*[@class='total_compet'])[1]
${mi_subUsageWidget_streamingUsageBtn}=  (//*[contains(@class,'legend-item')])[1]
${mi_subUsageWidget_SU_barsXpath}=  //*[@id='subscribe-usage']//*[@class='highcharts-point highcharts-color-0']
${mi_subUsageWidget_SU_tooltip}=  //*[@id='subscribe-usage']//*[@class='highcharts-label highcharts-tooltip highcharts-color-0']//*[5]
${mi_subUsageWidget_gamingUsageBtn}=  (//*[contains(@class,'legend-item')])[2]
${mi_subUsageWidget_GU_barsXpath}=  //*[@id='subscribe-usage']//*[@class='highcharts-point highcharts-color-1']
${mi_subUsageWidget_GU_tooltip}=  //*[@id='subscribe-usage']//*[@class='highcharts-label highcharts-tooltip highcharts-color-1']//*[5]
${mi_subUsageWidget_otherUsageBtn}=  (//*[contains(@class,'legend-item')])[3]
${mi_subUsageWidget_OU_barsXpath}=  //*[@id='subscribe-usage']//*[@class='highcharts-point highcharts-color-2']
${mi_subUsageWidget_OU_tooltip}=  //*[@id='subscribe-usage']//*[@class='highcharts-label highcharts-tooltip highcharts-color-2']//*[5]
${mi_cmc_subUsageWidget_Bars}=  //*[@id='subscribe-usage']//*[contains(@class,'point')]
${mi_cmc_subUsageWidget_tooltip}=  //*[@id='subscribe-usage']//*[contains(@class,'highcharts-tooltip')]//*[5]


${mi_servLimitsWidget_headerTxt}=  Service Limits
${mi_servLimitsWidget_dLoadBtn}=  (//button[contains(@class,'btn-dload')])[2]
${mi_servLimitsWidget_dlhBtn}=  (//*[text()='Downstream Limit Hits'])[2]
${mi_servLimitsWidget_ulhBtn}=  (//*[text()='Upstream Limit Hits'])[2]


${mi_compVisitWidget_headerTxt_CMC}=  Competitor Visit and Speed Test Minutes
${mi_compVisitWidget_headerTxt}=  Speed Test Minutes
${mi_compVisitWidget_dLoadBtn}=  (//button[contains(@class,'btn-dload')])[3]
${mi_compVisitWidget_compVisitsBtn}=  //*[text()='Competitor Visits']
${mi_compVisitWidget_CV_barsXpath}=  //*[@id='speed-test-chart']//*[@class='highcharts-point highcharts-color-0']
${mi_compVisitWidget_CV_tooltip}=  //*[@id='speed-test-chart']//*[@class='highcharts-label highcharts-tooltip highcharts-color-0']//*[5]
${mi_compVisitWidget_speedTestBtn}=  //*[text()='Speed Tests']
${mi_compVisitWidget_ST_barsXpath}=  //*[@id='speed-test-chart']//*[@class='highcharts-point highcharts-color-1']
${mi_compVisitWidget_ST_tooltip}=  //*[@id='speed-test-chart']//*[@class='highcharts-label highcharts-tooltip highcharts-color-1']//*[5]
${mi_cmc_compVisitWidget_Bars}=  //*[@id='speed-test-chart']//*[contains(@class,'point')]
${mi_cmc_compVisitWidget_tooltip}=  //*[@id='speed-test-chart']//*[contains(@class,'highcharts-tooltip')]//*[5]

${mi_usageByAppWidget_headerTxt}=  Usage by Application
${mi_usageByAppWidget_dLoadBtn}=  (//button[contains(@class,'btn-dload')])[4]
${mi_usageByAppWidget_pieXpath}=  //*[@id='pie-Usage-chart']//*[contains(@class,'data-label-color')]
${mi_usageByAppWidget_pieTooltip}=  //*[@id='pie-Usage-chart']//*[contains(@class,'highcharts-label highcharts-tooltip')]//*[5]



${mi_topAppsWidget_headerTxt}=  Top Applications
${mi_topAppsWidget_dLoadBtn}=  (//button[contains(@class,'btn-dload')])[5]
${mi_topAppsWidget_tRow}=  //tbody//tr
${mi_topAppsWidget_tCol}=  //tbody//tr[1]//td


${mi_dev&WifiTrendWidget_headerTxt}=  Devices and Wi-Fi Score Trend
${mi_dev&WifiTrendWidget_dLoadBtn}=  (//button[contains(@class,'btn-dload')])[6]
${mi_dev&WifiTrendWidget_wifiScoreBtn}=  //*[text()='Wi- Fi Score']
${mi_dev&WifiTrendWidget_devicesBtn}=  //*[@id='device-chart']//*[contains(text(),'Devices')]



${pagination_previous}=  //*[contains(@class,'previous')]
${pagination_first}=  //*[contains(@class,'first')]
${pagination_next}=  //*[contains(@class,'next')]
${pagination_last}=  //*[contains(@class,'last')]

*** Keywords ***
go to support cloud
    click element until enabled  ${suppportcloud}
    Capture the Screen  cscTableScreen

click on support insights button and verify elements on the screen
    [Documentation]    CCL-51804,CCL-51805 Basic Validation for support Insignts
    [Arguments]  ${subscriberName}
    click element until visible  ${SuppportInsightsBtn}
    @{txt}=  Create List  ${mi_supportInsightsHeadertxt}  ${mi_compvisitwidget_headertxt}  ${mi_dev&wifitrendwidget_headertxt}
    ...  ${mi_servlimitswidget_headertxt}  ${mi_subusagewidget_headertxt}  ${mi_topappswidget_headertxt}  ${mi_usagebyappwidget_headertxt}
    wait until page contains multiple text  @{txt}
    page should not contain    ${mi_compVisitWidget_headerTxt_CMC}
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    @{elements}=  Create List  ${mi_closebtn}  ${mi_subscriberaddress}  ${mi_devices}  ${mi_wifiscore}  ${mi_attainablerates}
    ...  ${mi_upstreamlh}  ${mi_downstreamlh}  ${mi_strusage}  ${mi_gamusage}  ${mi_totusage}  ${mi_servtier}  ${mi_speedtst}
    ...  ${mi_subusagewidget_dloadbtn}  ${mi_subusagewidget_gamingusagebtn}  ${mi_subusagewidget_otherusagebtn}
    ...  ${mi_subusagewidget_streamingusagebtn}  ${mi_subusagewidget_totalusage}  ${mi_servlimitswidget_dloadbtn}  ${mi_servlimitswidget_dlhbtn}
    ...  ${mi_servlimitswidget_ulhbtn}  ${mi_compvisitwidget_dloadbtn}  ${mi_compvisitwidget_speedtestbtn}
    ...  ${mi_usagebyappwidget_dloadbtn}  ${mi_topappswidget_dloadbtn}  ${mi_dev&wifitrendwidget_dloadbtn}  ${mi_dev&wifitrendwidget_wifiscorebtn}
    ...  ${mi_dev&wifitrendwidget_devicesbtn}
    wait until page contain elements  @{elements}
    Page Should Not Contain Element   ${mi_compVisitWidget_compVisitsBtn}
    Capture the Screen  SupportInsightsScreen

validate the support insights for a subscriber in support cloud
    [Documentation]  CCL-51804,CCL-51805  validate the Support insights for a subscriber in support cloud
    ${status}=  Run keyword And Return Status  element should be visible  //*[contains(text(),'No data available in table')]
    Run Keyword Unless  ${status}  check and validate the support insights for a subscriber in support cloud

check and validate the support insights for a subscriber in support cloud
    [Documentation]  CCL-51804,CCL-51805  validate the Support insights for a subscriber in support cloud
    enter the value untill visible   ${CSC_search}    ${test_data_config['env']['Home']}[Subscriber_name]
    click element until enabled   ${CSC_searchBTN}
    ${subscriberName}=  get the text from the element  //tbody//tr[1]//td[1]
    click element until enabled  //tbody//tr[1]//td[1]
    wait until page does not contain element   //*[contains(@class,'spinner')]  60s
    click element until visible  ${dropdownMenuBtn}
    ${status}=  Run Keyword And Return Status  element should be visible  ${SuppportInsightsBtn}
    Run Keyword If  ${status}  Run Keywords
    ...  click on support insights button and verify elements on the screen  ${subscriberName}
    ...  AND  verify elements on support insights screen
    ...  AND  validate clicking all widget download buttons in marketing insights screen
    ...  AND  get data from subscriber usage widget
    ...  AND  validate clicking legend buttons for service limits
    ...  AND  get data from speedtest chart
    ...  AND  extracting table data from top applications widget
    ...  AND  get data from usage by applications pie chart
    ...  AND  validating clicking legend buttons for dev and wifi score widget
    ...  ELSE  log to console  marketing insights button not present



click on search to navigate to marketing insights subscriber list
    clear element text  ${searchField}
    enter the value untill visible   ${searchField}    ${test_data_config['env']['Home']}[Subscriber_name]
    click element until visible  ${cmc_searchBtn}
    sleep  10
    @{elements}=  Create List  ${searchDropdownResult_test_subscribersTab}  ${searchDropdownResult_test_campaignsTab}
    ...   ${pagination_previous}  ${pagination_first}  ${pagination_next}  ${pagination_last}
    wait until page contain elements  @{elements}
    capture the screen  subscribersList

go to marketing insights for a subsriber from search results
    click element until visible  ${searchDropdownResult_test_subscribersTab}
    wait until page contains element  ${1stSubscriber}
    ${subscriberName}=  get the text from the element  ${1stSubscriber}
    click element until enabled  //*[@id='subscriber-table']//*[contains(text(),'${subscriberName}')]
    wait until page contains  ${subscriberName}  20s


verify elements on support insights screen
    Capture the Screen  marketingInsightsScreen
    @{txt}=  Create List  ${mi_supportInsightsHeadertxt}  ${mi_compvisitwidget_headertxt}  ${mi_dev&wifitrendwidget_headertxt}
    ...  ${mi_servlimitswidget_headertxt}  ${mi_subusagewidget_headertxt}  ${mi_topappswidget_headertxt}  ${mi_usagebyappwidget_headertxt}
    wait until page contains multiple text  @{txt}

    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    @{elements}=  Create List  ${mi_closebtn}  ${mi_subscriberaddress}  ${mi_devices}  ${mi_wifiscore}  ${mi_attainablerates}
    ...  ${mi_upstreamlh}  ${mi_downstreamlh}  ${mi_strusage}  ${mi_gamusage}  ${mi_totusage}  ${mi_servtier}  ${mi_speedtst}
    ...  ${mi_subusagewidget_dloadbtn}  ${mi_subusagewidget_gamingusagebtn}  ${mi_subusagewidget_otherusagebtn}
    ...  ${mi_subusagewidget_streamingusagebtn}  ${mi_subusagewidget_totalusage}  ${mi_servlimitswidget_dloadbtn}  ${mi_servlimitswidget_dlhbtn}
    ...  ${mi_servlimitswidget_ulhbtn}  ${mi_compvisitwidget_dloadbtn}  ${mi_compvisitwidget_speedtestbtn}
    ...  ${mi_usagebyappwidget_dloadbtn}  ${mi_topappswidget_dloadbtn}  ${mi_dev&wifitrendwidget_dloadbtn}  ${mi_dev&wifitrendwidget_wifiscorebtn}
    ...  ${mi_dev&wifitrendwidget_devicesbtn}
    wait until page contain elements  @{elements}


validate clicking all widget download buttons in marketing insights screen
    ${buttons}=  get element count  ${mi_downloadbtnpath}
    FOR  ${num}  IN RANGE  1  ${buttons}
    click element   (//button[contains(@class,'btn-dload')])[${num}]
    END


validate clicking legend buttons for service limits
    click element until enabled  ${mi_servlimitswidget_dlhbtn}
    click element until enabled  ${mi_servlimitswidget_ulhbtn}
    click element until enabled  ${mi_servlimitswidget_dlhbtn}
    click element until enabled  ${mi_servlimitswidget_ulhbtn}


extracting table data from top applications widget
    get table data without api call  ${mi_topappswidget_trow}  ${mi_topappswidget_tcol}


get data by enabling each usage button in subsriber usage widget
    [Arguments]  ${testName}  ${legendBtn1}  ${legendBtn2}   ${barXpath}  ${tipXpath}
    click element  ${legendBtn1}
    click element  ${legendBtn2}
    Get the Data from Bar Graph Widget without api call  ${barXpath}  ${tipXpath}
    click element  ${legendBtn1}
    click element  ${legendBtn2}


get data by enabling each legend button in competitor visit widget
    [Arguments]  ${testName}  ${legendBtn}  ${barXpath}  ${tipXpath}
    click element  ${legendBtn}
    Get the Data from Bar Graph Widget without api call  ${barXpath}  ${tipXpath}
    click element  ${legendBtn}


get data from usage by applications pie chart
    @{elements}=  get webelements  ${mi_usagebyappwidget_piexpath}
    FOR  ${element}  IN  @{elements}
    mouse over  ${element}
    sleep  1
    ${text}=  get text  ${mi_usagebyappwidget_pietooltip}
    log  ${text}
    END


get data from subscriber usage widget
    FOR  ${num}  IN RANGE  1  10
    mouse over  (//*[@id='subscribe-usage']//*[contains(@class,'point')])[${num}]
    ${text}=  get text  ${mi_cmc_subusagewidget_tooltip}
    log  ${text}
    END

get data from speedtest chart
    [Documentation]   get data from speedtest tooltip
    FOR  ${num}  IN RANGE  1  7
    mouse over  (//*[@id='speed-test-chart']//*[contains(@class,'point')])[${num}]
    ${text}=  get text  ${mi_cmc_compVisitWidget_tooltip}
    log  ${text}
    END

get data from speedtest chart for CMC
    [Documentation]   get data from speedtest and Competitor Visit tooltip
    FOR  ${num}  IN RANGE  1  13
    mouse over  (//*[@id='speed-test-chart']//*[contains(@class,'point')])[${num}]
    ${text}=  get text  ${mi_cmc_compVisitWidget_tooltip}
    log  ${text}
    END

validating clicking legend buttons for dev and wifi score widget
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    click element until enabled  ${mi_dev&wifitrendwidget_wifiscorebtn}
    click element until enabled   ${mi_dev&wifitrendwidget_devicesbtn}
    click element until enabled  ${mi_dev&wifitrendwidget_wifiscorebtn}
    click element until enabled   ${mi_dev&wifitrendwidget_devicesbtn}



Validate marketing insights for subscriber in CMC search results
    ${response}=   call method    ${CMCconnectionObj}    SEARCH_SubscriberCount
    Run Keyword Unless  "${response}" == "(200, 0)"  Run Keywords
    ...  go to marketing insights for a subsriber from search results
    ...  AND  verify elements on marketing insights screen
    ...  AND  validate clicking all widget download buttons in marketing insights screen
    ...  AND  get data from subscriber usage widget
    ...  AND  validate clicking legend buttons for service limits
    ...  AND  get data from speedtest chart for CMC
    ...  AND  extracting table data from top applications widget
    ...  AND  get data from usage by applications pie chart
    ...  AND  validating clicking legend buttons for dev and wifi score widget

verify elements on marketing insights screen
    [Documentation]   CCL-68673_11 - Validate the marketing insights screen
    Capture the Screen  marketingInsightsScreen
    @{txt}=  Create List  ${mi_marketingInsightsHeadertxt}  ${mi_compvisitwidget_headertxt}  ${mi_dev&wifitrendwidget_headertxt}
    ...  ${mi_servlimitswidget_headertxt}  ${mi_subusagewidget_headertxt}  ${mi_topappswidget_headertxt}  ${mi_usagebyappwidget_headertxt}
    wait until page contains multiple text  @{txt}

    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    @{elements}=  Create List  ${mi_closebtn}  ${mi_subscriberaddress}  ${mi_devices}  ${mi_wifiscore}  ${mi_attainablerates}
    ...  ${mi_upstreamlh}  ${mi_downstreamlh}  ${mi_strusage}  ${mi_gamusage}  ${mi_totusage}  ${mi_servtier}  ${mi_speedtst}
    ...  ${mi_subusagewidget_dloadbtn}  ${mi_subusagewidget_gamingusagebtn}  ${mi_subusagewidget_otherusagebtn}
    ...  ${mi_subusagewidget_streamingusagebtn}  ${mi_subusagewidget_totalusage}  ${mi_servlimitswidget_dloadbtn}  ${mi_servlimitswidget_dlhbtn}
    ...  ${mi_servlimitswidget_ulhbtn}  ${mi_compvisitwidget_dloadbtn}  ${mi_compvisitwidget_speedtestbtn}
    ...  ${mi_usagebyappwidget_dloadbtn}  ${mi_topappswidget_dloadbtn}  ${mi_dev&wifitrendwidget_dloadbtn}  ${mi_dev&wifitrendwidget_wifiscorebtn}
    ...  ${mi_dev&wifitrendwidget_devicesbtn}
    wait until page contain elements  @{elements}

#customKeys

