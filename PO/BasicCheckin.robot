*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Variables   ../utils/configReader.py
Variables  ../utils/InsightScreenAPI.py
Variables  ../utils/CMC-API.py


*** Variables ***
${username_txtFiled}=    id=username
${next_button}=    xpath=//button[contains(.,'Sign In')]
${password_txtField}=    id=password
${invalid_username}=    test
${invalid_password}=    test

${FirstName_LastName}=    xpath=//*[@id="main-dropdown"]/li/ul/li[1]/a/text()[1]
${userName}=    //*[@id="main-dropdown"]/li/ul/li[1]/a/text()[2]

${Marketing_Cloud}=    //*[@id="main-dropdown"]/li/ul/li[2]/a/span[2]/a
${Marketing_Cloud_help}=    //*[@id="main-dropdown"]/li/ul/li[2]/a/span[1]/a

${Support_Cloud}=    //*[@id="main-dropdown"]/li/ul/li[3]/a/span[2]/a
${Support_Cloud_help}=    //*[@id="main-dropdown"]/li/ul/li[3]/a/span[1]/a

${FA_plus}=  //*[@id="main-dropdown"]/li/ul/li[4]/a/span[2]/a
${FA_plus_help}=    //*[@id="main-dropdown"]/li/ul/li[4]/a/span[1]/a

${Shad}=    //*[@id="main-dropdown"]/li/ul/li[5]/a/span[2]/a
${Shad_help}=    //*[@id="main-dropdown"]/li/ul/li[5]/a/span[1]/a

${Org_Administration}=    //*[@id="main-dropdown"]/li/ul/li[6]/a/span[2]/a
${Org_Administration_help}=    //*[@id="main-dropdown"]/li/ul/li[6]/a/span[1]/a

${language}=   //*[@id="main-dropdown"]/li/ul/li[7]/a

${logout}=    //*[@href='/logout']
${MenuIcon}=      id=dropdownPeriod
${userDropdown}=  //*[contains(@src,'chevron')]
${text1}=    Support Cloud

${CMCLink}=      //*[@class='nav-item dropdown show']/ul/li[2]/a
${SHADLink}=    //*[@id="main-dropdown"]/li/ul/li[5]/a/span[2]/a

${Logout}=    //*[@href='/logout']

${CMC_AppType}=    119
${SHAD_AppType1}=   200
${SHAD_AppType2}=   201

${marketingCloudBtn}=   //*[@id='menu-category']//*[contains(text(),'Engagement')]

${TermCondAccept}=    //button[contains(.,'I Accept')]
${regionDropDown}=    id=filter-region-selection
${region_dropdownOption}=    xpath=//*[@class="ng-option ng-option-selected ng-option-marked"]
${locationDropDown}=     id=filter-location-selection
${location_dropdownOption}=    xpath=//*[@class="ng-option ng-option-selected ng-option-marked"]
${lastTwoMonths}=    Last Two Months
${apply}=    id=apply-filter-btn
${get_tooltip}=    //*[@id='subscriber-tier-tech-chart']//*[name()='div']//*[name()='svg']//*[name()='g'][5]/*[name()='g']//*[name()='rect']
${get_tooltip_text}=    //*[@id='subscriber-tier-tech-chart']//*[name()='svg']//*[name()='g'][10]//*[name()='text']

${drilldown_get_tooltip}=    //*[@id='Subscribers by Service Tier & Technology']//*[name()='div']//*[name()='svg']//*[name()='g'][5]/*[name()='g']//*[name()='rect']
${drilldown_get_tooltip_text}=    //*[@id='Subscribers by Service Tier & Technology']//*[name()='svg']//*[name()='g'][10]//*[name()='text']

${drilldown_table_rows}=     //*[@id='append-table-list']/tr
${drilldown_table_columns}=    //*[@id='append-table-list']/tr[1]/td
${Dropdownlist}=   //*[@class='dropdown-menu show']//*[contains(@class,'mod-li')]
${Menu_Dropdown}=  //*[@id='dropdownPeriod']
@{sidemenu_Titlelist}=   Engagement   Operations   Service   Deployment
*** Keywords ***

#Landing Page validation
click on side menu icon
     [Documentation]  Click the Menu category dropdown
     sleep    5
     click element until visible    ${Menu_Dropdown}
     Capture the Screen   ProjectTitle

verify Side Menu List
     [Documentation]  CCL-68673_01 Verify the Menu category
     @{getSideMenuList}=    get webelements    ${Dropdownlist}
     @{menuList}=  Create List
     FOR  ${sideMenuList}  IN   @{getSideMenuList}
     ${Text}=  get text  ${sideMenuList}
     Append to list    ${menuList}   ${Text}
     END
     log   ${menuList}
     log   ${sidemenu_Titlelist}
     should be equal   ${menuList}   ${sidemenu_Titlelist}
     click element until visible    ${Menu_Dropdown}
     sleep    5

