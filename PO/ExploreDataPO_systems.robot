*** Settings ***
Library    SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Resource    ../PO/CommonWrapper.robot
Resource   ../PO/LandingPage.robot
Resource   ../PO/ExploreData_BasicMenus.robot
Variables  ../utils/CMC-API.py

*** Variables ***
${deviceTab}=  id=deviceData-list-menu

${ciq_HeaderTxt}=  CommandIQ Trending
${ciqChart}=  //*[@id='command-status-IQ-chart']
${ciq_DloadBtn}=  (//*[contains(@class,'dload')])[1]
${ciq_ExpandBtn}=  (//*[contains(@class,'expand')])[1]
${ciq_legndCiq}=  (//*[contains(@class,'legend-item')])[1]
${ciq_yaxis_0}=  //*[@id='command-status-IQ-chart']//*[contains(@class,'yaxis-labels')]//*[text()='0']


${ManagedservicesHeaderTxt}=  Managed Services Trending
${revEdgeChart}=  //*[@id='revenue-edge-graph-div-system']
${revEdge_dloadBtn}=  (//*[contains(@class,'dload')])[2]
${revEdge_expandBtn}=  (//*[contains(@class,'expand')])[2]
${revEdge_legndEiq}=  (//*[contains(@class,'legend-item')])[2]
${revEdge_legndPiq}=  (//*[contains(@class,'legend-item')])[3]
${revEdge_legndArlo}=  (//*[contains(@class,'legend-item')])[4]
${revEdge_yaxis_0}=  //*[@id='revenue-edge-graph-div-system']//*[contains(@class,'yaxis-labels')]//*[text()='0']


${systemTrendsHeaderTxt}=  System by Model
${systemTrendsChart}=  //*[@id='systemModel-graph-div-system']
${sysTrends_dloadBtn}=  (//*[contains(@class,'dload')])[3]
${sysTrends_expandBtn}=  (//*[contains(@class,'expand')])[3]
${sysTrends_gm1020}=  (//*[contains(@class,'legend-item')])[5]
${sysTrends_gm1028}=  (//*[contains(@class,'legend-item')])[6]
${sysTrends_gs2020e}=  (//*[contains(@class,'legend-item')])[7]
${sysTrends_gs2026e}=  (//*[contains(@class,'legend-item')])[8]
${sysTrends_gs2028e}=  (//*[contains(@class,'legend-item')])[9]
${sysTrends_gs4220e}=  (//*[contains(@class,'legend-item')])[10]
${sysTrends_yaxis_0}=  //*[@id='systemModel-graph-div-system']//*[contains(@class,'yaxis-labels')]//*[text()='0']


${fullview_dloadBtn}=  id=subscriberChartDownload
${fullview_closeBtn}=  //*[contains(@class,'inv')]
${fullview_legndCiq}=  (//*[contains(@class,'legend-item')]//*[text()='CommandIQ'])[2]
${fullview_legndEiq}=  (//*[contains(@class,'legend-item')]//*[text()='ExperienceIQ'])[2]
${fullview_legndPiq}=  (//*[contains(@class,'legend-item')]//*[text()='ProtectIQ'])[2]
${fullview_legndArlo}=  (//*[contains(@class,'legend-item')]//*[text()='Arlo'])[2]
${fullview_gm1020}=  (//*[contains(@class,'legend-item')]//*[text()='GM1020'])[2]
${fullview_gm1028}=  (//*[contains(@class,'legend-item')]//*[text()='GM1028'])[2]
${fullview_gs2020e}=  (//*[contains(@class,'legend-item')]//*[text()='GS2020E'])[2]
${fullview_gs2026e}=  (//*[contains(@class,'legend-item')]//*[text()='GS2026E'])[2]
${fullview_gs2028e}=  (//*[contains(@class,'legend-item')]//*[text()='GS2028E'])[2]
${fullview_gs4220e}=  (//*[contains(@class,'legend-item')]//*[text()='GS4220E'])[2]

${legndHidden}=  //*[contains(@class,'legend-item-hidden')]

${deviceTrends_legendList}=    //*[@id="systemModel-graph-div-system"]//*[@class="highcharts-root"]//*[@class="highcharts-legend"]//*[name()="text"]


*** Keywords ***
navigate to device under basic tab
    click element until visible  ${devicetab}
    sleep  7
    capture the screen  deviceScreen

verify elements in the device tab
    [Documentation]   Basic validation for Systems tab
    @{txt}=  Create List  ${ciq_headertxt}  ${ManagedservicesHeaderTxt}  ${systemTrendsHeaderTxt}
    page should contain multiple text  @{txt}

    @{elements}=  Create List  ${ciq_dloadbtn}  ${ciq_expandbtn}  ${ciq_legndciq}
    ...  ${revedge_dloadbtn}  ${revedge_expandbtn}  ${revedge_legndeiq}  ${revedge_legndpiq}  ${revedge_legndarlo}
    ...  ${sysTrends_dloadBtn}  ${sysTrends_expandBtn}
    page should contain multiple element  @{elements}

    click element until visible  ${ciq_dloadbtn}
    click element until visible  ${revedge_dloadbtn}
    click element until visible  ${sysTrends_dloadBtn}
    Run Keyword And Ignore Error  validate legend buttons on the screen



validate commandIQ widget in fullview
    click element until visible  ${ciq_expandbtn}
    sleep  5
    page should contain the element  ${ciq_headertxt}
    @{elements}=  Create List  ${fullview_dloadbtn}  ${fullview_closebtn}  ${fullview_legndciq}
    page should contain multiple element  @{elements}
    click element until visible  ${fullview_dloadbtn}
    click element until visible  ${fullview_closebtn}
    sleep  7

validate Managed Services widget in fullview
    [Documentation]   Managed Services Subscribers widget widgets after expanded chart to fullview
    click element until visible  ${revedge_expandbtn}
    sleep  5
    page should contain the element  ${ManagedservicesHeaderTxt}
    @{elements}=  Create List  ${fullview_dloadbtn}  ${fullview_closebtn}  ${fullview_legndeiq}
    ...  ${fullview_legndpiq}  ${fullview_legndarlo}
    page should contain multiple element  @{elements}
    click element until visible  ${fullview_dloadbtn}
    click element until visible  ${fullview_closebtn}
    sleep  7

Device Trends Legends verify with API
    ${response}=   call method     ${CMCconnectionObj}    Device_Trends
    @{Get_trendsLegend}=   Get WebElements    ${deviceTrends_legendList}
    FOR  ${get_legends}  IN   @{Get_trendsLegend}
    ${LegentText}=   get text    ${get_legends}
    ${ConvertAPI}=    convert to string   ${response}
    should contain    ${ConvertAPI}    ${LegentText}
    END

validate system trends widget in fullview
    Device Trends Legends verify with API
    click element until visible  ${sysTrends_expandBtn}
    sleep  5
    page should contain the element  ${systemTrendsHeaderTxt}
     @{elements}=  Create List  ${fullview_dloadbtn}  ${fullview_closebtn}
    page should contain multiple element  @{elements}
    click element until visible  ${fullview_dloadbtn}
    click element until visible  ${fullview_closebtn}
    sleep  7
    Device Trends Legends verify with API


Click download and verify the chart should still be visible - CIQ Trending
    [Documentation]  This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible  ${ciq_DloadBtn}
    Verify expected elements on CIQ Trending

Verify expected elements on CIQ Trending
#    scroll element into view  ${ciqChart}
    @{elements}=  create list  ${ciq_DloadBtn}   ${ciq_ExpandBtn}
    ...  ${ciq_yaxis_0}
    wait until page contain elements  @{elements}
    capture the screen  ciqTrending-afterDownloadClick


Click download and verify the chart should still be visible - Rev EDGE Trending
    [Documentation]  This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible  ${revEdge_dloadBtn}
    Verify expected elements on Rev EDGE Trending

Verify expected elements on Rev EDGE Trending
#    scroll element into view  ${revEdgeChart}
    @{elements}=  create list  ${revEdge_dloadBtn}   ${revEdge_expandBtn}
    ...  ${revEdge_yaxis_0}
    wait until page contain elements  @{elements}
    capture the screen  revEdgeTrending-afterDownloadClick


Click download and verify the chart should still be visible - Sys By Model
    [Documentation]  This validation is because sometimes the chart data vanishes when clicked on download.
    click element until visible  ${sysTrends_dloadBtn}
    Verify expected elements on Sys By Model

Verify expected elements on Sys By Model
    scroll element into view  ${systemTrendsChart}
    @{elements}=  create list  ${sysTrends_dloadBtn}   ${sysTrends_expandBtn}
    ...  ${sysTrends_yaxis_0}
    wait until page contain elements  @{elements}
    capture the screen  sysByModel-afterDownloadClick