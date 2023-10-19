*** Settings ***
Library     SeleniumLibrary
Library     Collections
Variables  ../utils/CMC-API.py

                             ################### Acquisition Rate And Insights widget ###################
*** Variables ***
# Icons
${openGuid_widget10}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][10]//*[@src='assets/images/HappyFeet_Small.png']
${openVieo_widget10}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][10]//*[@src='assets/images/Videoiconsmall.png']
${QuesionIcon_10}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][10]//*[@class='fa fa-question-circle']
${downloadIcon_10}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][10]//*[@class='fa fa-download']
${WebElement_maximize_button_10}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][10]//*[@class='fa fa-expand']
${widgetIcons_10}=     xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][10]//*[name()='a']
${closeIcon_10}=    xpath=(//*[@class='btn btn-primary btn-lg info-modal-close-btn'])[11]
${WebElement_get_tooltip10}=    xpath=//*[@id='Acquisition-Rate-Insights']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect']
${WebElement_get_tooltiptext10}=   xpath=//*[@id='Acquisition-Rate-Insights']//*[name()='div']//*[name()='svg']//*[name()='g'][11]//*[name()='text']


${next_alert}=    //*[@class='btn btn-sm next-btn ng-star-inserted']
${back_button}=   xpath=//button[contains(.,'Back')]
${cmcdone_button}=    //*[@class='btn next-btn ng-star-inserted']
${close_button}=    css=.joyride-step__close > svg
${closeButton_contains}=    xpath=//button[contains(.,'Close')]
${lastTwoMonths}=    xpath=//button[contains(.,'Last Two Months')]

*** Keywords ***
# ---- Icons - Open Guid -----
Validate Acquisition Rate And Insights widget
      ${response_scopes}=   call method    ${CMCconnectionObj}   getScope
      ${ConvertAPI_scopes}=    convert to string     ${response_scopes}
      log to console   ${ConvertAPI_scopes}
      ${contains}=    run keyword and return status    should contain    '''${ConvertAPI_scopes}'''    'cloud.cmc.insights:read,write'
      log to console   ${contains}
      Run Keyword If     '''${contains}''' == 'True'  Handling CMC Insights Acquisition Rate And Insights widget
       ...    ELSE   Scope not in list

Handling CMC Insights Acquisition Rate And Insights widget
#     Validate the Open guid for Acquisition Rate And Insights widget
     Validate the Question for Acquisition Rate And Insights widget
     Validate the Download Icon for Acquisition Rate And Insights widget
     get graphvalue in Acquisition Rate And Insights widget
     maximize widget window Acquisition Rate And Insights widget
     #Validate the drilldown screen Region and Location
     ##get graphvalue in drilldown Service Tier Technology
     #Close the drilldown screen

Validate the Open guid for Acquisition Rate And Insights widget
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        click element    ${openGuid_widget10}
        click element    ${close_button}
        click element    ${openGuid_widget10}
        click element    ${next_alert}
        click element    ${back_button}
        click element    ${next_alert}
        ${present}=  Run Keyword And Return Status  element should be visible  ${next_alert}
        Run Keyword if  ${present}  close Alert
        sleep   2
        click element    ${cmcdone_button}
close Alert
        click element       ${next_alert}
        click element    ${cmcdone_button}


# ---- Icons - Question -----
Validate the Question for Acquisition Rate And Insights widget
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
         click element    ${QuesionIcon_10}
         sleep    6
#         click button    ${closeButton_contains2}
#         click element    ${QuesionIcon_2}
#         sleep    5
         click element    ${closeIcon_10}

# ---- Icons - Download -----
Validate the Download Icon for Acquisition Rate And Insights widget
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
         sleep    2
         click element    ${downloadIcon_10}

# ---- Icons -----
maximize widget window Acquisition Rate And Insights widget
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        sleep    7
        click element    ${WebElement_maximize_button_10}
        sleep   2
        click element       //*[@class='fa fa-compress']



get graphvalue in Acquisition Rate And Insights widget
#        ${response_Subscribers_by_Service_Tier_And_Technology_Chart_SeriesData}=   call method    ${connectionObj}   Subscribers_by_Service_Tier_And_Technology_Chart_total
#        ${category_total}    get length    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_SeriesData}
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        ${Tooltip_defauld}=  Set Variable    ${0}            #${}
        @{Tooltip_List}=    Create List
        @{Get_tooltip}=   Get WebElements  ${WebElement_get_tooltip10}
        ${sum}=   Set Variable    ${0}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
       ${height_value}=   Get Element Attribute  ${tooltiplocation}    height
        ${height_value1}=    CONVERT TO INTEGER  ${height_value}
        Run Keyword If    ${height_value1} == 0     Acquisition Rate And Insights widget Zero Handling
        ...    ELSE    Acquisition Rate And Insights widget Non Zero chart   ${tooltiplocation}
        END

Acquisition Rate And Insights widget Zero Handling
      log to console   Handled no data chart

Acquisition Rate And Insights widget Non Zero chart
      [Arguments]    ${tooltiplocation}
      set selenium timeout    60 seconds
      set selenium implicit wait    60 seconds
      mouse over    ${tooltiplocation}
      ${TooltipText}=   get text    ${WebElement_get_tooltiptext10}
      log to console   ${TooltipText}