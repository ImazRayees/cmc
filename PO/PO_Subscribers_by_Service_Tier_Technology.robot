*** Settings ***
Library     SeleniumLibrary
Library     Collections
Variables  ../utils/InsightScreenAPI.py
Resource    ../PO/InsightsPageObject.robot
Variables  ../utils/CMC-API.py
                ################## Subscribers by Service Tier & Technology Screen Validation   ###################

*** Variables ***
#API variables -  Subscribers by Service Tier And Technology
${Connection_response}
${Search_Region_Data}
${response_connection}
${response_searchRegion}
${response_searchRegionLocation}
${response_Subscribers_by_Service_Tier}
${response_Subscribers_by_Service_Tier_And_Technology_Chart_category}
${response_Subscribers_by_Service_Tier_And_Technology_Chart_series}
${response_Subscribers_by_Service_Tier_And_Technology_Chart_total}
${response_Subscribers_by_Service_Tier_And_Technology_table}

# WebElement Variables
${recByChart}=    css=.raphael-group-1556-plot-group > rect:nth-child(4)
${Table_RowCount}=    xpath=//*[@id="append-table-list"]/tr
${Table_ColumnCount}=   xpath=//*[@id="append-table-list"]/tr[1]/td

${Subscribers-by-Service-Tier-Technology}=    id=Subscribers-by-Service-Tier-Technology
${WebElement_get_no_of_widget}=    xpath=//*[@class='row pt-1']
${WebElement_get_Widgetname}=    xpath=(//*[@class='chart-heading mb-2'])[1]
${WebElement_get_tooltip}=    xpath=//*[@id='Subscribers-by-Service-Tier-Technology']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect']
${WebElement_get_Categories}=   xpath=//*[@id='Subscribers-by-Service-Tier-Technology']//*[name()='div']//*[name()='svg']//*[name()='g'][9]//*[name()='text']
${WebElement_get_Series}=    xpath=//*[@id='Subscribers-by-Service-Tier-Technology']//*[name()='div']//*[name()='svg']//*[name()='g'][8]//*[name()='g']//*[name()='text']
${WebElement_get_tooltiptext}=   xpath=//*[@id='Subscribers-by-Service-Tier-Technology']//*[name()='div']//*[name()='svg']//*[name()='g'][11]//*[name()='text']
${rectangle}=    xpath=//*[@id="highcharts-xwiprud-458"]/svg/g[6]/g[1]/rect[4]
${apply}=    Apply
${chart1}=    xpath=//*[@id="Subscribers-by-Service-Tier-Technology"]//*[@class="highcharts-point highcharts-color-0"][3]

# video icons
${postComment}=   xpath=//button[contains(.,'Post comment')]
${openVideo_close}=    xpath=//*[@class='modal-dialog modal-lg'][1]//*[@src='assets/images/blue-x-button.png']
${commentName}=   xpath=//*[@id="comments"]/form/div/div[2]/input
${commentMessage}=    xpath=//*[@id="comments"]/form/div/div[2]/div[1]/textarea
${checkbox_OpenVideo}=    comment__timecode_checkbox


# Icons
${openGuid_widget1}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][1]//*[@src='assets/images/HappyFeet_Small.png']
${openVieo_widget1}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][1]//*[@src='assets/images/Videoiconsmall.png']
${QuesionIcon_1}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][1]//*[@class='fa fa-question-circle']
${downloadIcon_1}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][1]//*[@class='fa fa-download']
${WebElement_maximize_button_1}=    xpath=//*[@class='fa fa-expand'][1]
${widgetIcons1}=     xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][1]//*[name()='a']

