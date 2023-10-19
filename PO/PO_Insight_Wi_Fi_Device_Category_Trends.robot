*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../PO/InsightsPageObject.robot
Variables  ../utils/CMC-API.py

                             ################### Wi-Fi Device Category Trends ###################
*** Variables ***
# Icons
${openGuid_widget22}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][22]//*[@src='assets/images/HappyFeet_Small.png']
${openVieo_widget22}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][22]//*[@src='assets/images/Videoiconsmall.png']
${QuesionIcon_22}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][22]//*[@class='fa fa-question-circle']
${downloadIcon_22}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][22]//*[@class='fa fa-download']
${WebElement_maximize_button_22}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][22]//*[@class='fa fa-expand']
${widgetIcons_22}=     xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][22]//*[name()='a']
${closeIcon_22}=    xpath=//*[@id="info-Wifi-Devices"]/div/div/div[1]/button/span


${next_alert}=  xpath=//button[contains(.,'Next')]
${back_button}=   xpath=//button[contains(.,'Back')]
${done_button}=   xpath=//button[contains(.,'Done')]
${close_button}=    css=.joyride-step__close > svg
${closeButton_contains}=    xpath=//button[contains(.,'Close')]
${lastTwoMonths}=    xpath=//button[contains(.,'Last Two Months')]

*** Keywords ***
Validate the Wi-Fi Device Category Trends widget
      ${response_scopes}=   call method    ${CMCconnectionObj}   getScope
      ${ConvertAPI_scopes}=    convert to string     ${response_scopes}
      log to console   ${ConvertAPI_scopes}
      ${contains}=    run keyword and return status    should contain    '''${ConvertAPI_scopes}'''    'cloud.cmc.insights:read,write'
      log to console   ${contains}
      Run Keyword If     '''${contains}''' == 'True'  Handling CMC Insights Wi-Fi Device Category Trends widget
       ...    ELSE   Scope not in list

Handling CMC Insights Wi-Fi Device Category Trends widget
     Validate the Open guid for Wi-Fi Device Category Trends widget
     Validate the Question for Wi-Fi Device Category Trends widget
     Validate the Download Icon for Wi-Fi Device Category Trends widget
     #maximize widget window Wi-Fi Device Category Trends widget
     #Validate the drilldown screen Region and Location
     #Close the drilldown screen

# ---- Icons - Open Guid -----
Validate the Open guid for Wi-Fi Device Category Trends widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
        click element    ${openGuid_widget22}
        click element    ${close_button}
        click element    ${openGuid_widget22}
        click element    ${next_alert}
        click element    ${back_button}
        click element    ${next_alert}
        click element    ${done_button}

# ---- Icons - Question -----
Validate the Question for Wi-Fi Device Category Trends widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
         click element    ${QuesionIcon_22}
         sleep    6
#         click button    ${closeButton_contains2}
#         click element    ${QuesionIcon_2}
#         sleep    5
         click element    ${closeIcon_22}

# ---- Icons - Download -----
Validate the Download Icon for Wi-Fi Device Category Trends widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
       sleep    2
       click element    ${downloadIcon_22}

# ---- Icons -----
maximize widget window Wi-Fi Device Category Trends widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
        sleep    7
        click element    ${WebElement_maximize_button_22}
