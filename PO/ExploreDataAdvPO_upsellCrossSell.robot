*** Settings ***
Library     SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Resource    ../PO/CommonWrapper.robot
Resource   ../PO/ExploreDataAdvPO_subscribers.robot


*** Variables ***
${exploreData_advanced_upsell/crossSellTab}=  (//*[contains(@class,'nav-item')])[5]

${exploreData_advanced_UsCs_subsBySegmentLabeltxt}=  Subscribers by segment
${exploreData_advanced_UsCs_subsBySegment_quesIcon}=  id=Popover-785
${exploreData_advanced_UsCs_subsBySegment_downloadIcon}=  (//*[@id='ic_download'])[1]
${exploreData_advanced_UsCs_subsBySegment_expandIcon}=  (//*[contains(@class,'resize')])[1]
${exploreData_advanced_UsCs_subsBySegment__}=
${exploreData_advanced_UsCs_subsBySegment__}=

${exploreData_advanced_UsCs_sbsPropensityScoreLabelTxt}=  Subscribers by segment with Propensity score
${exploreData_advanced_UsCs_sbsPropensityScore_quesIcon}=  id=Popover-786
${exploreData_advanced_UsCs_sbsPropensityScore_downloadIcon}=  (//*[@id='ic_download'])[2]
${exploreData_advanced_UsCs_sbsPropensityScore_expandIcon}=  (//*[contains(@class,'resize')])[2]
${exploreData_advanced_UsCs__}=
${exploreData_advanced_UsCs__}=

*** Keywords ***

go to upsell crosSell in advanced tab
    click element until enabled  ${exploreData_advanced_upsell/crossSellTab}
    sleep  5
    capture the screen  upsellCrossSellTabAdvanced


verify elements in advanced tab, upsell crossSell
    @{txt}=  Create List  ${exploreData_advanced_UsCs_subsBySegmentLabeltxt}  ${exploreData_advanced_UsCs_sbsPropensityScoreLabelTxt}
    page should contain multiple text  @{txt}
    select frame  ${advancedFrame}

    @{elements}=  Create List  ${exploreData_advanced_UsCs_subsBySegment_quesIcon}  ${exploreData_advanced_UsCs_subsBySegment_downloadIcon}  ${exploreData_advanced_UsCs_subsBySegment_expandIcon}
    ...  ${exploreData_advanced_UsCs_sbsPropensityScore_quesIcon}  ${exploreData_advanced_UsCs_sbsPropensityScore_downloadIcon}  ${exploreData_advanced_UsCs_sbsPropensityScore_expandIcon}
    page should contain multiple element  @{elements}
    select frame  ${advancedFrame}
