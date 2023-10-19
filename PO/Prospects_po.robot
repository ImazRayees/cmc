*** Settings ***
Library     SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Resource    ../PO/CommonWrapper.robot
Resource   ../PO/ExploreDataAdvPO_subscribers.robot

*** Keywords ***
Verify the Explore Data based on entitlements and Config API
    [Documentation]  CCL-56446_01  Verify whether the Custom Dashboards in CEC Plus user
    ${response}=   call method     ${API_CMCObj}  MarketingCloudProfessionalEntitlement
    ${Prospectsstatus}=    convert to string   ${response}
    log    ${Prospectsstatus}
    Run Keyword If    "${Prospectsstatus}" == "True"      Verify the CMC plus user tabs in exploreData
    ...    ELSE IF    "${Prospectsstatus}" == "False"     Verify the Non-plus CMC user in Explore Data

Verify the CMC plus user tabs in exploreData
    [Documentation]  CCL-56446_01  Verify whether the Custom Dashboards in CEC Plus user
    ${response}=   call method     ${API_CMCObj}  organizationConfig
    ${Plus_user_status}=    convert to string   ${response}
    Run Keyword If    "${Plus_user_status}" == "True"      Verify the Thoughtspot in Explore Data
    ...    ELSE IF    "${Plus_user_status}" == "False"     Verify the Qlik Prospects in Explore Data

Verify the Thoughtspot in Explore Data
    [Documentation]   Thoughtspot in Explore Data
    @{Explore_tabs}=  create list  ${test_data_config['env']['Explore_data']}[Explore_Basic]  ${test_data_config['env']['Explore_data']}[Explore_Advanced]
    ...  ${test_data_config['env']['Explore_data']}[Explore_Prospects]  ${test_data_config['env']['Explore_data']}[Explore_Custom_Subs]  ${test_data_config['env']['Explore_data']}[Explore_Custom_Pro]
    Get text and Ensure the Headers are Equal  ${locators_params['Explore_data']}[Exploredata_tabs]   @{Explore_tabs}
    Capture the Screen   Basic_explore_tab
    click element until enabled  ${locators_params['Explore_data']}[ExploreData_advanced_tab]
    sleep  2
    capture the screen  Advanced_explore_tab
    click element until enabled  ${locators_params['Explore_data']}[ExploreData_pro_tab]
    sleep  2
    capture the screen  Prospects_explore_tab
    click element until enabled  ${locators_params['Explore_data']}[ExploreData_custom_sub_tab]
    sleep  2
    capture the screen  Custom_sub_explore_tab
    click element until enabled  ${locators_params['Explore_data']}[ExploreData_custom_pro_tab]
    sleep  2
    capture the screen  Custom_pro_explore_tab

Verify the Qlik Prospects in Explore Data
    [Documentation]   CCL-56446_02 - Qlik Prospects in Explore Data
    @{Explore_tabs}=  create list  ${test_data_config['env']['Explore_data']}[Explore_Basic]
    ...  ${test_data_config['env']['Explore_data']}[Explore_Advanced]  ${test_data_config['env']['Explore_data']}[Explore_Prospects]
    Get text and Ensure the Headers are Equal  ${locators_params['Explore_data']}[Exploredata_tabs]   @{Explore_tabs}
    Capture the Screen   Basic_Qlik_explore_tab
    click element until enabled  ${locators_params['Explore_data']}[ExploreData_advanced_tab]
    sleep  2
    capture the screen  Advanced_Qlik_explore_tab
    click element until enabled  ${locators_params['Explore_data']}[ExploreData_pro_tab]
    sleep  2
    capture the screen  Prospects_Qlik_explore_tab

Verify the Non-plus CMC user in Explore Data
    [Documentation]  CCL-56446_02  Verify the Custom Dashboards in the CEC user
    @{Explore_tabs}=  create list  ${test_data_config['env']['Explore_data']}[Explore_Basic]  ${test_data_config['env']['Explore_data']}[Explore_Advanced]
    Get text and Ensure the Headers are Equal  ${locators_params['Explore_data']}[Exploredata_tabs]   @{Explore_tabs}
    Capture the Screen   Non-plus_Basic_explore_tab
    click element until enabled  ${locators_params['Explore_data']}[ExploreData_advanced_tab]
    sleep  2
    capture the screen  Non-plus_Advanced_explore_tab
    page should not contain element  ${locators_params['Explore_data']}[ExploreData_pro_tab]

