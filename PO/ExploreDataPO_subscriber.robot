*** Settings ***
Library    SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Resource    ../PO/CommonWrapper.robot
Resource   ../PO/LandingPage.robot
Resource   ../PO/ExploreData_BasicMenus.robot
Resource   ../PO/homeScreenPO.robot
Resource   ../PO/PageTitleKeywords.robot


*** Variables ***
${url}=    https://stage.elitecorpusa.in/
${loginScreen}=  loginScreen
${username_txtFiled}=    id=username
${next_btnn}=    //button[contains(.,"Next")]
${password_txtField}=    id=password
${Login_btn}=    //button[contains(.,"Sign In")]


${homeScreen}=  homeScreen
${close_btn}=   //button[contains(@class,'close')]
${cancel_btn}=   //button[contains(., "Cancel")]
${expandInvertbtn}=   //*[@class="btn-round btn-small-24 btn-grey btn-expand-inv"]
${menu_iconBox}=   //*[@id="dropdownPeriod"]
${marketingCloudBtn}=   //*[@id='menu-category']//*[contains(text(),'Engagement')]
${marketingCloudScreen}=  marketingCloudScreen
${exploreDatabtn}=   //a[contains(.,"Explore Data")]
${exploreDataScreen}=  exploreDataScreen
${basicTab}=   //a[contains(.,"Basic")]



${subscribersTab}=   id=subscribeData-list-menu
${exploreData_pendo_Stream_questionIcons}=  //button//*[@id='pendo-image-badge-615be5d1']
${exploreData_pendo_Gaming_questionIcons}=  //button//*[@id='pendo-image-badge-7d65ce88']
${exploreData_pendo_WFH_questionIcons}=  //button//*[@id='pendo-image-badge-2a693dbc']
${exploreData_pendo_questionIcons}=  //button//*[contains(@id,'pendo-image')]
${subscribers_AllSubscriberslabelTxt}=   Subscribers
${basic_kpv_subscribers}=  //*[contains(@class,'overview-row')]//div[1]//h2
${subscribers_gamerLabeltxt}=   Gaming
${basic_kpv_gaming}=  //*[contains(@class,'overview-row')]//div[3]//h2
${subscribers_streamerLabeltxt}=   Streaming
${basic_kpv_streaming}=  //*[contains(@class,'overview-row')]//div[2]//h2
${subscribers_workFrmHomelabeltxt}=   Work from Home
${basic_kpv_wfh}=  //*[contains(@class,'overview-row')]//div[4]//h2

