*** Settings ***
Suite Setup  Run Keywords
...        Login to the Application and Navigate to usercmc for Pendo  AND
...        navigate to homescreen
Suite Teardown  Close the browsers
Resource   ../../TestSuites/Base.robot

*** Test Cases ***

validate data in homescreen
    [Tags]  HS_Regression  HS_Sanity
    ${Stage_url}=   call method    ${ObjconfigReader}   stageurl
    Run Keyword If  "${Stage_url}" == "https://cloud-stg.calix.com/"    getting data from insights in homescreen
    ...  ELSE  log  Skipped this validation due to pendo not available in Interbal build


Pendo ques icons validation - Homescreen
    [Tags]  HS_Regression  HS_Sanity
    ${Stage_url}=   call method    ${ObjconfigReader}   stageurl
    Run Keyword If  "${Stage_url}" == "https://cloud-stg.calix.com/"  Validate pendo ques icons in homescreen
    ...  ELSE  log  skipped validation as pendo not available on internal build