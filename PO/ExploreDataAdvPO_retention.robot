*** Settings ***
Library     SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Resource    ../PO/CommonWrapper.robot
Resource   ../PO/ExploreDataAdvPO_subscribers.robot

*** Variables ***
${exploreData_advanced_retentionTab}=   (//*[contains(@class,'nav-item')])[4]

${exploreData_advanced_retention_churnRiskLabelTxt}=  Churn Risk
${exploreData_advanced_retention_churnRisk_quesIcon}=  id=Popover-796
${exploreData_advanced_retention_churnRisk_downloadIcon}=  (//*[@id='ic_download'])[1]
${exploreData_advanced_retention_churnRisk_expandIcon}=  (//*[contains(@class,'resize')])[1]
${exploreData_advanced_retention_churnRisk__}=
${exploreData_advanced_retention_churnRisk__}=

${exploreData_advanced_retention_retentionWidgLabelTxt}=  Retention
${exploreData_advanced_retention_retentionWidg_quesIcon}=  id=Popover-797
${exploreData_advanced_retention_retentionWidg_downloadIcon}=  (//*[@id='ic_download'])[2]
${exploreData_advanced_retention_retentionWidg_expandIcon}=  (//*[contains(@class,'resize')])[2]
${exploreData_advanced_retention_retentionWidg__}=
${exploreData_advanced_retention_retentionWidg__}=

${exploreData_advanced_retention_CRILabelTxt}=  Churn Rate & Insights
${exploreData_advanced_retention_CRI_quesIcon}=  id=Popover-798
${exploreData_advanced_retention_CRI_downloadIcon}=  (//*[@id='ic_download'])[3]
${exploreData_advanced_retention_CRI_expandIcon}=  (//*[contains(@class,'resize')])[3]
${exploreData_advanced_retention_CRI_<20M}=  (//*[text()='<20M'])[1]
${exploreData_advanced_retention_CRI_1G}=  (//*[text()='1G'])[1]
${exploreData_advanced_retention_CRI_20M+}=  (//*[text()='20M+'])[1]
${exploreData_advanced_retention_CRI_50M+}=  (//*[text()='50M+'])[1]
${exploreData_advanced_retention_CRI_300M+}=  (//*[text()='300M+'])[1]


*** Keywords ***
Go to retention in advanced tab
    click element until enabled  ${exploreData_advanced_retentionTab}
    sleep  5
    capture the screen  retentionTabAdvanced

verify elements in advanced tab, retention
    @{txt}=  Create List  ${exploreData_advanced_retention_churnRiskLabelTxt}  ${exploreData_advanced_retention_retentionWidgLabelTxt}  ${exploreData_advanced_retention_CRILabelTxt}
    page should contain multiple text  @{txt}
    select frame  ${advancedFrame}

    @{elements}=  Create List  ${exploreData_advanced_retention_churnRisk_quesIcon}  ${exploreData_advanced_retention_churnRisk_downloadIcon}  ${exploreData_advanced_retention_churnRisk_expandIcon}
    ...  ${exploreData_advanced_retention_retentionWidg_quesIcon}  ${exploreData_advanced_retention_retentionWidg_downloadIcon}  ${exploreData_advanced_retention_retentionWidg_expandIcon}
    ...  ${exploreData_advanced_retention_CRI_quesIcon}  ${exploreData_advanced_retention_CRI_downloadIcon}  ${exploreData_advanced_retention_CRI_expandIcon}
    ...  ${exploreData_advanced_retention_CRI_<20M}  ${exploreData_advanced_retention_CRI_1G}  ${exploreData_advanced_retention_CRI_20M+}
    ...  ${exploreData_advanced_retention_CRI_50M+}  ${exploreData_advanced_retention_CRI_300M+}
    page should contain multiple element  @{elements}
    select frame  ${advancedFrame}
