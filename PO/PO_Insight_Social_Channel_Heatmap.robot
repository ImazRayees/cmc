*** Settings ***
Library     SeleniumLibrary
Library     Collections
Variables  ../utils/CMC-API.py

                             ################### Social-Channel-Heatmap ###################

*** Variables ***
${WebElement_get_tooltip_3}=    xpath=(//*[@id='Social-Channel-Heatmap']//*[name()='div']//*[name()='svg']//*[contains(@class, 'highcharts-series-group')])[1]//*[name()='path']
${WebElement_get_tooltiptext_3}=   xpath=//*[@id='Social-Channel-Heatmap']//*[name()='div']//*[name()='svg']//*[name()='g'][11]//*[name()='text']

# Icons
${openGuid_widget3}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][3]//*[@src='assets/images/HappyFeet_Small.png']
${openVieo_widget3}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][3]//*[@src='assets/images/Videoiconsmall.png']
${QuesionIcon_3}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][3]//*[@class='fa fa-question-circle']
${downloadIcon_3}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][3]//*[@class='fa fa-download']
${WebElement_maximize_button_3}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][3]//*[@class='fa fa-expand']
${widgetIcons_3}=     xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][3]//*[name()='a']
${closeIcon_3}=    xpath=//*[@id="info-social-channel-heatmap"]/div/div/div[1]/button/span


${next_alert}=  xpath=//button[contains(.,'Next')]
${back_button}=   xpath=//button[contains(.,'Back')]
${done_button}=   xpath=//button[contains(.,'Done')]
${close_button}=    css=.joyride-step__close > svg
${closeButton_contains}=    xpath=//button[contains(.,'Close')]
${lastTwoMonths}=    xpath=//button[contains(.,'Last Two Months')]

${SocialChannel_dropdown}=    (//*[@class='ng-select-container ng-has-value'])[3]

${SocialChannel_dropdownList}=    //*[@class="ng-dropdown-panel-items scroll-host"]//*[@class="ng-option"]


*** Keywords ***
Validate the Social-Channel-Heatmap widget
      ${response_scopes}=   call method    ${CMCconnectionObj}   getScope
      ${ConvertAPI_scopes}=    convert to string     ${response_scopes}
      log to console   ${ConvertAPI_scopes}
      ${contains}=    run keyword and return status    should contain    '''${ConvertAPI_scopes}'''    'cloud.cmc.insights:read,write'
      log to console   ${contains}
      Run Keyword If     '''${contains}''' == 'True'  Handling CMC Insights Social-Channel-Heatmap widget
       ...    ELSE   Scope not in list

Handling CMC Insights Social-Channel-Heatmap widget
#     Validate the Open guid for Social-Channel-Heatmap widget widget
     Validate the Question for Social-Channel-Heatmap widget
     Validate the Download Icon for Social-Channel-Heatmap widget
     Validate the Social Channel list in dropdown
#     get graphvalue in Social-Channel-Heatmap


Validate the Social Channel list in dropdown
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
       sleep    4
       ${response}=   call method    ${CMCconnectionObj}   Social_Channel_List_for_Dropdown
       click element    ${SocialChannel_dropdown}
       @{Get_tooltip}=   Get WebElements  ${SocialChannel_dropdownList}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        sleep    1
        ${ConvertAPI}=    convert to string   ${response}[1]
        ${getText}=   get text    ${tooltiplocation}
        should contain    ${ConvertAPI}     ${getText}
        log to console    ${getText}
        END
        click element    @{Get_tooltip}[1]

# ---- Icons - Open Guid -----
Validate the Open guid for Social-Channel-Heatmap widget widget
       set selenium timeout    20 seconds
       set selenium implicit wait    20 seconds
       sleep    5
        click element    ${openGuid_widget3}
        click element    ${close_button}
        click element    ${openGuid_widget3}
        click element    ${next_alert}
        click element    ${back_button}
        click element    ${next_alert}
        click element    ${next_alert}
        click element    ${next_alert}
        click element    ${done_button}

# ---- Icons - Question -----
Validate the Question for Social-Channel-Heatmap widget
       set selenium timeout    20 seconds
       set selenium implicit wait    20 seconds
       sleep    5
         click element    ${QuesionIcon_3}
         sleep    6
#         click button    ${closeButton_contains2}
#         click element    ${QuesionIcon_2}
#         sleep    5
         click element    ${closeIcon_3}

# ---- Icons - Download -----
Validate the Download Icon for Social-Channel-Heatmap widget
       set selenium timeout    20 seconds
       set selenium implicit wait    20 seconds
         sleep    2
         click element    ${downloadIcon_3}

# ---- Icons -----
maximize widget window Social-Channel-Heatmap widget
        set selenium implicit wait    30 seconds
        set selenium timeout    60 seconds
        sleep    7
        click element    ${WebElement_maximize_button_3}

get graphvalue in Social-Channel-Heatmap
#        ${response_Subscribers_by_Service_Tier_And_Technology_Chart_SeriesData}=   call method    ${connectionObj}   Subscribers_by_Service_Tier_And_Technology_Chart_total
#        ${category_total}    get length    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_SeriesData}
        set selenium implicit wait    30 seconds
        set selenium timeout    60 seconds
        @{Tooltip_List}=    Create List
        @{Get_tooltip}=   Get WebElements  ${WebElement_get_tooltip_3}
        ${sum}=   Set Variable    ${0}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        sleep    2
        mouse over    ${tooltiplocation}
        ${height_value}=   Get Element Attribute  ${tooltiplocation}    height
        ${TooltipText}=   get text    ${WebElement_get_tooltiptext_3}
        log to console  ${TooltipText}
#        ${ConvertAPI}=    convert to string   ${response_Subscribers_by_Service_Tier_And_Technology_Chart_SeriesData}[${sum}]
        log    UI_Tooltip List: ${TooltipText}
        ${sum} =    Evaluate  ${sum}+${1}
        END