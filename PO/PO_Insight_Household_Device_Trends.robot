*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../PO/InsightsPageObject.robot
Resource    ../PO/PO_Insight_NewSubscribersbyServiceTierAndTechnology.robot
Variables  ../utils/CMC-API.py

                             ################### Household Device Trends ###################
*** Variables ***

# Icons
${openGuid_widget18}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][17]//*[@src='assets/images/HappyFeet_Small.png']
${openVieo_widget18}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][18]//*[@src='assets/images/Videoiconsmall.png']
${QuesionIcon_18}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][17]//*[@class='fa fa-question-circle']
${downloadIcon_18}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][18]//*[@class='fa fa-download']
${WebElement_maximize_button_18}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][18]//*[@class='fa fa-expand']
${widgetIcons_18}=     xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][18]//*[name()='a']
${closeIcon_18}=    xpath=(//*[@class='btn btn-primary btn-lg info-modal-close-btn'])[18]


${next_alert}=  xpath=//button[contains(.,'Next')]
${back_button}=   xpath=//button[contains(.,'Back')]
${done_button}=   xpath=//button[contains(.,'Done')]
${close_button}=    css=.joyride-step__close > svg
${closeButton_contains}=    xpath=//button[contains(.,'Close')]
${lastTwoMonths}=    xpath=//button[contains(.,'Last Two Months')]


*** Keywords ***
Validate the Household Device Trends widget
      ${response_scopes}=   call method    ${CMCconnectionObj}   getScope
      ${ConvertAPI_scopes}=    convert to string     ${response_scopes}
      log to console   ${ConvertAPI_scopes}
      ${contains}=    run keyword and return status    should contain    '''${ConvertAPI_scopes}'''    'cloud.cmc.insights:read,write'
      log to console   ${contains}
      Run Keyword If     '''${contains}''' == 'True'  Handling CMC Insights Household Device Trends widget
       ...    ELSE   Scope not in list

Handling CMC Insights Household Device Trends widget
#      Validate the Open guid for Household Device Trends widget
      Validate the Question for Household Device Trends widget
#      Validate the Download Icon for Household Device Trends widget
#      get graphvalue in New Subscribers by Devices per Household widget
      maximize widget window Household Device Trends widget
      #Validate the drilldown screen Region and Location
      #Close the drilldown screen


# ---- Icons - Open Guid -----
Validate the Open guid for Household Device Trends widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
        click element    ${openGuid_widget18}
        click element    ${close_button}
        click element    ${openGuid_widget18}
        click element    ${next_alert}
        click element    ${back_button}
        click element    ${next_alert}
        click element    ${next_alert}
        click element    ${done_button}

# ---- Icons - Question -----
Validate the Question for Household Device Trends widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
         click element    ${QuesionIcon_18}
         sleep    6
#         click button    ${closeButton_contains2}
#         click element    ${QuesionIcon_2}
#         sleep    5
         click element    ${closeIcon_18}

# ---- Icons - Download -----
Validate the Download Icon for Household Device Trends widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
         sleep    2
         click element    ${downloadIcon_18}

# ---- Icons -----
maximize widget window Household Device Trends widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
        sleep    7
        click element    ${WebElement_maximize_button_18}
#       # click element    //*[@class='joyride-step__close']
        sleep   2
        click element       //*[@class='fa fa-compress']


