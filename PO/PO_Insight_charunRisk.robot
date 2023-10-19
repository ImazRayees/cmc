*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../PO/InsightsPageObject.robot
Variables  ../utils/CMC-API.py

                             ################### Churn-Risk ###################
*** Variables ***
${charunRisk_tableRow}=    xpath=//*[@id="retentionChurnRiskChartFullview"]/tbody/tr
${charunRisk_tableCol}=    xpath=//*[@id="retentionChurnRiskChartFullview"]/tbody/tr[1]/td
${charunRisk_view}=    xpath=//*[@id='retentionChurnRiskChartFullview']
${rows}=   8

# Icons
${openGuid_widget9}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][9]//*[@src='assets/images/HappyFeet_Small.png']
${openVieo_widget9}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][9]//*[@src='assets/images/Videoiconsmall.png']
${QuesionIcon_9}=    xpath=//*[@data-target="#info-churn-risk"]//*[@class='fa fa-question-circle']
${downloadIcon_9}=    //*[@id="ChurnRisk"]//*[@class="fa fa-download"]
${WebElement_maximize_button_9}=    xpath=//*[@id="ChurnRisk"]//*[@class='fa fa-expand']
${widgetIcons_9}=     xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][9]//*[name()='a']
${closeIcon_9}=    (//*[@class='btn btn-primary btn-lg info-modal-close-btn'])[9]


${next_alert}=  xpath=//button[contains(.,'Next')]
${back_button}=   xpath=//button[contains(.,'Back')]
${done_button}=   xpath=//button[contains(.,'Done')]
${close_button}=    css=.joyride-step__close > svg
${closeButton_contains}=    xpath=//button[contains(.,'Close')]
${lastTwoMonths}=    xpath=//button[contains(.,'Last Two Months')]

*** Keywords ***
# ---- Icons - Open Guid -----
Validate the Churn-Risk widget
      ${response_scopes}=   call method    ${CMCconnectionObj}   getScope
      ${ConvertAPI_scopes}=    convert to string     ${response_scopes}
      log to console   ${ConvertAPI_scopes}
      ${contains}=    run keyword and return status    should contain    '''${ConvertAPI_scopes}'''    'cloud.cmc.insights:read,write'
      log to console   ${contains}
      Run Keyword If     '''${contains}''' == 'True'  Handling CMC Insights Churn-Risk widget
       ...    ELSE   Scope not in list

Handling CMC Insights Churn-Risk widget
#       Validate the Open guid for Churn-Risk widget
       Validate the Question for Churn-Risk widget
       #Validate the Download Icon for Churn-Risk widget
       Churn Risk Widget Table Data Validation
       maximize widget window Churn-Risk widget
       #Validate the drilldown screen Region and Location
       #Close the drilldown screen


Validate the Open guid for Churn-Risk widget
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        click element    ${openGuid_widget9}
        click element    ${close_button}
        click element    ${openGuid_widget9}
        click element    ${next_alert}
        click element    ${back_button}
        click element    ${next_alert}
        click element    ${done_button}

# ---- Icons - Question -----
Validate the Question for Churn-Risk widget
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
         click element    ${QuesionIcon_9}
         sleep    6
#         click button    ${closeButton_contains2}
#         click element    ${QuesionIcon_2}
#         sleep    5
         click element    ${closeIcon_9}

# ---- Icons - Download -----
Validate the Download Icon for Churn-Risk widget
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
         sleep    2
         click element    ${downloadIcon_9}


# ---- Icons -----
maximize widget window Churn-Risk widget
        set selenium timeout    60 seconds
        set selenium implicit wait    60 seconds
        sleep    7
        click element    ${WebElement_maximize_button_9}
##       click element    //*[@class='joyride-step__close']
#        sleep   2
        click element       //*[@class='fa fa-compress']

Churn Risk Widget Table Data Validation
         set selenium implicit wait    60 seconds
        set selenium timeout    60 seconds
        ${response}=   call method    ${CMCconnectionObj}   Churn_Risk
        scroll element into view    ${charunRisk_view}
        sleep    5
        ${sum}=   Set Variable    ${0}
        FOR    ${row}    IN RANGE  1  ${rows}
        Handle Table ChurnRisk    ${row}    ${response}
#        Handle Table ChurnRisk    ${row}
        END

Handle Table ChurnRisk
#       [Arguments]    ${test_row}
       [Arguments]    ${test_row}    ${response_Churn_Risk_Table_Data}
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
       ${columns}=    get element count  ${charunRisk_tableCol}
       FOR   ${column}    IN RANGE   1    ${columns}
       ${data_table}  get text   xpath=//*[@id="retentionChurnRiskChartFullview"]/tbody/tr[${test_row}]/td[${column}]
       log to console   ${data_table}
       ${row_data1}=    Evaluate   ${test_row}-${1}
       ${column_data1}=   Evaluate    ${column}-${1}
       ${ConvertAPI}=    convert to string   ${response_Churn_Risk_Table_Data}[1][${row_data1}] [${column_data1}]
       should contain   ${ConvertAPI}  ${data_table}
       END
