*** Settings ***
Library    SeleniumLibrary
Resource  ../utils/CommonWrappers.robot

*** Keywords ***
Open Browser To Login
    Open Browser    ${START_URL}    ${BROWSER}
    Set Window Size    768    1024
    Title Should Be    CMC
Input Username
    [Arguments]  ${username}
    Input Text    xpath=//input[@id='name']    ${username}    clear: bool=True

Click Next button
   Click Element  xpath=//button[@class='btn btn-primary']
   Log  Next button is clicked
Input Password
    [Arguments]    ${password}
    Input Text    xpath=//input[@id='password']    ${password}
    Log   Password is entered
Click Login button
    Click Button    xpath=//button[@class='btn btn-primary']
    Log   credentials are sumbitted
Verify Login is successful
    Wait Until Element Is Visible   xpath=//div[@class='card-body']//div[2]//div[1]//a[1]//img[1]
    Log  Login is succesful and Homepage launched
Error message on login page
    page should contain     Invalid username/password

Invaid Login Test
     [Arguments]  ${username}   ${password}
     Input Username    ${username}
     Click Next button
     Input password    ${password}
     Click login button
     sleep  2
     Error message on login page

Valid Login
     [Arguments]  ${username}   ${password}
     Input Username    ${username}
     Click Next button
     Input password    ${password}
     Click login button
     verify login is successful

