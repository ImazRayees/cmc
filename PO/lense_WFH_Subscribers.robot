*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Variables   ../utils/configReader.py
Variables  ../utils/InsightScreenAPI.py
Variables  ../utils/CMC-API.py
Resource    CommonWrapper.robot


*** Variables ***
${Subscriberlense4_get_tooltip}=    //*[@id='wfh-subscribers-chart']//*[name()='div']//*[name()='svg']//*[name()='g'][5]/*[name()='g']//*[name()='rect']
${Subscriberlense4_get_tooltip_text}=    //*[@id='wfh-subscribers-chart']//*[name()='svg']//*[name()='g'][11]//*[name()='text']

${Subscriberlense4_drilldown_get_tooltip}=    //*[@id='Work from Home (WFH) Subscribers']//*[name()='div']//*[name()='svg']//*[name()='g'][5]/*[name()='g']//*[name()='rect']
${Subscriberlense4_drilldown_get_tooltip_text}=    //*[@id='Work from Home (WFH) Subscribers']//*[name()='svg']//*[name()='g'][11]//*[name()='text']

${Subscriberlense4_Drilldown_bar}=    //*[@id='Work from Home (WFH) Subscribers']//*[name()='div']//*[name()='svg']//*[name()='g'][5]/*[name()='g']//*[name()='rect'][5]

${Subscriberlense4_quesionIcon}=    (//*[@class='btn-round btn-small-24 btn-grey btn-que'])[3]
${Subscriberlense4_expandIcon}=    (//*[@class='btn-round btn-small-24 btn-grey btn-expand'])[3]
${Subscriberlense4_downloadIcon}=    (//*[@class='btn-round btn-small-24 btn-grey btn-dload'])[3]

${Subscriberlense4_Minimize}=    //*[@id='subscriberChartFullViewClose']

${Subscriberlense4_drilldownHeader}=    //*[@class='fullscreen-table-info ng-star-inserted']

${drilldown_table_rows}=     //*[@id='append-table-list']/tr
${drilldown_table_columns}=    //*[@id='append-table-list']/tr[1]/td

${drilldown_table_rows}=     //*[@id='append-table-list']/tr
${drilldown_table_columns}=    //*[@id='append-table-list']/tr[1]/td

${Subscriberlense4_Non_WFH}=    (//*[@class='highcharts-legend-item highcharts-column-series highcharts-color-1 highcharts-series-1'])[3]
${Subscriberlense4_Non_WFH_hidden}=    (//*[@class='highcharts-legend-item highcharts-column-series highcharts-color-1 highcharts-series-1 highcharts-legend-item-hidden'])
${Subscriberlense4_WFH_}=    (//*[@class='highcharts-legend-item highcharts-column-series highcharts-color-0 highcharts-series-0'])[3]


${Subscriberlense4_Non_Streaming_drilldown}=    (//*[@class='highcharts-legend-item highcharts-column-series highcharts-color-1 highcharts-series-1'])[4]


*** Keywords ***
Verify get Bar value in WFH Subscriber
    click element until enabled    ${Subscriberlense4_Non_WFH}
    Get the Data from Bar Graph Widgets limit Iteration 5    ${Subscriberlense4_get_tooltip}    ${Subscriberlense4_get_tooltip_text}    Work_from_Home_WFH_Subscribers
    click element until enabled    ${Subscriberlense4_Non_WFH_hidden}

Verify get Bar value in Non WFH Subscriber
    click element until enabled    ${Subscriberlense4_WFH_}
    Get the Data from Bar Graph Widgets limit Iteration 5    ${Subscriberlense4_get_tooltip}    ${Subscriberlense4_get_tooltip_text}    NonWork_from_Home_WFH_Subscribers
#    click element until enabled    ${Subscriberlense4_WFH}

Click on Subscriberlense4 Maximize icon
    Click Element Until Enabled    ${Subscriberlense4_expandIcon}

Verify get drill down Bar value in WFH Subscriber
    sleep    5
    click element until enabled     ${Subscriberlense4_Non_Streaming_drilldown}
    Get the Data from Bar Graph Widgets limit Iteration 5   ${Subscriberlense4_drilldown_get_tooltip}    ${Subscriberlense4_drilldown_get_tooltip_text}    Work_from_Home_WFH_Subscribers
    Get Verify drill down table header No height limit 5    ${Subscriberlense4_drilldown_get_tooltip}    Work_from_Home_WFH_Subscribers    ${Subscriberlense4_drilldownHeader}
    click element until enabled    ${Subscriberlense4_Non_WFH_hidden}

Click on Subscriberlense4 Minimize icon
    Click Element Until Enabled    ${Subscriberlense4_Minimize}