*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Variables   ../utils/configReader.py
Variables  ../utils/InsightScreenAPI.py
Variables  ../utils/CMC-API.py
Resource  ../PO/CMCAPI_Integration.robot
Resource    CommonWrapper.robot


*** Variables ***
${homeBtn}=   id=homeMarketingSection
${Explore_data}=    //*[@href='/marketing/explore-data']
${Services}=    //a[contains(text(),'Services')]
${Subscribers}=    //*[@id='subscribeData-list-menu']
${Acquisition}=    //*[@id='acquisitionData-list-menu']

${basic_TimeFrame_dropdown}=    //*[@id='timeFrameSelect']
${basic_Location_dropdown}=    //*[@id='locationSelect']
${basic_Region_dropdown}=    //*[@id='regionSelect']
${basic_region_Allicance}=  //*[text()='ALLIANCE']
${basic_Region_dropdownPlaceholder}=  //*[@id='regionSelect']//span[2]
${ApplyButton}=    //*[@id='applyFilter']
${clearButton}=  //*[@id='clearFilter']//label


*** Keywords ***
Navigate to the Explore Data screen
    sleep    4
    Click Element Until Enabled    ${Explore_data}

Navigate to the Service menu
    sleep    4
    Click Element Until Enabled    ${Services}

Navigate to the Subscribers menu
    log to console    TestCaseID:    CMC_ExploreDataBasic_SubscriberLenses_01
    click element until enabled  ${homebtn}
    sleep    1
    click element until enabled  ${explore_data}
    sleep  1
    Click Element Until Enabled    ${Subscribers}
    sleep  4

Navigate to the Acquisition menu
    sleep    4
    Click Element Until Enabled    ${Acquisition}

Navigate to 2 Prior Months
    [Documentation]   Set the region as all and Timeframe as 2 prior months in Explore Data
    ${txt}=  get text  ${basic_Region_dropdownPlaceholder}
    Run Keyword if  "${txt}" == "All"  Region filter set to all
    ...  ELSE  select region all
    Click Element Until Enabled    ${locators_params['Explore_data']}[Timeframe_drop]
    sleep    4
    ${xpath}=  format string    ${locators_params['Explore_data']}[Timeframe_select]   Time=${test_data_config['env']['Explore_data']}[Time_30_txt]
    click element until visible   ${xpath}
    Click Element Until Enabled   ${locators_params['Explore_data']}[Apply_btn]

Verify the Filters in Explore data
    [Documentation]   CCL-67472   Filter validation for Explore Data
    Set the filter in different Region and location
    Set the filter in all status

Set the filter in different Region and location
    [Documentation]   Set the different region and location
    sleep  10s
    click element until visible   ${locators_params['Explore_data']}[Region_drop]
    click element until visible   ${locators_params['Explore_data']}[Region_all]
    click element until visible   ${locators_params['Explore_data']}[Location_drop]
    click element until visible   ${locators_params['Explore_data']}[Region_all]
    click element until visible   ${locators_params['Explore_data']}[Timeframe_drop]
    ${xpath}=  format string    ${locators_params['Explore_data']}[Timeframe_select]   Time=${test_data_config['env']['Explore_data']}[Time_30_txt]
    click element until visible   ${xpath}
    ${status}=   run keyword and return status   page should contain element   ${locators_params['Explore_data']}[Apply_dis_btn]
    run keyword if  '${status}' == 'False'   click element until visible   ${locators_params['Explore_data']}[Apply_btn]
    Capture the Screen   Default_filters in Exploredata
    click element until visible   ${locators_params['Explore_data']}[Region_drop]
    click element until visible   ${locators_params['Explore_data']}[Region_diff]
    click element until visible   ${locators_params['Explore_data']}[Location_drop]
    click element until visible   ${locators_params['Explore_data']}[Region_diff]
    click element until visible   ${locators_params['Explore_data']}[Timeframe_drop]
    ${xpath_2}=  format string    ${locators_params['Explore_data']}[Timeframe_select]   Time=${test_data_config['env']['Explore_data']}[Time_2Prior_txt]
    click element until visible   ${xpath_2}
    @{Filters}=   create list   ${locators_params['Explore_data']}[Apply_btn]   ${locators_params['Explore_data']}[Clear_btn]
    page should contain multiple element   @{Filters}
    page should not contain element   ${locators_params['Explore_data']}[Apply_dis_btn]
    Capture the Screen   Different_filters in Exploredata_23
    click element until visible   ${locators_params['Explore_data']}[Apply_btn]
    page should contain element   ${locators_params['Explore_data']}[Apply_dis_btn]
    Capture the Screen   Default_filters in Exploredata
    click element until visible   ${locators_params['Explore_data']}[Clear_btn]

