*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../PO/InsightsPageObject.robot
Variables  ../utils/CMC-API.py
Resource    ../PO/PO_Subscribers_by_Service_Tier_Technology.robot


                             ################### Streaming Subscribers ###################

*** Variables ***
${WebElement_get_no_of_widget4}=    xpath=//*[@class='row pt-1']
${WebElement_get_Widgetname4}=    xpath=(//*[@class='chart-heading mb-2'])[1]
${WebElement_get_tooltip4}=    xpath=//*[@id='Streaming-Subscribers']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect']
${WebElement_get_Categories4}=   xpath=//*[@id='Streaming-Subscribers']//*[name()='div']//*[name()='svg']//*[name()='g'][10]//*[name()='text']
${WebElement_get_Series4}=    xpath=//*[@id='Streaming-Subscribers']//*[name()='div']//*[name()='svg']//*[name()='g'][9]//*[name()='text']
${WebElement_get_tooltiptext4}=   xpath=//*[@id='Streaming-Subscribers']//*[name()='div']//*[name()='svg']//*[name()='g'][12]//*[name()='text']
${StreamingSubcribers_view}=    xpath=//*[@id='Streaming-Subscribers']
${Streaming} =    xpath=//*[@id="Streaming-Subscribers"]//*[@class="highcharts-legend-item highcharts-column-series highcharts-color-0 highcharts-series-0"]//*[@class="highcharts-point"]
${NonStreaming} =     xpath=//*[@id="Streaming-Subscribers"]//*[@class="highcharts-legend-item highcharts-column-series highcharts-color-1 highcharts-series-1"]//*[@class="highcharts-point"]
${NonStreaming_hidden} =     xpath=//*[@id="Streaming-Subscribers"]//*[@class="highcharts-legend-item highcharts-column-series highcharts-color-1 highcharts-series-1 highcharts-legend-item-hidden"]//*[@class="highcharts-point"]
${StreamingSubscribers_count}=    xpath=//*[@id="step11"]


# Icons
${openGuid_widget4}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][4]//*[@src='assets/images/HappyFeet_Small.png']
${openVieo_widget4}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][4]//*[@src='assets/images/Videoiconsmall.png']
${QuesionIcon_4}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][4]//*[@class='fa fa-question-circle']
${downloadIcon_4}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][4]//*[@class='fa fa-download']

${widgetIcons_4}=     xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][4]//*[name()='a']
${closeIcon_4}=    xpath=//*[@id="info-streaming-subscribers"]/div/div/div[1]/button/span
${WebElement_maximize_button_4}=   xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][4]//*[@class='fa fa-expand']


${next_alert}=  xpath=//button[contains(.,'Next')]
${back_button}=   xpath=//button[contains(.,'Back')]
${done_button}=   xpath=//button[contains(.,'Done')]
${close_button}=    css=.joyride-step__close > svg
${closeButton_contains}=    xpath=//button[contains(.,'Close')]
${lastTwoMonths}=    xpath=//button[contains(.,'Last Two Months')]


*** Keywords ***
Validate the Streaming Subscribers widget
      ${response_scopes}=   call method    ${CMCconnectionObj}   getScope
      ${ConvertAPI_scopes}=    convert to string     ${response_scopes}
      log to console   ${ConvertAPI_scopes}
      ${contains}=    run keyword and return status    should contain    '''${ConvertAPI_scopes}'''    'cloud.cmc.insights:read,write'
      log to console   ${contains}
      Run Keyword If     '''${contains}''' == 'True'  Handling CMC Insights Streaming Subscribers widget
       ...    ELSE   Scope not in list

Handling CMC Insights Streaming Subscribers widget
#    Validate the Open guid for Streaming Subscribers widget
    Validate the Question for Streaming Subscribers widget
    Validate the Download Icon for Streaming Subscribers widget
    Get No of Categories and Categories value for Streaming Subscribers Chart
    Get No of Series and values in Streaming Subscribers Chart
    get Tooltip graphvalue in Service Tier Technology Streaming Subscribers Chart
    Streaming Subscribers count validation
    maximize widget window Streaming Subscribers widget
    Validate the drilldown screen Region and Location
#    Validate the Question for Streaming Subscribers widget
    get graphvalue in drilldown Service Tier Technology
#    get Table data in drilldown Service Tier Technology
    Close the drilldown screen
#    Validate the drilldown screen display when click on bar chart4


Wait Until InsightPage to be load for Subscriber Data widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
    Wait Until Page Contains Element   ${WebElement_get_no_of_widget4}

Validate Data Usage widget Avail on screen and validate the title
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
       Element Text Should Be    ${WebElement_get_Widgetname4}       Subscribers by Service Tier & Technology

# ---- Icons - Open Guid -----
Validate the Open guid for Streaming Subscribers widget
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        click element    ${openGuid_widget4}
        click element    ${close_button}
        click element    ${openGuid_widget4}
        click element    ${next_alert}
        click element    ${back_button}
        click element    ${next_alert}
        click element    ${next_alert}
        click element    ${done_button}

# ---- Icons - Question -----
Validate the Question for Streaming Subscribers widget
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
         click element    ${QuesionIcon_4}
         sleep    6
#         click button    ${closeButton_contains2}
#         click element    ${QuesionIcon_2}
#         sleep    5
         click element    ${closeIcon_4}

# ---- Icons - Download -----
Validate the Download Icon for Streaming Subscribers widget
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
         sleep    2
         click element    ${downloadIcon_4}

# ---- Icons -----
maximize widget window Streaming Subscribers widget
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
       sleep    7
       click element    ${WebElement_maximize_button_4}