${next_alert}=  xpath=//button[contains(.,'Next')]
${back_button}=   xpath=//button[contains(.,'Back')]
${done_button}=   xpath=//button[contains(.,'Done')]
${close_button}=    css=.joyride-step__close > svg
${closeIcon_1}=    xpath=//*[@id="info-subscribers-by-service-tier-technology"]/div/div/div[1]/button/span
${closeButton_contains}=    xpath=(//*[@class='btn btn-primary btn-lg info-modal-close-btn'])[1]
${lastTwoMonths}=    xpath=//button[contains(.,'Last Two Months')]


#   Drill Down Attributes
${header_widget1}=    xpath=//*[@class="fullscreen-card"]//*[@joyridestep="fsNSubsTier1"]
${WebElement_get_tooltip_drilldown}=    xpath=//*[@joyridestep='fsStreaming1']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect']
${WebElement_get_tooltiptext_drilldown}=    xpath=//*[@joyridestep='fsStreaming1']//*[name()='div']//*[name()='svg']//*[name()='g'][11]//*[name()='text']

${drilldown_tableRow}=    //*[@id="append-table-list"]/tr
${drilldown_tableCol}=   //*[@id="append-table-list"]/tr[1]/td

${drilldown_close}=    //*[@class='fa fa-compress']

${drilldown_region}=    //*[@class="fullscreen-card"]//*[@id="filter-region-selection"]
${drilldown_location}=    //*[@class="fullscreen-card"]//*[@id="filter-location-selection"]

${region_Option}=     //*[@class="fullscreen-card"]//*[@id="filter-region-selection"]//*[@class="ng-option ng-option-selected"][1]
${region_All}=     //*[@class="fullscreen-card"]//*[@id="filter-region-selection"]//*[@class="ng-option ng-option-selected"]
${location_All}=    //*[@class="fullscreen-card"]//*[@id="filter-location-selection"]//*[@class="ng-option ng-option-selected"]

${drilldown_28Days}=    //*[@class="fullscreen-card"]//button[contains(.,'28 Days')]
${drilldown_LastMonth}=    //*[@class="fullscreen-card"]//button[contains(.,'Last Month')]
${drilldown_LastTwoMonths}=    //*[@class="fullscreen-card"]//button[contains(.,'Last Two Months')]

${drilldown_Apply}=    xpath=//*[@class="fullscreen-card"]//*[@class="btn btn-md btn-success apply-btn"]

${drilldown_QuestionIcon}=    //*[@class="fullscreen-card"]//*[@class="fa fa-question-circle"]

${drilldown_downloadIcon}=    xpath=//*[@class="fullscreen-card"]//*[@class='fa fa-download']


${ui_percentageData1}=    //*[@id='Subscribers-by-Service-Tier-Technology']//*[@class="highcharts-label highcharts-stack-labels"]//*[@class="highcharts-text-outline"]



*** Keywords ***
Validate the Subscribers by Service Tier and Technology
      ${response_scopes}=   call method    ${CMCconnectionObj}   getScope
      ${ConvertAPI_scopes}=    convert to string     ${response_scopes}
      log to console   ${ConvertAPI_scopes}
      ${contains}=    run keyword and return status    should contain    '''${ConvertAPI_scopes}'''    'cloud.cmc.insights:read,write'
      log to console   ${contains}
      Run Keyword If     '''${contains}''' == 'True'  Handling CMC Insights Subscribers by Service Tier and Technology
       ...    ELSE   Scope not in list


Handling CMC Insights Subscribers by Service Tier and Technology
      Validate the Subscribers by Service Tier and Technology widget icons
      Get No of Categories and Categories value in Service Tier Technology
      Get No of Series and values in Service Tier Technology
      get Bar value in Subscribers by Service Tier and Technology widget
      get graphvalue in Service Tier Technology
      Validate the Open guid for Subscribers by Service Tier and Technology widget
      Validate the Question for Subscribers by Service Tier and Technology widget
      Validate the Download Icon for Subscribers by Service Tier and Technology widget
      maximize widget window
      Validate the drilldown screen Region and Location
      validate the drilldown Question Icon
      get graphvalue in drilldown Service Tier Technology
      get Table data in drilldown Service Tier Technology
      Close the drilldown screen
      Validate the drilldown screen display when click on bar chart


get Bar value in Subscribers by Service Tier and Technology widget
        set selenium timeout    60 seconds
        set selenium implicit wait    60 seconds
        @{Get_tooltip}=   Get WebElements  ${ui_percentageData1}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        sleep    1
        ${height_value}=   get text    ${tooltiplocation}
        log to console    ${height_value}
        END


Wait Until InsightPage to be load
       log to console    ${response_connection}
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
#       Wait Until Page Contains Element   ${WebElement_get_no_of_widget}

Validate the Subscribers by Service Tier and Technology widget title
       set selenium timeout    20 seconds
       set selenium implicit wait    20 seconds
       Element Text Should Be    ${WebElement_get_Widgetname}       Subscribers by Service Tier & Technology
       log to console    test1

Validate the Subscribers by Service Tier and Technology widget icons
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
       sleep    30
        @{Get_tooltip}=   Get WebElements  ${widgetIcons1}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        sleep    2
        seleniumlibrary.mouse over    ${tooltiplocation}
        ${height_value}=   Get Element Attribute  ${tooltiplocation}    title
        log to console    ${height_value}
        END


Validate the Open video for Subscribers by Service Tier and Technology widget
        click element    ${openVieo_widget1}
        select frame     id=video-frame
        sleep    3
        scroll element into view    ${postComment}
        sleep    3
        click element    ${postComment}
        handle alert    accept
        log to console    alert handled
        input text   ${commentName}     test
        click element    ${postComment}
        handle alert    accept
        log to console    alert handled
        input text   ${commentMessage}     test
        click element    ${checkbox_OpenVideo}
        click element    ${postComment}
        sleep    5
        wait until page contains element    //*[@class='info-video-close-button']
        click element   //*[@class='info-video-close-button']

# ---- Icons - Open Guid -----
Validate the Open guid for Subscribers by Service Tier and Technology widget
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        click element    ${openGuid_widget1}
        click element    ${close_button}
        click element    ${openGuid_widget1}
        click element    ${next_alert}
        click element    ${back_button}
        click element    ${next_alert}
        click element    ${done_button}


# ---- Icons - Question -----
Validate the Question for Subscribers by Service Tier and Technology widget
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
         click element    ${QuesionIcon_1}
         sleep    10
         click button    ${closeButton_contains}
         click element    ${QuesionIcon_1}
         sleep    3
         click element    ${closeIcon_1}

# ---- Icons - Download -----
Validate the Download Icon for Subscribers by Service Tier and Technology widget
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
         sleep    2
         click element    ${downloadIcon_1}

# ---- Icons -----
maximize widget window
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        sleep    7
        click element    ${WebElement_maximize_button_1}
#        sleep   4
##        click element       //*[@class='fa fa-compress']
#        ${present}=    Run Keyword And Return Status    Element Should Be Visible    //*[@class='joyride-step__close']
#        Run Keyword If    ${present}   close the alert1
#        ...  ELSE     log to console   Subscribers-by-Service-Tier-Technology widget not available
#
#close the alert1
#        click element    //*[@class='joyride-step__close']


Get No of Categories and Categories value in Service Tier Technology
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        ${present}=    Run Keyword And Return Status    Element Should Be Visible    ${Subscribers-by-Service-Tier-Technology}
        Run Keyword If    ${present}   verify Get No of Categories and Categories value in Service Tier Technology
        ...  ELSE     log to console   Subscribers-by-Service-Tier-Technology widget not available

verify Get No of Categories and Categories value in Service Tier Technology
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        @{Categories_List}=    Create List
        ${get_noOfCategories}=    Get WebElements  ${WebElement_get_Categories}
        FOR    ${a}  IN RANGE  0   5
        ${data_table}  get text   ${get_noOfCategories}[${a}]
        log to console  ${data_table}
        log    UI_Categories List: ${data_table}
        END

Get No of Series and values in Service Tier Technology
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        ${present}=    Run Keyword And Return Status    Element Should Be Visible    ${Subscribers-by-Service-Tier-Technology}
        Run Keyword If    ${present}   verify Get No of Series and values in Service Tier Technology
        ...  ELSE     log to console   Subscribers-by-Service-Tier-Technology widget not available

verify Get No of Series and values in Service Tier Technology
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        ${xpath}=    Set Variable    ${WebElement_get_Series}
        ${count}=    get element count    ${xpath}
        ${names}=    Create List
        FOR    ${i}    IN RANGE    1    ${count} + 1
        ${a}=    Set Variable   [${i}]//*[name()='tspan']
        ${name}=    Get Text   ${WebElement_get_Series} ${a}
        log    UI_Series List: ${name}
        END

get graphvalue in Service Tier Technology
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        ${present}=    Run Keyword And Return Status    Element Should Be Visible    ${Subscribers-by-Service-Tier-Technology}
        Run Keyword If    ${present}   verify get graphvalue in Service Tier Technology
        ...  ELSE     log to console   Subscribers-by-Service-Tier-Technology widget not available
        set selenium implicit wait    30 seconds


verify get graphvalue in Service Tier Technology
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
       ${response}=   call method    ${CMCconnectionObj}   Subscribers_by_Service_Tier_And_Technology
        ${Tooltip_defauld}=  Set Variable    ${0}            #${}
        @{Tooltip_List}=    Create List
        @{Get_tooltip}=   Get WebElements  ${WebElement_get_tooltip}
        ${sum}=   Set Variable    ${0}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        sleep    2
        mouse over    ${tooltiplocation}
        ${height_value}=   Get Element Attribute  ${tooltiplocation}    height
        ${ConvertAPI}=    convert to string   ${response}[1][${sum}]
        ${TooltipText}=   get text    ${WebElement_get_tooltiptext}
        log to console  ${TooltipText}
        ${height_value1}=    CONVERT TO INTEGER  ${height_value}
        Run Keyword If    ${height_value1} == 0
        ...    Append To List    ${Tooltip_List}    '0'
        ...    ELSE     should contain    ${TooltipText}    ${ConvertAPI}
        log    UI_Tooltip List: ${TooltipText}
        ${sum} =    Evaluate  ${sum}+${1}
        END

Web Value with backend data for Subscribers by Service Tier
     log to console   test


# --- Drill Down Screen --------
Validate the drilldown screen Region and Location
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
#       sleep    4
#         click element    ${drilldown_region}
#         click element    ${region_Option}
#         click element    ${drilldown_region}
##         click element    ${region_All}
#         click element    ${drilldown_location}
#         click element    ${location_All}
         click element    ${drilldown_LastMonth}
         click element    ${drilldown_Apply}
         sleep    5
         click element    ${drilldown_LastTwoMonths}
         click element    ${drilldown_Apply}

# --- Drill Down Screen --------
validate the drilldown Question Icon
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
#       sleep    4
         click element    ${drilldown_downloadIcon}
         click element     ${drilldown_QuestionIcon}
         sleep    5
#         click button    ${closeButton_contains}
#         click element    ${drilldown_QuestionIcon}
#         sleep    5
         click element    ${closeIcon_1}

# --- Drill Down Screen --------
get graphvalue in drilldown Service Tier Technology
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
       sleep    4
#        ${getText4}=    get text     ${header_widget1}
#        log to console    ${getText4}
        @{Tooltip_List}=    Create List
        @{Get_tooltip}=   Get WebElements    ${WebElement_get_tooltip_drilldown}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        sleep    2
        mouse over    ${tooltiplocation}
        ${height_value}=   Get Element Attribute  ${tooltiplocation}    height
        ${TooltipText}=   get text    ${WebElement_get_tooltiptext_drilldown}
        log to console  ${TooltipText}
        ${height_value1}=    CONVERT TO INTEGER  ${height_value}
#        ${ConvertAPI}=    convert to string   ${response_Subscribers_by_Service_Tier_And_Technology_Chart_SeriesData}[${sum}]
        Run Keyword If    ${height_value1} == 0
        ...    Append To List    ${Tooltip_List}    '0'
#        ...    ELSE    should contain    ${TooltipText}    ${ConvertAPI}
        log    UI_Tooltip List: ${TooltipText}
#        log    API_Categories List: ${ConvertAPI}
        sleep    4
         click element    ${tooltiplocation}
         get Table data in drilldown Service Tier Technology
         sleep    8
        END

# --- Drill Down Screen --------
get Table data in drilldown Service Tier Technology
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        ${Get_tooltip}=   Get WebElements    ${WebElement_get_tooltip_drilldown}
        ${sum1}=   Set Variable    ${0}

#------- Click on the any Bar chart --------
#         click element     ${Get_tooltip}[4]


# ----- Table Data Validation ------
       ${columns}=    get element count  ${drilldown_tableCol}
       log to console    ${columns}
       ${rows}=    get element count  ${drilldown_tableRow}
       log to console    ${rows}
       FOR   ${rows}    IN RANGE   1      ${rows}+1
       Handle drilldown Table  ${rows}
       END

# --- Drill Down Screen --------
Handle drilldown Table
       [Arguments]    ${rows}
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
#         ${response_Job_list}=   call method    ${connectionObj}   scheduledjoblist
        ${columns}=    get element count  ${drilldown_tableCol}
        FOR   ${column}    IN RANGE   1    2
        ${sum} =    Evaluate   ${rows}-${1}
        log    ${rows}
        log     ${column}
       ${data_table}  get text   //*[@id='append-table-list']/tr[${rows}]/td[${column}]
       log    ${data_table}
       log to console  ${data_table}
#        ${ConvertAPI}=    convert to string     ${response_Job_list}${sum}
#        should contain    ${ConvertAPI}    ${data_table}
        END

# --- Drill Down Screen --------
Close the drilldown screen
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        click element    ${drilldown_close}

# --- Drill Down Screen --------
Validate the drilldown screen display when click on bar chart
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        @{Get_tooltip}=   Get WebElements    ${WebElement_get_tooltip}
        ${sum1}=   Set Variable    ${0}

#------- Click on the any Bar chart --------
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        sleep    2
        ${sum1} =    Evaluate  ${sum1}+${1}
        log to console   ${sum1}
            exit for loop if  ${sum1}==3
        END
        click element    ${tooltiplocation}
        sleep    4
        click element    ${drilldown_close}
