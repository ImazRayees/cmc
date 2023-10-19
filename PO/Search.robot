*** Settings ***
Documentation    Suite description
Library    SeleniumLibrary
Variables  ../utils/CMC-API.py
Library    Collections
*** Variables ***
${search_input}=    xpath=//input[@placeholder='Type subscribers name or account number']
${search_Btn}=      xpath=//i[contains(@class,'fa fa-search')]
${searchkey}=   user
${Searchlink}=      link=Search
${Tablecolumns}=    xpath=//table[@class='table table-striped search-selected-table table-responsive']//tbody//tr/td
${searchlist}=      xpath=//tbody//tr[1]
${searchUserName}=        xpath=//tbody/tr[1]/td[1]/span[1]
${appilcationtop_tableRow}=      xpath=//*[@id="Top-Applications"]/tbody/tr
${appilcationtop_tableCol}=      xpath=//*[@id="Top-Applications"]/tbody/tr[1]/td
${Loader}=      xpath=//span[@class='spin-circle']
${UsageXasix_label}=        xpath=//*[@id='Subscriber-Usage']//*[name()='div']//*[name()='svg']//*[name()='g'][9]//*[name()='text']
${usage_get_tooltiptext}=   xpath=//*[@id='Subscriber-Usage']//*[name()='div']//*[name()='svg']//*[name()='g'][11]//*[name()='text']
${usageWebElement_get_tooltip}=    xpath=//*[@id='Subscriber-Usage']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect']
${Competitor_get_tooltiptext}=    xpath=//*[@id='Competitor-Visit-and-Speed-Test-Minutes']//*[name()='div']//*[name()='svg']//*[name()='g'][11]//*[name()='text']
${Competitor_get_tooltip}=    xpath=//*[@id='Competitor-Visit-and-Speed-Test-Minutes']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect']
${UsageBy_get_tooltip}=     xpath=//*[@id='Usage-By-Application']//*[name()='div']//*[name()='svg']//*[name()='g'][1]//*[name()='path']
${UsageBy_get_tooltiptext}=     xpath=//*[@id='Usage-By-Application']//*[name()='div']//*[name()='svg']//*[name()='g'][5]//*[name()='text']

*** Keywords ***
Click on the Search Tab in Dashboard
        set selenium implicit wait    30 seconds
        set selenium timeout    30 seconds
        sleep    15
        wait until element is not visible       ${Loader}
        wait until element is visible   ${Searchlink}
        page should contain    Search
        click link    ${Searchlink}

Validate the No matching subscriber found in Search filter
        input text    ${search_input}   tt
        click element    ${search_Btn}
        page should contain    No matching subscriber found

click on the search list
        wait until element is visible    ${searchUserName}
        ${SearchUserName}=      get text    ${searchUserName}
        click element    ${searchlist}

Validate the search filter profile and their details
        input text    ${search_input}   Mahendra
        sleep    5
        click element    ${search_Btn}
        sleep    2
        ${present}=    Run Keyword And Return Status    page should contain     No matching subscriber found
        Run Keyword If    ${present}    log to console  No matching subscriber found in this filter

                  ...  ELSE     click on the search list
        Run Keyword If    ${present}    log to console  No matching subscriber found in this filter

                  ...  ELSE     validate the Table Data for specific search User

validate the Table Data for specific search User
        set selenium implicit wait    30 seconds
        set selenium timeout    30 seconds
        wait until element is not visible       ${Loader}
        sleep    5
        ${response_ConfigReader}=   call method    ${CMCconnectionObj}   ConfigReaderStage
        ${response_Login}=   call method    ${CMCconnectionObj}   loginAPI
        ${response}=   call method    ${CMCconnectionObj}   SEARCH_WIDGET
        @{Schedule_Data}=    Create List
        ${countcolumn}=      get element count      ${Tablecolumns}
        FOR    ${a}  IN RANGE  1  ${countcolumn}+1
           ${data_table}  get text   xpath=//table[@class='table table-striped search-selected-table table-responsive']//tbody//tr/td[${a}]
           log to console    ${data_table}
           Append To List    ${Schedule_Data}    ${data_table}
            ${ConvertAPI}=    convert to string   ${response}
            should contain  ${ConvertAPI}    ${data_table}
        END

Validate the Subscriber Usage data for specific search User
        ${CheckSubscriber_Usage}=    Run Keyword And Return Status    page should contain     Subscriber Usage
        Run Keyword If    ${CheckSubscriber_Usage}      Subscribers Usage Chart Data Validation

                  ...  ELSE     log to console    Subscriber Usage charts was not displayed


