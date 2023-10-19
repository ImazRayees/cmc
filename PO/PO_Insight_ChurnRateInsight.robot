*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource     ../PO/InsightsPageObject.robot
Variables  ../utils/CMC-API.py
Resource    ../PO/PO_Subscribers_by_Service_Tier_Technology.robot

                             ################### Churn-Rate-Insights ###################

*** Variables ***
${WebElement_ChurnRateInsights_get_no_of_widget}=    xpath=//*[@class='row pt-1']
${WebElement_ChurnRateInsights_maximize_button}=    xpath=//*[@class='fa fa-expand'][1]
${WebElement_ChurnRateInsights_get_Widgetname}=    xpath=(//*[@class='chart-heading mb-2'])[1]
${WebElement_ChurnRateInsights_get_tooltip}=    xpath=//*[@id='Churn-Rate-Insights']//*[name()='div']//*[name()='svg']//*[name()='g'][6]/*[name()='g']//*[name()='rect']
${WebElement_ChurnRateInsights_get_Categories}=   xpath=//*[@id='Churn-Rate-Insights']//*[name()='div']//*[name()='svg']//*[name()='g'][9]//*[name()='text']
${WebElement_ChurnRateInsights_get_Series}=    xpath=//*[@id='Churn-Rate-Insights']//*[name()='div']//*[name()='svg']//*[name()='g'][10]//*[name()='g']
${WebElement_ChurnRateInsights_get_tooltiptext}=   xpath=//*[@id='Churn-Rate-Insights']//*[name()='div']//*[name()='svg']//*[name()='g'][11]//*[name()='text']
${rectangle}=    xpath=//*[@id="highcharts-xwiprud-458"]/svg/g[6]/g[1]/rect[4]
${CRI_view}=     xpath=//*[@id='Retention']

# Icons
${openGuid_widget7}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][7]//*[@src='assets/images/HappyFeet_Small.png']
${openVieo_widget7}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][7]//*[@src='assets/images/Videoiconsmall.png']
${QuesionIcon_7}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][7]//*[@class='fa fa-question-circle']
${downloadIcon_7}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][7]//*[@class='fa fa-download']
${WebElement_maximize_button_7}=    xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][7]//*[@class='fa fa-expand']
${widgetIcons_7}=     xpath=//*[@class='col-md-12 col-sm-12 col-lg-6 col-xl-4'][7]//*[name()='a']
${closeIcon_7}=    xpath=//*[@id="info-churn-rate-insights"]/div/div/div[1]/button/span


${next_alert}=  xpath=//button[contains(.,'Next')]
${back_button}=   xpath=//button[contains(.,'Back')]
${done_button}=   xpath=//button[contains(.,'Done')]
${close_button}=    css=.joyride-step__close > svg
${closeButton_contains}=    xpath=//button[contains(.,'Close')]
${lastTwoMonths}=    xpath=//button[contains(.,'Last Two Months')]


*** Keywords ***
# ---- Icons - Open Guid -----
Validat the Churn-Rate-Insights widget
      ${response_scopes}=   call method    ${CMCconnectionObj}   getScope
      ${ConvertAPI_scopes}=    convert to string     ${response_scopes}
      log to console   ${ConvertAPI_scopes}
      ${contains}=    run keyword and return status    should contain    '''${ConvertAPI_scopes}'''    'cloud.cmc.insights:read,write'
      log to console   ${contains}
      Run Keyword If     '''${contains}''' == 'True'  Handling CMC Insights Churn-Rate-Insights widget
       ...    ELSE   Scope not in list

Handling CMC Insights Churn-Rate-Insights widget
#      Validate the Open guid for Churn-Rate-Insights widget
      Validate the Question for Churn-Rate-Insights widget
      Validate the Download Icon for Churn-Rate-Insights widget
      Get No of Categories and Categories value for CRI
      Get No of Series and values in CRI
      get Tooltip graphvalue in CRI
      maximize widget window Churn-Rate-Insights widget
     Validate the drilldown screen Region and Location
