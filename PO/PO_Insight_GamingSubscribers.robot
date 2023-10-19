*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../PO/InsightsPageObject.robot
Variables  ../utils/CMC-API.py
Resource    ../PO/PO_Subscribers_by_Service_Tier_Technology.robot

                             ################### Gaming-Subscribers ###################

*** Variables ***
${WebElement_get_no_of_widget5}=    xpath=//*[@class='row pt-1']
${WebElement_get_Widgetname5}=    xpath=(//*[@class='chart-heading mb-2'])[1]
${WebElement_get_tooltip5}=    xpath=//*[@id='Gaming-Subscribers']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect']
${WebElement_get_Categories5}=   xpath=//*[@id='Gaming-Subscribers']//*[name()='div']//*[name()='svg']//*[name()='g'][10]//*[name()='text']
${WebElement_get_Series5}=    xpath=//*[@id='Gaming-Subscribers']//*[name()='div']//*[name()='svg']//*[name()='g'][9]//*[name()='text']
${WebElement_get_tooltiptext5}=   xpath=//*[@id='Gaming-Subscribers']//*[name()='div']//*[name()='svg']//*[name()='g'][12]//*[name()='text']
${StreamingSubcribers_view}=    xpath=//*[@id='Gaming-Subscribers']
${Gaming} =    xpath=//*[@id="Gaming-Subscribers"]//*[@class="highcharts-legend-item highcharts-column-series highcharts-color-0 highcharts-series-0"]//*[@class="highcharts-point"]
${NonGaming} =     xpath=//*[@id="Gaming-Subscribers"]//*[@class="highcharts-legend-item highcharts-column-series highcharts-color-1 highcharts-series-1"]//*[@class="highcharts-point"]
${NonGaming_hidden} =     xpath=//*[@id="Gaming-Subscribers"]//*[@class="highcharts-legend-item highcharts-column-series highcharts-color-1 highcharts-series-1 highcharts-legend-item-hidden"]//*[@class="highcharts-point"]
${GamingSubscribers_count}=     xpath=//*[@joyridestep="step14"]

# Icons
${openGuid_widget5}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][5]//*[@src='assets/images/HappyFeet_Small.png']
${openVieo_widget5}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][5]//*[@src='assets/images/Videoiconsmall.png']
${QuesionIcon_5}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][5]//*[@class='fa fa-question-circle']
${downloadIcon_5}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][5]//*[@class='fa fa-download']
${WebElement_maximize_button_5}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][5]//*[@class='fa fa-expand']
${widgetIcons_5}=     xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][5]//*[name()='a']
${closeIcon_5}=    xpath=//*[@id="info-gaming-subscribers"]/div/div/div[1]/button/span


${next_alert}=  xpath=//button[contains(.,'Next')]
${back_button}=   xpath=//button[contains(.,'Back')]
${done_button}=   xpath=//button[contains(.,'Done')]
${close_button}=    css=.joyride-step__close > svg
${closeButton_contains}=    xpath=//button[contains(.,'Close')]
${lastTwoMonths}=    xpath=//button[contains(.,'Last Two Months')]


*** Keywords ***
# ---- Icons - Open Guid -----
Validate the Gaming-Subscribers widget
      ${response_scopes}=   call method    ${CMCconnectionObj}   getScope
      ${ConvertAPI_scopes}=    convert to string     ${response_scopes}
      log to console   ${ConvertAPI_scopes}
      ${contains}=    run keyword and return status    should contain    '''${ConvertAPI_scopes}'''    'cloud.cmc.insights:read,write'
      log to console   ${contains}
      Run Keyword If     '''${contains}''' == 'True'  Handling CMC Insights Gaming-Subscribers widget
       ...    ELSE   Scope not in list

Handling CMC Insights Gaming-Subscribers widget
#     Validate the Open guid for Gaming-Subscribers widget
     Validate the Question for Gaming-Subscribers widget
     Validate the Download Icon for Gaming-Subscribers widget
     Get No of Categories and Categories value for Gaming Subscribers Chart
     Get No of Series and values in Gaming Subscribers Chart
     get Tooltip graphvalue in Service Tier Technology Gaming Subscribers Chart
     Gaming Subscribers count validation
     maximize widget window Gaming-Subscribers widget
     Validate the drilldown screen Region and Location
#    Validate the Question for Streaming Subscribers widget
#     get graphvalue in drilldown Service Tier Technology
#    get Table data in drilldown Service Tier Technology
     Close the drilldown screen
    Validate the drilldown screen display when click on bar chart5


Validate the Open guid for Gaming-Subscribers widget
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        click element    ${openGuid_widget5}
        click element    ${close_button}
        click element    ${openGuid_widget5}
        click element    ${next_alert}
        click element    ${back_button}
        click element    ${next_alert}
        click element    ${next_alert}
        ${present}=  Run Keyword And Return Status  element should be visible  ${next_alert}
        Run Keyword if  ${present}  close Alert5
        click element    ${done_button}
close Alert5
       click element        ${next_alert}


# ---- Icons - Question -----
Validate the Question for Gaming-Subscribers widget
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
         click element    ${QuesionIcon_5}
         sleep    6
#         click button    ${closeButton_contains2}
#         click element    ${QuesionIcon_2}
#         sleep    5
         click element    ${closeIcon_5}

# ---- Icons - Download -----
Validate the Download Icon for Gaming-Subscribers widget
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
         sleep    2
         click element    ${downloadIcon_5}

# ---- Icons -----
maximize widget window Gaming-Subscribers widget
#       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        sleep    7
        click element    ${WebElement_maximize_button_5}
#        sleep    7
#        click element    ${done_button}