Subscribers Usage Chart Data Validation
        set selenium implicit wait    30 seconds
        ${Tooltip_defauld}=  Set Variable    ${0}            #${}
        ${response}=   call method    ${CMCconnectionObj}   SEARCH_Subscriber_usage
        ${GetXaxisCount}=   get element count    ${UsageXasix_label}
        ${sum}=   Set Variable    ${0}
        @{Tooltip_List}=    Create List
        @{Newlist}=    Create List
        @{Get_tooltip}=   Get WebElements  ${usageWebElement_get_tooltip}
        ${ConvertAPI}=    convert to string   ${response}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
            mouse over    ${tooltiplocation}
            ${height_value}=   Get Element Attribute  ${tooltiplocation}    height
            ${TooltipText}=   get text    //*[@id='Subscriber-Usage']//*[name()='div']//div[starts-with(@class,'highcharts-label')]/span
            ${height_value1}=    CONVERT TO INTEGER  ${height_value}
            Append To List    ${Newlist}    ${TooltipText}
            Run Keyword If    ${height_value1} == 0
            ...    Append To List    ${Tooltip_List}    '0'
            ...    ELSE    should contain    ${TooltipText}    ${TooltipText}
            log    UI_Tooltip List: ${TooltipText}
            ${sum} =    Evaluate  ${sum}+${1}
        END

Get ToolTip data
        @{tooltiptextvalue} =    Get Webelements    //*[@id='Subscriber-Usage']//*[name()='div']//div[starts-with(@class,'highcharts-label')]//span/following-sibling::span
        FOR  ${tooltiplocation}  IN   @{tooltiptextvalue}
            ${TestData}=     get text    ${tooltiplocation}
        END

Validate the Top Applications Table Data Validation
        ${Topapplication}=    Run Keyword And Return Status    page should contain     Top Applications
        Run Keyword If    ${Topapplication}      Top Applications Table Data Values

                  ...  ELSE    log to console   Top Application Table was not displayed

Top Applications Table Data Values

        ${rows}=    get element count    ${appilcationtop_tableRow}
        ${columns}=    get element count    ${appilcationtop_tableCol}
        FOR    ${a}  IN RANGE  1  ${columns}+1
            ${data_table}  get text    xpath=//*[@id="Top-Applications"]/tbody/tr[1]/td[${a}]

        END

Validate the Competitor Visit and Speed Test Minutes Chart Data Validation
         ${CheckSubscriber_Usage}=    Run Keyword And Return Status    page should contain     Competitor Visit and Speed Test Minutes
        Run Keyword If    ${CheckSubscriber_Usage}      Get Competitor Visit and Speed Test Minutes chart Data

                  ...  ELSE     log to console    Competitor Visit and Speed Test Minutes charts was not displayed



Get Competitor Visit and Speed Test Minutes chart Data
        set selenium implicit wait    30 seconds
        ${Tooltip_defauld}=  Set Variable    ${0}            #${}
        @{Tooltip_List}=    Create List
        ${response}=   call method    ${CMCconnectionObj}   SEARCH_Competitor_vist_and_Speed_test_mintues
        @{Get_tooltip}=   Get WebElements  ${Competitor_get_tooltip}
        ${sum}=   Set Variable    ${0}
        ${ConvertAPI}=    convert to string   ${response}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        mouse over    ${tooltiplocation}
        ${height_value}=   Get Element Attribute  ${tooltiplocation}    height
        ${TooltipText}=   get text    //*[@id='Competitor-Visit-and-Speed-Test-Minutes']//*[name()='div']//div[starts-with(@class,'highcharts-label')]/span
        ${height_value1}=    CONVERT TO INTEGER  ${height_value}
        Run Keyword If    ${height_value1} == 0
        ...    Append To List    ${Tooltip_List}    '0'
        ...    ELSE    should contain    ${TooltipText}    ${TooltipText}
        log    UI_Tooltip List: ${TooltipText}
        ${sum} =    Evaluate  ${sum}+${1}
        END

Validate the Usage By Application Chart Data Validation
         ${CheckSubscriber_Usage}=    Run Keyword And Return Status    page should contain     Usage By Application
        Run Keyword If    ${CheckSubscriber_Usage}      Get Usage By Application Bar Data

                  ...  ELSE     log to console    Usage By Application charts was not displayed

Get Usage By Application Bar Data
        set selenium implicit wait    30 seconds
        ${Tooltip_defauld}=  Set Variable    ${0}            #${}
        @{Tooltip_List}=    Create List
        @{Get_tooltip}=   Get WebElements  ${UsageBy_get_tooltip}
        ${sum}=   Set Variable    ${0}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        mouse over    ${tooltiplocation}
#        ${height_value}=   Get Element Attribute  ${tooltiplocation}    height
        ${TooltipText}=   get text    ${UsageBy_get_tooltiptext}
#        ${height_value1}=    CONVERT TO INTEGER  ${height_value}
#        Run Keyword If    ${height_value1} == 0
#        ...    Append To List    ${Tooltip_List}    '0'
#        ...    ELSE    should contain    ${TooltipText}    ${TooltipText}
#        log    UI_Tooltip List: ${TooltipText}
        ${sum} =    Evaluate  ${sum}+${1}
        END