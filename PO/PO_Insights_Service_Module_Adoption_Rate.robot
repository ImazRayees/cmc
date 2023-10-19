*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../PO/InsightsPageObject.robot
Variables  ../utils/CMC-API.py

                             ################### Service Module Adoption Rate ###################
*** Variables ***
# Icons
${openGuid_widget21}=    xpath=(//*[@src='assets/images/HappyFeet_Small.png'])[21]
${openVieo_widget21}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][21]//*[@src='assets/images/Videoiconsmall.png']
${QuesionIcon_21}=    //*[@id="Adoption"]//*[@class='fa fa-question-circle']
${downloadIcon_21}=    //*[@id="Adoption"]//*[@class='fa fa-download']
${WebElement_maximize_button_21}=    //*[@id="Adoption"]//*[@class='fa fa-expand']
${widgetIcons_21}=     xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][21]//*[name()='a']
${closeIcon_21}=    (//*[@class='btn btn-primary btn-lg info-modal-close-btn'])[22]


${next_alert}=  xpath=//button[contains(.,'Next')]
${back_button}=   xpath=//button[contains(.,'Back')]
${done_button}=   xpath=//button[contains(.,'Done')]
${close_button}=    css=.joyride-step__close > svg
${closeButton_contains}=    xpath=//button[contains(.,'Close')]
${lastTwoMonths}=    xpath=//button[contains(.,'Last Two Months')]

*** Keywords ***
validate the Service Module Adoption Rate widget
      ${response_scopes}=   call method    ${CMCconnectionObj}   getScope
      ${ConvertAPI_scopes}=    convert to string     ${response_scopes}
      log to console   ${ConvertAPI_scopes}
      ${contains}=    run keyword and return status    should contain    '''${ConvertAPI_scopes}'''    'cloud.cmc.insights:read,write'
      log to console   ${contains}
      Run Keyword If     '''${contains}''' == 'True'  Handling CMC Insights Service Module Adoption Rate widget
       ...    ELSE   Scope not in list

Handling CMC Insights Service Module Adoption Rate widget
#      Validate the Open guid for Service Module Adoption Rate widget
      Validate the Question for Service Module Adoption Rate widget
      #Validate the Download Icon for Service Module Adoption Rate widget
      maximize widget window Service Module Adoption Rate widget
      #Validate the drilldown screen Region and Location
      #Close the drilldown screen

# ---- Icons - Open Guid -----
Validate the Open guid for Service Module Adoption Rate widget
        set selenium implicit wait    60 seconds
        set selenium timeout    60 seconds
        click element    ${openGuid_widget21}
        click element    ${close_button}
        click element    ${openGuid_widget21}
        click element    ${next_alert}
        click element    ${back_button}
        click element    ${next_alert}
        click element    ${done_button}

# ---- Icons - Question -----
Validate the Question for Service Module Adoption Rate widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
       click element    ${QuesionIcon_21}
       sleep    6
#         click button    ${closeButton_contains2}
#         click element    ${QuesionIcon_2}
#         sleep    5
         click element    ${closeIcon_21}

# ---- Icons - Download -----
Validate the Download Icon for Service Module Adoption Rate widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
       sleep    2
       click element    ${downloadIcon_21}

# ---- Icons -----
maximize widget window Service Module Adoption Rate widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
        sleep    7
        click element    ${WebElement_maximize_button_21}
        sleep    3
                click element       //*[@class='fa fa-compress']
##       click element    //*[@class='joyride-step__close']
#        sleep   2
#        ${present}=    Run Keyword And Return Status    Element Should Be Visible    //*[@class='joyride-step__close']
#        Run Keyword If    ${present}   close the alert1
#        ...  ELSE     log to console   Subscribers-by-Service-Tier-Technology widget not available
#
#close the alert1
#        click element    //*[@class='joyride-step__close']


