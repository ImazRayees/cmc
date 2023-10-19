*** Settings ***
Library     SeleniumLibrary
Library     Collections
Variables  ../utils/InsightScreenAPI.py
Resource    ../PO/InsightsPageObject.robot
                ################## Subscribers by Service Tier & Technology Screen Validation   ###################

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
${WebElement_get_tooltip}=    xpath=//*[@id='Streaming_Subscribers']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect']
${WebElement_get_Categories}=   xpath=//*[@id='Streaming_Subscribers']//*[name()='div']//*[name()='svg']//*[name()='g'][9]//*[name()='text']
${WebElement_get_Series}=    xpath=//*[@id='Streaming_Subscribers']//*[name()='div']//*[name()='svg']//*[name()='g'][8]//*[name()='text']
${WebElement_get_tooltiptext}=   xpath=//*[@id='Streaming_Subscribers']//*[name()='div']//*[name()='svg']//*[name()='g'][11]//*[name()='text']
#${Window_close}=    xpath=//*[@id='info-subscribers-by-service-tier-technology']//*[@class='close']
${Window_close}=    css=.fa-times

${Subcribers_window}=    xpath//*[@id="cdk-overlay-1"]/nb-dialog-container

${Switch_Window}=    xpath=//*[@id="cdk-overlay-0"]/nb-dialog-container

*** Keywords ***

Get No of Categories and Categories value for Streaming Subscribers widget
        sleep    10
        InsightsPageObject.WebSocket Connection
        ${response_Subscribers_by_Service_Tier}=    call method    ${connectionObj}  Streaming_Subscribers_Chart_Data_categories
        ${response_Subscribers_by_Service_Tier_And_Technology_Chart_category}=   call method    ${connectionObj}   Streaming_Subscribers_Chart_Data_categories
        ${category_listSize}    get length    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_category}
        log to console    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_category}[0]
        set selenium implicit wait    30 seconds
        @{Categories_List}=    Create List
        ${get_noOfCategories}=    Get WebElements  ${WebElement_get_Categories}
        FOR    ${a}  IN RANGE  0   ${category_listSize}
        ${data_table}  get text   ${get_noOfCategories}[${a}]
        ${ConvertAPI}=    convert to string    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_category}[${a}]
        log    UI_Categories List: ${data_table}
        log    API_Categories List: ${ConvertAPI}
        should contain  UI and API Comepare: ${ConvertAPI}    ${data_table}
        END


Get No of Series and values for Streaming Subscribers widget
        ${response_Subscribers_by_Service_Tier_And_Technology_Chart_series}=   call method    ${connectionObj}   Streaming_Subscribers_Chart_Data_series
        ${series_list}    get length    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_series}
         log to console  ${series_list}
        set selenium implicit wait    30 seconds
        ${xpath}=    Set Variable    ${WebElement_get_Series}
        ${count}=    get element count    ${xpath}
        ${names}=    Create List
        FOR    ${i}    IN RANGE    1    ${count} + 1
        ${a}=    Set Variable   [${i}]//*[name()='tspan']
        ${name}=    Get Text   ${WebElement_get_Series} ${a}
        ${ConvertAPI}=    convert to string    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_series}
        should contain  UI and API Comepare: ${ConvertAPI}    ${name}
        log    UI_Series List: ${name}
        log    API_Categories List: ${ConvertAPI}
        Append To List    ${names}    ${name}
        END

get graphvalue for Streaming Subscribers widget
        ${response_Subscribers_by_Service_Tier_And_Technology_Chart_SeriesData}=   call method    ${connectionObj}   Streaming_Subscribers_Chart_Data_total
        ${category_total}    get length    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_SeriesData}
        set selenium implicit wait    30 seconds
        ${Tooltip_defauld}=  Set Variable    ${0}            #${}
        @{Tooltip_List}=    Create List
        @{Get_tooltip}=   Get WebElements  ${WebElement_get_tooltip}
        ${sum}=   Set Variable    ${0}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        mouse over    ${tooltiplocation}
        ${height_value}=   Get Element Attribute  ${tooltiplocation}    height
        ${TooltipText}=   get text    ${WebElement_get_tooltiptext}
        ${height_value1}=    CONVERT TO INTEGER  ${height_value}
        ${ConvertAPI}=    convert to string   ${response_Subscribers_by_Service_Tier_And_Technology_Chart_SeriesData}[${sum}]
        Run Keyword If    ${height_value1} == 0
        ...    Append To List    ${Tooltip_List}    '0'
        ...    ELSE    should contain    ${TooltipText}    ${ConvertAPI}
        log    UI_Tooltip List: ${TooltipText}
        log    API_Categories List: ${ConvertAPI}
        ${sum} =    Evaluate  ${sum}+${1}
        END

Web Value with backend data for Subscribers by Service Tier
     log to console   test


maximize widget window
   set selenium implicit wait    30 seconds
#   click element    ${WebElement_maximize_button}
   sleep    10
   ${Get_tooltip}=   Get WebElements  ${WebElement_get_tooltip}
   click element    ${Get_tooltip}[3]
   sleep    10
#   switch window
   click button    ${Window_close}