Set the filter in all status
    [Documentation]   Set the filter in all status
    click element until visible   ${locators_params['Explore_data']}[Region_drop]
    click element until visible   ${locators_params['Explore_data']}[Region_all]
    click element until visible   ${locators_params['Explore_data']}[Location_drop]
    click element until visible   ${locators_params['Explore_data']}[Region_all]
    click element until visible   ${locators_params['Explore_data']}[Timeframe_drop]
    ${xpath}=  format string    ${locators_params['Explore_data']}[Timeframe_select]   Time=${test_data_config['env']['Explore_data']}[Time_30_txt]
    click element until visible   ${xpath}
    click element until visible   ${locators_params['Explore_data']}[Apply_btn]
    Capture the Screen   All Filter in Exploredata

Set filter to Lincoln region
    click element until visible  ${basic_region_dropdown}
    click element until visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${globVar_region4}')]
    click element until visible  ${basic_Location_dropdown}
    click element until visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${globVar_location4}')]
    click element until visible  ${applybutton}
    sleep  5

select region all
    click element until enabled  ${locators_params['Explore_data']}[Region_drop]
    sleep  2
    click element until enabled  ${locators_params['Explore_data']}[Region_all]

Region filter set to all
    log to console  Region filter is set to All

Login api calls
     APIReponse Login

Explore data api calls
     APIReponse StageYamlReader
     APIReponse UserLogin_UserCMC
     APIReponse Subscribers_Data_Usage
     APIReponse Subscribers_Data_Usage_drilldown
     APIReponse Streaming_Subscribers
     APIReponse Streaming_Subscribers_drilldown
     APIReponse Gaming_Subscribers
     APIReponse Gaming_Subscribers_drilldown
     APIReponse Work_from_Home_WFH_Subscribers
     APIReponse Work_from_Home_WFH_Subscribers_drilldown
     APIReponse Subscriber_Activity_Trends
     APIReponse Data_Usage_Trends
     APIReponse Devices_per_Household
     APIReponse Devices_per_Household_drilldown
     APIReponse Subscribers_by_Service_Tier_And_Technology
     APIReponse Subscribers_by_Service_Tier_And_Technology_drilldown
     APIReponse Household_Device_Trends
     APIReponse Wi_Fi_Device_Category_Trends
     APIReponse Blocked_Threats_Insights
     APIReponse CommandIQ_Insights
     APIReponse Usage_by_Application_Type
     APIReponse Usage_by_Application_Type_drilldown
     APIReponse Top_Applications
     APIReponse Top_Applications_drilldown
     APIReponse Top_Gaming_Applications
     APIReponse Top_Gaming_Applications_drilldown
     APIReponse Social_Channel_Heatmap_charts
     APIReponse churn_rate_And_insights
     APIReponse churn_rate_And_insights_drilldown
     APIReponse Churn_Risk
     APIReponse Retention
     APIReponse New_Subscribers_by_Service_Tier_And_Technology
     APIReponse New_Subscribers_by_Service_Tier_And_Technology_drilldown
     APIReponse Acquisition_Revenue_And_Insights
     APIReponse Acquisition_Revenue_And_Insights_drilldown
     APIReponse Acquisition_rate_And_Insights
     APIReponse Acquisition_rate_And_Insights_drilldown
     APIReponse Device_CommandIQ_Status
     APIReponse Device_Revenue_Edge_Suite_Status_ExperienceIQ
     APIReponse Device_Revenue_Edge_Suite_Status_ProtectIQ
     APIReponse Device_Revenue_Edge_Suite_Status_Arlo
     APIReponse Device_Trends
     APIReponse Services_Smart_Home_Insights
     APIReponse Services_Wifi_Device_Category_Trends
     APIReponse Services_Edge_Suites_Tresnds
     APIReponse Services_Household_Device_Trends