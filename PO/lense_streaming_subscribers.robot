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
${Subscriberlense2_get_tooltip}=    //*[@id='streaming-subscribers-chart']//*[name()='div']//*[name()='svg']//*[name()='g'][5]/*[name()='g']//*[name()='rect']
${Subscriberlense2_get_tooltip_text}=    //*[@id='streaming-subscribers-chart']//*[name()='svg']//*[name()='g'][11]//*[name()='text']

${Subscriberlense2_drilldown_get_tooltip}=    //*[@id='Streaming Subscribers']//*[name()='div']//*[name()='svg']//*[name()='g'][5]/*[name()='g']//*[name()='rect']
${Subscriberlense2_drilldown_get_tooltip_text}=    //*[@id='Streaming Subscribers']//*[name()='svg']//*[name()='g'][11]//*[name()='text']

${Subscriberlense2_Drilldown_bar}=    //*[@id='Streaming Subscribers']//*[name()='div']//*[name()='svg']//*[name()='g'][5]/*[name()='g']//*[name()='rect'][5]

${Subscriberlense2_quesionIcon}=    (//*[@class='btn-round btn-small-24 btn-grey btn-que'])[2]
${Subscriberlense2_expandIcon}=    (//*[@class='btn-round btn-small-24 btn-grey btn-expand'])[2]
${Subscriberlense2_downloadIcon}=    (//*[@class='btn-round btn-small-24 btn-grey btn-dload'])[2]

${Subscriberlense2_Minimize}=    //*[@id='subscriberChartFullViewClose']

${Subscriberlense2_drilldownHeader}=    //*[@class='fullscreen-table-info ng-star-inserted']

${drilldown_table_rows}=     //*[@id='append-table-list']/tr
${drilldown_table_columns}=    //*[@id='append-table-list']/tr[1]/td

${drilldown_table_rows}=     //*[@id='append-table-list']/tr
${drilldown_table_columns}=    //*[@id='append-table-list']/tr[1]/td

${Subscriberlense2_Non_Streaming}=    (//*[contains(text(),'Non-Streaming')])[1]
${Subscriberlense2_Streaming_}=    (//*[@class='highcharts-legend-item highcharts-column-series highcharts-color-0 highcharts-series-0'])[1]

${Subscriberlense2_Non_Gaming_drilldown}=    (//*[@class='highcharts-legend-item highcharts-column-series highcharts-color-1 highcharts-series-1'])[4]
${Subscriberlense2_Non_Gaming_drilldown_hidden}=    (//*[@class='highcharts-legend-item highcharts-column-series highcharts-color-1 highcharts-series-1 highcharts-legend-item-hidden'])


*** Keywords ***
Verify get Bar value in Streaming Subscriber
    click element until enabled    ${Subscriberlense2_Non_Streaming}
    Get the Data from Bar Graph Widgets limit Iteration 5    ${Subscriberlense2_get_tooltip}    ${Subscriberlense2_get_tooltip_text}    Streaming_Subscribers
    click element until enabled    ${Subscriberlense2_Non_Streaming}

Verify get Bar value in Non Streaming Subscriber
    click element until enabled    ${Subscriberlense2_Streaming_}
    Get the Data from Bar Graph Widgets limit Iteration 5    ${Subscriberlense2_get_tooltip}    ${Subscriberlense2_get_tooltip_text}    Streaming_Subscribers_NonStreaming
    click element until enabled    ${Subscriberlense2_Streaming}

Click on Subscriberlense2 Maximize icon
    Click Element Until Enabled    ${Subscriberlense2_expandIcon}
    capture the screen  streamingSubscribersWidgetFullView

Verify get drill down Bar value in Streaming Subscriber
    click element until enabled     ${Subscriberlense2_Non_Gaming_drilldown}
    Get the Data from Bar Graph Widgets limit Iteration 5   ${Subscriberlense2_drilldown_get_tooltip}    ${Subscriberlense2_drilldown_get_tooltip_text}    Streaming_Subscribers
    Get Verify drill down table header No height limit 5    ${Subscriberlense2_drilldown_get_tooltip}    Streaming_Subscribers    ${Subscriberlense2_drilldownHeader}
    click element until enabled    ${Subscriberlense2_Non_Gaming_drilldown_hidden}

Verify get drill down Bar value in Non Streaming Subscriber
    click element until enabled    (//*[@class='highcharts-legend-item highcharts-column-series highcharts-color-0 highcharts-series-0'])[3]
    sleep    3
    Get Verify drill down table header No height limit 5    ${Subscriberlense2_drilldown_get_tooltip}    Streaming_Subscribers_NonStreaming    ${Subscriberlense2_drilldownHeader}

Click on Subscriberlense2 Minimize icon
    Click Element Until Enabled    ${Subscriberlense2_Minimize}
    sleep  2
    capture the screen  ${subscribersscreen}
