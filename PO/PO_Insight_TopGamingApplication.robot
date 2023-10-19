*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../PO/InsightsPageObject.robot
Variables  ../utils/CMC-API.py

                             ################### Top Gaming Applications ###################
*** Variables ***
${topGamingApplication_tableRow}=    //*[@id="Top-Gaming-Applications"]/tbody/tr
${topGamingApplication_tableCol}=    //*[@id="Top-Gaming-Applications"]/tbody/tr[1]/td
${rows}=   8

# Icons
${openGuid_widget15}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][15]//*[@src='assets/images/HappyFeet_Small.png']
${openVieo_widget15}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][15]//*[@src='assets/images/Videoiconsmall.png']
${QuesionIcon_15}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][14]//*[@class='fa fa-question-circle']
${downloadIcon_15}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][15]//*[@class='fa fa-download']
${WebElement_maximize_button_15}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][15]//*[@class='fa fa-expand']
${widgetIcons_15}=     xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][15]//*[name()='a']
${closeIcon_15}=    xpath=(//*[@class='btn btn-primary btn-lg info-modal-close-btn'])[15]



${next_alert}=  xpath=//button[contains(.,'Next')]
${back_button}=   xpath=//button[contains(.,'Back')]
${done_button}=   xpath=//button[contains(.,'Done')]
${close_button}=    css=.joyride-step__close > svg
${closeButton_contains}=    xpath=//button[contains(.,'Close')]
${lastTwoMonths}=    xpath=//button[contains(.,'Last Two Months')]


*** Keywords ***
Valdiate the Top Gaming Applications widget
      ${response_scopes}=   call method    ${CMCconnectionObj}   getScope
      ${ConvertAPI_scopes}=    convert to string     ${response_scopes}
      log to console   ${ConvertAPI_scopes}
      ${contains}=    run keyword and return status    should contain    '''${ConvertAPI_scopes}'''    'cloud.cmc.insights:read,write'
      log to console   ${contains}
      Run Keyword If     '''${contains}''' == 'True'  Handling CMC Insights Top Gaming Applications widget
       ...    ELSE   Scope not in list

Handling CMC Insights Top Gaming Applications widget
#     Validate the Open guid for Top Gaming Applications widget
     Validate the Question for Top Gaming Applications widget
     Validate the Download Icon for Top Gaming Applications widget
     Top Gaming Applications Widget Table Data Validation
     maximize widget window Top Gaming Applications widget
     #Validate the drilldown screen Region and Location
     #Close the drilldown screen


# ---- Icons - Open Guid -----
Validate the Open guid for Top Gaming Applications widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
        click element    ${openGuid_widget15}
        click element    ${close_button}
        click element    ${openGuid_widget15}
        click element    ${next_alert}
        click element    ${back_button}
        click element    ${next_alert}
        click element    ${done_button}

# ---- Icons - Question -----
Validate the Question for Top Gaming Applications widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
         sleep    3
         click element    ${QuesionIcon_15}
         sleep    6
#         click button    ${closeButton_contains2}
#         click element    ${QuesionIcon_2}
#         sleep    5
         click element    ${closeIcon_15}

# ---- Icons - Download -----
Validate the Download Icon for Top Gaming Applications widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
         sleep    2
         click element    ${downloadIcon_15}

# ---- Icons -----
maximize widget window Top Gaming Applications widget
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
        sleep    7
        click element    ${WebElement_maximize_button_15}
        sleep    4
                click element       //*[@class='fa fa-compress']

#       # click element    //*[@class='joyride-step__close']
#        sleep   2
#        ${present}=    Run Keyword And Return Status    Element Should Be Visible    //*[@class='joyride-step__close']
#        Run Keyword If    ${present}   close the alert1
#        ...  ELSE     log to console   Subscribers-by-Service-Tier-Technology widget not available
#
#close the alert1
#        click element    //*[@class='joyride-step__close']



Top Gaming Applications Widget Table Data Validation
        set selenium implicit wait    60 seconds
        set selenium timeout    60 seconds
        sleep    2
       ${response}=   call method    ${CMCconnectionObj}   Top_Gaming_Applications
       ${columns}=    get element count    ${topGamingApplication_tableCol}
        ${sum}=   Set Variable    ${0}
        FOR    ${row}  IN RANGE  1  ${rows}
         Handle Table TopGaming    ${row}    ${response}
#         Handle Table TopGaming    ${row}
        END

Handle Table TopGaming
       [Arguments]    ${test_row}    ${response_Top_Gaming_Applications_Table_Data}
#       [Arguments]    ${test_row}
           set selenium implicit wait    60 seconds
        set selenium timeout    60 seconds
       ${columns}=    get element count  ${topApplication_tableCol}
       FOR   ${column}    IN RANGE   1    2
       ${data_table}  get text   xpath=//*[@id="Top-Gaming-Applications"]/tbody/tr[${test_row}]/td[${column}]
       log  ${data_table}
       ${row_data1}=    Evaluate   ${test_row}-${1}
       ${column_data1}=   Evaluate    ${column}-${1}
       ${ConvertAPI}=    convert to string    ${response_Top_Gaming_Applications_Table_Data}[1][${row_data1}] [${column_data1}]
       should contain   ${ConvertAPI}  ${data_table}
       END