${exportSubscriberListBtn}=   //button[contains(.,'Export Subscriber List')]
${string_exportData}=   Export Data
${string_maximize}=   Maximize
${icons_tooltip}=   (//div[@class='marketing-wizard flex'])[1]//*[@class='mwc-btns flex']//button

${subscribers_streamingSubscribers_fullView_downloadBtn}=
${subscribers_subscriberDataUsageLabeltxt}=   Subscriber Data Usage
${subscribers_subscriberDataUsageChart}=  //*[@id='subscriber-data-usage-chart']
${subscribers_subscriberDataUsage_activSubsCount}=  (//*[@class='d-block'])[1]//h5
${subscribers_subscriberDataUsageQuesbtn}=   id=subscriberModelOpen
${subscribers_subscriberDataUsageQuesbtn_stringAtrribute}=  The distribution of subscribers by consumed bandwidth.
${subscribers_subscriberDataUsageDownloadbtn}=   id=subscriberDownloadSection
${subscribers_subscriberDataUsageExpandbtn}=   id=subscriberExpandSection
${acquisition_subscriberDataUsage_barDataList}=  //*[@id='subscriber-data-usage-chart']//*[contains(@class,'label highcharts-stack-labels')]//*[@class='highcharts-text-outline']
${subscribers_subscriberDataUsage_xaxisUsage}=  //*[@class='highcharts-axis-title']//*[contains(text(),'Usage')]
${subscribers_subscriberDataUsage_yaxis_0}=  //*[@id='subscriber-data-usage-chart']//*[contains(@class,'yaxis-labels')]//*[text()='0']
${subscribers_subscriberDataUsage_fullView_7thbar}=  //*[@id='Subscriber Data Usage']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect'][7]
${subscribers_fullView_quesBtn}=  id=subscriberChartFullView
${subscribers_fullView_downloadBtn}=  id=subscriberChartDownload


${subscribers_streamingSubscriberslabeltxt}=   Streaming Subscribers
${subscribers_streamingSubscribersChart}=  //*[@id='streaming-subscribers-chart']
${subscribers_streamingSubscribers_pendo_helpText}=  Subscribers who consume the equivalent of 1GB per day for the selected period of days worth of streaming video.
${subscribers_streamingSubscribers_streamingSubcount}=  (//*[@class='d-block'])[2]//h5
${subscribers_streamingSubscribersQuesBtn}=   //*[@id='_pendo-badge_7ZqFefHrrRywZKI4cTxo0mX4ecA']//*[contains(@id,'pendo')]
${subscribers_streamingSubscribersQuesBtn_stringAttribute}=   Subscribers who consume the equivalent of 1GB per day for the selected period of days worth of streaming video.
${subscribers_streamingSubscribersDownloadbtn}=   id=streamingDownloadSection
${subscribers_streamingSubscribersExpandbtn}=   id=streamingExpandSection
${acquisition_streamingSubscribers_barDataList}=  //*[@id='streaming-subscribers-chart']//*[contains(@class,'label highcharts-stack-labels')]//*[@class='highcharts-text-outline']
${subscribers_streamingSubscribers_yaxis_0}=  //*[@id='streaming-subscribers-chart']//*[contains(@class,'yaxis-labels')]//*[text()='0']
${subscribers_streamingSubscribers_fullView_green_1stBar}=   //*[@id='Streaming Subscribers']//*[@class='highcharts-point highcharts-color-1'][1]
${subscribers_streamingSubscribers_fullView_5thBar}=   //*[@id='Streaming Subscribers']//*[@class='highcharts-point highcharts-color-1'][5]
${subscribers_streamingSubscribers_fullView_green_4thBar}=  //*[@id='Streaming Subscribers']//*[@class='highcharts-point highcharts-color-1'][4]

${subscribers_gamingSubscribersLabeltxt}=   Gaming Subscribers
${subscribers_gamingSubscribersChart}=  //*[@id='gaming-subscribers-chart']
${subscribers_gamingSubscribers_pendo_helpTxt}=  Subscribers who consume at least 1MB of data each month through consoles such as PlayStation, services such as Xbox Live, and content on Twitch.tv.
${subscribers_gamingSubscribers_gamingSubsCount}=   (//*[@class='d-block'])[3]//h5
${subscribers_gamingSubscribersQuesBtn}=   //*[@id='_pendo-badge_yfTj2mMigmQW0mQgfucv4jI5O2U']//*[contains(@id,'pendo')]
${subscribers_gamingSubscribersQuesBtn_stringAttrubute}=   Subscribers who consume at least 1MB of data each month through consoles such as PlayStation, services such as Xbox Live, and content on Twitch.tv.
${subscribers_gamingSubscribersDownloadbtn}=   id=gamingSubscriberDownloadSection
${subscribers_gamingSubscribersExpandbtn}=    id=gamingSubscriberExpandSection
${acquisition_gamingSubscribers_barDataList}=  //*[@id='gaming-subscribers-chart']//*[contains(@class,'label highcharts-stack-labels')]//*[@class='highcharts-text-outline']
${subscribers_gamingSubscribers_yaxis_0}=  //*[@id='gaming-subscribers-chart']//*[contains(@class,'yaxis-labels')]//*[text()='0']
${subscribers_gamingSubscribers_fullView_1stGreenBar}=   //*[@id='Gaming Subscribers']//*[@class='highcharts-point highcharts-color-1'][1]
${subscribers_gamingSubscribers_fullView_5thGreenBar}=   //*[@id='Gaming Subscribers']//*[@class='highcharts-point highcharts-color-1'][5]
${subscribers_gamingSubscribers_fullView_4thGreenBar}=   //*[@id='Gaming Subscribers']//*[@class='highcharts-point highcharts-color-1'][4]



${subscribers_WFHsubscribersLabeltxt}=   Work from Home (WFH) Subscribers
${subscribers_WFHSubscribersChart}=  //*[@id='wfh-subscribers-chart']
${subscribers_WFHsubscribers_pendo_helpTxt}=  Subscribers who spend at least an average of 80 minutes per day using business applications.
${subscribers_WFHsubscribers_wfhSubsCount}=  (//*[@class='d-block'])[4]//h5
${subscribers_WFHsubscribersQuesbtn}=   //*[@id='_pendo-badge_4c1j4ygIFrvSW5c2lBO4gRn2jDs']//*[contains(@id,'pendo')]
${subscribers_WFHsubscribersQuesbtn_stringAttrubute}=   Subscribers who spend at least an average of 80 minutes per day using business applications.
${subscribers_WFHsubscribersDownloadbtn}=   id=WFHSubscriberDownloadSection
${subscribers_WFHsubscribersexpandBtn}=   id=WFHSubscriberExpandSection
${acquisition_WFHsubscribers_barDataList}=  //*[@id='wfh-subscribers-chart']//*[contains(@class,'label highcharts-stack-labels')]//*[@class='highcharts-text-outline']
${subscribers_WFHSubscribers_yaxis_0}=  //*[@id='wfh-subscribers-chart']//*[contains(@class,'yaxis-labels')]//*[text()='0']
${subscribers_WFHsubscribers_fullView_1stGreenBar}=   //*[@id='Work from Home (WFH) Subscribers']//*[@class='highcharts-point highcharts-color-1'][1]
${subscribers_WFHsubscribers_fullView_4thGreenBar}=   //*[@id='Work from Home (WFH) Subscribers']//*[@class='highcharts-point highcharts-color-1'][4]
${subscribers_WFHsubscribers_fullView_5thGreenBar}=   //*[@id='Work from Home (WFH) Subscribers']//*[@class='highcharts-point highcharts-color-1'][5]


${subscribers_subActivitytrendLabeltxt}=   Subscriber Activity Trends
${subscribers_subActivitytrendChart}=  //*[@id='subscriber-activity-trends-chart']
${subscribers_subActivitytrendQuesbtn}=   id=subscriberActivityModelOpen
${subscribers_subActivitytrendQuesbtn_stringAttrubute}=   A comparative monthly trend in streaming,WFH and gaming subscribers
${subscribers_subActivitytrendDownloadbtn}=   id=subscriberActivityDownloadSection
${subscribers_subActivitytrendExpandbtn}=   id=subscriberActivityExpandSection
${subscribers_subActivitytrend_yaxis_0}=  //*[@id='subscriber-activity-trends-chart']//*[contains(@class,'yaxis-labels')]//*[text()='0']
${subscribers_subActivitytrend_fullView_quesBtn}=
${subscribers_subActivitytrend_fullView_downloadBtn}=
${subscribers_streamingSubBtn}=   (//*[@class="highcharts-legend-item highcharts-line-series highcharts-color-0 highcharts-series-0"])[1]
${subscribers_WFHsubtn}=   (//*[@class="highcharts-legend-item highcharts-line-series highcharts-color-1 highcharts-series-1"])[1]
${subscribers_GamingsubsBtn}=   (//*[@class="highcharts-legend-item highcharts-line-series highcharts-color-2 highcharts-series-2"])[1]

${subscribers_dataUsageTrendsLabeltxt}=   Data Usage Trends
${subscribers_dataUsageTrendsChart}=  //*[@id='data-usage-trends-chart']
${subscribers_dataUsageTrendsQuesbtn}=   id=dataUsageModelOpen
${subscribers_dataUsageTrendsQuesbtn_stringAttrubute}=   A comparative usage monthly trend in bandwidth usage vs. streaming usage over time.
${subscribers_dataUsageTrendsDownloadbtn}=   id=dataUsageDownloadSection
${subscribers_dataUsageTrendsExpandbtn}=   id=dataUsageExpandSection
${subscribers_dataUsageTrends_yaxis_0}=  //*[@id='data-usage-trends-chart']//*[contains(@class,'yaxis-labels')]//*[text()='0']
${subscribers_dataUsageTrends_fullView_quesBtn}=
${subscribers_dataUsageTrends_fullView_downloadBtn}=
${subscribers_totalUsagebtn}=   (//*[@class="highcharts-legend-item highcharts-line-series highcharts-color-0 highcharts-series-0"])[2]
${subscribers_streamingUsagebtn}=    (//*[@class="highcharts-legend-item highcharts-line-series highcharts-color-1 highcharts-series-1"])[2]

${subscribers_devPerHouseholdlabelTxt}=   Devices per Household
${subscribers_devPerHouseholdChart}=  //*[@id='device-per-household-chart']
${subscribers_devPerHousehold_csc&GigaFamSubsCount}=  (//*[@class='greyaa mb0 heading-subtitle'])[2]
${subscribers_devPerHouseholdQuesbtn}=   id=deviceModelOpen
${subscribers_devPerHouseholdQuesbtn_stringAttrubute}=   The total number of subscribers using GigaFamily devices and the device count per subscribers.
${subscribers_devPerHouseholdDownloadbtn}=   id=deviceDownloadSection
${subscribers_devPerHouseholdExpandbtn}=   id=deviceExpandSection
${subscribers_devPerHousehold_yaxis_0}=  //*[@id='device-per-household-chart']//*[contains(@class,'yaxis-labels')]//*[text()='0']
${subscribers_devPerHousehold_fullView_5thBar}=   //*[@id='Devices per Household']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect'][5]

${fullView_dropdownDloadBtn}=   id=dropdownPeriod11
${fullView_loaderSpinner}=  id=serviceChartFullViewLoadMore
${widgetFullViewScreen}=  widgetFullViewScreen
${subscribersScreen}=  subscribersScreen

*** Keywords ***

Login to site
    set selenium implicit wait   10
    ${Stage_url}=   call method    ${ObjconfigReader}   stageurl
    Open Browser  ${Stage_url}   ${browser}
    sleep  10
    maximize browser window
    capture the screen  ${loginscreen}
    enter the value untill visible  ${username_txtfiled}  ${stage_USERNAME}
    click element until enabled  ${next_btnn}
    sleep  2
    enter the value untill visible  ${password_txtfield}  ${stage_PASSWORD}
    click element until enabled  ${login_btn}
    sleep    20
    ${present}=    Run Keyword And Return Status    Element Should Be Visible    //span[contains(@class,'close')]
    Run Keyword If    ${present}   close Toast Message
     ...  ELSE   log to console   No Toast Message
    Capture the Screen    Dashboard

go to marketing cloud
    sleep  5
    capture the screen  ${homescreen}
    click element until enabled  ${menu_iconBox}
    click element until enabled  ${marketingcloudbtn}
    sleep  3
    capture the screen  ${marketingcloudscreen}


click on explore data
    set selenium implicit wait   10
    click element until enabled  ${exploredatabtn}


verify elements on exploreData basic
    @{elements}=  Create List  ${basic_Region_dropdown}  ${basic_Location_dropdown}  ${basic_TimeFrame_dropdown}  ${ApplyButton}
    wait until page contain elements  @{elements}
    capture the screen  exploreDataScreen
    verify page title for exploredata screen



--------------------------------SUBSCRIBERSdiv
navigate to subscribers tab under basic tab
    set selenium implicit wait   10
    click element until enabled  ${exploredatabtn}
    click element until enabled  ${subscriberstab}


verify elements on subscribers tab
    @{multitxt}=  Create List  ${subscribers_allsubscriberslabeltxt}   ${subscribers_gamerlabeltxt}   ${subscribers_streamerlabeltxt}
    ...  ${subscribers_workfrmhomelabeltxt}   ${subscribers_subscriberdatausagelabeltxt}  ${subscribers_streamingsubscriberslabeltxt}
    ...  ${subscribers_gamingsubscriberslabeltxt}   ${subscribers_wfhsubscriberslabeltxt}  ${subscribers_subactivitytrendlabeltxt}
    ...  ${subscribers_datausagetrendslabeltxt}   ${subscribers_devperhouseholdlabeltxt}
    wait until page contains multiple text  @{multitxt}

    @{elements}=  Create List  ${basic_kpv_subscribers}  ${basic_kpv_gaming}  ${basic_kpv_streaming}  ${basic_kpv_wfh}  ${subscribers_subscriberdatausagequesbtn}   ${subscribers_subscriberdatausagedownloadbtn}  ${subscribers_subscriberdatausageexpandbtn}
    ...  ${subscribers_streamingsubscribersquesbtn}   ${subscribers_streamingsubscribersdownloadbtn}  ${subscribers_streamingsubscribersexpandbtn}
    ...  ${subscribers_gamingsubscribersquesbtn}  ${subscribers_gamingsubscribersdownloadbtn}  ${subscribers_gamingsubscribersexpandbtn}
    ...  ${subscribers_wfhsubscribersquesbtn}  ${subscribers_wfhsubscribersdownloadbtn}  ${subscribers_wfhsubscribersexpandbtn}
    ...  ${subscribers_subactivitytrendquesbtn}  ${subscribers_subactivitytrenddownloadbtn}  ${subscribers_subactivitytrendexpandbtn}
    ...  ${subscribers_devperhouseholdquesbtn}  ${subscribers_devperhouseholddownloadbtn}  ${subscribers_devperhouseholdexpandbtn}
    ...  ${subscribers_subscriberDataUsage_xaxisUsage}
    wait until page contain elements  @{elements}

    capture the screen  exploreData-subscribersScreen
    @{elementss}=  Create List  ${basic_kpv_subscribers}  ${basic_kpv_gaming}  ${basic_kpv_streaming}  ${basic_kpv_wfh}
    ...  ${subscribers_subscriberdatausage_activsubscount}  ${subscribers_streamingsubscribers_streamingsubcount}  ${subscribers_gamingsubscribers_gamingsubscount}
    ...  ${subscribers_wfhsubscribers_wfhsubscount}  ${subscribers_devperhousehold_csc&gigafamsubscount}
    get text from multiple element  @{elementss}

Pendo question icons validation in subscribers tab -exploreDataBasic
    Click on pendo ques icon and verify the text  streamingSubscribers  ${exploreData_pendo_Stream_questionIcons}  ${subscribers_streamingsubscribers_pendo_helptext}
    Click on pendo ques icon and verify the text  gamingSubscribers  ${exploreData_pendo_Gaming_questionIcons}  ${subscribers_gamingsubscribers_pendo_helptxt}
    Click on pendo ques icon and verify the text  wfhSubscribers  ${exploreData_pendo_WFH_questionIcons}  ${subscribers_wfhsubscribers_pendo_helptxt}

Pendo video icons validation in subscribers tab -exploreDataBasic
    Pendo video icon validation  subscriberDataUsage  (${pendo_videoicons})[1]

Filters validation for timeframe 30days - ExploreDataBasic
    log  selecting 1st region, location
    Select value from filter  ${basic_region_dropdown}  ${globVar_region1}
    Select value from filter  ${basic_location_dropdown}  ${globVar_location1}
    Select value from filter  ${basic_timeframe_dropdown}  30 Days
    click element until visible   ${applybutton}
    sleep  7
    Match kpi count with widgets count in subscribers tab -exploreDataBasic
    capture the screen  filtersVal30Days-${globVar_region1}

    log  selecting 2nd region, location
    Select value from filter  ${basic_region_dropdown}  ${globVar_region3}
    Select value from filter  ${basic_location_dropdown}  ${globVar_location3}
    Select value from filter  ${basic_timeframe_dropdown}  30 Days
    click element until visible   ${applybutton}
    sleep  7
    Match kpi count with widgets count in subscribers tab -exploreDataBasic
    capture the screen  filtersVal30Days-${globVar_region3}

    log  selecting 3rd region, location
    Select value from filter  ${basic_region_dropdown}  ${globVar_region4}
    Select value from filter  ${basic_location_dropdown}  ${globVar_location4}
    Select value from filter  ${basic_timeframe_dropdown}  30 Days
    click element until visible   ${applybutton}
    sleep  7
    Match kpi count with widgets count in subscribers tab -exploreDataBasic
    capture the screen  filtersVal30Days-${globVar_region4}

    log  selecting 4th region, location
    Select value from filter  ${basic_region_dropdown}  ${globVar_region5}
    Select value from filter  ${basic_location_dropdown}  ${globVar_location5}
    Select value from filter  ${basic_timeframe_dropdown}  30 Days
    click element until visible   ${applybutton}
    sleep  7
    Match kpi count with widgets count in subscribers tab -exploreDataBasic
    capture the screen  filtersVal30Days-${globVar_region5}
    Clear filters and verify the default values

Filters validation for timeframe PriorMonth - ExploreDataBasic
    log  selecting 1st region, location
    Select value from filter  ${basic_region_dropdown}  ${globVar_region1}
    Select value from filter  ${basic_location_dropdown}  ${globVar_location1}
    Select value from filter  ${basic_timeframe_dropdown}  Prior Month
    click element until visible   ${applybutton}
    sleep  7
    Match kpi count with widgets count in subscribers tab -exploreDataBasic
    capture the screen  filtersValPrMonth-${globVar_region1}

    log  selecting 2nd region, location
    Select value from filter  ${basic_region_dropdown}  ${globVar_region3}
    Select value from filter  ${basic_location_dropdown}  ${globVar_location3}
    Select value from filter  ${basic_timeframe_dropdown}  Prior Month
    click element until visible   ${applybutton}
    sleep  7
    Match kpi count with widgets count in subscribers tab -exploreDataBasic
    capture the screen  filtersValPrMonth-${globVar_region3}

    log  selecting 3rd region, location
    Select value from filter  ${basic_region_dropdown}  ${globVar_region4}
    Select value from filter  ${basic_location_dropdown}  ${globVar_location4}
    Select value from filter  ${basic_timeframe_dropdown}  Prior Month
    click element until visible   ${applybutton}
    sleep  7
    Match kpi count with widgets count in subscribers tab -exploreDataBasic
    capture the screen  filtersValPrMonth-${globVar_region4}

    log  selecting 4th region, location
    Select value from filter  ${basic_region_dropdown}  ${globVar_region5}
    Select value from filter  ${basic_location_dropdown}  ${globVar_location5}
    Select value from filter  ${basic_timeframe_dropdown}  Prior Month
    click element until visible   ${applybutton}
    sleep  7
    Match kpi count with widgets count in subscribers tab -exploreDataBasic
    capture the screen  filtersValPrMonth-${globVar_region5}
    Clear filters and verify the default values

Filters validation for timeframe 2PriorMonth - ExploreDataBasic
    log  selecting 1st region, location
    Select value from filter  ${basic_region_dropdown}  ${globVar_region1}
    Select value from filter  ${basic_location_dropdown}  ${globVar_location1}
    Select value from filter  ${basic_timeframe_dropdown}  2 Prior Month
    click element until visible   ${applybutton}
    sleep  7
    Match kpi count with widgets count in subscribers tab -exploreDataBasic
    capture the screen  filtersVal2PrMonth-${globVar_region1}

    log  selecting 2nd region, location
    Select value from filter  ${basic_region_dropdown}  ${globVar_region3}
    Select value from filter  ${basic_location_dropdown}  ${globVar_location3}
    Select value from filter  ${basic_timeframe_dropdown}  2 Prior Month
    click element until visible   ${applybutton}
    sleep  7
    Match kpi count with widgets count in subscribers tab -exploreDataBasic
    capture the screen  filtersVal2PrMonth-${globVar_region3}

    log  selecting 3rd region, location
    Select value from filter  ${basic_region_dropdown}  ${globVar_region4}
    Select value from filter  ${basic_location_dropdown}  ${globVar_location4}
    Select value from filter  ${basic_timeframe_dropdown}  2 Prior Month
    click element until visible   ${applybutton}
    sleep  7
    Match kpi count with widgets count in subscribers tab -exploreDataBasic
    capture the screen  filtersVal2PrMonth-${globVar_region4}

    log  selecting 4th region, location
    Select value from filter  ${basic_region_dropdown}  ${globVar_region5}
    Select value from filter  ${basic_location_dropdown}  ${globVar_location5}
    Select value from filter  ${basic_timeframe_dropdown}  2 Prior Month
    click element until visible   ${applybutton}
    sleep  7
    Match kpi count with widgets count in subscribers tab -exploreDataBasic
    capture the screen  filtersVal2PrMonth-${globVar_region5}
    Clear filters and verify the default values


Match kpi count with widgets count in subscribers tab -exploreDataBasic
    ${subscriberKpiData}=  get the text from the element  ${basic_kpv_subscribers}
    ${activeSubsData}=  get the text from the element  ${subscribers_subscriberdatausage_activsubscount}
    should contain  ${activeSubsData}  ${subscriberKpiData}

    ${streamingKpiData}=  get the text from the element  ${basic_kpv_streaming}
    ${streamingSubsData}=  get the text from the element  ${subscribers_streamingSubscribers_streamingSubcount}
    should contain  ${streamingSubsData}  ${streamingKpiData}

    ${gamingKpiData}=  get the text from the element  ${basic_kpv_gaming}
    ${gamingSubsData}=  get the text from the element  ${subscribers_gamingsubscribers_gamingsubscount}
    should contain  ${gamingSubsData}  ${gamingKpiData}

    ${wfhKpiData}=  get the text from the element  ${basic_kpv_wfh}
    ${wfhData}=  get the text from the element  ${subscribers_wfhsubscribers_wfhsubscount}
    should contain  ${wfhData}  ${wfhKpiData}


Clear filters and verify the default values
    click element until visible  ${clearbutton}
    element should contain  ${basic_region_dropdown}  All
    element should contain  ${basic_location_dropdown}  All
    element should contain  ${basic_timeframe_dropdown}  30 Days
    wait until page does not contain element   ${clearbutton}
    capture the screen  defaultFilter-exploreData


validating widget icons data with mouse over in subscribers tab
    [Arguments]  ${testData}  ${webElement}  ${comparingString}
    set selenium implicit wait  10 seconds
    Mouse Over  ${webElement}
    ${tooltipData}=  Get WebElement   ${webElement}
    ${tooltipTitle}=   Call Method   ${tooltipData}   get_attribute   title
    should be equal as strings  ${tooltipTitle}  ${comparingString}



validate clicking widget icons in subscribers screen
    [Arguments]   ${testName}   ${downloadBtn}  ${expand}  ${headerlbl}  ${fullViewdLoad}
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
#    click element until enabled  ${cancel_btn}
#    click element until enabled  ${fullViewQues}
#    page should contain the element  ${headerlbl}
#    click element until enabled  ${close_btn}
    click element until enabled  ${fullViewdLoad}
    sleep  2
    click element until enabled  ${expandinvertbtn}
    sleep  2
    capture the screen  ${subscribersscreen}


validate download button fuction by clicking any bar from widgets in subscribers screen
    [Arguments]  ${testName}  ${expand}  ${barXpath}
    sleep  2
    click element until enabled  ${expand}
    sleep  3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Run Keyword And Ignore Error  disable one legend button if present
    click element until enabled  ${barXpath}
    sleep  2
    click element until enabled  ${fullview_dropdowndloadbtn}
    click element until enabled  ${exportsubscriberlistbtn}
    sleep  2
    click element until enabled  ${expandinvertbtn}


Disable one legend button if present
    ${status}=  Run Keyword And Return Status  element should be visible  (//*[contains(@class,'legend-item')])[13]
    Run Keyword If  ${status}  disable a legend
    ...  ELSE  legend not present log

Disable a legend
    click element until visible  (//*[contains(@class,'legend-item')])[13]

legend not present log
    log to console  legend not present

getting data from kpv basic tab
    @{elements}=  Create List  ${basic_kpv_subscribers}  ${basic_kpv_gaming}  ${basic_kpv_streaming}  ${basic_kpv_wfh}
    get text from multiple element  @{elements}

Click download and verify the chart should still be visible - Subscriber data usage
    [Documentation]  This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible  ${subscribers_subscriberDataUsageDownloadbtn}
    Verify expected elements on Subscriber data usage

Verify expected elements on Subscriber data usage
    scroll element into view  ${subscribers_subscriberDataUsageChart}
    @{elements}=  create list  ${subscribers_subscriberDataUsageQuesbtn}   ${subscribers_subscriberDataUsageDownloadbtn}
    ...  ${subscribers_subscriberDataUsageExpandbtn}  ${subscribers_subscriberDataUsage_yaxis_0}
    wait until page contain elements  @{elements}
    capture the screen  subsDataUsage-afterDownloadClick

Click download and verify the chart should still be visible - Streaming subscribers
    [Documentation]  This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible  ${subscribers_streamingSubscribersDownloadbtn}
    Verify expected elements on Streaming subscribers

Verify expected elements on Streaming subscribers
    @{elements}=  create list  ${subscribers_streamingSubscribersQuesBtn}   ${subscribers_streamingSubscribersDownloadbtn}
    ...  ${subscribers_streamingSubscribersExpandbtn}  ${subscribers_streamingSubscribers_yaxis_0}
    wait until page contain elements  @{elements}
    capture the screen  streamingSubs-afterDownloadClick

Click download and verify the chart should still be visible - Gaming subscribers
    [Documentation]  This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible  ${subscribers_gamingSubscribersDownloadbtn}
    Verify expected elements on Gaming subscribers

Verify expected elements on Gaming subscribers
    scroll element into view  ${subscribers_gamingSubscribersChart}
    @{elements}=  create list  ${subscribers_gamingSubscribersQuesBtn}   ${subscribers_gamingSubscribersDownloadbtn}
    ...  ${subscribers_gamingSubscribersExpandbtn}  ${subscribers_gamingSubscribers_yaxis_0}
    wait until page contain elements  @{elements}
    capture the screen  gamingSubs-afterDownloadClick

Click download and verify the chart should still be visible - WFH subscribers
    [Documentation]  This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible  ${subscribers_WFHsubscribersDownloadbtn}
    Verify expected elements on WFH subscribers

Verify expected elements on WFH subscribers
    @{elements}=  create list  ${subscribers_WFHsubscribersQuesbtn}   ${subscribers_WFHsubscribersDownloadbtn}
    ...  ${subscribers_WFHsubscribersexpandBtn}  ${subscribers_WFHSubscribers_yaxis_0}
    wait until page contain elements  @{elements}
    capture the screen  wfhSubs-afterDownloadClick

Click download and verify the chart should still be visible - Subscriber activity trends
    [Documentation]  This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible  ${subscribers_subActivitytrendDownloadbtn}
    Verify expected elements on Subscriber activity trends

Verify expected elements on Subscriber activity trends
    scroll element into view  ${subscribers_subActivitytrendChart}
    @{elements}=  create list  ${subscribers_subActivitytrendQuesbtn}   ${subscribers_subActivitytrendDownloadbtn}
    ...  ${subscribers_subActivitytrendExpandbtn}  ${subscribers_subActivitytrend_yaxis_0}
    wait until page contain elements  @{elements}
    capture the screen  subsActTrends-afterDownloadClick

Click download and verify the chart should still be visible - Data usage trends
    [Documentation]  This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible  ${subscribers_dataUsageTrendsDownloadbtn}
    Verify expected elements on Data usage trends

Verify expected elements on Data usage trends
    @{elements}=  create list  ${subscribers_dataUsageTrendsQuesbtn}   ${subscribers_dataUsageTrendsDownloadbtn}
    ...  ${subscribers_dataUsageTrendsExpandbtn}  ${subscribers_dataUsageTrends_yaxis_0}
    wait until page contain elements  @{elements}
    capture the screen  dataUsageTrends-afterDownloadClick

Click download and verify the chart should still be visible - Dev per household trends
    [Documentation]  This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible  ${subscribers_devPerHouseholdDownloadbtn}
    Verify expected elements on Dev per household trends

Verify expected elements on Dev per household trends
    scroll element into view  ${subscribers_devPerHouseholdChart}
    @{elements}=  create list  ${subscribers_devPerHouseholdQuesbtn}   ${subscribers_devPerHouseholdDownloadbtn}
    ...  ${subscribers_devPerHouseholdExpandbtn}  ${subscribers_devPerHousehold_yaxis_0}
    wait until page contain elements  @{elements}
    capture the screen  devicePerHouseholdTrends-afterDownloadClick