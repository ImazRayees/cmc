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
${WebElemnet_SelectLastmonth}=    xpath=(//*[contains(text(),'Last Month')])
#   ${WebElement_get_tooltip}=    xpath=//*[@id='${WidgetID}']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect']
#   ${WebElement_get_Categories}=   xpath=//*[@id='${WidgetID}']//*[name()='div']//*[name()='svg']//*[name()='g'][9]//*[name()='text']
#   ${WebElement_get_Series}=    xpath=//*[@id='${WidgetID}']//*[name()='div']//*[name()='svg']//*[name()='g'][8]//*[name()='text']
#   ${WebElement_get_tooltiptext}=   xpath=//*[@id='${WidgetID}']//*[name()='div']//*[name()='svg']//*[name()='g'][11]//*[name()='text']

#${WidgetID_WidgetName_Dict}=    Create Dictionary
${WidgetType}
${WidgetNO}=   ${1}
*** Keywords ***
Pass the WidgetID and WidgetName to the Keywords on Pie Charts
    [Arguments]     ${Widget}
    log to console    "Widget data validation"
#    ${WidgetID_WidgetName_Dict}=    Create Dictionary
#    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Subscribers-by-Service-Tier-Technology    Subscribers by Service Tier & Technology
#    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Subscribers-Data-Usage    Subscriber Data Usage
#    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Social-Channel-Heatmap    Social Channel Heatmap
#    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Streaming-Subscribers    Streaming Subscribers
#    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Gaming-Subscribers    Gaming Subscribers
#    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Work-from-Home-Subscribers    Work from Home (WFH) Subscribers
#    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Churn-Rate-Insights    Churn Rate & Insights
#    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Retention    Retention
#    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Churn-Risk    Churn Risk
#    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Acquisition-Rate-Insights    Acquisition Rate & Insights
#    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Acquisition-Revenue-And-Insights    Acquisition Revenue And Insights
#    Set To Dictionary    ${WidgetID_WidgetName_Dict}    New-Subscribers-by-Service-Tier-Technology    New Subscribers by Service Tier & Technology
#    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Usage-by-Application-Type   Usage by Application Type
#    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Top-Applications    Top Applications
#    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Top-Gaming-Applications    Top Gaming Applications
#    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Subscriber-Activity-Trends    Subscriber Activity Trends
#    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Data-Usage-Trends    Data Usage Trends
#    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Household-Device-Trends    Household Device Trends
#    Set To Dictionary    ${WidgetID_WidgetName_Dict}    CommandIQ-Insights    CommandIQ Insights
#    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Devices-per-Household    Devices per Household
#    Set To Dictionary    ${WidgetID_WidgetName_Dict}    Wi-Fi-Device-Category-Trends    Wi-Fi Device Category Trends
#    Set Test Variable    ${WidgetID_WidgetName_Dict}

Get Widgets Title And Validate the Widget Title on Pie Charts
    [Arguments]     ${WidgetIDGetTitle}
    log to console    ${WidgetIDGetTitle}
    log   Validate the Widget Titile is Avail on the Screen
    Set Test Variable  ${WidgetNO}
    log to console    ${WidgetNO}
    set selenium implicit wait    30 seconds
    ${WidgetNO} =    Evaluate  ${WidgetNO}+${1}
    log to console    number ${WidgetNO}



Get No of Series and values and valiadate with websocket value on Pie Charts graph
    [Arguments]     ${WidgetIdToReplace}
    ${WidgetIdToAPICall}=   replace string   ${WidgetIdToReplace}   -    _
    set selenium implicit wait    30 seconds
    sleep    60
    set selenium implicit wait    30 seconds
    ${xpath}=    set variable   xpath=(//*[@id='${WidgetIdToReplace}']//*[name()='div']//*[contains(@class, 'highcharts-data-labels')])[2]//*[name()='div']
    ${count}=    get element count    ${xpath}
    log to console    count: ${count}
    ${names}=    Create List
    FOR    ${i}    IN RANGE    1    ${count} + 1
         ${name}=    Get Text   xpath=(//*[@id='${WidgetIdToReplace}']//*[name()='div']//*[contains(@class, 'highcharts-data-labels')])[2]//*[name()='div'][${i}]
         log    UI_Series List: ${name}
         log to console   UI_Series List: ${name}
    END

Mouse Hover on Pie Chart bars and get Tooltip Value and valiadate with websocket value
    [Arguments]     ${WidgetIdToReplace}
    log to console  Get Tool Tip Text
    ${WidgetIdToAPICall}=   replace string    ${WidgetIdToReplace}   -    _
    set selenium implicit wait    30 seconds
    ${Tooltip_defauld}=  Set Variable    ${0}
    @{Tooltip_List}=    Create List
    #### Get Widget tooltip text
    @{Get_tooltip}=   Get WebElements  xpath=(//*[@id='${WidgetIdToReplace}']//*[name()='div']//*[name()='svg']//*[contains(@class, 'highcharts-series-group')])[1]//*[name()='path']
    ${sum}=   Set Variable    ${0}
    FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        mouse over    ${tooltiplocation}
        ${TooltipText}=   get text    xpath=(//*[@id='${WidgetIdToReplace}']//*[name()='div']//*[name()='svg']//*[contains(@class, 'highcharts-tooltip')])[1]//*[name()='text']
        log    UI_Tooltip List: ${TooltipText}
        log to console  UI_Tooltip List: ${TooltipText}
    END

Maximize the Widget screen Pie Chart bars

    log to console    Maximize the Widget screen and get the Values
#    click element    (//*[@title='Maximize'])[${NoOfWidget}]
#    set selenium implicit wait    30 seconds
#    ${NoOfWidget} =    Evaluate  ${WidgetNO}+${1}
#    log to console    number ${WidgetNO}

Validate the Widget data with web socket data Pie Chart bars
    log to console    "Widget data validation"