*** Settings ***
Library    SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Resource    ../PO/CommonWrapper.robot
Resource    ../PO/Campigns_po.robot
Resource   ../PO/ExploreDataPO_subscriber.robot
Variables   ../utils/configReader.py
Variables  ../utils/InsightScreenAPI.py
Variables  ../utils/CMC-API.py
Resource    CommonWrapper.robot


*** Variables ***

${campTableId}=  //*[@id='DataTables_Table_0']
${campTrow}=   (//*[@id='DataTables_Table_0']//tbody)[1]//tr
${campTcol}=   (//*[@id='DataTables_Table_0']//tbody)[1]//tr[1]//td



*** Keywords ***
validation of campaigns table data
    ${RowCounts}=    get element count    (//*[@id='DataTables_Table_0']//tbody)[1]//tr
    log to console    ${RowCounts}
    Table Data Validation with drill down data with tbody  ${campTrow}  ${camptcol}  Campaign_New  DataTables_Table_0


*** Test Cases ***
Login to the site
    [Tags]  Login  e2eUI
    Given login to site


navigate to marketing cloud
    [Tags]  marketingCloud  e2eUI
    Given go to marketing cloud


Navigating to campaigns
    [Tags]  campaignsTab  campaignsTabNav  e2eUI
    Given Naviagate to Campaigns Tab
    Then validation of campaigns table data