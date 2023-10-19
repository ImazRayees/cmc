*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Variables   ../utils/configReader.py
Variables  ../utils/InsightScreenAPI.py
Variables  ../utils/CMC-API.py
Resource    CommonWrapper.robot
Resource   ../PO/ExploreDataPO_acquisition.robot


*** Variables ***
${Acquisitionlense1_get_tooltip}=    //*[@id='new-subscriber-tier-tech-chart']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[@class='highcharts-point highcharts-color-0']
${Acquisitionlense1_get_tooltip_text}=    //*[@id='new-subscriber-tier-tech-chart']//*[name()='svg']//*[name()='g'][11]//*[name()='text']

${Acquisitionlense1_drilldown_get_tooltip}=    //*[@id='New Subscribers by Service Tier & Technology']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[@class='highcharts-point highcharts-color-0']
${Acquisitionlense1_drilldown_get_tooltip_text}=    //*[@id='New Subscribers by Service Tier & Technology']//*[name()='svg']//*[name()='g'][11]//*[name()='text']

${Acquisitionlense1_Drilldown_bar}=    //*[@id='New Subscribers by Service Tier & Technology']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*

${Acquisitionlense1_quesionIcon}=    (//*[@class='btn-round btn-small-24 btn-grey btn-que'])[1]
${Acquisitionlense1_expandIcon}=    (//*[@class='btn-round btn-small-24 btn-grey btn-expand'])[1]
${Acquisitionlense1_downloadIcon}=    (//*[@class='btn-round btn-small-24 btn-grey btn-dload'])[1]

${drilldown_table_rows}=     //*[@id='append-table-list']//tr
${drilldown_table_columns}=    //*[@id='append-table-list']//tr[1]//td



${Acquisitionlense1_drilldownHeader}=    //*[@class='fullscreen-table-info']

${Acquisitionlense1_MinimizeIcon}=    //*[@class='btn-round btn-small-24 btn-grey btn-expand-inv']



*** Keywords ***
Verify get Bar value in New Subscribers by Service Tier
    ${response}=   call method    ${API_CMCObj}   New_Subscribers_by_Service_Tier_And_Technology
    Get the Data from Bar Graph Widgets No Hight    ${Acquisitionlense1_get_tooltip}    ${Acquisitionlense1_get_tooltip_text}    New_Subscribers_by_Service_Tier_And_Technology

Click on Acquisitionlense1 Maximize icon
    Click Element Until Visible    ${Acquisitionlense1_expandIcon}
    sleep  2
    capture the screen  newSubscribersBySTFullView

Verify get drill down Bar value in New Subscribers by Service Tier
    Get the Data from Bar Graph Widgets No Hight    ${Acquisitionlense1_drilldown_get_tooltip}    ${Acquisitionlense1_drilldown_get_tooltip_text}    New_Subscribers_by_Service_Tier_And_Technology

Click on Acquisitionlense1 Drilldown Bar
    Click Element Until Enabled    ${Acquisitionlense1_Drilldown_bar}

Verify get drill down Table Data in New Subscribers by Service Tier
    ${columns}=    get element count    ${drilldown_table_columns}
    log to console    ${columns}
    ${rows}=    get element count    ${drilldown_table_rows}
    log to console    ${rows}
    Table Data Validation with drill down data    ${drilldown_table_rows}    ${drilldown_table_columns}    New_Subscribers_by_Service_Tier_And_Technology_drilldown    append-table-list

Verify Subscribers by New Service Tier all bars header of drill down
        Get Verify drill down table header opacity    ${Acquisitionlense1_drilldown_get_tooltip}    New_Subscribers_by_Service_Tier_And_Technology    ${Acquisitionlense1_drilldownHeader}
       Click Element Until Enabled    ${Acquisitionlense1_MinimizeIcon}
       sleep  2
       capture the screen  ${acquisitionscreen}