Get No of Categories and Categories value for Gaming Subscribers Chart
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
#        ${response_Gaming_Subscribers_Chart_Data_categories}=    call method    ${connectionObj}     Gaming_Subscribers_Chart_Data_categories
#        ${category_listSize}    get length   ${response_Gaming_Subscribers_Chart_Data_categories}
#        scroll element into view    ${StreamingSubcribers_view}
        set selenium implicit wait    30 seconds
        @{Categories_List}=    Create List
        ${get_noOfCategories_5}=    Get WebElements  ${WebElement_get_Categories5}
        FOR    ${a}  IN RANGE  0   5
        ${data_table}  get text   ${get_noOfCategories_5}[${a}]
        log to console   ${data_table}
#        ${ConvertAPI}=    convert to string    ${response_Gaming_Subscribers_Chart_Data_categories}[${a}]
        log    UI_Categories List: ${data_table}
#        log    API_Categories List: ${ConvertAPI}
#        should contain  UI and API Comepare: ${ConvertAPI}    ${data_table}
        END

Get No of Series and values in Gaming Subscribers Chart
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
#         ${response_Gaming_Subscribers_Chart_Data_series}=    call method    ${connectionObj}    Gaming_Subscribers_Chart_Data_series
#        ${series_list}    get length   ${response_Gaming_Subscribers_Chart_Data_series}
#        log to console  ${series_list}
        set selenium implicit wait    30 seconds
        ${xpath}=    Set Variable    ${WebElement_get_Series5}
        ${count}=    get element count    ${xpath}
#        ${names}=    Create List
#        FOR    ${i}    IN RANGE    1    ${count} + 1
#        ${a}=    Set Variable   [${i}]//*[name()='tspan']
#        ${name}=    Get Text   ${WebElement_get_Series5}[${a}]
#        ${ConvertAPI}=    convert to string    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_series}
#        should contain  UI and API Comepare: ${ConvertAPI}    ${name}
#        log     UI_Series List: ${name}
##        log    API_Categories List: ${ConvertAPI}
#        Append To List    ${names}    ${name}
#        END

get Tooltip graphvalue in Service Tier Technology Gaming Subscribers Chart
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        ${response}=   call method    ${CMCconnectionObj}   Gaming_Subscribers
        ${Tooltip_defauld}=  Set Variable    ${0}            #${}
        @{Tooltip_List}=    Create List
        @{Get_tooltip}=   Get WebElements  ${WebElement_get_tooltip5}
        ${sum}=   Set Variable    ${0}

# - - - - - - - -  Gaming validation - - - - - - - - - - - -
        log to console    click Non Gaming
        click element    ${NonGaming}
        FOR  ${tooltiplocation}  IN  @{Get_tooltip}
        sleep    2
        mouse over    ${tooltiplocation}
        ${height_value}=   Get Element Attribute  ${tooltiplocation}    height
        ${TooltipText}=   get text    ${WebElement_get_tooltiptext5}
        log to console    ${TooltipText}
        ${height_value1}=    CONVERT TO INTEGER  ${height_value}
        ${ConvertAPI}=    convert to string   ${response}[1][${sum}]
        Run Keyword If    ${height_value1} == 0
        ...    Append To List    ${Tooltip_List}    '0'
        ...    ELSE    should contain    ${TooltipText}    ${ConvertAPI}
        log    UI_Tooltip List: ${TooltipText}
#        log    API_Categories List: ${ConvertAPI}
        ${sum} =    Evaluate  ${sum}+${1}
            exit for loop if  ${sum}==5
        END

# - - - - - - - -  NonGaming validation - - - - - - - - - - - -
        ${sum1}=   Set Variable    ${0}
        log to console    click Non Gaming hidden
        click element    ${NonGaming_hidden}
        log to console    click Gaming
        click element    ${Gaming}
        ${response1}=   call method    ${CMCconnectionObj}   NonGaming_Subscribers
        FOR  ${tooltiplocation}  IN  @{Get_tooltip}
        sleep    2
        mouse over    ${tooltiplocation}
        ${height_value}=   Get Element Attribute  ${tooltiplocation}    height
        ${TooltipText}=   get text    ${WebElement_get_tooltiptext5}
        log to console    ${TooltipText}
        ${height_value1}=    CONVERT TO INTEGER  ${height_value}
        ${ConvertAPI}=    convert to string   ${response1}[1][${sum1}]
        Run Keyword If    ${height_value1} == 0
        ...    Append To List    ${Tooltip_List}    '0'
        ...    ELSE    should contain    ${TooltipText}    ${ConvertAPI}
        log    UI_Tooltip List: ${TooltipText}
#        log    API_Categories List: ${ConvertAPI}
        ${sum1} =    Evaluate  ${sum1}+${1}
            exit for loop if  ${sum1}==5
        END

Gaming Subscribers count validation
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
       ${response}=   call method    ${CMCconnectionObj}   userCount_gamingSubscribers
       ${ConvertAPI}=    convert to string   ${response}[0]
       ${getText}=   get text    ${GamingSubscribers_count}
       should contain    ${getText}    ${ConvertAPI}
       log to console    ${getText}


# --- Drill Down Screen --------
Validate the drilldown screen display when click on bar chart5
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        @{Get_tooltip}=   Get WebElements    ${WebElement_get_tooltip5}
        ${sum1}=   Set Variable    ${0}

#------- Click on the any Bar chart --------
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        sleep    2
        ${sum1} =    Evaluate  ${sum1}+${1}
        log to console   ${sum1}
            exit for loop if  ${sum1}==3
        END
        click element    ${tooltiplocation}
        sleep    4
        click element    ${drilldown_close}
