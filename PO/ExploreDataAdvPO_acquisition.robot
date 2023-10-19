*** Settings ***
Library     SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Resource    ../PO/CommonWrapper.robot
Resource   ../PO/ExploreDataAdvPO_subscribers.robot


*** Variables ***
${exploreData_advanced_acquisitionTab}=  (//*[contains(@class,'nav-item')])[6]

${exploreData_advanced_acquisition_servLocationLabelTxt}=  Serviceable Location
${exploreData_advanced_acquisition_servLocation_quesIcon}=
${exploreData_advanced_acquisition_servLocation_downloadIcon}=  (//*[@id='ic_download'])[1]
${exploreData_advanced_acquisition_servLocation_expandIcon}=  (//*[contains(@class,'resize')])[1]
${exploreData_advanced_acquisition_servLocation__}=
${exploreData_advanced_acquisition_servLocation__}=


*** Keywords ***

go to acquisition in advanced tab
    click element until enabled  ${exploreData_advanced_acquisitionTab}
    sleep  5
    capture the screen  acquisitionTabAdvanced


verify elements in advanced tab, acquisition
    page should contain the element  ${exploreData_advanced_acquisition_servLocationLabelTxt}
    select frame  ${advancedFrame}

    @{elements}=  create list  ${exploreData_advanced_acquisition_servLocation_downloadIcon}  ${exploreData_advanced_acquisition_servLocation_expandIcon}
    page should contain multiple element  @{elements}
    select frame  ${advancedFrame}