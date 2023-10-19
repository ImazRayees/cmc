*** Settings ***
Library    SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Resource    ../utils/CommonWrappers.robot
Variables  ../utils/InsightScreenAPI.py
Resource    ../PO/InsightsPageObject.robot

*** Variables ***
${username_txtFiled}=    id=name
${next_button}=    css=body > ngx-app > ngx-login > div > div > div > form > div.sumbit-btn > button
${password_txtField}=    id=password

*** Keywords ***
Enter the userName
    input text   ${username_txtFiled}    ${USERNAME}
    InsightsPageObject.APIResponse ping_msg
Click Next Button
    click button    ${next_button}
    wait until element is visible    password
    element visible validation    ${password_txtField}

Enter the Password
     input text  ${password_txtField}  ${PASSWORD}
     wait until page contains  Login
     sleep    3
     click button    Login
     InsightsPageObject.APIResponse ping_msg


