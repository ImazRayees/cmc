*** Settings ***
Library     SeleniumLibrary
Library     Collections
Variables  ../utils/CMC-API.py

                             ################### Usage by Application Type ###################
*** Variables ***
# Icons
${openGuid_widget13}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][13]//*[@src='assets/images/HappyFeet_Small.png']
${openVieo_widget13}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][13]//*[@src='assets/images/Videoiconsmall.png']
${QuesionIcon_13}=        //*[@id="usageByApplication"]//*[@class='fa fa-question-circle']
${downloadIcon_13}=         //*[@id="usageByApplication"]//*[@class='fa fa-download']
${WebElement_maximize_button_13}=      //*[@id="usageByApplication"]//*[@class='fa fa-expand']
${widgetIcons_13}=     xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][13]//*[name()='a']
${closeIcon_13}=    xpath=(//*[@class='btn btn-primary btn-lg info-modal-close-btn'])[13]
${WebElement_get_tooltiptext13}=    (//*[@id='Usage-by-Application-Type']//*[name()='div']//*[name()='svg']//*[contains(@class, 'highcharts-tooltip')])[1]//*[name()='text']
${WebElement_get_tooltiptext13_drilldown}=    (//*[@id='usage-by-application-type']//*[name()='div']//*[name()='svg']//*[contains(@class, 'highcharts-tooltip')])[1]//*[name()='text']
${ChartDataMaping}=    //*[@id="tableContentReady"]/h4
${WebElement_get_tooltip13}=    (//*[@id='Usage-by-Application-Type']//*[name()='div']//*[name()='svg']//*[contains(@class, 'highcharts-series-group')])[1]//*[name()='path']
${WebElement_get_tooltip13_drilldown}=    (//*[@id='usage-by-application-type']//*[name()='div']//*[name()='svg']//*[contains(@class, 'highcharts-series-group')])[1]//*[name()='path']


${next_alert}=  xpath=//button[contains(.,'Next')]
${back_button}=   xpath=//button[contains(.,'Back')]
${done_button}=   xpath=//button[contains(.,'Done')]
${close_button}=    css=.joyride-step__close > svg
${closeButton_contains}=    xpath=//button[contains(.,'Close')]
${lastTwoMonths}=    xpath=//button[contains(.,'Last Two Months')]

*** Keywords ***
# ---- Icons - Open Guid -----
Validate the Usage by Application Type widget
      ${response_scopes}=   call method    ${CMCconnectionObj}   getScope
      ${ConvertAPI_scopes}=    convert to string     ${response_scopes}
      log to console   ${ConvertAPI_scopes}
      ${contains}=    run keyword and return status    should contain    '''${ConvertAPI_scopes}'''    'cloud.cmc.insights:read,write'
      log to console   ${contains}
      Run Keyword If     '''${contains}''' == 'True'  Handling CMC Insights Application Type widget
       ...    ELSE   Scope not in list

Handling CMC Insights Application Type widget
#      Validate the Open guid for Usage by Application Type widget
      Validate the Question for Usage by Application Type widget
      Validate the Download Icon for Usage by Application Type widget
      maximize widget window Usage by Application Type widget
      Validate the circular chart of Usage by Application
      #Validate the drilldown screen Region and Location
      #Close the drilldown screen


Validate the Open guid for Usage by Application Type widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
        click element    ${openGuid_widget13}
        click element    ${close_button}
        click element    ${openGuid_widget13}
        click element    ${next_alert}
        click element    ${back_button}
        click element    ${next_alert}
        ${present}=  Run Keyword And Return Status  element should be visible  ${next_alert}
        Run Keyword if  ${present}  close Alert3
        click element    ${done_button}
close Alert3
        click element       ${next_alert}

# ---- Icons - Question -----
Validate the Question for Usage by Application Type widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
         sleep    4
         click element    ${QuesionIcon_13}
         sleep    6
#         click button    ${closeButton_contains2}
#         click element    ${QuesionIcon_2}
#         sleep    5
         click element    ${closeIcon_13}

# ---- Icons - Download -----
Validate the Download Icon for Usage by Application Type widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
         sleep    2
         click element    ${downloadIcon_13}

# ---- Icons -----
maximize widget window Usage by Application Type widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
        sleep    7
        click element    ${WebElement_maximize_button_13}
        sleep    4
        @{Gettooltip}=   Get WebElements    ${WebElement_get_tooltip13_drilldown}
        FOR  ${toollocation}  IN   @{Gettooltip}
        mouse over    ${toollocation}
        ${ToolText}=   get text     ${WebElement_get_tooltiptext13_drilldown}
        click element    ${toollocation}
         sleep    5
        ${getUIText}=    get text    ${ChartDataMaping}
        should contain   ${ToolText}    ${getUIText}
        log to console   ${ToolText}
        END
        sleep    4
        click element       //*[@class='fa fa-compress']


Validate the circular chart of Usage by Application
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
        sleep    4
        @{Gettooltip}=   Get WebElements    ${WebElement_get_tooltip13}
        FOR  ${toollocation}  IN   @{Gettooltip}
        mouse over    ${toollocation}
        ${ToolText}=   get text     ${WebElement_get_tooltiptext13}
        log to console   ${ToolText}
        END