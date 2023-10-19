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
${Servicelense1_get_tooltip}=    (//*[@id='subscriber-tier-tech-chart']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g'])[7]/*
${Servicelense1_get_tooltip_text}=    //*[@id='subscriber-tier-tech-chart']//*[name()='svg']//*[name()='g'][11]//*[name()='text']

${Servicelense1_drilldown_get_tooltip}=    (//*[@id='Service Tier & Technology']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g'])[7]//*
${Servicelense1_drilldown_get_tooltip_text}=    //*[@id='Service Tier & Technology']//*[name()='svg']//*[name()='g'][11]//*[name()='text']

${Servicelense1_Drilldown_bar}=    (//*[@id='Service Tier & Technology']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect'][3])[3]

${Servicelense1_quesionIcon}=    (//*[@class='btn-round btn-small-24 btn-grey btn-que'])[1]
${Servicelense1_expandIcon}=    (//*[@class='btn-round btn-small-24 btn-grey btn-expand'])[1]
${Servicelense1_downloadIcon}=    (//*[@class='btn-round btn-small-24 btn-grey btn-dload'])[1]

${drilldown_table_rows}=     //*[@id='append-table-list']/tr
${drilldown_table_columns}=    //*[@id='append-table-list']/tr[1]/td

${Servicelense1_drilldownHeader}=    //*[@class='fullscreen-table-info']

${Servicelense1_MinimizeIcon}=    //*[@class='btn-round btn-small-24 btn-grey btn-expand-inv']



*** Keywords ***
Verify get Bar value in Subscribers by Service Tier
    ${response}=   call method    ${API_CMCObj}   Subscribers_by_Service_Tier_And_Technology
    Get the Data from Bar Graph Widgets No Hight    ${Servicelense1_get_tooltip}    ${Servicelense1_get_tooltip_text}    Subscribers_by_Service_Tier_And_Technology

Click on Servicelense1 Maximize icon
    Click Element Until Enabled    ${Servicelense1_expandIcon}
    sleep  2
    capture the screen  subscriberBySTFullView

Verify get drill down Bar value in Subscribers by Service Tier
    ${response}=   call method    ${API_CMCObj}   Subscribers_by_Service_Tier_And_Technology
    Get the Data from Bar Graph Widgets No Hight     ${Servicelense1_drilldown_get_tooltip}    ${Servicelense1_drilldown_get_tooltip_text}    Subscribers_by_Service_Tier_And_Technology

Click on Servicelense1 Drilldown Bar
    Click Element Until Enabled    ${Servicelense1_Drilldown_bar}

Verify get drill down Table Data in Subscribers by Service Tier
    ${columns}=    get element count    ${drilldown_table_columns}
    log to console    ${columns}
    ${rows}=    get element count    ${drilldown_table_rows}
    log to console    ${rows}
    Table Data Validation with drill down data    ${drilldown_table_rows}    ${drilldown_table_columns}    Subscribers_by_Service_Tier_And_Technology_drilldown    append-table-list

Verify Subscribers by Service Tier all bars header of drill down
       Get Verify drill down table header opacity    ${Servicelense1_drilldown_get_tooltip}    Subscribers_by_Service_Tier_And_Technology    ${Servicelense1_drilldownHeader}
       Click Element Until Enabled    ${Servicelense1_MinimizeIcon}
       sleep  2
       capture the screen  ${servicesscreen}

