*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Variables   ../utils/configReader.py
Variables  ../utils/InsightScreenAPI.py
Variables  ../utils/CMC-API.py
Resource    CommonWrapper.robot


*** Variables ***
${Servicelense6_TableRow}=    //*[@id='serviceCommandInsightTable']/tbody/tr
${Servicelense6_TableCol}=    //*[@id='serviceCommandInsightTable']/tbody/tr[1]/td


*** Keywords ***
Validate CommandIQ Insights table data
     Table Data Validation with drill down data with tbody     ${Servicelense6_TableRow}    ${Servicelense6_TableCol}    CommandIQ_Insights    serviceCommandInsightTable

