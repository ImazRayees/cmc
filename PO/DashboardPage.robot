*** Settings ***
Library  SeleniumLibrary
Variables  ../utils/InsightScreenAPI.py
Resource    ../PO/InsightsPageObject.robot

*** Variables ***
${Dashboard_text}=   Dashboard
${Dashboard_header}=    css=body > ngx-app > ngx-dashboard > div.container > div > div > div.card-header
${CMC_image}=    css=.col-md-3:nth-child(2) .logo-brand
${MenuIcon}=        id=navbarDropdownMenuLink
${CMCLink}=      //*[@class='nav-item dropdown show']/ul/li[2]/a
${SHADLink}=     //*[@class='nav-item dropdown show']/ul/li[4]/a
${TermCondAccept}=    //button[contains(.,'I Accept')]

*** Keywords ***
Click on the CMC
    set selenium timeout    60 seconds
    set selenium implicit wait    60 seconds
    sleep    20
    click element    ${MenuIcon}
    sleep    5
    click element    ${CMCLink}

