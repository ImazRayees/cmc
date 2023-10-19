*** Settings ***
Documentation     Library for parsing the Network Topology Information
Library           PythonLib/config_parser.py
Library           String

*** Keywords ***

Parsing locators information
    #### This keyword parses the locators information from yaml file
    Set Log Level    NONE
    ${locators_params}=    parse_yaml    ${CURDIR}${/}Configure${/}Variables${/}Locatorparams.yml
    Set Log Level    INFO
    Set suite variable    ${locators_params}
    Log    ${locators_params}

Parsing test Data Config for Stage/Dev
    ${Url}=   call method    ${ObjconfigReader}   environment
    run keyword if  '${Url}' == 'Stage'   Run Keyword   Parsing test data config
    ...  ELSE IF   '${Url}' == 'Devfunc'  Run Keyword   Parsing Dev test data config
    ...  ELSE IF   '${Url}' == 'Dev'  Run Keyword   Parsing Dev test data config

Parsing test data config
    #### This keyword parses the test data config from yaml file
    Set Log Level    NONE
    ${test_data_config}=    parse_yaml    ${CURDIR}${/}Configure${/}env${/}stg.yml
    Set Log Level    INFO
    Set suite variable    ${test_data_config}
    Log    ${test_data_config}

Parsing Dev test data config
    #### This keyword parses the test data config from yaml file
    Set Log Level    NONE
    ${test_data_config}=    parse_yaml    ${CURDIR}${/}configure${/}env${/}dev.yml
    Set Log Level    INFO
    Set suite variable    ${test_data_config}
    Log    ${test_data_config}

