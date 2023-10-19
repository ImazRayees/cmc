*** Settings ***
Library     SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Resource    ../PO/CommonWrapper.robot
Resource    ../PO/ExploreDataPO_subscriber.robot

*** Variables ***

${applicatoinsTab}=   id=applicationData-list-menu
${applications_usageByApplTypelabelTxt}=   Usage by Application Type
${applications_usageByApplTypeChart}=  //*[@id='usage-by-app-chart']
${applications_usageByApplType_quesBtn}=  id=usageAppModelOpen
${applications_usageByApplType_quesBtn_stringAttrubute}=   The distribution of subscribers by application type.
${applications_usageByApplType_downloadBtn}=   id=usageAppDownloadSection
${applications_usageByApplType_expanddBtn}=   id=usageAppExpandSection
${applications_usageByApplType_noData}=  (//*[contains(@class,'text-center')])[3]
${applications_fullView_quesBtn}=   id=applicationChartModalExpand
${applications_fullView_downloadBtn}=   id=applicationChartModalDownlod

${applications_usageByApplType_usageByApplTypePieChart_webCloudStorageHosting_location}=  //*[@class='highcharts-label highcharts-data-label highcharts-data-label-color-1']
${applications_usageByApplType_usageByApplTypePieChart_webCloudStorageHosting_tooltip}=  //*[@class='highcharts-label highcharts-tooltip highcharts-color-1']
${applications_usageByApplType_usageByApplTypePieChart_amazon_location}=  //*[@class='highcharts-label highcharts-data-label highcharts-data-label-color-2']
${applications_usageByApplType_usageByApplTypePieChart_amazon_tooltip}=  //*[@class='highcharts-label highcharts-tooltip highcharts-color-2']
${applications_usageByApplType_usageByApplTypePieChart_apple_location}=  //*[@class='highcharts-label highcharts-data-label highcharts-data-label-color-3']
${applications_usageByApplType_usageByApplTypePieChart_apple_tooltip}=   //*[@class='highcharts-label highcharts-tooltip highcharts-color-3']
${applications_usageByApplType_usageByApplTypePieChart_other_location}=  //*[@class='highcharts-label highcharts-data-label highcharts-data-label-color-4']
${applications_usageByApplType_usageByApplTypePieChart_other_tooltip}=  //*[@class='highcharts-label highcharts-tooltip highcharts-color-4']
${applications_usageByApplType_usageByApplTypePieChart_streamingMedia_location}=  //*[@class='highcharts-label highcharts-data-label highcharts-data-label-color-0']
${applications_usageByApplType_usageByApplTypePieChart_streamingMedia_tooltip}=  //*[@class='highcharts-label highcharts-tooltip highcharts-color-0']
${applications_UBApieChart_pieElements}=  //*[@id='usage-by-app-chart']//*[contains(@class,'highcharts-series')]//*[contains(@class,'highcharts-series')]//*[contains(@class,'highcharts-point')]
${applications_UBApieChart_pieTooltip}=  //*[contains(@class,'highcharts-tooltip highcharts')]/*[@x]
${applications_UBApieChart_fullview_pieElements}=  //*[@id='Usage by Application Type']//*[contains(@class,'highcharts-series')]//*[contains(@class,'highcharts-series')]//*[contains(@class,'highcharts-point')]
${applications_UBApieChart_fullview_pieTooltip}=  //*[contains(@class,'highcharts-tooltip highcharts')]/*[@x]
${applications_usageByApplType_usageByApplTypePieChart_fullView_webCloudStorageHosting_location}=  (//*[@class='highcharts-label highcharts-data-label highcharts-data-label-color-1'])[2]
${applications_usageByApplType_usageByApplTypePieChart_fullView_webCloudStorageHosting_toolTip}=  //*[@class='highcharts-label highcharts-tooltip highcharts-color-1']
${applications_usageByApplType_usageByApplTypePieChart_fullView_amazon_location}=  (//*[@class='highcharts-label highcharts-data-label highcharts-data-label-color-2'])[2]
${applications_usageByApplType_usageByApplTypePieChart_fullView_amazon_toolTip}=  //*[@class='highcharts-label highcharts-tooltip highcharts-color-2']
${applications_usageByApplType_usageByApplTypePieChart_fullView_apple_location}=  (//*[@class='highcharts-label highcharts-data-label highcharts-data-label-color-3'])[2]
${applications_usageByApplType_usageByApplTypePieChart_fullView_apple_toolTip}=  //*[@class='highcharts-label highcharts-tooltip highcharts-color-3']
${applications_usageByApplType_usageByApplTypePieChart_fullView_other_location}=  (//*[@class='highcharts-label highcharts-data-label highcharts-data-label-color-4'])[2]
${applications_usageByApplType_usageByApplTypePieChart_fullView_other_toolTip}=  //*[@class='highcharts-label highcharts-tooltip highcharts-color-4']
${applications_usageByApplType_usageByApplTypePieChart_fullView_streamingMedia_location}=  (//*[@class='highcharts-label highcharts-data-label highcharts-data-label-color-0'])[2]
${applications_usageByApplType_usageByApplTypePieChart_fullView_streamingMedia_toolTip}=  //*[@class='highcharts-label highcharts-tooltip highcharts-color-0']
${applications_usageByApplType_usageByApplTypePieChart_fullView_exportApplicationListBtn}=   //button[contains(.,'Export Application List')]

${exportApplicationListBtn}=   //button[contains(.,'Export Application List')]

${applications_topApplLabeltxt}=   Top Applications
${applications_topApplChart}=  //*[@id='topAppTableData']
${applications_topAppl_quesBtn}=   id=topAppModelOpen
${applications_topAppl_quesBtn_stringAttrubute}=   The top 10 applications used by the subscribers with the average subscriber count and percentage.
${applications_topAppl_downloadBtn}=   id=topAppDownloadSection
${applications_topAppl_expandBtn}=   id=topAppExpandSection
${applications_topAppl_thApplication}=  //*[@id='topAppTableData']//th[contains(text(),'Application')]
${applications_topAppl_thAverage}=  //*[@id='topAppTableData']//th[contains(text(),'Average # Subscribers')]
${applications_topAppl_thPercentage}=  //*[@id='topAppTableData']//th[contains(text(),'Percentage')]


${applications_topGamingappsLabeltxt}=   Top Gaming Applications
${applications_topGamingAppsChart}=  //*[@id='topGamingAppTableData']
${applications_topGamingapps_quesBtn}=   id=topGamingModelOpen
${applications_topGamingapps_quesBtn_stringAttrubute}=   The top 10 gaming applications used by the subscribers with the average subscriber count and percentage.
${applications_topGamingapps_downloadBtn}=   id=topGamingDownloadSection
${applications_topGamingapps_expandBtn}=   id=topGamingExpandSection
${applications_topGamingapps_thApplication}=  //*[@id='topGamingAppTableData']//th[contains(text(),'Application')]
${applications_topGamingapps_thAverage}=  //*[@id='topGamingAppTableData']//th[contains(text(),'Average # Subscribers')]
${applications_topGamingapps_thPercentage}=  //*[@id='topGamingAppTableData']//th[contains(text(),'Percentage')]



${applications_socialChannelHeatmaplabeltxt}=   Social Channel Heatmap
${applications_socialChannelHeatmapChart}=  //*[@id='social-heat-map']
${applications_socialChannelHeatmap_quesBtn}=   id=socialHeatModelOpen
${applications_socialChannelHeatmap_quesBtn_stringAttrubute}=  A heatmap of subscribers by social channels, enabling you to determine which social channel and time of day is best to target for maximum return in marketing spend.
${applications_socialChannelHeatmap_downloadBtn}=   id=socialHeatDownloadSection
${applications_socialChannelHeatmap_expandBtn}=   id=socialHeatExpandSection
${applications_socialChannelHeatmap_gmtText}=  //*[@id='social-heat-map']//*[contains(@class,'gmt-text')]//*[text()='(GMT+5:30)']
${applications_socialChannelHeatmap_dropdown}=   //*[@placeholder='socialChannelSelected']//input
${applications_SCH_dropdowncontain}=   //*[contains(@placeholder,'socialChannelSelected')]
${applications_socialChannelHeatmap_dropdown_listPath}=   //*[@class='ng-dropdown-panel ng-select-bottom']//*[@class='ng-option']
${applications_socialChannelHeatmap_dropdown_placeholder}=   (//*[@class="ng-value ng-star-inserted"])[4]//*[2]
${applications_socialChannelHeatmap_dropdown_YouTube}=  //*[@class='ng-dropdown-panel ng-select-bottom']//*[@class='ng-option'][1]
${applications_socialChannelHeatmap_dropdown_Facebook}=  (//*[text()='Facebook'])[2]
${applications_socialChannelHeatmap_dropdown_Twitter}=  (//*[text()='Twitter'])[2]
${applications_socialChannelHeatmap_dropdown_Instagram}=  (//*[text()='Instagram'])[2]
${applications_socialChannelHeatmap_dropdown_Pandora}=  //*[text()='Pandora']
${applications_socialChannelHeatmap_dropdown_LinkedIn}=  //*[text()='LinkedIn']
${applications_socialChannelHeatmap_dropdown_WhatsApp}=  //*[text()='WhatsApp']
${applications_socialChannelHeatmap_dropdown_Snapchat}=  //*[text()='Snapchat']
${applications_socialChannelHeatmap_dropdown_Pinterest}=  //*[text()='Pinterest']
${applications_socialChannelHeatmap_dropdown_Spotify}=  //*[text()='Spotify']
${applications_socialChannelHeatmap_dropdown_audit_ani}=  //*[text()='audit_ani']
${applications_socialChannelHeatmap_dropdown_cld}=  //*[text()='cld']
${applications_socialChannelHeatmap_dropdown_Discovery}=  //*[text()='Discovery']
${applications_socialChannelHeatmap_dropdown_N}=  //*[text()='N']
${applications_socialChannelHeatmap_dropdown_Speed4}=  //*[text()='Speed 4']
${applications_socialChannelHeatmap_dropdown_TwitterString}=  Twitter
${applications_socialChannelHeatmap_dropdown_InstagramString}=  Instagram
${applications_socialChannelHeatmap_dropdown_PandoraString}=  Pandora
${applications_socialChannelHeatmap_dropdown_LinkedInString}=  LinkedIn
${applications_socialChannelHeatmap_dropdown_WhatsAppString}=  WhatsApp
${applications_socialChannelHeatmap_dropdown_SnapchatString}=  Snapchat
${applications_socialChannelHeatmap_dropdown_PinterestString}=  Pinterest
${applications_socialChannelHeatmap_dropdown_SpotifyString}=  Spotify
${applications_socialChannelHeatmap_dropdown_audit_aniString}=  audit_ani
${applications_socialChannelHeatmap_dropdown_cldString}=  cld
${applications_socialChannelHeatmap_dropdown_DiscoveryString}=  Discovery
${applications_socialChannelHeatmap_dropdown_Nstring}=  N
${applications_socialChannelHeatmap_dropdown_Speed4String}=  Speed 4

${applicationsScreen}=  applicationsScreen



*** Keywords ***

navigate to applications under basic tab
    click element until enabled  ${applicatoinstab}
    sleep  2
    capture the screen  ${applicationsscreen}


verify elements on applications screen
    [Documentation]   Verify the elements in application-Explore Data
    set selenium implicit wait   10
    @{multitxt}=  Create List   ${applications_usagebyappltypelabeltxt}   ${applications_topappllabeltxt}   ${applications_topgamingappslabeltxt}
    ...   ${applications_socialchannelheatmaplabeltxt}
    page should contain multiple text  @{multitxt}

    @{elements}=  Create List    ${applications_topappl_downloadbtn}  ${applications_topappl_expandbtn}   ${applications_topappl_quesbtn}
#    ...  ${applications_socialchannelheatmap_quesbtn}  ${applications_socialchannelheatmap_downloadbtn}  ${applications_socialchannelheatmap_dropdown}  ${applications_socialchannelheatmap_expandbtn}
    ...  ${applications_topgamingapps_downloadbtn}   ${applications_topgamingapps_expandbtn}   ${applications_topgamingapps_quesbtn}
    ...  ${applications_usagebyappltype_downloadbtn}   ${applications_usagebyappltype_expanddbtn}   ${applications_usagebyappltype_quesbtn}
    page should contain multiple element  @{elements}


validating widget icons data with mouse over in applications tab
    [Arguments]  ${testData}  ${webElement}  ${comparingString}
    set selenium implicit wait  10 seconds
    Mouse Over  ${webElement}
    ${tooltipData}=  Get WebElement   ${webElement}
    ${tooltipTitle}=   Call Method   ${tooltipData}   get_attribute   title
    should be equal as strings  ${tooltipTitle}  ${comparingString}



validate clicking widget icons in applications screen
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
    capture the screen  ${applicationsscreen}


validate download button fuction by clicking any bar from Usage By Application widget in applications screen
    sleep  2
    click element until enabled  ${applications_usagebyappltype_expanddbtn}
    sleep  3
    click element until enabled  ${applications_usagebyappltype_usagebyappltypepiechart_fullView_amazon_location}
    sleep  5
    click element until enabled  ${fullview_dropdowndloadbtn}
    click element until enabled  ${exportapplicationlistbtn}
    sleep  2



validating tooltip data for Usage by application pie in applications screen
    sleep  5s
    @{elements}=  get webelements  ${applications_ubapiechart_pieelements}
    FOR  ${element}  IN  @{elements}
    mouse over  ${element}
    sleep  5s
    ${txt}=  get text  ${applications_ubapiechart_pietooltip}
    capture the screen  Tooltipdata for Usage by application
    END




expand Usage by application widget and validate data
    set selenium implicit wait  10 seconds
    click element until enabled  ${applications_usagebyappltype_expanddbtn}
    sleep  2
    capture the screen  ${widgetfullviewscreen}



validating tooltip data in fullview for UBA pie in applications screen
    @{elements}=  get webelements  ${applications_ubapiechart_fullview_pieElements}
    FOR  ${element}  IN  @{elements}
    mouse over  ${element}
    sleep  5s
    ${txt}=  get text  ${applications_ubapiechart_fullview_pietooltip}
    END



minimize the full view widget screen
    set selenium implicit wait  10 seconds
    click element until enabled  ${expandinvertbtn}
    sleep  10
    capture the screen  ${applicationsscreen}


validating dropdown under SCH widget
    [Arguments]  ${testData}  ${ddValue}
    [Documentation]   This validation is because sometimes the chart data not available in UI
    ${response}=    call method    ${API_CMCObj}   Social_Channel_Heatmap_charts
    ${response_text}=  convert to string   ${response}[1]
    Run Keyword If   "${response_text}" == "${SCH_APItxt}"    Validate the different social channel in Exploredata page   ${testData}  ${ddValue}
    ...   ELSE   log    No data available in Charts

Validate the different social channel in Exploredata page
    [Arguments]    ${testData}  ${ddValue}
    ${response}=    call method    ${API_CMCObj}   Social_Channel_Heatmap_charts
    ${response_text}=  convert to string   ${response}[2][0]
    ${Social_txt}=   remove string   ${response_text}   [  ]  (  )  '  dict_keys
    run keyword if   '${test_data_config['env']['Home']}[Youtube_txt]' == '${Social_txt}'    Validate the Social channel heatmap Youtube only in Exploredata   ${testData}  ${test_data_config['env']['Home']}[Youtube_txt]
    ...   ELSE IF   '${test_data_config['env']['Home']}[Fb_Yt_txt]' == '${Social_txt}'    Validate the dropdown only contains YT and FB  ${testData}  ${ddValue}
    ...   ELSE   '${test_data_config['env']['Home']}[Facebook_txt]' == '${Social_txt}'   Validate the Social channel heatmap Facebook only in Exploredata   ${testData}  ${test_data_config['env']['Home']}[Facebook_txt]

Validate the Social channel heatmap Youtube only in Exploredata
    [Documentation]  Dropdown only contains Youtube
    [Arguments]    ${testData}  ${ddValue}
    click element until visible   ${applications_socialchannelheatmap_dropdown}
    ${Actual_dropdown}=  get text  ${home_SCH_dropdownlist}
    Should be Equal    ${Actual_dropdown}   ${test_data_config['env']['Home']}[Youtube_txt]
    click element until enabled  //*[contains(@class,'scroll-host')]//*[contains(text(),'${ddValue}')]
    capture the screen  ${ddValue}-selected
    sleep  2
    Element Should Contain   ${applications_SCH_dropdowncontain}  ${ddValue}

Validate the Social channel heatmap Facebook only in Exploredata
    [Documentation]  Dropdown only contains Facebook
    [Arguments]    ${testData}  ${ddValue}
    click element until visible   ${applications_socialchannelheatmap_dropdown}
    ${Actual_dropdown}=  get text  ${home_SCH_dropdownlist}
    Should be Equal    ${Actual_dropdown}   ${test_data_config['env']['Home']}[Facebook_txt]
    click element until enabled  //*[contains(@class,'scroll-host')]//*[contains(text(),'${ddValue}')]
    capture the screen  ${ddValue}-selected
    sleep  2
    Element Should Contain   ${applications_SCH_dropdowncontain}  ${ddValue}

Validate the dropdown only contains YT and FB
    [Arguments]  ${testData}  ${ddValue}
    [Documentation]   CCL-52639 Dropdown only contains Facebook and Youtube
    set selenium implicit wait   10
    sleep  5
    @{list}=  Create List  ${test_data_config['env']['Home']}[Facebook_txt]   ${test_data_config['env']['Home']}[Youtube_txt]
    ${Actual_dropdown}=  Get dropdown Actual Lists   ${applications_socialchannelheatmap_dropdown}   ${home_SCH_dropdownlist}
    Should be Equal    ${Actual_dropdown}   ${list}
    click element until enabled  //*[contains(@class,'scroll-host')]//*[contains(text(),'${ddValue}')]
    capture the screen  ${ddValue}-selected
    sleep  2
    Element Should Contain   ${applications_SCH_dropdowncontain}  ${ddValue}

Click download and verify the chart should still be visible - Usage by apps
    [Documentation]  This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible  ${applications_usageByApplType_downloadBtn}
    validating tooltip data for Usage by application pie in applications screen


Click download and verify the chart should still be visible - Top Applications
    [Documentation]  This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible  ${applications_topAppl_downloadBtn}
    Verify expected elements on Top Applications

Verify expected elements on Top Applications
#    scroll element into view  ${applications_topApplChart}
    @{elements}=  create list  ${applications_topAppl_quesBtn}   ${applications_topAppl_downloadBtn}
    ...  ${applications_topAppl_expandBtn}
    ...  ${applications_topAppl_thApplication}  ${applications_topAppl_thAverage}
    ...  ${applications_topAppl_thPercentage}
    wait until page contain elements  @{elements}
    capture the screen  topApps-afterDownloadClick


Click download and verify the chart should still be visible - Top Gaming Apps
    [Documentation]  This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible  ${applications_topGamingapps_downloadBtn}
    Verify expected elements on Top Gaming Apps

Verify expected elements on Top Gaming Apps
    scroll element into view  ${applications_topGamingAppsChart}
    @{elements}=  create list  ${applications_topGamingapps_quesBtn}   ${applications_topGamingapps_downloadBtn}
    ...  ${applications_topGamingapps_expandBtn}
    ...  ${applications_topGamingapps_thApplication}  ${applications_topGamingapps_thAverage}
    ...  ${applications_topGamingapps_thPercentage}
    wait until page contain elements  @{elements}
    capture the screen  topGamingApps-afterDownloadClick


Click download and verify the chart should still be visible - Social Channel Heatmap
    [Documentation]  This validation is because sometimes the chart data not available in UI
    ${response}=    call method    ${API_CMCObj}   Social_Channel_Heatmap_charts
    ${response_text}=  convert to string   ${response}[1]
    Run Keyword If   "${response_text}" == "${SCH_APItxt}"    Click download and verify the chart for SCH
    ...   ELSE   log    No data available in Charts

Click download and verify the chart for SCH
    [Documentation]  This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible  ${applications_socialChannelHeatmap_downloadBtn}
    Verify expected elements on Social Channel Heatmap

Verify expected elements on Social Channel Heatmap
#    scroll element into view  ${applications_socialChannelHeatmapChart}
    @{elements}=  create list  ${applications_socialChannelHeatmap_quesBtn}   ${applications_socialChannelHeatmap_downloadBtn}
    ...  ${applications_socialChannelHeatmap_expandBtn}  ${applications_socialChannelHeatmap_gmtText}
    wait until page contain elements  @{elements}
    capture the screen  sch-afterDownloadClick