#    Validate the Question for Streaming Subscribers widget
#     get graphvalue in drilldown Service Tier Technology
#    get Table data in drilldown Service Tier Technology
     Close the drilldown screen
#    Validate the drilldown screen display when click on bar chart7

Validate the Open guid for Churn-Rate-Insights widget
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        click element    ${openGuid_widget7}
        click element    ${close_button}
        click element    ${openGuid_widget7}
        click element    ${next_alert}
        click element    ${back_button}
        click element    ${next_alert}
        click element    ${done_button}

# ---- Icons - Question -----
Validate the Question for Churn-Rate-Insights widget
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
         click element    ${QuesionIcon_7}
         sleep    6
#         click button    ${closeButton_contains2}
#         click element    ${QuesionIcon_2}
#         sleep    5
         click element    ${closeIcon_7}

# ---- Icons - Download -----
Validate the Download Icon for Churn-Rate-Insights widget
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
         sleep    2
         click element    ${downloadIcon_7}

# ---- Icons -----
maximize widget window Churn-Rate-Insights widget
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        sleep    7
        click element    ${WebElement_maximize_button_7}
#        sleep    7
#        click element    //*[@id="joyride-step-fsNChurnRate1"]/div/joy-close-button

Get No of Categories and Categories value for CRI
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
       scroll element into view    ${CRI_view}
      @{Categories_List}=    Create List
      ${get_noOfCategories}=    Get WebElements  ${WebElement_ChurnRateInsights_get_Categories}
      FOR    ${a}  IN RANGE  0   4
      ${data_table}  get text   ${get_noOfCategories}[${a}]
      log to console    UI_Categories List: ${data_table}
      END


Get No of Series and values in CRI
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        ${xpath}=    Set Variable    ${WebElement_ChurnRateInsights_get_Series}
        ${count}=    get element count    ${xpath}
        ${names}=    Create List
        FOR    ${i}    IN RANGE    1    ${count} + 1
        ${a}=    Set Variable   [${i}]//*[name()='tspan']
        ${name}=    Get Text   ${WebElement_ChurnRateInsights_get_Series}${a}
        log to console    UI_Series List: ${name}
        END
get Tooltip graphvalue in CRI
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        ${Tooltip_defauld}=  Set Variable    ${0}            #${}
        @{Tooltip_List}=    Create List
        @{Get_tooltip}=   Get WebElements  ${WebElement_ChurnRateInsights_get_tooltip}
        ${sum}=   Set Variable    ${0}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        ${height_value}=   Get Element Attribute  ${tooltiplocation}    height
        ${height_value1}=    CONVERT TO INTEGER  ${height_value}
        Run Keyword If    ${height_value1} == 0    Zero Handling
        ...    ELSE    Non Zero chart   ${tooltiplocation}
        END

Zero Handling
      log to console   Handled no data chart

Non Zero chart
      [Arguments]    ${tooltiplocation}
      set selenium timeout    60 seconds
      set selenium implicit wait    60 seconds
      mouse over    ${tooltiplocation}
      ${TooltipText}=   get text    ${WebElement_ChurnRateInsights_get_tooltiptext}
      log to console   ${TooltipText}

# --- Drill Down Screen --------
Validate the drilldown screen display when click on bar chart7
       set selenium timeout    60 seconds
       set selenium implicit wait    60 seconds
        @{Get_tooltip}=   Get WebElements    ${WebElement_ChurnRateInsights_get_tooltip}
        ${sum1}=   Set Variable    ${0}

#------- Click on the any Bar chart --------
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        sleep    2
        ${sum1} =    Evaluate  ${sum1}+${1}
        log to console   ${sum1}
            exit for loop if  ${sum1}==5
        END
        click element    ${tooltiplocation}
        sleep    4
        click element    ${drilldown_close}