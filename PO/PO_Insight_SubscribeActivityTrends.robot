*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../PO/InsightsPageObject.robot
Variables  ../utils/CMC-API.py

                             ################### Subscriber Activity Trends ###################
*** Variables ***

# Icons
${openGuid_widget16}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][16]//*[@src='assets/images/HappyFeet_Small.png']
${openVieo_widget16}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][16]//*[@src='assets/images/Videoiconsmall.png']
${QuesionIcon_16}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][15]//*[@class='fa fa-question-circle']
${downloadIcon_16}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][16]//*[@class='fa fa-download']
${WebElement_maximize_button_16}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][16]//*[@class='fa fa-expand']
${widgetIcons_16}=     xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][16]//*[name()='a']
${closeIcon_16}=    xpath=(//*[@class='btn btn-primary btn-lg info-modal-close-btn'])[16]


${next_alert}=  xpath=//button[contains(.,'Next')]
${back_button}=   xpath=//button[contains(.,'Back')]
${done_button}=   xpath=//button[contains(.,'Done')]
${close_button}=    css=.joyride-step__close > svg
${closeButton_contains}=    xpath=//button[contains(.,'Close')]
${lastTwoMonths}=    xpath=//button[contains(.,'Last Two Months')]


*** Keywords ***
# ---- Icons - Open Guid -----
Valdiate the Subscriber Activity Trends widget
      ${response_scopes}=   call method    ${CMCconnectionObj}   getScope
      ${ConvertAPI_scopes}=    convert to string     ${response_scopes}
      log to console   ${ConvertAPI_scopes}
      ${contains}=    run keyword and return status    should contain    '''${ConvertAPI_scopes}'''    'cloud.cmc.insights:read,write'
      log to console   ${contains}
      Run Keyword If     '''${contains}''' == 'True'  Handling CMC Insights Subscriber Activity Trends widget
       ...    ELSE   Scope not in list

Handling CMC Insights Subscriber Activity Trends widget
#     Validate the Open guid for Subscriber Activity Trends widget
     Validate the Question for Subscriber Activity Trends widget
     Validate the Download Icon for Subscriber Activity Trends widget
     maximize widget window Subscriber Activity Trends widget
     #Validate the drilldown screen Region and Location
     #Close the drilldown screen


Validate the Open guid for Subscriber Activity Trends widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
        click element    ${openGuid_widget16}
        click element    ${close_button}
        click element    ${openGuid_widget16}
        click element    ${next_alert}
        click element    ${back_button}
        click element    ${next_alert}
        ${present}=  Run Keyword And Return Status  element should be visible  ${next_alert}
        Run Keyword if  ${present}  close Alert4
        click element    ${done_button}
close Alert4
        click element       ${next_alert}


# ---- Icons - Question -----
Validate the Question for Subscriber Activity Trends widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
         click element    ${QuesionIcon_16}
         sleep    6
#         click button    ${closeButton_contains2}
#         click element    ${QuesionIcon_2}
#         sleep    5
         click element    ${closeIcon_16}

# ---- Icons - Download -----
Validate the Download Icon for Subscriber Activity Trends widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
         sleep    2
         click element    ${downloadIcon_16}

# ---- Icons -----
maximize widget window Subscriber Activity Trends widget
    set selenium implicit wait    10 seconds
    set selenium timeout    10 seconds
        sleep    7
        click element    ${WebElement_maximize_button_16}
        sleep    4
                click element       //*[@class='fa fa-compress']
##        click element    //*[@class='joyride-step__close']
#        sleep   2
#        ${present}=    Run Keyword And Return Status    Element Should Be Visible    //*[@class='joyride-step__close']
#        Run Keyword If    ${present}   close the alert1
#        ...  ELSE     log to console   Subscribers-by-Service-Tier-Technology widget not available
#
#close the alert1
#        click element    //*[@class='joyride-step__close']

