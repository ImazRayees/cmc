*** Settings ***
Library    SeleniumLibrary
Resource  ../utils/CommonWrappers.robot
Resource  ../PO/Loginpage_PO.robot
*** Keywords ***
Launch CMC Home page
     Valid Login    implementation@allophone.net    Impl7583
     Log  Login is succesful and Homepage launched
     Wait Until Element Is Visible  css=body > ngx-app > ngx-dashboard > div.container > div > div > div.card-body > div > div:nth-child(2) > div > a > img
     Click Element      css=body > ngx-app > ngx-dashboard > div.container > div > div > div.card-body > div > div:nth-child(2) > div > a > img
     Log    Clicked on CMC button on Dashboard
     Wait Until Element Is Visible  xpath=//a[contains(text(),'Upsell')]
     sleep  3

Invaid search box functionality
     [Arguments]   ${search text}
     Launch CMC Home page
     Wait Until Element Is Visible  xpath=//a[@class='nav-link active']
     Click Button  xpath=//a[@class='nav-link active']
     Log  Clicked on search tab
     Input text    xpath=//input[@placeholder='Type subscribers name or account number']    ${search text}    clear: bool=True
     Log  Entered tex into search text box
     Click Button  xpath=//i[contains(@class,'fa fa-search')]
     Log  Clicked on search button
     sleep  3


Valid search box functionality
     Launch CMC Home page
     Wait Until Element Is Visible  xpath=//a[@class='nav-link active']
     Click Button  xpath=//a[@class='nav-link active']
     Log  Clicked on search tab
     Input text    xpath=//input[@placeholder='Type subscribers name or account number']    ${search text}    clear: bool=True
     Log  Entered tex into search text box
     Click Button  xpath=//i[contains(@class,'fa fa-search')]
     Log  Clicked on search button
     sleep  3
