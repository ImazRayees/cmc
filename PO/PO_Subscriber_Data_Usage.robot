*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../PO/InsightsPageObject.robot
Resource    ../PO/PO_Subscribers_by_Service_Tier_Technology.robot


                             ################### Subscriber_Data_Usage ###################

*** Variables ***
${WebElement_get_no_of_widget1}=    xpath=//*[@class='row pt-1']
${WebElement_maximize_button1}=    xpath=(//*[@class='fa fa-expand'])[2]
${WebElement_get_Widgetname1}=    xpath=(//*[@class='chart-heading mb-2'])[1]
${WebElement_get_tooltip1}=    xpath=//*[@id='Subscribers-Data-Usage']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect']
${WebElement_get_Categories1}=   xpath=//*[@id='Subscribers-Data-Usage']//*[name()='div']//*[name()='svg']//*[name()='g'][9]//*[name()='text']
${WebElement_get_Series1}=    xpath=//*[@id='Subscribers-Data-Usage']//*[name()='div']//*[name()='svg']//*[name()='g'][8]//*[name()='text']
${WebElement_get_tooltiptext1}=   xpath=//*[@id='Subscribers-Data-Usage']//*[name()='div']//*[name()='svg']//*[name()='g'][11]//*[name()='text']

# Icons
${openGuid_widget2}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][2]//*[@src='assets/images/HappyFeet_Small.png']
${openVieo_widget2}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][2]//*[@src='assets/images/Videoiconsmall.png']
${QuesionIcon_2}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][2]//*[@class='fa fa-question-circle']
${downloadIcon_2}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][2]//*[@class='fa fa-download']
${WebElement_maximize_button_2}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][2]//*[@class='fa fa-expand']
${widgetIcons_2}=     xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][2]//*[name()='a']
${closeIcon_2}=    xpath=//*[@id="info-subscribers-data-usage"]/div/div/div[1]/button/span


${next_alert}=  xpath=//button[contains(.,'Next')]
${back_button}=   xpath=//button[contains(.,'Back')]
${done_button}=   xpath=//button[contains(.,'Done')]
${close_button}=    css=.joyride-step__close > svg
${closeButton_contains2}=    xpath=//button[contains(.,'Close')]
${lastTwoMonths}=    xpath=//button[contains(.,'Last Two Months')]

${ui_percentageData2}=   //*[@id='Subscribers-Data-Usage']//*[@class="highcharts-labelighcharts-stack-labels"]//*[@class="highcharts-text-outline"]

${SubscribersCount}=     //*[@class="border pl-1 subscriber"]

*** Keywords ***
Validate the Subscriber Data widget
      ${response_scopes}=   call method    ${CMCconnectionObj}   getScope
      ${ConvertAPI_scopes}=    convert to string     ${response_scopes}
      log to console   ${ConvertAPI_scopes}
      ${contains}=    run keyword and return status    should contain    '''${ConvertAPI_scopes}'''    'cloud.cmc.insights:read,write'
      log to console   ${contains}
      Run Keyword If     '''${contains}''' == 'True'  Handling CMC Insights Subscriber Data widget
       ...    ELSE   Scope not in list

Handling CMC Insights Subscriber Data widget
#    Get No of Categories and Categories value for Subscriber Data widget
    Get No of Series and values for Subscriber Data widget
    get Active Subscribers count
    get Bar value in Subscribers-Data-Usage widget widget
    get graphvalue for Subscriber Data widget
#    Validate the Open guid for Subscribers-Data-Usage widget widget
    Validate the Question for Subscribers-Data-Usage widget
    Validate the Download Icon for Subscribers by Service Tier and Technology widget
    maximize Subscribers-Data-Usage widget window
    Validate the drilldown screen Region and Location
#    validate the drilldown Question Icon
    get graphvalue in drilldown Service Tier Technology
#    get Table data in drilldown Service Tier Technology
    Close the drilldown screen
    Validate the drilldown screen display when click on bar chart2



get Active Subscribers count
      ${response}=   call method    ${CMCconnectionObj}   Active_Subscriber_Count
      ${ConvertAPI}=    convert to string   ${response}[1]
      ${getText}=    get text    ${SubscribersCount}
      should contain    ${getText}    ${ConvertAPI}
      log to console   ${getText}

get Bar value in Subscribers-Data-Usage widget widget
        set selenium timeout    60 seconds
        set selenium implicit wait    60 seconds
        @{Get_tooltip}=   Get WebElements  ${ui_percentageData2}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        sleep    1
        ${height_value}=   get text    ${tooltiplocation}
        log to console    ${height_value}
        END

Wait Until InsightPage to be load for Subscriber Data widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
    Wait Until Page Contains Element   ${WebElement_get_no_of_widget1}

