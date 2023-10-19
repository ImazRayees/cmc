*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Variables   ../utils/configReader.py
Variables  ../utils/InsightScreenAPI.py
Variables  ../utils/CMC-API.py
Resource    CommonWrapper.robot

*** Variables ***
${Applicationlense2_TableRow}=    //*[@id='topGamingAppTableData']/tbody/tr
${Applicationlense2_TableCol}=    //*[@id='topGamingAppTableData']/tbody/tr[1]/td

${Applications}=    //*[@id='applicationData-list-menu']

*** Keywords ***
Validate Top Gaming Application table data
     Table Data Validation with drill down data with tbody    ${Applicationlense2_TableRow}    ${Applicationlense2_TableCol}    Top_Gaming_Applications    topGamingAppTableData


