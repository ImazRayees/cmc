*** Settings ***
Library    SeleniumLibrary
Resource    CommonWrapper.robot

*** Variables ***
${MobileHistory_tableRow}=    //*[@id='DataTables_Table_0']/tbody/tr
${MobileHistory_tableCol}=    //*[@id='DataTables_Table_0']/tbody/tr[1]/td

${MailChimpResults_tableRow}=    //*[@id='DataTables_Table_1']/tbody/tr
${MailChimpResults_tableCol}=    //*[@id='DataTables_Table_1']/tbody/tr[1]/td

*** Keywords ***
Navigate to the Campaign Mobile Notification Results Screen
    Click Element Until Visible    //a[contains(text(),'Campaigns')]
    Click Element Until Visible    //a[@id='advancedData-list-tab']
    Click Element Until Visible    //*[@class='textCalix btn-default primary mr-2']

Campaign Mobile Notification Results table Data API Inegration
    ${response}=   call method    ${CMCconnectionObj}    Campaign_MobileNotification_History
    Table Data Validation with drill down data with tbody     ${MobileHistory_tableRow}    ${MobileHistory_tableCol}    Campaign_MobileNotification_History    DataTables_Table_0
    log to console    Integrated Succesfully

Navigate to the MailChimp Marketing Channel Results
    Click Element Until Visible     css=.close > span
    Click Element Until Visible    //*[@class='btn-default primary mr-2 textCalix']

MailChimp Marketing Channel Results table Data API Integration
    ${response}=   call method    ${CMCconnectionObj}    Campaign_MailChimp_Marketing_Channel_Results
    Table Data Validation with drill down data with tbody     ${MailChimpResults_tableRow}   ${MailChimpResults_tableCol}    Campaign_MailChimp_Marketing_Channel_Results    DataTables_Table_1
    log to console    Integrated Succesfully