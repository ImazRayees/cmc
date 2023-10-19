*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../PO/InsightsPageObject.robot
Variables  ../utils/CMC-API.py

                             ################### Retention ###################


*** Variables ***
${retention_tableRow}=    xpath=//*[@id="Retention"]/tbody/tr
${retention_tableCol}=    xpath=//*[@id="Retention"]/tbody/tr[1]/td
${retention_view}=     xpath=//*[@id='Retention']
${rows}=   8

# Icons
${openGuid_widget8}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][8]//*[@src='assets/images/HappyFeet_Small.png']
${openVieo_widget8}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][8]//*[@src='assets/images/Videoiconsmall.png']
${QuesionIcon_8}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][8]//*[@class='fa fa-question-circle']
${downloadIcon_8}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][8]//*[@class='fa fa-download']
${WebElement_maximize_button_8}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][8]//*[@class='fa fa-expand']
${widgetIcons_8}=     xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][8]//*[name()='a']
${closeIcon_8}=    xpath=//*[@id="info-retention"]/div/div/div[1]/button/span


${next_alert}=  xpath=//button[contains(.,'Next')]
${back_button}=   xpath=//button[contains(.,'Back')]
${done_button}=   xpath=//button[contains(.,'Done')]
${close_button}=    css=.joyride-step__close > svg
${closeButton_contains}=    xpath=//button[contains(.,'Close')]
${lastTwoMonths}=    xpath=//button[contains(.,'Last Two Months')]



*** Keywords ***
Validate the Retention widget
      ${response_scopes}=   call method    ${CMCconnectionObj}   getScope
      ${ConvertAPI_scopes}=    convert to string     ${response_scopes}
      log to console   ${ConvertAPI_scopes}
      ${contains}=    run keyword and return status    should contain    '''${ConvertAPI_scopes}'''    'cloud.cmc.insights:read,write'
      log to console   ${contains}
      Run Keyword If     '''${contains}''' == 'True'  Handling CMC Insights Retention widget
       ...    ELSE   Scope not in list

Handling CMC Insights Retention widget
#       Validate the Open guid for Retention widget
       Validate the Question for Retention widget
#       Validate the Download Icon for Retention widget
       Retention Widget Table Data Validation
       maximize widget window Retention widget
#       Validate the drilldown screen Region and Location
#       Close the drilldown screen

# ---- Icons - Open Guid ----
Validate the Open guid for Retention widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
        click element    ${openGuid_widget8}
        click element    ${close_button}
        click element    ${openGuid_widget8}
        click element    ${next_alert}
        click element    ${back_button}
        click element    ${next_alert}
        click element    ${done_button}

# ---- Icons - Question -----
Validate the Question for Retention widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
         click element    ${QuesionIcon_8}
         sleep    6
#         click button    ${closeButton_contains2}
#         click element    ${QuesionIcon_2}
#         sleep    5
         click element    ${closeIcon_8}

# ---- Icons - Download -----
Validate the Download Icon for Retention widget
    set selenium implicit wait    60 seconds
#    set selenium timeout    60 seconds
         sleep    2
         click element    ${downloadIcon_8}

# ---- Icons -----
maximize widget window Retention widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
    sleep    7
    click element    ${WebElement_maximize_button_8}
##   click element    //*[@class='joyride-step__close']
    sleep   2
    click element       //*[@class='fa fa-compress']

#    ------****  Retention Table Data  *****-----------
Retention Widget Table Data Validation
        set selenium implicit wait    60 seconds
        set selenium timeout    60 seconds
        ${response}=   call method    ${CMCconnectionObj}   Retention
        scroll element into view    ${retention_view}
        sleep    5
        ${columns}=    get element count    ${retention_tableCol}
        ${sum}=   Set Variable    ${0}
        FOR    ${row}  IN RANGE  1  ${rows}
        Handle Table Retension    ${row}    ${response}
#        Handle Table Retension    ${row}
        END

Handle Table Retension
#       [Arguments]    ${test_row}
       [Arguments]    ${test_row}    ${test_response_Retention_Table_Data}
       set selenium implicit wait    60 seconds
       set selenium timeout    60 seconds
       ${columns}=    get element count  ${retention_tableCol}
       FOR   ${column}    IN RANGE   1    ${columns}
       ${data_table}  get text   xpath=//*[@id="Retention"]/tbody/tr[${test_row}]/td[${column}]
       log to console    ${data_table}
       ${row_data1}=    Evaluate   ${test_row}-${1}
       ${column_data1}=   Evaluate    ${column}-${1}
       log     ${test_response_Retention_Table_Data}[1][${row_data1}] [${column_data1}]
       ${ConvertAPI}=    convert to string    ${test_response_Retention_Table_Data}[1][${row_data1}] [${column_data1}]
       should contain   ${ConvertAPI}  ${data_table}
       END