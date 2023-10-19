*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Variables   ../utils/configReader.py
Variables  ../utils/InsightScreenAPI.py
Variables  ../utils/CMC-API.py
Resource    CommonWrapper.robot

*** Variables ***
${Retentionlense3_TableRow}=    //*[@id='retentionTable']/tbody/tr
${Retentionlense3_TableCol}=    //*[@id='retentionTable']/tbody/tr[1]/td


*** Keywords ***
Validate Retention table data
     Table Data Validation with drill down data with tbody    ${Retentionlense3_TableRow}    ${Retentionlense3_TableCol}    Retention    retentionTable