Validate Data Usage widget Avail on screen and validate the title
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
    Element Text Should Be    ${WebElement_get_Widgetname1}       Subscribers by Service Tier & Technology

Get No of Categories and Categories value for Subscriber Data widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
#       InsightsPageObject.WebSocket Connection
#       ${response_Subscribers_Data_Usage_Chart}=    call method     ${connectionObj}    Subscribers_Data_Usage_Chart
#        ${category_listSize}    get length    ${response_Subscribers_Data_Usage_Chart}
        set selenium implicit wait    30 seconds
       @{Categories_List}=    Create List
       ${get_noOfCategories_1}=    Get WebElements  ${WebElement_get_Categories1}
        FOR    ${a}  IN RANGE  0   5
        ${data_table}  get text   ${get_noOfCategories_1}[${a}]
#        ${ConvertAPI}=    convert to string    ${response_Subscribers_Data_Usage_Chart}[${a}]
        log    UI_Categories List: ${data_table}
#        log    API_Categories List: ${ConvertAPI}
#        should contain  UI and API Comepare: ${ConvertAPI}    ${data_table}
        END


Get No of Series and values for Subscriber Data widget
       set selenium implicit wait    60 seconds
       set selenium timeout    60 seconds
        ${xpath}=    Set Variable    ${WebElement_get_Series1}
        ${count}=    get element count    ${xpath}
        ${names}=    Create List
        FOR    ${i}    IN RANGE    1    ${count} + 1
        ${a}=    Set Variable   [${i}]//*[name()='tspan']
        ${name}=    Get Text   ${WebElement_get_Series1} ${a}
        log to console    ${name}
        Append To List    ${names}    ${name}
        END

get graphvalue for Subscriber Data widget
      set selenium implicit wait    60 seconds
      set selenium timeout    60 seconds
      ${response}=   call method    ${CMCconnectionObj}   Subscribers_Data_Usage
       ${Tooltip_defauld}=  Set Variable    ${0}            #${}
       @{Tooltip_List}=    Create List
       @{Get_tooltip}=   Get WebElements  ${WebElement_get_tooltip1}
       ${sum}=   Set Variable    ${0}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        sleep    2
        mouse over    ${tooltiplocation}
        ${height_value}=   Get Element Attribute  ${tooltiplocation}    height
        ${TooltipText}=   get text    ${WebElement_get_tooltiptext1}
         ${height_value1}=     convert to integer    ${height_value}
         ${ConvertAPI}=    convert to string   ${response}[1][${sum}]
        Run Keyword If    ${height_value1} == 0
        ...    Append To List    ${Tooltip_List}    ${Tooltip_defauld}
        ...    ELSE     should contain    ${TooltipText}    ${ConvertAPI}
        log    UI_Tooltip List: ${TooltipText}
#        log    API_Categories List: ${ConvertAPI}
           ${sum} =    Evaluate  ${sum}+${1}
        END

maximize widget1 window
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
    click element    ${WebElement_maximize_button1}



# ---- Icons - Open Guid -----
Validate the Open guid for Subscribers-Data-Usage widget widget
       set selenium implicit wait    60 seconds
       set selenium timeout    60 seconds
        click element    ${openGuid_widget2}
        click element    ${close_button}
        click element    ${openGuid_widget2}
        click element    ${next_alert}
        click element    ${back_button}
        click element    ${next_alert}
        click element    ${next_alert}
        click element    ${done_button}

# ---- Icons - Question -----
Validate the Question for Subscribers-Data-Usage widget
         set selenium implicit wait    60 seconds
         set selenium timeout    60 seconds
         click element    ${QuesionIcon_2}
         sleep    6
#         click button    ${closeButton_contains2}
#         click element    ${QuesionIcon_2}
#         sleep    5
         click element    ${closeIcon_2}

# ---- Icons - Download -----
Validate the Download Icon for Subscribers-Data-Usage widget
       set selenium implicit wait    60 seconds
       set selenium timeout    60 seconds
         sleep    2
         click element    ${downloadIcon_2}

# ---- Icons - Maximize window -----
maximize Subscribers-Data-Usage widget window
        set selenium implicit wait    60 seconds
        set selenium timeout    60 seconds
        sleep    10
        click element    ${WebElement_maximize_button_2}
#        sleep   5
##        click element       //*[@class='fa fa-compress']
#        ${present}=    Run Keyword And Return Status    Element Should Be Visible    //*[@class='joyride-step__close']
#        Run Keyword If    ${present}   close the alert1
#        ...  ELSE     log to console   Subscribers-by-Service-Tier-Technology widget not available
#
#close the alert1
#        click element    //*[@class='joyride-step__close']

# --- Drill Down Screen --------
Validate the drilldown screen display when click on bar chart2
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        @{Get_tooltip}=   Get WebElements    ${WebElement_get_tooltip1}
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


