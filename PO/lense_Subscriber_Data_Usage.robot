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
${Subscriberlense1_get_tooltip}=    //*[@id='subscriber-data-usage-chart']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect']
${Subscriberlense1_get_tooltip_text}=    //*[@id='subscriber-data-usage-chart']//*[name()='svg']//*[name()='g'][11]//*[name()='text']

${Subscriberlense1_drilldown_get_tooltip}=    //*[@id='Subscriber Data Usage']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect']
${Subscriberlense1_drilldown_get_tooltip_text}=    //*[@id='Subscriber Data Usage']//*[name()='svg']//*[name()='g'][11]//*[name()='text']

${Subscriberlense1_Drilldown_bar}=    //*[@id='Subscriber Data Usage']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect'][7]

${Subscriberlense1_quesionIcon}=    (//*[@class='btn-round btn-small-24 btn-grey btn-que'])[1]
${Subscriberlense1_expandIcon}=    (//*[@class='btn-round btn-small-24 btn-grey btn-expand'])[1]
${Subscriberlense1_downloadIcon}=    (//*[@class='btn-round btn-small-24 btn-grey btn-dload'])[1]

${Subscriberlense1_Minimize}=    //*[@id='subscriberChartFullViewClose']

${Subscriberlense1_drilldownHeader}=    //*[@class='fullscreen-table-info']

${drilldown_table_rows}=     //*[@id='append-table-list']/tr
${drilldown_table_columns}=    //*[@id='append-table-list']/tr[1]/td

${Subscriberlense1_Subscribers_Total}=    (//*[@class='primary'])[1]
${Subscriberlense1_Streaming_Total}=    (//*[@class='primary'])[2]
${Subscriberlense1_Gaming_Total}=    (//*[@class='primary'])[3]
${Subscriberlense1_WorkFromHome_Total}=    (//*[@class='primary'])[4]
${Nodata_available_path}=  //*[@id='no-data-available']/span[text()='No Data Available']

*** Keywords ***
Verify get Bar value in Subscriber Data Usage
    log to console    TestCaseID:   CMC_ExploreDataBasic_SubscriberLenses_02
    ${response}=   call method    ${CMCconnectionObj}   Subscribers_Data_Usage
    log     ${response}
    Get the Data from Bar Graph Widgets No Hight    ${Subscriberlense1_get_tooltip}    ${Subscriberlense1_get_tooltip_text}    Subscribers_Data_Usage

Click on Subscriberlense1 Maximize icon
    log to console    TestCaseID:    CMC_ExploreDataBasic_SubscriberLenses_03
    Click Element Until Enabled    ${Subscriberlense1_expandIcon}
    sleep  2
    capture the screen  subscriberDataUsageFullView

Verify get drill down Bar value in Subscriber Data Usage
    log to console    TestCaseID:    CMC_ExploreDataBasic_SubscriberLenses_04
    Get the Data from Bar Graph Widgets No Hight   ${Subscriberlense1_drilldown_get_tooltip}    ${Subscriberlense1_drilldown_get_tooltip_text}    Subscribers_Data_Usage

Click on Subscriberlense1 Drilldown Bar
    log to console    TestCaseID:    CMC_ExploreDataBasic_SubscriberLenses_05
    Click Element Until Enabled    ${Subscriberlense1_Drilldown_bar}

Verify the Subscriber Data Usage Data table
    Run Keyword If    "${Nodata_available_path}" == "True"    log   No Data available in table
    ...   ELSE    Verify get drill down Table Data in Subscriber Data Usage

Verify get drill down Table Data in Subscriber Data Usage
    log to console    TestCaseID:    CMC_ExploreDataBasic_SubscriberLenses_06
    ${columns}=    get element count    ${drilldown_table_columns}
    log to console    ${columns}
    ${rows}=    get element count    ${drilldown_table_rows}
    log to console    ${rows}
    Table Data Validation with drill down data    ${drilldown_table_rows}    ${drilldown_table_columns}    Subscribers_Data_Usage_drilldown    append-table-list

Verify Subscriber Data Usage all bars header of drill down
    Get Verify drill down table header No height    ${Subscriberlense1_drilldown_get_tooltip}    Subscribers_Data_Usage    ${Subscriberlense1_drilldownHeader}

Click on Subscriberlense1 Minimize icon
    sleep    4
    Click Element Until Enabled    ${Subscriberlense1_Minimize}
    sleep  2
    capture the screen  ${subscribersscreen}


getting data from Subscriber data usage widget with Lincoln region filter
    Get the Data from Bar Graph Widget without api call  ${Subscriberlense1_get_tooltip}    ${Subscriberlense1_get_tooltip_text}


verify the Active subscribers data
    log to console    TestCaseID:   CMC_ExploreDataBasic_SubscriberKPI_01
    ${response}=   call method    ${API_CMCObj}   Active_Subscriber_Count
    ${Subscribers_Total}   Get Text   ${Subscriberlense1_Subscribers_Total}
    ${Subscribers_Total_API}=    convert to string   ${response}[1]
    should contain any    ${Subscribers_Total}      ${Subscribers_Total_API}

verify the Streaming subscribers total data
    log to console    TestCaseID:   CMC_ExploreDataBasic_SubscriberKPI_02
    ${response}=   call method    ${API_CMCObj}   userCount_streamingSubscribers
    ${Streaming_Total}   Get Text   ${Subscriberlense1_Streaming_Total}
    ${Streaming_Total_API}=    convert to string   ${response}[0][0]
    should contain any    ${Streaming_Total}      ${Streaming_Total_API}

verify the Gaming subscribers total data
    log to console    TestCaseID:    CMC_ExploreDataBasic_SubscriberKPI_03
    ${response}=   call method    ${API_CMCObj}   userCount_streamingSubscribers
    ${Gaming_Total}   Get Text   ${Subscriberlense1_Gaming_Total}
    ${Gaming_Total_API}=    convert to string   ${response}[1]
    should contain any    ${Gaming_Total}      ${Gaming_Total_API}

verify the Work_from_Home subscribers total data
    log to console    TestCaseID:    CMC_ExploreDataBasic_SubscriberKPI_04
    ${response}=   call method    ${API_CMCObj}   userCount_streamingSubscribers
    ${WFH_Total}   Get Text   ${Subscriberlense1_WorkFromHome_Total}
    ${WFH_Total_API}=    convert to string   ${response}[2]
    should contain any    ${WFH_Total}      ${WFH_Total_API}
