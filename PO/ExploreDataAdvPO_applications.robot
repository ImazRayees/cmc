*** Settings ***
Library     SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Resource    ../PO/CommonWrapper.robot
Resource   ../PO/ExploreDataAdvPO_subscribers.robot


*** Variables ***
${exploreData_advanced_applicationsTab}=   (//*[contains(@class,'nav-item')])[3]

${exploreData_advanced_applications_usageByAppllabelTxt}=  Usage by Application Type
${exploreData_advanced_applications_usageByAppl_quesIcon}=  id=Popover-388
${exploreData_advanced_applications_usageByAppl_downloadIcon}=  (//*[@id='ic_download'])[1]
${exploreData_advanced_applications_usageByAppl_expandIcon}=  (//*[@id='ic_expand'])[1]
${exploreData_advanced_applications_}=

${exploreData_advanced_applications_SCHlabelTxt}=  Social Channel Heatmap
${exploreData_advanced_applications_SCH_quesIcon}=  id=Popover-391
${exploreData_advanced_applications_SCH_downloadIcon}=  (//*[@id='ic_download'])[4]
${exploreData_advanced_applications_SCH_expandIcon}=  (//*[@id='ic_expand'])[4]
${exploreData_advanced_applications_SCH_dropdown}=  //*[@class='lui-select']

${exploreData_advanced_applications_topAppslabelTxt}=  Top Applications
${exploreData_advanced_applications_topApps_quesIcon}=  id=Popover-390
${exploreData_advanced_applications_topApps_downloadIcon}=  (//*[@id='ic_download'])[2]
${exploreData_advanced_applications_topApps_expandIcon}=  (//*[@id='ic_expand'])[2]
${exploreData_advanced_applications_}=

${exploreData_advanced_applications_topGamingAppslabelTxt}=  Top Gaming Applications
${exploreData_advanced_applications_topGamingApps_quesIcon}=  id=Popover-389
${exploreData_advanced_applications_topGamingApps_downloadIcon}=  (//*[@id='ic_download'])[3]
${exploreData_advanced_applications_topGamingApps_expandIcon}=  (//*[@id='ic_expand'])[3]
${exploreData_advanced_applications_}=


*** Keywords ***

go to applications in advanced tab
    click element until enabled  ${exploredata_advanced_applicationstab}
    sleep  5
    capture the screen  applicationsTabAdvanced


verify elements in advanced tab, applications
    @{txt}=  Create List  ${exploredata_advanced_applications_usagebyappllabeltxt}  ${exploredata_advanced_applications_schlabeltxt}
    ...  ${exploredata_advanced_applications_topappslabeltxt}  ${exploredata_advanced_applications_topgamingappslabeltxt}
    page should contain multiple text  @{txt}
    select frame  ${advancedFrame}

    @{elements}=  Create List  ${exploredata_advanced_applications_usagebyappl_quesicon}  ${exploredata_advanced_applications_sch_quesicon}  ${exploredata_advanced_applications_topapps_quesicon}
    ...  ${exploredata_advanced_applications_topgamingapps_quesicon}  ${exploredata_advanced_applications_sch_downloadicon}  ${exploredata_advanced_applications_topapps_downloadicon}
    ...  ${exploredata_advanced_applications_topgamingapps_downloadicon}  ${exploredata_advanced_applications_usagebyappl_downloadicon}  ${exploredata_advanced_applications_sch_expandicon}
    ...  ${exploredata_advanced_applications_topapps_expandicon}  ${exploredata_advanced_applications_topgamingapps_expandicon}  ${exploredata_advanced_applications_usagebyappl_expandicon}
    ...  ${exploreData_advanced_applications_SCH_dropdown}
    page should contain multiple element  @{elements}
    select frame  ${advancedFrame}


