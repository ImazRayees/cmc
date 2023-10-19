*** Settings ***
Library     SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Resource    ../PO/CommonWrapper.robot
Resource   ../PO/ExploreDataAdvPO_subscribers.robot


*** Variables ***
${exploreData_advanced_servicesTab}=   (//*[contains(@class,'nav-item')])[2]

${exploreData_advanced_services_subscriberBySTTLabeltxt}=  Subscribers by Service Tier & Technology
${exploreData_advanced_services_subscriberBySTT_quesIcon}=  id=Popover-393
${exploreData_advanced_services_subscriberBySTT_downloadIcon}=  (//*[@id='ic_download'])[1]
${exploreData_advanced_services_subscriberBySTT_expandIcon}=  (//*[@id='ic_expand'])[1]
${exploreData_advanced_services_subscriberBySTT_fiberBtn}=  (//*[text()='Fiber'])[1]
${exploreData_advanced_services_subscriberBySTT_}=
${exploreData_advanced_services_subscriberBySTT_}=
${exploreData_advanced_services_subscriberBySTT_}=

${exploreData_advanced_services_smartHomeInsLabeltxt}=  Smart Home Insights
${exploreData_advanced_services_smartHomeIns_quesIcon}=  id=Popover-557
${exploreData_advanced_services_smartHomeIns_downloadIcon}=  (//*[@id='ic_download'])[3]
${exploreData_advanced_services_smartHomeIns_expandIcon}=  (//*[@id='ic_expand'])[3]
${exploreData_advanced_services_smartHomeIns_}=
${exploreData_advanced_services_smartHomeIns_}=
${exploreData_advanced_services_smartHomeIns_}=
${exploreData_advanced_services_smartHomeIns_}=
${exploreData_advanced_services_smartHomeIns_}=

${exploreData_advanced_services_householdDevTrendsLabeltxt}=  Household Device Trends
${exploreData_advanced_services_householdDevTrends_quesIcon}=  id=Popover-394
${exploreData_advanced_services_householdDevTrends_downloadIcon}=  (//*[@id='ic_download'])[2]
${exploreData_advanced_services_householdDevTrends_expandIcon}=  (//*[@id='ic_expand'])[2]
${exploreData_advanced_services_householdDevTrends_wifiScoreBtn}=  (//*[text()='Wi-Fi Score'])[1]
${exploreData_advanced_services_householdDevTrends_avgHomeDevBtn}=  (//*[text()='Average Home Devic…'])[1]
${exploreData_advanced_services_householdDevTrends_}=
${exploreData_advanced_services_householdDevTrends_}=
${exploreData_advanced_services_householdDevTrends_}=

${exploreData_advanced_services_blockdThreatInsightslabeltxt}=  Blocked Threats Insights
${exploreData_advanced_services_blockdThreatInsights_quesIcon}=  id=Popover-558
${exploreData_advanced_services_blockdThreatInsights_downloadIcon}=  (//*[@id='ic_download'])[4]
${exploreData_advanced_services_blockdThreatInsights_expandIcon}=  (//*[@id='ic_expand'])[4]
${exploreData_advanced_services_blockdThreatInsights_}=
${exploreData_advanced_services_blockdThreatInsights_}=
${exploreData_advanced_services_blockdThreatInsights_}=
${exploreData_advanced_services_blockdThreatInsights_}=
${exploreData_advanced_services_blockdThreatInsights_}=

${exploreData_advanced_services_wifiDevCategoryLabeltxt}=  Wi-Fi Device Category Trends
${exploreData_advanced_services_wifiDevCategory_quesIcon}=  id=Popover-560
${exploreData_advanced_services_wifiDevCategory_downloadIcon}=  (//*[@id='ic_download'])[6]
${exploreData_advanced_services_wifiDevCategory_expandIcon}=  (//*[@id='ic_expand'])[6]
${exploreData_advanced_services_wifiDevCategory_cameraBtn}=  (//*[text()='Camera'])[1]
${exploreData_advanced_services_wifiDevCategory_gamingConsoleBtn}=  (//*[text()='GamingConsole'])[1]
${exploreData_advanced_services_wifiDevCategory_othersBtn}=  (//*[text()='Others'])[1]
${exploreData_advanced_services_wifiDevCategory_computerBtn}=  (//*[text()='Computer'])[1]
${exploreData_advanced_services_wifiDevCategory_iotBtn}=  (//*[text()='IoT'])[1]

${exploreData_advanced_services_edgeSuitesAdpLabeltxt}=  EDGE Suites Adoption Rate
${exploreData_advanced_services_edgeSuitesAdp_quesIcon}=  id=Popover-559
${exploreData_advanced_services_edgeSuitesAdp_downloadIcon}=  (//*[@id='ic_download'])[5]
${exploreData_advanced_services_edgeSuitesAdp_expandIcon}=  (//*[@id='ic_expand'])[5]
${exploreData_advanced_services_edgeSuitesAdp_expIQBtn}=  (//*[text()='ExperienceIQ Module'])[1]
${exploreData_advanced_services_edgeSuitesAdp_protecIQBtn}=   (//*[text()='ProtectIQ Module'])[1]
${exploreData_advanced_services_edgeSuitesAdp_}=
${exploreData_advanced_services_edgeSuitesAdp_}=
${exploreData_advanced_services_edgeSuitesAdp_}=

${exploreData_advanced_services_}=
${exploreData_advanced_services_}=
${exploreData_advanced_services_}=


*** Keywords ***

go to services in advanced tab
    click element until enabled  ${exploredata_advanced_servicestab}
    sleep  5
    capture the screen  servicesTabAdvanced

verify elements in advanced tab, services
    @{txt}=  Create List  ${exploredata_advanced_services_subscriberbysttlabeltxt}  ${exploredata_advanced_services_smarthomeinslabeltxt}
    ...  ${exploredata_advanced_services_householddevtrendslabeltxt}  ${exploredata_advanced_services_blockdthreatinsightslabeltxt}
    ...  ${exploredata_advanced_services_wifidevcategorylabeltxt}  ${exploredata_advanced_services_edgesuitesadplabeltxt}
    page should contain multiple text  @{txt}
    select frame  ${advancedFrame}

    @{elements}=  Create List  ${exploredata_advanced_services_blockdthreatinsights_quesicon}  ${exploredata_advanced_services_edgesuitesadp_quesicon}
    ...  ${exploredata_advanced_services_householddevtrends_quesicon}  ${exploredata_advanced_services_smarthomeins_quesicon}  ${exploredata_advanced_services_subscriberbystt_quesicon}
    ...  ${exploredata_advanced_services_wifidevcategory_quesicon}  ${exploredata_advanced_services_blockdthreatinsights_downloadicon}  ${exploredata_advanced_services_edgesuitesadp_downloadicon}
    ...  ${exploredata_advanced_services_householddevtrends_downloadicon}  ${exploredata_advanced_services_smarthomeins_downloadicon}  ${exploredata_advanced_services_subscriberbystt_downloadicon}
    ...  ${exploredata_advanced_services_wifidevcategory_downloadicon}  ${exploredata_advanced_services_blockdthreatinsights_expandicon}  ${exploredata_advanced_services_edgesuitesadp_expandicon}
    ...  ${exploredata_advanced_services_householddevtrends_expandicon}  ${exploredata_advanced_services_smarthomeins_expandicon}  ${exploredata_advanced_services_subscriberbystt_expandicon}
    ...  ${exploredata_advanced_services_wifidevcategory_expandicon}  ${exploredata_advanced_services_subscriberbystt_fiberbtn}  ${exploredata_advanced_services_householddevtrends_wifiscorebtn}
    ...  ${exploredata_advanced_services_householddevtrends_avghomedevbtn}  ${exploredata_advanced_services_wifidevcategory_camerabtn}  ${exploredata_advanced_services_wifidevcategory_gamingconsolebtn}
    ...  ${exploredata_advanced_services_wifidevcategory_othersbtn}  ${exploredata_advanced_services_wifidevcategory_computerbtn}  ${exploredata_advanced_services_wifidevcategory_iotbtn}
    ...  ${exploreData_advanced_services_edgeSuitesAdp_expIQBtn}  ${exploredata_advanced_services_edgesuitesadp_proteciqbtn}
    page should contain multiple element  @{elements}
    select frame  ${advancedFrame}