verify show data for the past
    set selenium timeout    60 seconds
    set selenium implicit wait    60 seconds
           click element    ${regionDropDown}
    sleep   4
    click element    ${region_dropdownOption}
     sleep   4
    click element    ${locationDropDown}
     sleep   4
    click element    ${location_dropdownOption}
    sleep   4
    click button    ${lastTwoMonths}
    sleep   4
    click element    xpath=//button[@id='apply-filter-btn']


Menu not in list
     log to console    Menu not in list

Click on Notification
      sleep    8
      click element     xpath=//*[@id="wm-shoutout-140603"]/div[1]


Handling Marketing Cloud
      log to console   Marketing Cloud available
#      ${response_ConfigReader}=   call method    ${CMCconnectionObj}   ConfigReaderDev
#      ${response_Login}=   call method    ${CMCconnectionObj}   loginAPI
#      log to console   ${response_Login}
      ${response_entitlment}=   call method    ${CMCconnectionObj}   getEntitlements
      log to console   ${response_entitlment}
      ${ConvertAPI_entitlement}=    convert to string     ${response_entitlment}
      should contain   ${ConvertAPI_entitlement}    ${CMC_AppType}

# ==========  CMC Scope Validation - Insights, Upsell, Retension, acquisition, mobilenotifications, search ============
      sleep    20
      click element    ${CMCLink}
#      log to console     handle Terms and condition
#      sleep    10
#      ${present}=    Run Keyword And Return Status    Element Should Be Visible    ${TermCondAccept}
#       Run Keyword If    ${present}   Accept Terms and Condition
#       ...  ELSE     log to console   No Terms and Condition
#       log to console     handled Terms and condition

Accept Terms and Condition
#        select frame    //*[@class="modal-dialog modal-lg"]
#        execute javascript    window.scrollToBy(0,200)
#        scroll element into view       //*[@id="tos-body"]/div/div
#        click element    ${TermCondAccept}
        sleep    20


#      ${response_scopes}=   call method    ${CMCconnectionObj}   getScope
#      ${response_scopesCount}=   call method    ${CMCconnectionObj}   getScopeCount
#      FOR   ${scopesForCount}    IN RANGE   1    ${response_scopesCount}
#      ${ConvertAPI_scopes}=    convert to string     ${response_scopes}[${scopesForCount}]
#      Run Keyword If   '''${ConvertAPI_scopes}''' == 'cloud.cmc.insights:read,write'  Handling CMC Insights
#       ...    ELSE   Scope not in list
#      Run Keyword If   '''${ConvertAPI_scopes}''' == 'cloud.cmc.upsell:read,write'  Handling CMC upsell
#       ...    ELSE   Scope not in list
#      Run Keyword If   '''${ConvertAPI_scopes}''' == 'cloud.cmc.retention:read,write'  Handling CMC retention
#       ...    ELSE   Scope not in list
#      Run Keyword If   '''${ConvertAPI_scopes}''' == 'cloud.cmc.acquisition:read,write'  Handling CMC acquisition
#       ...    ELSE   Scope not in list
#      Run Keyword If   '''${ConvertAPI_scopes}''' == 'cloud.cmc.mobilenotifications:read,write'  Handling CMC mobilenotifications
#       ...    ELSE   Scope not in list
#      Run Keyword If   '''${ConvertAPI_scopes}''' == 'cloud.cmc.search:read,write'  Handling CMC search
#       ...    ELSE   Scope not in list
#      END


Handling CMC insights read only
      log to console    CMC insights read only scopes available
      page should contain    Insights
      log to console    Insights tab verified successfully


Handling CMC search
      log to console    CMC search scopes available
      page should contain    Search
      log to console    search tab verified successfully

Handling CMC mobilenotifications
      log to console    CMC mobilenotifications scopes available
      page should contain    Mobile Notifications
      log to console    mobilenotifications tab verified successfully

Handling CMC acquisition
      log to console    CMC acquisition scopes available
      page should contain    Acquisition
      log to console    acquisition tab verified successfully

Handling CMC retention
      log to console    CMC retention scopes available
      page should contain    Retention
      log to console    retention tab verified successfully


Handling CMC upsell
      log to console    CMC upsell scopes available
      page should contain    Upsell
      log to console    upsell tab verified successfully


Scope not in list
      log to console    Scope not in list

Handling CMC Insights
      log to console    CMC Insights socpes available
      page should contain    Insights
      log to console    Insights tab verified successfully

Logout of the site
    click element until visible  ${userDropdown}
    click element until visible  ${logout}
