*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../PO/InsightsPageObject.robot
Variables  ../utils/CMC-API.py

                             ################### Devices per Household ###################
*** Variables ***
# Icons
${openGuid_widget20}=    xpath=(//*[@src='assets/images/HappyFeet_Small.png'])[20]
${openVieo_widget20}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][20]//*[@src='assets/images/Videoiconsmall.png']
${QuesionIcon_20}=    //*[@id="Deviceper"]//*[@class='fa fa-question-circle']
${downloadIcon_20}=    //*[@id="Deviceper"]//*[@class='fa fa-download']
${WebElement_maximize_button_20}=    //*[@id="Deviceper"]//*[@class='fa fa-expand']
${widgetIcons_20}=     xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][20]//*[name()='a']
${closeIcon_20}=    xpath=(//*[@class='btn btn-primary btn-lg info-modal-close-btn'])[20]
${WebElement_get_tooltip20}=    xpath=//*[@id='Devices-per-Household']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect']
${WebElement_get_tooltiptext20}=   xpath=//*[@id='Devices-per-Household']//*[name()='div']//*[name()='svg']//*[name()='g'][11]//*[name()='text']


${next_alert}=  xpath=//button[contains(.,'Next')]
${back_button}=   xpath=//button[contains(.,'Back')]
${done_button}=   xpath=//button[contains(.,'Done')]
${close_button}=    css=.joyride-step__close > svg
${closeButton_contains}=    xpath=//button[contains(.,'Close')]
${lastTwoMonths}=    xpath=//button[contains(.,'Last Two Months')]

*** Keywords ***
Validate the Devices per Household widget
      ${response_scopes}=   call method    ${CMCconnectionObj}   getScope
      ${ConvertAPI_scopes}=    convert to string     ${response_scopes}
      log to console   ${ConvertAPI_scopes}
      ${contains}=    run keyword and return status    should contain    '''${ConvertAPI_scopes}'''    'cloud.cmc.insights:read,write'
      log to console   ${contains}
      Run Keyword If     '''${contains}''' == 'True'  Handling CMC Insights Devices per Household widget
       ...    ELSE   Scope not in list

Handling CMC Insights Devices per Household widget
#     Validate the Open guid for Devices per Household widget
     Validate the Question for Devices per Household widget
     Validate the Download Icon for Devices per Household widget
     maximize widget window Devices per Households widget
     #Validate the drilldown screen Region and Location
     #get graphvalue in drilldown Service Tier Technology
     #Close the drilldown screen


# ---- Icons - Open Guid -----
Validate the Open guid for Devices per Household widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
        click element    ${openGuid_widget20}
        click element    ${close_button}
        click element    ${openGuid_widget20}
        click element    ${next_alert}
        click element    ${back_button}
        click element    ${next_alert}
        click element    ${next_alert}
        click element    ${done_button}

# ---- Icons - Question -----
Validate the Question for Devices per Household widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
         click element    ${QuesionIcon_20}
         sleep    6
#         click button    ${closeButton_contains2}
#         click element    ${QuesionIcon_2}
#         sleep    5
         click element    ${closeIcon_20}

# ---- Icons - Download -----
Validate the Download Icon for Devices per Household widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
         sleep    2
         click element    ${downloadIcon_20}

# ---- Icons -----
maximize widget window Devices per Household widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
        sleep    7
        click element    ${WebElement_maximize_button_20}
#         sleep   2
#         click element       //*[@class='fa fa-compress']


# ---- Icons -----
maximize widget window Devices per Households widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
        sleep    7
        click element    ${WebElement_maximize_button_20}
        #click element    //*[@class='joyride-step__close']
        sleep   2
        click element       //*[@class='fa fa-compress']


get graphvalue in New Subscribers by Devices per Household widget
#        ${response_Subscribers_by_Service_Tier_And_Technology_Chart_SeriesData}=   call method    ${connectionObj}   Subscribers_by_Service_Tier_And_Technology_Chart_total
#        ${category_total}    get length    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_SeriesData}
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
        ${Tooltip_defauld}=  Set Variable    ${0}            #${}
        @{Tooltip_List}=    Create List
        @{Get_tooltip}=   Get WebElements  ${WebElement_get_tooltip20}
        ${sum}=   Set Variable    ${0}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
       ${height_value}=   Get Element Attribute  ${tooltiplocation}    height
        ${height_value1}=    CONVERT TO INTEGER  ${height_value}
        Run Keyword If    ${height_value1} == 0     Devices per Household widget Zero Handling
        ...    ELSE    Devices per Household widget Non Zero chart   ${tooltiplocation}
        END

Devices per Household widget Zero Handling
      log to console   Handled no data chart

Devices per Household widget Non Zero chart
      [Arguments]    ${tooltiplocation}
      set selenium implicit wait    60 seconds
      set selenium timeout    60 seconds
      mouse over    ${tooltiplocation}
      ${TooltipText}=   get text    ${WebElement_get_tooltiptext20}
      log to console   ${TooltipText}