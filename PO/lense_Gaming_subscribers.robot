*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Variables   ../utils/configReader.py
Variables  ../utils/InsightScreenAPI.py
Variables  ../utils/CMC-API.py
Resource    CommonWrapper.robot
Resource   ../PO/ExploreDataPO_subscriber.robot

*** Variables ***
${Subscriberlense3_get_tooltip}=    //*[@id='gaming-subscribers-chart']//*[name()='div']//*[name()='svg']//*[name()='g'][5]/*[name()='g']//*[name()='rect']
${Subscriberlense3_get_tooltip_text}=    //*[@id='gaming-subscribers-chart']//*[name()='svg']//*[name()='g'][11]//*[name()='text']

${Subscriberlense3_drilldown_get_tooltip}=    //*[@id='Gaming Subscribers']//*[name()='div']//*[name()='svg']//*[name()='g'][5]/*[name()='g']//*[name()='rect']
${Subscriberlense3_drilldown_get_tooltip_text}=    //*[@id='Gaming Subscribers']//*[name()='svg']//*[name()='g'][11]//*[name()='text']

${Subscriberlense3_Drilldown_bar}=    //*[@id='Gaming Subscribers']//*[name()='div']//*[name()='svg']//*[name()='g'][5]/*[name()='g']//*[name()='rect'][5]

${Subscriberlense3_quesionIcon}=    (//*[@class='btn-round btn-small-24 btn-grey btn-que'])[3]
${Subscriberlense3_expandIcon}=    (//*[@class='btn-round btn-small-24 btn-grey btn-expand'])[3]
${Subscriberlense3_downloadIcon}=    (//*[@class='btn-round btn-small-24 btn-grey btn-dload'])[3]

${Subscriberlense3_Minimize}=    //*[@id='subscriberChartFullViewClose']

${Subscriberlense3_drilldownHeader}=    //*[@class='fullscreen-table-info ng-star-inserted']

${drilldown_table_rows}=     //*[@id='append-table-list']/tr
${drilldown_table_columns}=    //*[@id='append-table-list']/tr[1]/td

${drilldown_table_rows}=     //*[@id='append-table-list']/tr
${drilldown_table_columns}=    //*[@id='append-table-list']/tr[1]/td

${Subscriberlense3_Non_Streaming}=    (//*[@class='highcharts-legend-item highcharts-column-series highcharts-color-1 highcharts-series-1'])[2]
${Subscriberlense3_Non_Streaming_hidden}=    (//*[@class='highcharts-legend-item highcharts-column-series highcharts-color-1 highcharts-series-1 highcharts-legend-item-hidden'])[1]
${Subscriberlense3_Streaming_}=    (//*[@class='highcharts-legend-item highcharts-column-series highcharts-color-0 highcharts-series-0'])[2]


${Subscriberlense3_Non_Streaming_drilldown}=    (//*[@class='highcharts-legend-item highcharts-column-series highcharts-color-1 highcharts-series-1'])[4]


*** Keywords ***
Verify get Bar value in Gaming Subscriber
    click element until enabled    ${Subscriberlense3_Non_Streaming}
    Get the Data from Bar Graph Widgets limit Iteration 5    ${Subscriberlense3_get_tooltip}    ${Subscriberlense3_get_tooltip_text}    Gaming_Subscribers
    click element until enabled    ${Subscriberlense3_Non_Streaming_hidden}

Verify get Bar value in Non Gaming Subscriber
    click element until enabled    ${Subscriberlense3_Streaming_}
    Get the Data from Bar Graph Widgets limit Iteration 5    ${Subscriberlense3_get_tooltip}    ${Subscriberlense3_get_tooltip_text}    NonGaming_Subscribers
    click element until enabled    ${Subscriberlense3_Streaming}

Click on Subscriberlense3 Maximize icon
    Click Element Until Enabled    ${Subscriberlense3_expandIcon}
    sleep  2
    capture the screen  gamingSubscribersWidgetFullView

Verify get drill down Bar value in Gaming Subscriber
    sleep    5
    click element until enabled     ${Subscriberlense3_Non_Streaming_drilldown}
    Get the Data from Bar Graph Widgets limit Iteration 5   ${Subscriberlense3_drilldown_get_tooltip}    ${Subscriberlense3_drilldown_get_tooltip_text}    Gaming_Subscribers
    Get Verify drill down table header No height limit 5    ${Subscriberlense3_drilldown_get_tooltip}    Gaming_Subscribers    ${Subscriberlense3_drilldownHeader}
    click element until enabled    ${Subscriberlense3_Non_Streaming_hidden}

Click on Subscriberlense3 Minimize icon
    Click Element Until Enabled    ${Subscriberlense3_Minimize}
    sleep  2
    capture the screen  ${subscribersscreen}