*** Settings ***
Library    SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Resource    ../PO/CommonWrapper.robot
Resource    ../PO/ExploreDataPO_subscriber.robot
Resource    ../PO/BasicCheckin.robot


*** Variables ***
${username_txtFiled}=    id=username
${next_btn_user}=    (//button)[1]
${password_txtField}=    id=password
${Loing}=    xpath=(//button)[1]
${user_logo}=   id=profile-icon
${logout}=  xpath=//*[@href='/logout']
${user_usercmc}=  usercmc@calix.com
${pass_usercmc}=  calix123
*** Keywords ***
Launch the Browser
    [Documentation]   To Launch the Browser and maximize the Window Size
    Open Browser  about:blank   headlesschrome
    Maximize Browser Window
    Set Window Size  ${1440}   ${900}

Login to the Application and Navigate to usercmc for Pendo
    [Documentation]   Login to the UserCMC User and check the Pendos
    Launch the Browser
    Initialize configuration parameters
    ${Url}=   call method    ${ObjconfigReader}   environment
    Run keyword IF   '${Url}' == 'Dev'    Dev environment validation
    ...    ELSE IF   '${Url}' == 'Devfunc'  Dev environment validation
    ...    ELSE IF   '${Url}' == 'Stage'    Stage env validation for userCMC@calix.com
    click on side menu icon
    verify Side Menu List
    go to marketing cloud

Stage env validation for userCMC@calix.com
    [Documentation]   Use this Keyword to run the code in Stage Environment-UserCMC user
    set selenium timeout    20 seconds
    set selenium implicit wait    20 seconds
    log to console    running Stage..
    ${Stage_url}=   call method    ${ObjconfigReader}   stageurl
    go to  ${Stage_url}
    sleep    20
    enter the value untill visible   ${username_txtFiled}    ${user_usercmc}
    log to console     running user     ${globVar_userCSC_username}
    click element until visible    (//button)[1]
    wait until element is visible    password
    enter the value untill visible  ${password_txtField}  ${pass_usercmc}
    wait until page contains  Login
    sleep    2
    click element until visible    ${Loing}
    sleep    20
    ${present}=    Run Keyword And Return Status    Element Should Be Visible    //span[contains(@class,'close')]
    Run Keyword If    ${present}   close Toast Message
     ...  ELSE   log to console   No Toast Message
    Capture the Screen    userCMCDashboard

Stage environment validation
    [Documentation]   Use this Keyword to run the code in Stage Environment
    set selenium timeout    20 seconds
    set selenium implicit wait    20 seconds
    log to console    running Stage..
    go to  ${test_data_config['env']}[Product_URL]
    wait until page contains element  ${username_txtFiled}  20s
    Enter the Value Untill Visible   ${username_txtFiled}    ${test_data_config['env']['login']}[username]
    click button    (//button)[1]
    wait until element is visible    password
    Enter the Value Untill Visible  ${password_txtField}  ${test_data_config['env']['login']}[password]
    wait until page contains  Login
    click element    ${Loing}
    sleep    15
    ${present}=    Run Keyword And Return Status    Element Should Be Visible    //span[contains(@class,'close')]
    Run Keyword If    ${present}   close Toast Message
     ...  ELSE   log to console   No Toast Message
    Capture the Screen    Dashboard

Stage environment validation for AutomationFiono
    [Documentation]   Use this Keyword to run the code in AutomationFiono in Stage Environment
    set selenium timeout    20 seconds
    set selenium implicit wait    20 seconds
    log to console    running Stage..
    ${Stage_url}=   call method    ${ObjconfigReader}   stageurl
    go to  ${Stage_url}
    Enter the Value Untill Visible   ${username_txtFiled}    ${globVar_Fiona_username}
    log to console     running user      ${globVar_Fiona_username}
    click element until visible  ${next_btn_user}
    wait until element is visible    ${password_txtField}
    Enter the Value Untill Visible   ${password_txtField}  ${globVar_Fiona_password}
    wait until page contains   Login
    click element until visible    ${Loing}
    sleep    15
    ${present}=    Run Keyword And Return Status    Element Should Be Visible    //span[contains(@class,'close')]
    Run Keyword If    ${present}   close Toast Message
     ...  ELSE   log to console   No Toast Message
    Capture the Screen    Dashboard

Stage env validation for userCSC@calix.com
    [Documentation]   Use this Keyword to run the code in Stage Environment-UserCSC user
    set selenium timeout    20 seconds
    set selenium implicit wait    20 seconds
    log to console    running Stage..
    ${Stage_url}=   call method    ${ObjconfigReader}   stageurl
    go to  ${Stage_url}
#    go to  ${cloud_dev_url}
#    go to  ${dev_START_URL}
    sleep    20
    input text   ${username_txtFiled}    ${globVar_userCSC_username}
    log to console     running user     ${globVar_userCSC_username}
    click button    (//button)[1]
    wait until element is visible    password
    input text  ${password_txtField}  ${globVar_userCSC_password}
    wait until page contains  Login
    sleep    2
    click element    ${Loing}
    sleep    20
    ${present}=    Run Keyword And Return Status    Element Should Be Visible    //span[contains(@class,'close')]
    Run Keyword If    ${present}   close Toast Message
     ...  ELSE   log to console   No Toast Message
    Capture the Screen    userCSCDashboard

Stage environment validation for allo org user
    [Documentation]   Use this Keyword to run the code in Stage Environment-allo org user
    set selenium timeout    20 seconds
    set selenium implicit wait    20 seconds
    log to console    running Stage..
    ${Stage_url}=   call method    ${ObjconfigReader}   stageurl
    go to  ${Stage_url}
#    go to  ${cloud_dev_url}
#    go to  ${dev_START_URL}
    sleep    20
    input text   ${username_txtFiled}    ${dev_USERNAME}
    log to console     running user     ${dev_USERNAME}
    click button    (//button)[1]
    wait until element is visible    password
    input text  ${password_txtField}  ${dev_PASSWORD}
    wait until page contains  Login
    sleep    2
    click element    ${Loing}
    sleep    20
    ${present}=    Run Keyword And Return Status    Element Should Be Visible    //span[contains(@class,'close')]
    Run Keyword If    ${present}   close Toast Message
     ...  ELSE   log to console   No Toast Message
    Capture the Screen    AlloOrgDashboard

Prod environment validation
    [Documentation]   Use this Keyword to run the code in Production Environment
    set selenium timeout    20 seconds
    set selenium implicit wait    20 seconds
    go to  ${stage_START_URL}
    log to console    running Prod..
    input text   ${username_txtFiled}    ${stage_USERNAME}
    click button    ${next_btn_user}
    wait until element is visible    password
    input text  ${password_txtField}  ${stage_PASSWORD}
    wait until page contains  Login
    sleep    1
    click element    ${Loing}
    sleep  10
     ${present}=    Run Keyword And Return Status    Element Should Be Visible    //span[contains(@class,'close')]
     Run Keyword If    ${present}   close Toast Message
     ...  ELSE     log to console   No Toast Message

Dev environment validation
    [Documentation]   Use this Keyword to run the code in Developer Environment
    set selenium timeout    20 seconds
    set selenium implicit wait    20 seconds
    go to  ${test_data_config['env']}[Product_URL]
    sleep    5
    log to console    running Dev..
    Enter the Value Untill Visible   ${username_txtFiled}    ${test_data_config['env']['login']}[username]
    sleep    1
    Click Element Until Visible    (//button)[1]
    wait until element is visible    password
    Enter the Value Untill Visible  ${password_txtField}  ${test_data_config['env']['login']}[password]
    wait until page contains  Login
    sleep    1
    Click Element Until Visible    ${Loing}
    sleep    5
    Capture the Screen    Dashboard

Stage environment validation for cmc automation user
    [Documentation]   Use this Keyword to run the code in Stage Environment-cmc automation user
    set selenium timeout    20 seconds
    set selenium implicit wait    20 seconds
    log to console    running Stage..
    ${Stage_url}=   call method    ${ObjconfigReader}   stageurl
    go to  ${Stage_url}
#    go to  ${cloud_dev_url}
#    go to  ${dev_START_URL}
    sleep    20
    input text   ${username_txtFiled}    ${cmc_USERNAME}
    log to console     running user     ${cmc_USERNAME}
    click button    (//button)[1]
    wait until element is visible    password
    input text  ${password_txtField}  ${cmc_PASSWORD}
    wait until page contains  Login
    sleep    2
    click element    ${Loing}
    sleep    20
    ${present}=    Run Keyword And Return Status    Element Should Be Visible    //span[contains(@class,'close')]
    Run Keyword If    ${present}   close Toast Message
     ...  ELSE   log to console   No Toast Message
    Capture the Screen    10100OrgDashboard

close Toast Message
    [Documentation]   To Close the Error Message
    sleep  2
    ${count}=  get element count   //span[contains(@class,'close')]
    FOR  ${num}  IN RANGE  ${count}
    sleep  2
    click element   (//span[contains(@class,'close')])[1]
    END

logout the Application
     [Documentation]   To Logout from the Application
     wait until element is Visible  ${user_logo}
     click element until visible   ${user_logo}
     click element until visible   ${logout}

Launch the Application and navigate to cmc
    [Documentation]   This should Navigate to Marketing page
    Launch the Browser
    Initialize configuration parameters
    ${Url}=   call method    ${ObjconfigReader}   environment
    Run keyword IF   '${Url}' == 'Dev'    Dev environment validation
    ...    ELSE IF   '${Url}' == 'Devfunc'  Dev environment validation
    ...    ELSE IF   '${Url}' == 'Stage'    Stage environment validation
    click on side menu icon
    verify Side Menu List
    go to marketing cloud

Launch the Application and navigate to AutomationFiono
    [Documentation]   This should Navigate to Marketing page
    Launch the Browser
    Initialize configuration parameters
    ${Url}=   call method    ${ObjconfigReader}   environment
    Run keyword IF   '${Url}' == 'Dev'    Dev environment validation
    ...    ELSE IF   '${Url}' == 'Devfunc'  Dev environment validation
    ...    ELSE IF   '${Url}' == 'Stage'    Stage environment validation for AutomationFiono
    click on side menu icon
    verify Side Menu List
    go to marketing cloud

Launch the Application for usercsc@calix.com and navigate to cmc
    [Documentation]   Login to usercsc@calix.com user and Navigate to Marketing page
    Launch the Browser
    Initialize configuration parameters
    ${Url}=   call method    ${ObjconfigReader}   environment
    Run keyword IF   '${Url}' == 'Dev'    Dev environment validation
    ...    ELSE IF   '${Url}' == 'Devfunc'  Dev environment validation
    ...    ELSE IF   '${Url}' == 'Stage'    Stage env validation for userCSC@calix.com
    click on side menu icon
    verify Side Menu List
    go to marketing cloud

Launch the Application for Allo org and navigate to cmc
    [Documentation]   Login to Allo org user and Navigate to Marketing page
    Launch the Browser
    Initialize configuration parameters
    ${Url}=   call method    ${ObjconfigReader}   environment
    Run keyword IF   '${Url}' == 'Dev'    Dev environment validation
    ...    ELSE IF   '${Url}' == 'Devfunc'  Dev environment validation
    ...    ELSE IF   '${Url}' == 'Stage'    Stage environment validation for allo org user
    click on side menu icon
    verify Side Menu List
    go to marketing cloud

Launch the Application for cmc automation user and navigate to cmc
    [Documentation]   Login to cmc automation user and Navigate to Marketing page
    Launch the Browser
    Initialize configuration parameters
    ${Url}=   call method    ${ObjconfigReader}   environment
    Run keyword IF   '${Url}' == 'Dev'    Dev environment validation
    ...    ELSE IF   '${Url}' == 'Devfunc'  Dev environment validation
    ...    ELSE IF   '${Url}' == 'Stage'    Stage environment validation for cmc automation user
    click on side menu icon
    verify Side Menu List
    go to marketing cloud


Close the browsers
    [Documentation]   This keyword is used to close all Open Browser
    close all browsers
#    DB Call for End the Report update