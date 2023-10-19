*** Settings ***
Library    SeleniumLibrary
Resource   ../utils/GlobVariables.robot
Resource   ../PO/CommonWrapper.robot
Resource   ../PO/ExploreDataPO_applications.robot
Resource   ../PO/ExploreDataAdvPO_subscribers.robot
Resource   ../PO/Campigns_po.robot
Resource   ../PO/PageTitleKeywords.robot
Resource   ../Configure/Variables/Locatorparams.yml
*** Keywords ***

Validate the Home Thoughtspot KPI in homescreen
    @{Elements}=   create list    ${locators_params['Home']['Thoughtspot_Insights']}[Subscribers_thoughtspot]   ${locators_params['Home']['Thoughtspot_Insights']}[Average_fee]
    wait until page contain elements  @{elements}