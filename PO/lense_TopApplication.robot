*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Variables   ../utils/configReader.py
Variables  ../utils/InsightScreenAPI.py
Variables  ../utils/CMC-API.py
Resource    CommonWrapper.robot
Resource   ../PO/ExploreDataPO_applications.robot

*** Variables ***
${Applicationlense2_TableRow}=    //*[@id='topAppTableData']/tbody/tr
${Applicationlense2_TableCol}=    //*[@id='topAppTableData']/tbody/tr[1]/td

${Applications}=    //*[@id='applicationData-list-menu']

*** Keywords ***
Navigate to the Application menu
     Click Element Until Enabled    ${Applications}
     sleep  2
     capture the screen  ${applicationsscreen}


Validate Top Application table data
     log to console    Top Application Success
#     Table Data Validation with drill down data with tbody    ${Applicationlense2_TableRow}    ${Applicationlense2_TableCol}    Top_Applications    topAppTableData