##       click element    //*[@class='fa fa-compress']
#        sleep   5
#        ${present}=    Run Keyword And Return Status    Element Should Be Visible    //*[@class='joyride-step__close']
#        Run Keyword If    ${present}   close the alert1
#        ...  ELSE     log to console   Subscribers-by-Service-Tier-Technology widget not available
#
#close the alert1
#        click element    //*[@class='joyride-step__close']



Get No of Categories and Categories value for Streaming Subscribers Chart
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
#        ${response_Streaming_Subscribers_Chart_Data_categories}=    call method    ${connectionObj}    Streaming_Subscribers_Chart_Data_categories
#        ${category_listSize}    get length    ${response_Streaming_Subscribers_Chart_Data_categories}
#        scroll element into view    ${StreamingSubcribers_view}
        set selenium implicit wait    30 seconds
        @{Categories_List}=    Create List
        ${get_noOfCategories_4}=    Get WebElements  ${WebElement_get_Categories4}
        FOR    ${a}  IN RANGE  0   5
        ${data_table}  get text   ${get_noOfCategories_4}[${a}]
#        ${ConvertAPI}=    convert to string    ${response_Streaming_Subscribers_Chart_Data_categories}[${a}]
        log    UI_Categories List: ${data_table}
        log to console    ${data_table}
#        log    API_Categories List: ${ConvertAPI}
#        should contain  UI and API Comepare: ${ConvertAPI}    ${data_table}
        END

Get No of Series and values in Streaming Subscribers Chart
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
#        ${response_Streaming_Subscribers_Chart_Data_series}=    call method    ${connectionObj}    Streaming_Subscribers_Chart_Data_series
#        ${series_list}    get length    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_series}
#        log to console  ${series_list}
        set selenium implicit wait    30 seconds
        ${xpath}=    Set Variable    ${WebElement_get_Series4}
        ${count}=    get element count    ${xpath}
#        ${names}=    Create List
#        FOR    ${i}    IN RANGE    1    ${count} + 1
#        ${a}=    Set Variable   [${i}]//*[name()='tspan']
#        ${name}=    Get Text   ${WebElement_get_Series4}[${a}]
#        ${ConvertAPI}=    convert to string    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_series}
#        should contain  UI and API Comepare: ${ConvertAPI}    ${name}
#        log     UI_Series List: ${name}
#        log    API_Categories List: ${ConvertAPI}
#        Append To List    ${names}    ${name}
#        END



get Tooltip graphvalue in Service Tier Technology Streaming Subscribers Chart
        set selenium timeout    60 seconds
        set selenium implicit wait    60 seconds
        ${response}=   call method    ${CMCconnectionObj}   Streaming_Subscribers
        ${Tooltip_defauld}=  Set Variable    ${0}            #${}
        @{Tooltip_List}=    Create List
        @{Get_tooltip}=   Get WebElements  ${WebElement_get_tooltip4}
        ${sum}=   Set Variable    ${0}
        sleep   5
        log to console    clcik NonStreaming
# - - - - - - Streaming validation - - - - - - - - - - - - -
        click element    ${NonStreaming}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        sleep    2
        mouse over    ${tooltiplocation}
        ${height_value}=   Get Element Attribute  ${tooltiplocation}    height
        ${TooltipText}=   get text    ${WebElement_get_tooltiptext4}
        ${height_value1}=    CONVERT TO INTEGER  ${height_value}
        ${ConvertAPI}=    convert to string   ${response}[1][${sum}]
        Run Keyword If    ${height_value1} == 0
        ...    Append To List    ${Tooltip_List}    '0'
        ...    ELSE    should contain    ${TooltipText}    ${ConvertAPI}
        log    UI_Tooltip List: ${TooltipText}
        log to console    ${TooltipText}
#        log    API_Categories List: ${ConvertAPI}
        ${sum} =    Evaluate  ${sum}+${1}
            exit for loop if  ${sum}==5
        END

# - - - - - - - Non Streaming validation - - - - - - - - - - -
        sleep   5
        log to console    clcik Streaming
        click element    ${Streaming}
        sleep   3
        log to console    click NonStreaming
        ${response1}=   call method    ${CMCconnectionObj}   Streaming_Subscribers_NonStreaming
        click element    ${NonStreaming_hidden}
        ${sum1}=   Set Variable    ${0}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        sleep    2
        mouse over    ${tooltiplocation}
        ${height_value}=   Get Element Attribute  ${tooltiplocation}    height
        ${TooltipText}=   get text    ${WebElement_get_tooltiptext4}
        ${height_value1}=    CONVERT TO INTEGER  ${height_value}
        ${ConvertAPI}=    convert to string   ${response1}[${sum1}]
        Run Keyword If    ${height_value1} == 0
        ...    Append To List    ${Tooltip_List}    '0'
        ...    ELSE    should contain    ${TooltipText}    ${ConvertAPI}
        log    UI_Tooltip List: ${TooltipText}
        log to console    ${TooltipText}
#        log    API_Categories List: ${ConvertAPI}
        ${sum1} =    Evaluate  ${sum1}+${1}
        log to console   ${sum1}
            exit for loop if  ${sum1}==5
        END

Streaming Subscribers count validation
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
      ${response}=   call method    ${CMCconnectionObj}   userCount_streamingSubscribers
      ${ConvertAPI}=    convert to string   ${response}[0]
       ${getText}=   get text    ${StreamingSubscribers_count}
      should contain    ${getText}    ${ConvertAPI}
       log to console    ${getText}

# --- Drill Down Screen --------
Validate the drilldown screen display when click on bar chart4
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        @{Get_tooltip}=   Get WebElements    ${WebElement_get_tooltip4}
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
