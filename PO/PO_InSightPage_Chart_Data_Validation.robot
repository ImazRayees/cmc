*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     String
Resource    ../PO/InsightsPageObject.robot
Variables  ../utils/InsightScreenAPI.py


*** Variables ***
#API variables -  Subscribers by Service Tier And Technology
${Connection_response}=   connected
${Search_Region_Data}=    cloudRegions
${response_connection}
${response_searchRegion}
${response_searchRegionLocation}
${response_Subscribers_by_Service_Tier}
${response_Subscribers_by_Service_Tier_And_Technology_Chart_category}
${response_Subscribers_by_Service_Tier_And_Technology_Chart_series}
${response_Subscribers_by_Service_Tier_And_Technology_Chart_total}
${response_Subscribers_by_Service_Tier_And_Technology_table}

# WebElement Variables
${recByChart}=    css=.raphael-group-1556-plot-group > rect:nth-child(4)
${Table_RowCount}=    xpath=//*[@id="append-table-list"]/tr
${Table_ColumnCount}=   xpath=//*[@id="append-table-list"]/tr[1]/td

${WebElement_get_no_of_widget}=    xpath=//*[@class='row pt-1']
${WebElement_maximize_button}=    xpath=//*[@class='fa fa-expand'][1]
${WebElement_get_Widgetname}=    xpath=(//*[@class='chart-heading mb-2'])[1]
${Window_close}=    css=.fa-times
${Subcribers_window}=    xpath//*[@id="cdk-overlay-1"]/nb-dialog-container
${Switch_Window}=    xpath=//*[@id="cdk-overlay-0"]/nb-dialog-container
${WebElement_GetWideget_Count}=     xpath=(//*[@class='dashboard-card'])
${WebElemnet_GetWidget_Title}=     xpath=(//*[@class='dashboard-card'])[1]/nb-card-header/div/div
#   ${WebElement_get_tooltip}=    xpath=//*[@id='${WidgetID}']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect']
#   ${WebElement_get_Categories}=   xpath=//*[@id='${WidgetID}']//*[name()='div']//*[name()='svg']//*[name()='g'][9]//*[name()='text']
#   ${WebElement_get_Series}=    xpath=//*[@id='${WidgetID}']//*[name()='div']//*[name()='svg']//*[name()='g'][8]//*[name()='text']
#   ${WebElement_get_tooltiptext}=   xpath=//*[@id='${WidgetID}']//*[name()='div']//*[name()='svg']//*[name()='g'][11]//*[name()='text']

#${WidgetID_WidgetName_Dict}=    Create Dictionary
${WidgetType}
${WidgetNO}=   ${1}
*** Keywords ***
Pass the WidgetID and WidgetName to the Keywords
    [Arguments]     ${Widget}
    ${WidgetID_WidgetName_Dict}=    Create Dictionary
    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Subscribers-by-Service-Tier-Technology    Subscribers by Service Tier & Technology
    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Subscribers-Data-Usage    Subscriber Data Usage
    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Social-Channel-Heatmap    Social Channel Heatmap
    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Streaming-Subscribers    Streaming Subscribers
    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Gaming-Subscribers    Gaming Subscribers
    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Work-from-Home-Subscribers    Work from Home (WFH) Subscribers
    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Churn-Rate-Insights    Churn Rate & Insights
    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Retention    Retention
    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Churn-Risk    Churn Risk
    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Acquisition-Rate-Insights    Acquisition Rate & Insights
    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Acquisition-Revenue-And-Insights    Acquisition Revenue And Insights
    Set To Dictionary    ${WidgetID_WidgetName_Dict}    New-Subscribers-by-Service-Tier-Technology    New Subscribers by Service Tier & Technology
    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Usage-by-Application-Type   Usage by Application Type
    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Top-Applications    Top Applications
    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Top-Gaming-Applications    Top Gaming Applications
    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Subscriber-Activity-Trends    Subscriber Activity Trends
    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Data-Usage-Trends    Data Usage Trends
    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Household-Device-Trends    Household Device Trends
    Set To Dictionary    ${WidgetID_WidgetName_Dict}    CommandIQ-Insights    CommandIQ Insights
    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Devices-per-Household    Devices per Household
    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Wi-Fi-Device-Category-Trends    Wi-Fi Device Category Trends
    Set Test Variable    ${WidgetID_WidgetName_Dict}

Get the Count of No of Widgets avail on the Screen
#    ${response_connection}=   call method    ${connectionObj}   WebsocketConnection
#    log to console    ${response_connection}
    set selenium timeout    60 seconds
    set selenium implicit wait    60 seconds
#    InsightsPageObject.WebSocket Connection
#    InsightsPageObject.APIResponse ping_msg
    log  Get the No Of widgets avail on the Screen
    set selenium implicit wait    50 seconds
    ${NoOFWidgets}=    get element count    ${WebElement_GetWideget_Count}
    log  No Widgets are Avail on the InSight Page: ${NoOFWidgets}
    log to console  No Widgets are Avail on the InSight Page: ${NoOFWidgets}

Get Widgets Title And Validate the Widget Title
    [Arguments]     ${WidgetIDGetTitle}
#    InsightsPageObject.APIResponse ping_msg
    log to console    ${WidgetIDGetTitle}
    log   Validate the Widget Titile is Avail on the Screen
    Set Test Variable  ${WidgetNO}
    log to console    ${WidgetNO}
    set selenium implicit wait    30 seconds
    ${GetWidget_Name}=    Get From Dictionary    ${WidgetID_WidgetName_Dict}    ${WidgetIDGetTitle}
    log to console    Widget Title: ${GetWidget_Name}
#    Element Text Should Be  xpath=(//*[@class='dashboard-card'])[${WidgetNO}]/nb-card-header/div/div    ${GetWidget_Name}
#    ${WidgetNO} =    Evaluate  ${WidgetNO}+${1}
#    log to console    number ${WidgetNO}
Identify the Graph type based on the Widget
    [Arguments]     ${WidgetToIdentify}
#    InsightsPageObject.APIResponse ping_msg
    log to console    Identify the Graph type based on the Widget
    scroll element into view    xpath=//*[@id='${WidgetToIdentify}']
    @{BarChartWidgets}=    Create List
    ...     Subscribers-by-Service-Tier-Technology      Subscribers-Data-Usage      Streaming-Subscribers
    ...     Gaming-Subscribers      Work-from-Home-Subscribers      Churn-Rate-Insights
    ...     Acquisition-Rate-Insights    Acquisition-Revenue-And-Insights    New-Subscribers-by-Service-Tier-Technology
    ...     Devices-per-Household
    @{LineChartWidgets}=   Create List
    ...     Wi-Fi-Device-Category-Trends    Subscriber-Activity-Trends       Data-Usage-Trends    Household-Device-Trends
    @{PieChartWidgets}=    Create List
    ...     Usage-by-Application-Type
    @{TablesWidgets}=      Create List    Top-Applications    Top-Gaming-Applications

#    Run Keyword If    ${WidgetToIdentify}  in   ${BarChartWidgets}   BarChart
#    ...    ELSE IF    ${WidgetToIdentify}  in   ${LineChartWidgets}   LineChart
#    ...    ELSE IF    ${WidgetToIdentify}  in   ${TablesWidgets}      TableChart
#    ...    ELSE   PieChart
#    log to console      ${WidgetType}
#    ${WidgetType}=     set global variable   ${WidgetType}

Get No of Categories and Categories value and valiadate with websocket value on Bar Chart graph
    [Arguments]     ${WidgetIdToReplace}
    ${WidgetIdToAPICall}=   replace string   ${WidgetIdToReplace}   -    _
#    ${response_Subscribers_by_Service_Tier}=    call method    ${connectionObj}  ${WidgetIdToAPICall}_Chart
#    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_category}=   call method    ${connectionObj}   ${WidgetIdToAPICall}_Chart_category
#    ${category_listSize}    get length    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_category}
#    log to console    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_category}[0]
    set selenium implicit wait    30 seconds
    @{Categories_List}=    create list
    ${get_noOfCategories}=    Get WebElements  xpath=//*[@id='${WidgetIdToReplace}']//*[name()='div']//*[name()='svg']//*[contains(@class, 'highcharts-axis-labels')]//*[name()='text']
    ${get_noElementCount}=    get element count   xpath=//*[@id='${WidgetIdToReplace}']//*[name()='div']//*[name()='svg']//*[contains(@class, 'highcharts-axis-labels')]//*[name()='text']
#    FOR    ${a}  IN RANGE  0   ${category_listSize}
     FOR    ${a}  IN RANGE  0   ${get_noElementCount}
        ${data_table}  get text   ${get_noOfCategories}[${a}]
#        ${ConvertAPI}=    convert to string    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_category}[${a}]
         log    UI_Categories List: ${data_table}
         log to console   UI_Categories List: ${data_table}
#        log    API_Categories List: ${ConvertAPI}
#        should contain  UI and API Comepare: ${ConvertAPI}    ${data_table}
    END
Get No of Series and values and valiadate with websocket value on Bar Chart graph
    [Arguments]     ${WidgetIdToReplace}
    ${WidgetIdToAPICall}=   replace string   ${WidgetIdToReplace}   -    _
#    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_series}=   call method    ${connectionObj}   ${WidgetIdToAPICall}_Chart_series
#    ${series_list}    get length    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_series}
#    log to console    ${series_list}
    set selenium implicit wait    30 seconds
#    ${xpath}=    set variable   xpath=//*[@id='${WidgetIdToReplace}']//*[name()='div']//*[name()='svg']//*[name()='g'][8]//*[name()='text']
    ${xpath}=    set variable   xpath=//*[@id='${WidgetIdToReplace}']//*[name()='div']//*[name()='svg']//*[@class='highcharts-legend']//*[name()='g']//*[name()='g']//*[name()='g']//*[name()='text']
    ${count}=    get element count    ${xpath}
    log to console    count: ${count}
    ${names}=    Create List
    FOR    ${i}    IN RANGE    1    ${count} + 1
#        ${a}=    Set Variable   [${i}]//*[name()='tspan']
#        ${name}=    Get Text   xpath=//*[@id='${WidgetIdToReplace}']//*[name()='div']//*[name()='svg']//*[name()='g'][8]//*[name()='text'] ${a}
         ${name}=    Get Text   xpath=(//*[@id='${WidgetIdToReplace}']//*[name()='div']//*[name()='svg']//*[contains(@class, 'highcharts-legend')]//*[name()='text'])[${i}]
#        ${ConvertAPI}=    convert to string    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_series}
#        should contain  UI and API Comepare: ${ConvertAPI}    ${name}
         log    UI_Series List: ${name}
         log to console   UI_Series List: ${name}
#        log    API_Categories List: ${ConvertAPI}
        Append To List    ${names}    ${name}
    END
Mouse Hover on Each bars and get Tooltip Value and valiadate with websocket value
    [Arguments]     ${WidgetIdToReplace}
    ${WidgetIdToAPICall}=   replace string    ${WidgetIdToReplace}   -    _
#    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_SeriesData}=   call method    ${connectionObj}   ${WidgetIdToAPICall}_Chart_total
#    ${category_total}    get length    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_SeriesData}
    set selenium implicit wait    30 seconds
    ${Tooltip_defauld}=  Set Variable    ${0}            #${}
    @{Tooltip_List}=    Create List
    #### Get Widget tooltip text
    @{Get_tooltip}=   Get WebElements  xpath=//*[@id='${WidgetIdToReplace}']//*[name()='div']//*[name()='svg']//*[contains(@class, 'highcharts-tracker')]//*[name()='rect']
    ${sum}=   Set Variable    ${0}
    FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        mouse over    ${tooltiplocation}
        ${height_value}=   Get Element Attribute  ${tooltiplocation}    height
        ${TooltipText}=   get text    xpath=//*[@id='${WidgetIdToReplace}']//*[name()='div']//*[name()='svg']//*[contains(@class, 'highcharts-tooltip')]//*[name()='text']
        ${height_value1}=    CONVERT TO INTEGER  ${height_value}
#        ${ConvertAPI}=    convert to string   ${response_Subscribers_by_Service_Tier_And_Technology_Chart_SeriesData}[${sum}]
        Run Keyword If    ${height_value1} == 0
        ...    Append To List    ${Tooltip_List}    '0'
#        ...    ELSE    should contain    ${TooltipText}    ${ConvertAPI}
        log    UI_Tooltip List: ${TooltipText}
        log to console  UI_Tooltip List: ${TooltipText}
#        log    API_Categories List: ${ConvertAPI}
        ${sum} =    Evaluate  ${sum}+${1}
    END

Maximize the Widget screen

    log to console    Maximize the Widget screen and get the Values
#    click element    (//*[@title='Maximize'])[${NoOfWidget}]
#    set selenium implicit wait    30 seconds
#    ${NoOfWidget} =    Evaluate  ${WidgetNO}+${1}
#    log to console    number ${WidgetNO}

Validate the Widget data with web socket data
    log to console    "Widget data validation"