*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../PO/InsightsPageObject.robot
Variables  ../utils/CMC-API.py

                             ################### CommandIQ Insights ###################
*** Variables ***
${CommandIQInsights_tableRow}=    //*[@id="CommandIQ-Insights"]/tbody/tr
${CommandIQInsights_tableCol}=    //*[@id="CommandIQ-Insights"]/tbody/tr[1]/td
${CommandIQInsights_view}=    xpath=//*[@id='CommandIQ-Insights']
${rows}=   8

# Icons
${openGuid_widget19}=    xpath=(//*[@src='assets/images/HappyFeet_Small.png'])[19]
${openVieo_widget19}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][19]//*[@src='assets/images/Videoiconsmall.png']
${QuesionIcon_19}=     //*[@id="CommandIQ"]//*[@class='fa fa-question-circle']
${downloadIcon_19}=     //*[@id="CommandIQ"]//*[@class='fa fa-download']
${WebElement_maximize_button_19}=    //*[@id="CommandIQ"]//*[@class='fa fa-expand']
${widgetIcons_19}=     xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][19]//*[name()='a']
${closeIcon_19}=    (//*[@class='btn btn-primary btn-lg info-modal-close-btn'])[19]


${next_alert}=  xpath=//button[contains(.,'Next')]
${back_button}=   xpath=//button[contains(.,'Back')]
${back_button}=   xpath=//button[contains(.,'Back')]
${back_button}=   xpath=//button[contains(.,'Back')]
${done_button}=   xpath=//button[contains(.,'Done')]
${close_button}=    css=.joyride-step__close > svg
${closeButton_contains}=    xpath=//button[contains(.,'Close')]
${lastTwoMonths}=    xpath=//button[contains(.,'Last Two Months')]

*** Keywords ***
Validate the CommandIQ Insights widget
      ${response_scopes}=   call method    ${CMCconnectionObj}   getScope
      ${ConvertAPI_scopes}=    convert to string     ${response_scopes}
      log to console   ${ConvertAPI_scopes}
      ${contains}=    run keyword and return status    should contain    '''${ConvertAPI_scopes}'''    'cloud.cmc.insights:read,write'
      log to console   ${contains}
      Run Keyword If     '''${contains}''' == 'True'  Handling CMC Insights CommandIQ Insights widget
       ...    ELSE   Scope not in list

Handling CMC Insights CommandIQ Insights widget
#     Validate the Open guid for CommandIQ Insights widget
     Validate the Question for CommandIQ Insights widget
#     Validate the Download Icon for CommandIQ Insights widget
     CommandIQ Insights Widget Table Data
     maximize widget window CommandIQ Insights widget
     #Validate the drilldown screen Region and Location
     #Close the drilldown screen

# ---- Icons - Open Guid -----
Validate the Open guid for CommandIQ Insights widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
        click element    ${openGuid_widget19}
        click element    ${close_button}
        click element    ${openGuid_widget19}
        click element    ${next_alert}
        click element    ${back_button}
        click element    ${next_alert}
        click element    ${done_button}

# ---- Icons - Question -----
Validate the Question for CommandIQ Insights widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
         click element    ${QuesionIcon_19}
         sleep    6
#         click button    ${closeButton_contains2}
#         click element    ${QuesionIcon_2}
#         sleep    5
         click element    ${closeIcon_19}

# ---- Icons - Download -----
Validate the Download Icon for CommandIQ Insights widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
         sleep    2
         click element    ${downloadIcon_19}

# ---- Icons -----
maximize widget window CommandIQ Insights widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
        sleep    7
        click element    ${WebElement_maximize_button_19}
#       # click element    //*[@class='joyride-step__close']
        sleep   2
        click element       //*[@class='fa fa-compress']


CommandIQ Insights Widget Table Data
        set selenium implicit wait    60 seconds
        set selenium timeout    60 seconds
        ${response}=   call method    ${CMCconnectionObj}   CommandIQ_Insights
        scroll element into view    ${CommandIQInsights_view}
        sleep    5
        ${columns}=    get element count    ${CommandIQInsights_tableCol}
        ${sum}=   Set Variable    ${0}
        FOR    ${row}  IN RANGE  1  ${rows}
        Handle Table CommandIQ Insights   ${row}    ${response}
#        Handle Table CommandIQ Insights    ${row}
        END

Handle Table CommandIQ Insights
#       [Arguments]    ${test_row}
       [Arguments]    ${test_row}    ${test_response_Retention_Table_Data}
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
       ${columns}=    get element count  ${CommandIQInsights_tableCol}
       FOR   ${column}    IN RANGE   1    ${columns}
       ${data_table}  get text   xpath=//*[@id="CommandIQ-Insights"]/tbody/tr[${test_row}]/td[${column}]
       log to console    ${data_table}
       ${row_data1}=    Evaluate   ${test_row}-${1}
       ${column_data1}=   Evaluate    ${column}-${1}
       ${ConvertAPI}=    convert to string    ${test_response_Retention_Table_Data}[1][${row_data1}][${column_data1}]
       should contain   ${ConvertAPI}  ${data_table}
       END