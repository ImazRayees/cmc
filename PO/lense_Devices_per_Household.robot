*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Variables   ../utils/configReader.py
Variables  ../utils/InsightScreenAPI.py
Variables  ../utils/CMC-API.py
Resource    CommonWrapper.robot
Resource   ../PO/ExploreDataPO_services.robot

*** Variables ***
${Servicelense7_get_tooltip}=    //*[@id='device-per-household-chart']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='path']
${Servicelense7_get_tooltip_text}=    //*[@id='device-per-household-chart']//*[name()='svg']//*[name()='g'][11]//*[name()='text']

${Servicelense7_drilldown_get_tooltip}=    //*[@id='Devices per Household']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='path']
${Servicelense7_drilldown_get_tooltip_text}=    //*[@id='Devices per Household']//*[name()='svg']//*[name()='g'][11]//*[name()='text']

${Servicelense7_Drilldown_bar}=    //*[@id='Devices per Household']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect'][2]

${Servicelense7_quesionIcon}=    (//*[@class='btn-round btn-small-24 btn-grey btn-que'])[7]
${Servicelense7_expandIcon}=    (//*[@class='btn-round btn-small-24 btn-grey btn-expand'])[7]
${Servicelense7_downloadIcon}=    (//*[@class='btn-round btn-small-24 btn-grey btn-dload'])[7]

${Servicelense7_Minimize}=    //*[@class='fullscreen-table-info']

${Servicelense1_drilldownHeader}=    //*[@class='fullscreen-table-info']

${drilldown_table_rows}=     //*[@id='append-table-list']/tr
${drilldown_table_columns}=    //*[@id='append-table-list']/tr[1]/td

${drilldown_table_rows}=     //*[@id='append-table-list']/tr
${drilldown_table_columns}=    //*[@id='append-table-list']/tr[1]/td



*** Keywords ***
Verify get Bar value in Devices per Household
    ${response}=   call method    ${CMCconnectionObj}   Devices_per_Household
    Get the Data from Bar Graph Widgets No Hight    ${Servicelense7_get_tooltip}    ${Servicelense7_get_tooltip_text}    Devices_per_Household

Click on Servicelense7 Maximize icon
    Click Element Until Enabled    ${Servicelense7_expandIcon}
    sleep  3
    capture the screen  devicesPerHouseHoldWidgetFullView

Verify get drill down Bar value in Devices per Household
    ${response}=   call method    ${CMCconnectionObj}   Devices_per_Household
    Get the Data from Bar Graph Widgets No Hight   ${Servicelense7_drilldown_get_tooltip}    ${Servicelense7_drilldown_get_tooltip_text}    Devices_per_Household

Click on Servicelense7 Drilldown Bar
    Click Element Until Enabled    ${Servicelense7_Drilldown_bar}

Verify get drill down Table Data in Devices per Household
    ${columns}=    get element count    ${drilldown_table_columns}
    log to console    ${columns}
    ${rows}=    get element count    ${drilldown_table_rows}
    log to console    ${rows}
    Table Data Validation with drill down data    ${drilldown_table_rows}    ${drilldown_table_columns}    Devices_per_Household_drilldown    append-table-list

Verify Devices per Household all bars header of drill down
        Get Verify drill down table header No height    ${Servicelense7_drilldown_get_tooltip}    Devices_per_Household    ${Servicelense1_drilldownHeader}
       Click Element Until Enabled    ${Servicelense7_Minimize}
       sleep  2
       capture the screen  ${servicesscreen}