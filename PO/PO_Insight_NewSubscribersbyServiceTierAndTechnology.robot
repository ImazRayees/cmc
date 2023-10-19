*** Settings ***
Library     SeleniumLibrary
Library     Collections
Variables  ../utils/CMC-API.py

                             ################### New Subscribers by Service Tier And Technology ###################
*** Variables ***
# Icons
${openGuid_widget12}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][12]//*[@src='assets/images/HappyFeet_Small.png']
${openVieo_widget12}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][12]//*[@src='assets/images/Videoiconsmall.png']
${QuesionIcon_12}=      //*[@id="Newsubscriber"]//*[@class='fa fa-question-circle']
${downloadIcon_12}=     //*[@id="Newsubscriber"]//*[@class='fa fa-download']
${WebElement_maximize_button_12}=      //*[@id="Newsubscriber"]//*[@class='fa fa-expand']
${widgetIcons_12}=     xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][12]//*[name()='a']
${closeIcon_12}=    xpath=(//*[@class='btn btn-primary btn-lg info-modal-close-btn'])[12]
${WebElement_get_tooltip12}=    xpath=//*[@id='New-Subscribers-by-Service-Tier-Technology']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect']
${WebElement_get_tooltiptext12}=   xpath=//*[@id='New-Subscribers-by-Service-Tier-Technology']//*[name()='div']//*[name()='svg']//*[name()='g'][11]//*[name()='text']


${next_alert}=  xpath=//button[contains(.,'Next')]
${back_button}=   xpath=//button[contains(.,'Back')]
${done_button}=   xpath=//button[contains(.,'Done')]
${close_button}=    css=.joyride-step__close > svg
${closeButton_contains}=    xpath=//button[contains(.,'Close')]
${lastTwoMonths}=    xpath=//button[contains(.,'Last Two Months')]

*** Keywords ***
# ---- Icons - Open Guid -----
Validate the New Subscribers by Service Tier And Technology widget
      ${response_scopes}=   call method    ${CMCconnectionObj}   getScope
      ${ConvertAPI_scopes}=    convert to string     ${response_scopes}
      log to console   ${ConvertAPI_scopes}
      ${contains}=    run keyword and return status    should contain    '''${ConvertAPI_scopes}'''    'cloud.cmc.insights:read,write'
      log to console   ${contains}
      Run Keyword If     '''${contains}''' == 'True'  Handling CMC Insights New Subscribers by Service Tier And Technology widget
       ...    ELSE   Scope not in list


Handling CMC Insights New Subscribers by Service Tier And Technology widget
#     Validate the Open guid for New Subscribers by Service Tier And Technology widget
     Validate the Question for New Subscribers by Service Tier And Technology widget
     Validate the Download Icon for New Subscribers by Service Tier And Technology widget
     get graphvalue in New Subscribers by Service Tier And Technology widget
     maximize widget window New Subscribers by Service Tier And Technology widget
     #Validate the drilldown screen Region and Location
     ##get graphvalue in drilldown Service Tier Technology
     #Close the drilldown screen


Validate the Open guid for New Subscribers by Service Tier And Technology widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
        click element    ${openGuid_widget12}
        click element    ${close_button}
        click element    ${openGuid_widget12}
        click element    ${next_alert}
        click element    ${back_button}
        click element    ${next_alert}
         ${present}=  Run Keyword And Return Status  element should be visible  ${next_alert}
        Run Keyword if  ${present}  close Alert2
        click element    ${done_button}
close Alert2
        click element       ${next_alert}


# ---- Icons - Question -----
Validate the Question for New Subscribers by Service Tier And Technology widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
    sleep    4
         click element    ${QuesionIcon_12}
         sleep    6
#         click button    ${closeButton_contains2}
#         click element    ${QuesionIcon_2}
#         sleep    5
         click element    ${closeIcon_12}

# ---- Icons - Download -----
Validate the Download Icon for New Subscribers by Service Tier And Technology widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
         sleep    2
         click element    ${downloadIcon_12}

# ---- Icons -----
maximize widget window New Subscribers by Service Tier And Technology widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
        sleep    7
        click element    ${WebElement_maximize_button_12}
##       click element    //*[@class='joyride-step__close']
        sleep   4
        click element       //*[@class='fa fa-compress']




get graphvalue in New Subscribers by Service Tier And Technology widget
        set selenium implicit wait    60 seconds
        set selenium timeout    60 seconds
        ${response}=   call method    ${CMCconnectionObj}   New_Subscribers_by_Service_Tier_And_Technology
        ${Tooltip_defauld}=  Set Variable    ${0}            #${}
        @{Tooltip_List}=    Create List
        @{Get_tooltip}=   Get WebElements  ${WebElement_get_tooltip12}
        ${sum}=   Set Variable    ${0}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        ${height_value}=   Get Element Attribute  ${tooltiplocation}    height
        ${height_value1}=    CONVERT TO INTEGER  ${height_value}
        Run Keyword If    ${height_value1} == 0     New Subscribers by Service Tier And Technology widget Zero Handling
        ...    ELSE    New Subscribers by Service Tier And Technology widget Non Zero chart   ${tooltiplocation}    ${response}    ${sum}
        ${sum} =    Evaluate  ${sum}+${1}
        END


New Subscribers by Service Tier And Technology widget Zero Handling
      log to console   Handled no data chart

New Subscribers by Service Tier And Technology widget Non Zero chart
      [Arguments]    ${tooltiplocation}    ${response}    ${sum}
       set selenium implicit wait    60 seconds
       set selenium timeout    60 seconds
      ${ConvertAPI}=    convert to string   ${response}[1][${sum}]
      mouse over    ${tooltiplocation}
      ${TooltipText}=   get text    ${WebElement_get_tooltiptext12}
      should contain    ${TooltipText}    ${ConvertAPI}
      log to console   ${TooltipText}