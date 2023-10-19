*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Variables   ../utils/configReader.py
Variables  ../utils/InsightScreenAPI.py
Variables  ../utils/CMC-API.py
Resource    CommonWrapper.robot
Resource   ../PO/ExploreDataPO_retention.robot

*** Variables ***
${Retensionlense2_TableRow}=    //*[@id='retentionChurnTable']/tbody/tr
${Retensionlense2_TableCol}=    //*[@id='retentionChurnTable']/tbody/tr[1]/td

${Retention}=    //*[@id='retentionData-list-menu']



*** Keywords ***
Navigate to the Retention menu
     Click Element Until Enabled    ${Retention}
     sleep  2
     capture the screen  ${retentionscreen}

Validate Churn_Risk table data
     Table Data Validation with drill down data with tbody    ${Retensionlense2_TableRow}    ${Retensionlense2_TableCol}    Churn_Risk    retentionChurnTable


