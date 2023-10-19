*** Settings ***
Library     SeleniumLibrary
Library     Collections
Variables  ../utils/CMC-API.py

                             #################### Acquisition Revenue And Insights ###################
*** Variables ***
# Icons
${openGuid_widget11}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][11]//*[@src='assets/images/HappyFeet_Small.png']
${openVieo_widget11}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][11]//*[@src='assets/images/Videoiconsmall.png']
${QuesionIcon_11}=       //*[@id="AcquisitionRevenue"]//*[@class='fa fa-question-circle']
${downloadIcon_11}=    xpath=//*[@id="AcquisitionRevenue"]//*[@class='fa fa-download']
${WebElement_maximize_button_11}=    xpath=//*[@id="AcquisitionRevenue"]//*[@class='fa fa-expand']
${widgetIcons_11}=     xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][11]//*[name()='a']
${closeIcon_11}=    (//*[@class='btn btn-primary btn-lg info-modal-close-btn'])[11]
${WebElement_get_tooltip11}=    xpath=//*[@id='Acquisition-Revenue-And-Insights']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect']
${WebElement_get_tooltiptext11}=   xpath=//*[@id='Acquisition-Revenue-And-Insights']//*[name()='div']//*[name()='svg']//*[name()='g'][11]//*[name()='text']


${next_alert}=  xpath=//button[contains(.,'Next')]
${back_button}=   xpath=//button[contains(.,'Back')]
${done_button}=   xpath=//button[contains(.,'Done')]
${close_button}=    css=.joyride-step__close > svg
${closeButton_contains}=    xpath=//button[contains(.,'Close')]
${lastTwoMonths}=    xpath=//button[contains(.,'Last Two Months')]

${ui_percentageData11}=   //*[@id='Acquisition-Revenue-And-Insights']//*[@class="highcharts-label highcharts-stack-labels"]//*[@class="highcharts-text-outline"]

*** Keywords ***
# ---- Icons - Open Guid -----
Validate the Acquisition Revenue And Insights widget
      ${response_scopes}=   call method    ${CMCconnectionObj}   getScope
      ${ConvertAPI_scopes}=    convert to string     ${response_scopes}
      log to console   ${ConvertAPI_scopes}
      ${contains}=    run keyword and return status    should contain    '''${ConvertAPI_scopes}'''    'cloud.cmc.insights:read,write'
      log to console   ${contains}
      Run Keyword If     '''${contains}''' == 'True'  Handling CMC Insights Acquisition Revenue And Insights widget
       ...    ELSE   Scope not in list

Handling CMC Insights Acquisition Revenue And Insights widget
#     Validate the Open guid for Acquisition Revenue And Insights widget
     Validate the Question for Acquisition Revenue And Insights widget
     Validate the Download Icon for Acquisition Revenue And Insights widget
#     get Bar value in Acquisition Revenue And Insights
     get graphvalue in Acquisition Revenue And Insights
     maximize widget window Acquisition Revenue And Insights widget
     #Validate the drilldown screen Region and Location
     ##get graphvalue in drilldown Service Tier Technology
     #Close the drilldown screen

get Bar value in Acquisition Revenue And Insights
        set selenium timeout    60 seconds
        set selenium implicit wait    60 seconds
        @{Get_tooltip}=   Get WebElements  ${ui_percentageData11}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        sleep    1
        ${height_value}=   get text    ${tooltiplocation}
        log to console    ${height_value}
        END

Validate the Open guid for Acquisition Revenue And Insights widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
       sleep    4
        click element    ${openGuid_widget11}
        click element    ${close_button}
        click element    ${openGuid_widget11}
        click element    ${next_alert}
        click element    ${back_button}
        click element    ${next_alert}
        click element    ${next_alert}
        ${present}=  Run Keyword And Return Status  element should be visible  ${next_alert}
        Run Keyword if  ${present}  close Alert1
        click element    ${done_button}
close Alert1
        click element       ${next_alert}

# ---- Icons - Question -----
Validate the Question for Acquisition Revenue And Insights widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
         click element    ${QuesionIcon_11}
         sleep    6
#         click button    ${closeButton_contains2}
#         click element    ${QuesionIcon_2}
#         sleep    5
         click element    ${closeIcon_11}

# ---- Icons - Download -----
Validate the Download Icon for Acquisition Revenue And Insights widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
         sleep    2
         click element    ${downloadIcon_11}

# ---- Icons -----
maximize widget window Acquisition Revenue And Insights widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
        sleep    7
        click element    ${WebElement_maximize_button_11}
#        sleep   2
        click element       //*[@class='fa fa-compress']



get graphvalue in Acquisition Revenue And Insights
#        ${response_Subscribers_by_Service_Tier_And_Technology_Chart_SeriesData}=   call method    ${connectionObj}   Subscribers_by_Service_Tier_And_Technology_Chart_total
#        ${category_total}    get length    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_SeriesData}
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
        ${Tooltip_defauld}=  Set Variable    ${0}            #${}
        @{Tooltip_List}=    Create List
        @{Get_tooltip}=   Get WebElements  ${WebElement_get_tooltip11}
        ${sum}=   Set Variable    ${0}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
       ${height_value}=   Get Element Attribute  ${tooltiplocation}    height
        ${height_value1}=    CONVERT TO INTEGER  ${height_value}
        Run Keyword If    ${height_value1} == 0     Acquisition Revenue And Insights Zero Handling
        ...    ELSE    Acquisition Revenue And Insights Non Zero chart   ${tooltiplocation}
        END

Acquisition Revenue And Insights Zero Handling
      log to console   Handled no data chart

Acquisition Revenue And Insights Non Zero chart
      [Arguments]    ${tooltiplocation}
          set selenium implicit wait    60 seconds
     set selenium timeout    60 seconds
      mouse over    ${tooltiplocation}
      ${TooltipText}=   get text    ${WebElement_get_tooltiptext11}
      log to console   ${TooltipText}