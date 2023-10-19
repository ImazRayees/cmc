*** Settings ***
Library         SeleniumLibrary  timeout=30 seconds  run_on_failure=Capture Page Screenshot
Library         OperatingSystem
Library         DateTime
Library         String
Library         Collections
Variables        ../utils/CMC-API.py
Variables        ../utils/OptimizeAPI.py
Library         RequestsLibrary
Resource       ../ConfigParserKeywords.robot

*** Variables ***
${timeout} =    60.0 seconds
${long_timeout}=    60.0 seconds
${subscriber.search.input}=     id=inputKey
${logo}=     dom:$("a[href='/']")
${subscriber.back_btn}=      id=back_search
${legendDisabled}=  //*[contains(@class,'legend-item-hidden')]
${pendo_close}=  //*[@class='_pendo-close-guide']
*** Keywords ***
#Capture screenshot if failed
#    [Arguments]    ${ScreenName}
#    Set Library Search Order  seleniumlibrary
#    Run Keyword If Test Failed    Capture Page Screenshot  ${screenshot_directory}${TEST NAME}.png

Initialize configuration parameters
    [Documentation]   It will Initialize the Configuration file for locators and testdata's for both dev and stage
    Parsing locators information
    Parsing test Data Config for Stage/Dev
    ${Url}=   call method    ${ObjconfigReader}   environment
    run keyword if   '${Url}' == 'Dev'    ConfigReader dev
    ...   ELSE IF   '${Url}' == 'Devfunc'    ConfigReader devfunc
    ...   ELSE IF   '${Url}' == 'Stage'    ConfigReader Stage
    APIReponse Login

Download should be done
    [Arguments]    ${directory}
    [Documentation]    Verifies that the directory has only one folder and it is not a temp file.
    ...
    ...    Returns path to the file
    ${files}    List Files In Directory    ${directory}
    Length Should Be    ${files}    1    Should be only one file in the download folder
    Should Not Match Regexp    ${files[0]}    (?i).*\\.tmp    Chrome is still downloading a file
    ${file}    Join Path    ${directory}    ${files[0]}
    Log    File was successfully downloaded to ${file}
    [Return]    ${file}

Return To Homepage
    Set Library Search Order  seleniumlibrary
    ${input_exist}=  Run Keyword And Return Status  Element Should Be Visible  ${subscriber.search.input}
    Run Keyword Unless  ${input_exist}  Run Keywords  Click Element  ${logo}
    ...  AND  Wait Until Element Is Visible  ${subscriber.search.input}

Click The First Record From Filter
    [Arguments]  ${search_input}
    Execute Javascript  $('td:contains(${search_input})').first().click()
    Wait Until Element Is Visible  ${subscriber.back_btn}

Capture the Screen
    [Arguments]    ${ScreenName}
    Set Library Search Order  seleniumlibrary
    sleep    2
    Capture Page Screenshot    ${ScreenName}.png

JS click element
    [Documentation]  To click hidden element
    [Arguments]     ${element_xpath}
    # escape " characters of xpath
    ${element_xpath}=       Replace String      ${element_xpath}        \"  \\\"
    Execute JavaScript  document.evaluate("${element_xpath}", document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();

Broken links test
    [Arguments]    ${BASE_URL}
    ${element_list}=     get webelements     xpath=//a[@href]
    ${href_list}=  Evaluate  [item.get_attribute('href') for item in $element_list]
    Log    ${href_list}
    Create Session    testing    ${BASE_URL}
    FOR    ${element_href}    IN    @{href_list}
        ${uri}=    Remove String    ${element_href}    ${BASE_URL}
        ${contains_base_url}=    Evaluate     "${BASE_URL}" in "${element_href}"
        ${response}=    Run Keyword If    ${contains_base_url}    Get Request    testing    ${uri}
        Run Keyword If    ${contains_base_url}    Should Be Equal As Strings     ${response.status_code}    200
    END


Check the all images are broken or not in the screen
   ${img_count}=  Get Element Count  tag:img

   # get available image tags src and store in list
   @{img_src}=  Create List
   FOR  ${img}  IN RANGE  1  ${img_count}+1
       ${index}=  Convert To Integer  ${img}
       ${src}=  Get Element Attribute  (//img)[${index}]  src
       Append To List  ${img_src}  ${src}
   END
   # validate image status
   FOR  ${img}  IN  @{img_src}
       Create Session  broken_image  ${img}
       ${response}=  Get Request  broken_image  /
       Log  ${response}
       # Add you validation here like
       Should Be Equal As Strings  ${response.status_code}  200
   END


API Response Validation
     [Arguments]     ${APIMethod}     ${Responsecode}
     ${response}=   call method    ${CMCconnectionObj}    ${APIMethod}
     log to console    ${response}
     should contain     '''${response}'''     ${Responsecode}
     [Return]    ${response}

Get Element Bgcolor Hex
    [Documentation]  Get the background color of the element
    [Arguments]  ${element}    ${ExpectedColor}
    ${web_element}=  Get Webelement  ${element}
    ${color_rgba}=  Call Method  ${web_element}  value_of_css_property  background-color
    ${index}=  Evaluate  "${color_rgba}".find("(")
    ${color_tuple}=  Evaluate  eval("${color_rgba}"[${index}:])
    ${color_hex}=  Evaluate  '#{:02x}{:02x}{:02x}'.format(*${color_tuple})
    should be equal    '${color_hex}'    ${ExpectedColor}
    [Return]  ${color_hex}

Get Element Color Hex
    [Documentation]  Get the color of the element
    [Arguments]  ${element}
    ${web_element}=  Get Webelement  ${element}
    ${color_rgba}=  Call Method  ${web_element}  value_of_css_property  color
    ${index}=  Evaluate  "${color_rgba}".find("(")
    ${color_tuple}=  Evaluate  eval("${color_rgba}"[${index}:])
    ${color_hex}=  Evaluate  '#{:02x}{:02x}{:02x}'.format(*${color_tuple})
    [Return]  ${color_hex}

Click Element Until Enabled
    [Documentation]  Wait until element is enabled and then click element
    [Arguments]    ${locator}
    Set Library Search Order  seleniumlibrary
    Wait Until Element Is Enabled  ${locator}  timeout=${timeout}
    click element  ${locator}

Click Element Until Visible
    [Documentation]  Wait until element is visible and then click element
    [Arguments]  ${locator}
    Set Library Search Order  seleniumlibrary
    Wait Until Page Contains Element  ${locator}  timeout=${timeout}
    click element  ${locator}
    sleep  1


Enter the Value Untill Visible
    [Documentation]  Wait until element is visible and then Enter the Value
    [Arguments]  ${locator}  ${TextValue}
    Set Library Search Order  seleniumlibrary
    Wait Until Element Is Visible  ${locator}  timeout=${timeout}
    Clear the Element Text with Presskeys   ${locator}
    input text    ${locator}      ${TextValue}

Page should contain the element
    [Documentation]  wait until Page should contains element
    [Arguments]    ${TextValue}
    Set Library Search Order  seleniumlibrary
    page should contain    ${TextValue}

Get the Text from the Element
    [Documentation]  wait until Text should be displayed
    [Arguments]    ${TextID}
    Set Library Search Order  seleniumlibrary
    Wait Until Element Is Visible  ${TextID}  timeout=${timeout}
    ${TEXTData}=    get text    ${TextID}
    [Return]    ${TEXTData}

Table Data Validation with drill down data
    [Documentation]  Get the Table Data
    [Arguments]    ${Rowxpath}    ${columnxpath}    ${methodname}    ${Table_ID}
        set selenium implicit wait    60 seconds
        set selenium timeout    60 seconds
        ${response}=   call method    ${API_CMCObj}   ${methodname}
        sleep    5
        ${rows}=    get element count    ${Rowxpath}
        ${sum}=   Set Variable    ${0}
        FOR    ${row}  IN RANGE  1  ${rows}
        Handle Table drill down   ${row}    ${response}    ${columnxpath}    ${Table_ID}
        END

Handle Table drill down
#       [Arguments]    ${test_row}
       [Arguments]    ${test_row}    ${test_response_Retention_Table_Data}    ${columnxpath}    ${Table_ID}
       set selenium implicit wait    60 seconds
       set selenium timeout    60 seconds
       ${columns}=    get element count  ${columnxpath}
       FOR   ${column}    IN RANGE   1    ${columns}
       ${data_table}  get text   //*[@id='${Table_ID}']/tr[${test_row}]/td[${column}]
       log to console    ${data_table}
       ${row_data1}=    Evaluate   ${test_row}-${1}
       ${column_data1}=   Evaluate    ${column}-${1}
       ${ConvertAPI}=    convert to string    ${test_response_Retention_Table_Data}[1][${row_data1}] [${column_data1}]
       should contain   ${ConvertAPI}  ${data_table}
       log   ${data_table}
       END


Table Data Validation with drill down data with tbody
    [Documentation]  Get the Table Data
    [Arguments]    ${Rowxpath}    ${columnxpath}    ${methodname}    ${Table_ID}
        set selenium implicit wait    60 seconds
        set selenium timeout    60 seconds
        ${response}=   call method    ${API_CMCObj}   ${methodname}
        sleep    5
        ${rows}=    get element count    ${Rowxpath}
        ${sum}=   Set Variable    ${0}
        FOR    ${row}  IN RANGE  1  ${rows}
        Handle Table drill down with tbody   ${row}    ${response}    ${columnxpath}    ${Table_ID}
        END

Handle Table drill down with tbody
#       [Arguments]    ${test_row}
       [Arguments]    ${test_row}    ${test_response_Retention_Table_Data}    ${columnxpath}    ${Table_ID}
       set selenium implicit wait    60 seconds
       set selenium timeout    60 seconds
       ${columns}=    get element count  ${columnxpath}
       FOR   ${column}    IN RANGE   1    ${columns}
       ${data_table}  get text   //*[@id='${Table_ID}']/tbody/tr[${test_row}]/td[${column}]
       log to console    ${data_table}
       ${row_data1}=    Evaluate   ${test_row}-${1}
       ${column_data1}=   Evaluate    ${column}-${1}
       ${ConvertAPI}=    convert to string    ${test_response_Retention_Table_Data}[1][${row_data1}] [${column_data1}]
       should contain   ${ConvertAPI}  ${data_table}
       log   ${data_table}
       END





Get Table Data without API Call
    [Documentation]  Get the Table Data
    [Arguments]    ${Rowxpath}    ${columnxpath}
     @{Tablelist}=    Create List
     ${columns}=    get element count  ${Rowxpath}
       FOR    ${row}  IN RANGE  1  ${columns}+1
         ${data_table}=    Handle Table Data without API    ${row}     ${columnxpath}
         append to list    ${Tablelist}     ${data_table}
        END
#     [Return]    ${data_table}

Handle Table Data without API
       [Arguments]    ${test_row}    ${columnxpath}
       @{Tablelist}=    Create List
       ${columns}=    get element count  ${columnxpath}
       FOR   ${column}    IN RANGE   1    ${columns}
         ${data_table}    get text   xpath=//tbody/tr[${test_row}]/td[${column}]
#         append to list    ${Tablelist}     ${data_table}
#         ${row_data1}=    Evaluate   ${test_row}-${1}
#         ${column_data1}=   Evaluate    ${column}-${1}
       log to console    ${data_table}
       END
#       [Return]    ${Tablelist}

Get Table Data without API Call data with last cloumn
    [Documentation]  Get the Table Data
    [Arguments]    ${Rowxpath}    ${columnxpath}
     @{Tablelist}=    Create List
     ${columns}=    get element count  ${Rowxpath}
       FOR    ${row}  IN RANGE  1  ${columns}+1
         ${data_table}=    Handle Table Data without API data with last cloum   ${row}     ${columnxpath}
         append to list    ${Tablelist}     ${data_table}
        END
     [Return]    ${data_table}

Handle Table Data without API data with last cloum
       [Arguments]    ${test_row}    ${columnxpath}
       @{Tablelist}=    Create List
       ${columns}=    get element count  ${columnxpath}
       FOR   ${column}    IN RANGE   1    ${columns}+1
         ${data_table}    get text   xpath=//tbody/tr[${test_row}]/td[${column}]
#         append to list    ${Tablelist}     ${data_table}
         ${row_data1}=    Evaluate   ${test_row}-${1}
         ${column_data1}=   Evaluate    ${column}-${1}
       log to console    ${data_table}
       END
       [Return]    ${Tablelist}


Get the Full Table data
    [Documentation]  Get the Table Data
    [Arguments]    ${Rowxpath}    ${columnxpath}    ${CMCconnectionObj}    ${methodname}
     @{Tablelist}=    Create List
     ${response}=   call method       ${CMCconnectionObj}    ${methodname}
     ${columns}=    get element count  ${Rowxpath}
       FOR    ${row}  IN RANGE  1  ${columns}+1
         ${data_table}=    Handle Table Data    ${row}     ${columnxpath}    ${response}
         append to list    ${Tablelist}     ${data_table}
        END
     [Return]    ${data_table}

Handle Table Data
       [Arguments]    ${test_row}    ${columnxpath}    ${response_Table_Data}
       @{Tablelist}=    Create List
       ${columns}=    get element count  ${columnxpath}
       FOR   ${column}    IN RANGE   1    ${columns}
         ${data_table}    get text   xpath=//tbody/tr[${test_row}]/td[${column}]
         append to list    ${Tablelist}     ${data_table}
         ${row_data1}=    Evaluate   ${test_row}-${1}
         ${column_data1}=   Evaluate    ${column}-${1}
         ${ConvertAPI}=    convert to string    ${response_Table_Data}[1][${row_data1}] [${column_data1}]
         should contain   ${ConvertAPI}  ${data_table}
       log to console    ${data_table}
       END
       [Return]    ${Tablelist}

Get Table Data without last column
    [Documentation]  Get the Table Data Content and last column has action buttons/graphs
    [Arguments]    ${Rowxpath}    ${columnxpath}   ${methodname}
     @{Tablelist}=    Create List
#     ${response}=   call method       ${CMCconnectionObj}     ${methodname}
     ${columns}=    get element count  ${Rowxpath}
     FOR    ${row}  IN RANGE  1  ${columns}+1
         ${data_table}=    Handle Table Data    ${row}     ${columnxpath}    ${methodname}
         append to list    ${Tablelist}     ${data_table}
     END
     [Return]    ${Tablelist}

Get the Data from Bar Graph Widgets No Hight
        [Arguments]    ${DataXpath}    ${TipXpath}    ${methodname}
        ${Tooltip_defauld}=  Set Variable    0
        ${response}=   call method    ${API_CMCObj}     ${methodname}
        log to console    ${response}[1]
        @{Tooltip_List}=    Create List
        @{Get_tooltip}=   Get WebElements  ${DataXpath}
        ${sum}=   Set Variable    ${0}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        sleep    2
        mouse over    ${tooltiplocation}
        ${TooltipText}=   get text    ${TipXpath}
        ${ConvertAPI}=    convert to string   ${response}[1][${sum}]
        ${height_value}=   Get Element Attribute  ${tooltiplocation}    opacity
        ${height_value1}=    CONVERT TO INTEGER  ${height_value}
        Run Keyword If    ${height_value1} == 0
        ...    Append To List    ${Tooltip_List}    '0'
        ...    ELSE    should contain    ${TooltipText}    ${ConvertAPI}
        ${sum} =    Evaluate  ${sum}+${1}
        END
        [Return]    ${Tooltip_List}


Get the Data from Bar Graph Widgets limit Iteration 5
        [Arguments]    ${DataXpath}    ${TipXpath}    ${methodname}
        ${Tooltip_defauld}=  Set Variable    0
        ${response}=   call method    ${API_CMCObj}     ${methodname}
        log to console    ${response}[1]
        @{Tooltip_List}=    Create List
        @{Get_tooltip}=   Get WebElements  ${DataXpath}
        ${sum}=   Set Variable    ${0}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        sleep    2
        mouse over    ${tooltiplocation}
        ${TooltipText}=   get text    ${TipXpath}
        ${ConvertAPI}=    convert to string   ${response}[1][${sum}]
        ${height_value}=   Get Element Attribute  ${tooltiplocation}    opacity
        ${height_value1}=    CONVERT TO INTEGER  ${height_value}
        Run Keyword If    ${height_value1} == 0
        ...    Append To List    ${Tooltip_List}    '0'
        ...    ELSE    should contain    ${TooltipText}    ${ConvertAPI}
        ${sum} =    Evaluate  ${sum}+${1}
        exit for loop if  ${sum}==5
        END
        [Return]    ${Tooltip_List}


Get the Data from Bar Graph Widgets
        [Arguments]    ${DataXpath}    ${TipXpath}    ${methodname}
        ${Tooltip_defauld}=  Set Variable    0
        ${response}=   call method    ${CMCconnectionObj}     ${methodname}
        log to console    ${response}[1]
        @{Tooltip_List}=    Create List
        @{Get_tooltip}=   Get WebElements  ${DataXpath}
        ${sum}=   Set Variable    ${0}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        sleep    2
        mouse over    ${tooltiplocation}
        ${TooltipText}=   get text    ${TipXpath}
        ${ConvertAPI}=    convert to string   ${response}[1][${sum}]
        ${height_value}=   Get Element Attribute  ${tooltiplocation}    height
        ${height_value1}=    CONVERT TO INTEGER  ${height_value}
        Run Keyword If    ${height_value1} == 0
        ...    Append To List    ${Tooltip_List}    '0'
        ...    ELSE    should contain    ${TooltipText}    ${ConvertAPI}
        ${sum} =    Evaluate  ${sum}+${1}
        END
        [Return]    ${Tooltip_List}

Get the ToolTip Value of Bar Graph Widgets
      [Arguments]    ${tooltiplocation}    ${ToolTipXpath}    ${response}    ${sum}
       ${ConvertAPI}=    convert to string   ${response}[1][${sum}]
       mouse over    ${tooltiplocation}
        ${TooltipText}=   get text    ${ToolTipXpath}
        should contain    ${TooltipText}    ${ConvertAPI}
       log to console   ${TooltipText}
       [Return]    ${TooltipText}

List comparision with Api List
      [Arguments]    ${UIList}    ${APIList}
      FOR  ${item}  IN  @{UIList}
        should contain    ${APIList}    ${item}
      END

Get the Data from circle widgets
        [Arguments]    ${ElementXpath}    ${ToolTipXpath}
        @{Tooltip_List}=    Create List
        @{Get_tooltip}=   Get WebElements  ${ElementXpath}
        ${sum}=   Set Variable    ${0}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
         mouse over    ${tooltiplocation}
         ${TooltipText}=   get text    ${ToolTipXpath}
         append to list     ${Tooltip_List}     ${TooltipText}
        END
        [Return]     ${Tooltip_List}

get tooltip data from bar graph widget
        [Arguments]    ${ElementXpath}    ${ToolTipXpath}
        @{Get_tooltip}=   Get WebElements  ${ElementXpath}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        mouse over    ${tooltiplocation}
        ${TooltipText}=   get text    ${ToolTipXpath}
        END



Handle Alert Popup
         [Arguments]    ${AlertText}     ${YesButton}
         Wait Until Page Contains Element       ${YesButton}
         ${Alertmsg}=   get text    ${AlertText}
         click element    ${YesButton}

verify text inside Iframe
       [Documentation]  Check the Iframe Content
       [Arguments]    ${TextValue}
       current frame should contain    ${TextValue}

verify the content in Iframe from MainFrame
       [Documentation]  Check the content in Iframe from MainFrame
       [Arguments]    ${IframeId}    ${TextValue}
       frame should contain    ${IframeId}      ${TextValue}

Select the Iframe
       [Documentation]  Select the Iframe
       [Arguments]    ${Iframe_id}
       Select the Iframe    ${Iframe_id}

Switch to Main Frame
       [Documentation]  Back to Main Frame
       unselect frame

Wait Until Elements Are Visible
    [Documentation]  Wait Until Multiple Elements Are Visible
    [Arguments]  @{multi_element}
    Set Library Search Order  seleniumlibrary
    FOR   ${locator}   IN    @{multi_element}
      Wait Until Element Is Visible  ${locator}     timeout=${timeout}
    END

Wait Until Page Contain Elements
    [Documentation]  Wait Until Page Contain Elements
    [Arguments]  @{multi_element}
    Set Library Search Order  seleniumlibrary
    FOR  ${element}  IN  @{multi_element}
      Wait Until Page Contains Element  ${element}  timeout=${timeout}
    END

Page Should Contain Multiple Text
    [Documentation]  Page should contain multiple text at the same time
    [Arguments]  @{multi_text}
    FOR  ${text}  IN  @{multi_text}
      Page Should Contain  ${text}
    END

Table Header Should Contain Mutiple Text
    [Documentation]  Table header should contain mutiple text at the same time
    [Arguments]  ${locator}  @{multi_text}
    FOR  ${text}  IN  @{multi_text}
      Table Header Should Contain  ${locator}  ${text}
    END

Page Should Contain Multiple Element
    [Documentation]  Page should contain multiple element at the same time
    [Arguments]  @{multi_element}
    FOR  ${element}  IN  @{multi_element}
      Page Should Contain Element  ${element}
    END

Page Should Not Contain Multiple Element
    [Documentation]  Page should not contain multiple element at the same time
    [Arguments]  @{multi_element}
    FOR  ${element}  IN  @{multi_element}
      Page Should Not Contain Element  ${element}
    END


Element count should at least one
    [Documentation]  Element has at least one
    [Arguments]  ${locator}
    # wait for element loading
    Sleep  2
    ${locator_count}=  Get element count  ${locator}
    Should be true   ${locator_count} > 0

Get table row index by text
    [Arguments]  ${table_css_locator}  ${text}
    # wait for table loading
    Sleep  2
    ${row_index}=  Execute Javascript
    ...  return ${table_css_locator}.find("td:contains(${text})").parent("tr").index()
    [Return]  ${row_index}

Check y_axis score num
    [Arguments]  ${y_axis_score}
    ${y_axis_score_num}=  Get Element Count  ${y_axis_score}
    log  y_axis_score_num:${y_axis_score_num}
    Should Be True  ${y_axis_score_num} > 1
    FOR  ${i}  IN RANGE  ${y_axis_score_num}
    \  ${scale_value}=  Get Text  ${y_axis_score}\[${i}\]
    \  log  ==scale_value:${scale_value}
    \  Should Not Contain  ${scale_value}  null

Get Checkbox
    [Arguments]  ${locator}
    ${value}=  Run Keyword And Return Status  Checkbox Should Be Selected  ${locator}
    [Return]    ${value}

Set Checkbox
    [Arguments]  ${locator}  ${visible_locator}  ${value}
    ${original_value}=  Get Checkbox  ${locator}
    Run Keyword Unless  '${original_value}' == '${value}'  Click Element  ${visible_locator}
    log  original:${original_value}, set to:${value}

Modify Input Text
    [Arguments]  ${locator}  ${value}
    ${original_value}=  Get Text By Id  ${locator}
    log  original:${original_value}, set to:${value}
    Run Keyword Unless  '${original_value}' == '${value}'  Input Text  ${locator}  ${value}

Get Text By Id
    [Arguments]  ${element_id}
    ${value}=  Execute Javascript  return $("#${element_id}").val()
    [Return]  ${value}

Input Text By Id Should Be
    [Arguments]  ${id}  ${expected_text}
    ${actual_text}=  Get Text By Id  ${id}
    Should Be Equal  ${actual_text}  ${expected_text}

Should Be Equal As Boolean
    [Arguments]  ${var1}  ${var2}
    ${var1_bool_type}=  Evaluate  type(${var1}) is bool
    ${bool_var1}=  Run Keyword Unless  ${var1_bool_type}  Convert To Boolean  ${var1}
    ...  ELSE  Set Variable  ${var1}
    ${var2_bool_type}=  Evaluate  type(${var2}) is bool
    ${bool_var2}=  Run Keyword Unless  ${var2_bool_type}  Convert To Boolean  ${var2}
    ...  ELSE  Set Variable  ${var2}
    Should Be Equal  ${bool_var1}  ${bool_var2}

Should Be Integer
    [Arguments]  ${var}
    ${stripped}=  Strip String  ${var}
    ${is_int}=  Evaluate  isinstance(${stripped}, int)
    Should Be True  ${is_int}

Get Percentage Vaule
    [Arguments]  ${var}
    ${stripped}=  Strip String  ${var}
    ${percentage_value}=  Fetch From Left  ${stripped}  %
    [Return]  ${percentage_value}


Table Row Should Contain Element
    [Arguments]  ${table_css_locator}  ${row}  ${element_css}
    ${element_locator}=  Set Variable  dom:${table_css_locator}.find('tr').eq(${row}).find('${element_css}')
    Wait Until Element Is Visible  ${element_locator}
    [Return]  ${element_locator}

Get Column Index By Table Header
    [Arguments]  ${table_css_locator}  ${th}
    ${column_index}=  Execute Javascript  return ${table_css_locator}.find("th:contains(${th})").index()
    [Return]  ${column_index}

Get Table Cell By Jquery
    [Arguments]  ${table_css_locator}  ${row}  ${column}
    ${value}=  Execute Javascript  return ${table_css_locator}.find("tr:not(:has(th))").eq(${row}).find("td").eq(${column}).text()
    [Return]  ${value}

Get Uniq NumString
    ${time}    Get Current Date    result_format=timestamp
    ${time_stamp}    Convert Date    ${time}    epoch
    ${time_stamp2}    evaluate    int(round(${time_stamp} * 1000))
    ${value}    Set Variable    ${time_stamp2}
    [Return]  ${value}

Get Verify drill down table header No height
        [Arguments]    ${Servicelense1_drilldown_get_tooltip}    ${methodname}    ${Servicelense1_drilldownHeader}
        @{Get_tooltip}=   Get WebElements  ${Servicelense1_drilldown_get_tooltip}
        ${sum}=   Set Variable    ${0}
        ${response}=   call method    ${API_CMCObj}     ${methodname}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        sleep    3
        ${height_value}=   Get Element Attribute  ${tooltiplocation}    opacity
        ${height_value1}=    CONVERT TO INTEGER  ${height_value}
        ${ConvertAPI}=    convert to string   ${response}[2][${sum}]
        Run Keyword If    ${height_value1} == 0    chart data zero validation
        ...    ELSE     chart data validation    ${tooltiplocation}    ${ConvertAPI}    ${Servicelense1_drilldownHeader}
        ${sum} =    Evaluate  ${sum}+${1}
        END

Get Verify drill down table header No height limit 5
        [Arguments]    ${Servicelense1_drilldown_get_tooltip}    ${methodname}    ${Servicelense1_drilldownHeader}
        @{Get_tooltip}=   Get WebElements  ${Servicelense1_drilldown_get_tooltip}
        ${sum}=   Set Variable    ${0}
        ${response}=   call method    ${API_CMCObj}     ${methodname}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        sleep    3
        ${height_value}=   Get Element Attribute  ${tooltiplocation}    opacity
        ${height_value1}=    CONVERT TO INTEGER  ${height_value}
        ${ConvertAPI}=    convert to string   ${response}[2][${sum}]
        Run Keyword If    ${height_value1} == 0    chart data zero validation
        ...    ELSE     chart data validation    ${tooltiplocation}    ${ConvertAPI}    ${Servicelense1_drilldownHeader}
        ${sum} =    Evaluate  ${sum}+${1}
        exit for loop if  ${sum}==5
        END


Get Verify drill down table header
        [Arguments]    ${Servicelense1_drilldown_get_tooltip}    ${methodname}    ${Servicelense1_drilldownHeader}
        @{Get_tooltip}=   Get WebElements  ${Servicelense1_drilldown_get_tooltip}
        ${sum}=   Set Variable    ${0}
        ${response}=   call method    ${CMCconnectionObj}     ${methodname}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        sleep    3
        ${height_value}=   Get Element Attribute  ${tooltiplocation}    height
        ${height_value1}=    CONVERT TO INTEGER  ${height_value}
        ${ConvertAPI}=    convert to string   ${response}[2][${sum}]
        Run Keyword If    ${height_value1} == 0    chart data zero validation
        ...    ELSE     chart data validation    ${tooltiplocation}    ${ConvertAPI}    ${Servicelense1_drilldownHeader}
        ${sum} =    Evaluate  ${sum}+${1}
        END


Get Verify drill down table header opacity
        [Arguments]    ${Servicelense1_drilldown_get_tooltip}    ${methodname}    ${Servicelense1_drilldownHeader}
        @{Get_tooltip}=   Get WebElements  ${Servicelense1_drilldown_get_tooltip}
        ${sum}=   Set Variable    ${0}
        ${response}=   call method    ${API_CMCObj}     ${methodname}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        sleep    3
        ${height_value}=   Get Element Attribute  ${tooltiplocation}    opacity
        ${height_value1}=    CONVERT TO INTEGER  ${height_value}
        ${ConvertAPI}=    convert to string   ${response}[2][${sum}]
        Run Keyword If    ${height_value1} == 0    chart data zero validation
        ...    ELSE     chart data validation    ${tooltiplocation}    ${ConvertAPI}    ${Servicelense1_drilldownHeader}
        ${sum} =    Evaluate  ${sum}+${1}
        END



chart data validation
        [Arguments]    ${tooltiplocation}    ${ConvertAPI}    ${Servicelense1_drilldownHeader}
        Set Focus To Element   ${tooltiplocation}
        click element until visible  ${tooltiplocation}
        sleep    5
        ${getText}=    get text    ${Servicelense1_drilldownHeader}
        should contain     ${getText}     ${ConvertAPI}


chart data zero validation
         log to console    chart zero


Get text from Multiple Element
    [Documentation]  Page should contain multiple element at the same time
    [Arguments]  @{multi_element}
    @{list}=  Create List
    FOR  ${element}  IN  @{multi_element}
    ${elements}  get text  ${element}
    append to list  ${list}  ${elements}
    END


scroll horizontal and then vertical
    [Arguments]  ${xPixel}  ${yPixel}
    Execute Javascript  window.scrollTo(${xPixel}, ${yPixel})


Get the Data from Bar Graph Widget without api call
     [Arguments]    ${barXpath}    ${TipXpath}
        @{Bars}=   Get WebElements  ${barXpath}
        FOR  ${bar}  IN   @{Bars}
        sleep  1
        mouse over    ${bar}
        sleep  1
        ${TooltipText}=   get text    ${TipXpath}
        log to console  ${tooltiptext}
        END


Turn Page To Find Expected Record
      [Arguments]  ${excepted_text}  ${tableId}
      log to console    ${excepted_text}
      FOR    ${i}    IN    99
      ${find_result}=  Run Keyword And Return Status  Wait Until Element Contains  ${tableId}  ${excepted_text}
      Exit For Loop If  ${find_result}
      Click Element Until Visible  //*[text()='Next']
      END


Get Table Data with table id
    [Documentation]  Get the Table Data
    [Arguments]    ${Rowxpath}    ${columnxpath}  ${tableID}
     @{Tablelist}=    Create List
     ${columns}=    get element count  ${Rowxpath}
       FOR    ${row}  IN RANGE  1  ${columns}+1
         ${data_table}=    Handle Table Data with table id    ${row}   ${columnxpath}  ${tableID}
         append to list    ${Tablelist}     ${data_table}
        END


Handle Table Data with table id
       [Arguments]    ${test_row}   ${columnxpath}  ${tableID}
       @{Tablelist}=    Create List
       ${columns}=    get element count  ${columnxpath}
       FOR   ${column}    IN RANGE   1    ${columns}+1
         ${data_table}    get text   xpath=${tableID}//tbody/tr[${test_row}]/td[${column}]
#         append to list    ${Tablelist}     ${data_table}
       log to console    ${data_table}
       END

Get value from Title attribute and compare
    [Arguments]  ${element}  ${comparingString}
    mouse over  ${element}
    ${attribute}=  get webelement  ${element}
    ${title}=  call method  ${attribute}  get_attribute  title
    should be equal as strings  ${title}  ${comparingString}


Page Should Not Contain Multiple Text
    [Documentation]  Page should not contain multiple text at the same time
    [Arguments]  @{multi_text}
    FOR  ${text}  IN  @{multi_text}
      Page Should Not Contain  ${text}
    END

validate legend buttons on the screen
    @{lgndBtns}=  get webelements  //*[contains(@class,'legend-item')]
    FOR  ${btn}  IN  @{lgndBtns}
    click and validate legend buttons  ${btn}
    END


wait until page contains multiple text
    [Documentation]  Wait Until Page Contain  multiple text
    [Arguments]  @{multi_text}
    Set Library Search Order  seleniumlibrary
    FOR  ${element}  IN  @{multi_text}
      Wait Until Page Contains  ${element}  timeout=${timeout}
    END

To Reload Page
    Reload Page
    sleep  5

Fail if list contains duplicates
    [Arguments]  ${dropdownName}  ${dropdownListElement}
    wait until page contains element  ${dropdownListElement}  30s
    ${list}=  Create List
    @{elements}=  get webelements  ${dropdownListElement}
    FOR  ${element}  IN  @{elements}
    ${text}=  get text  ${element}
    Append To List  ${list}  ${text}
    END

Wait until loader spinner disappears
    wait until page does not contain element   //*[contains(@class,'spinner')]  60s

Mouse over a pendo question icon and verify the guide text
    [Arguments]  ${screenName}  ${pendoelement}  ${text}
#    click element  ${pendoelement}
    Mouse Over    ${pendoelement}
#    wait until page contains multiple text  ${text}
#    capture the screen  ${screenName}-pendo
#    click element until visible  ${pendo_close}

Mouse over a pendo and verify the text
    [Arguments]  ${chartName}  ${pendoelement}  ${text}
    Mouse Over    ${pendoelement}
    wait until page contains   ${text}  5s
    capture the screen  ${chartName}-pendo
    click element until visible  ${pendo_close}

Click on pendo ques icon and verify the text
    [Arguments]  ${chartName}  ${pendoelement}  ${text}
    click element until visible    ${pendoelement}
    wait until page contains   ${text}  5s
    capture the screen  ${chartName}-pendo
    click element until visible  ${pendo_close}

Pendo video icon validation
    [Arguments]  ${Name}  ${pendoElement}
    click element  ${pendoElement}
    wait until page contains element  ${pendo_videopopup}
    capture the screen  ${Name}-videoPendo
    click element  ${pendo_close}

Convert to coma separated Int value
	    [Arguments]  ${int_variable}
        ${value}=      Evaluate     "{:,}".format($int_variable)
        [Return]   ${value}

Floating values on bar charts should contain % icon
    [Arguments]  ${chartName}  ${floatingValuesListElement}
    @{elements}=  get webelements  ${floatingValuesListElement}
    FOR  ${element}  IN  @{elements}
    ${label}=  get text  ${element}
    should contain  ${label}    %
    END

Get Dropdown Actual Lists
    [Documentation]   Click the Dropdown and get the dropdown lists
    [Arguments]  ${Click_Dropdown}   ${listof_webelements}
    click element until visible  ${Click_Dropdown}
    ${Actual_dropdown}=   Create List
    @{elements}=   Get WebElements   ${listof_webelements}
    FOR  ${element}  IN  @{elements}
    ${text}=  get text   ${element}
    Append to list  ${Actual_dropdown}  ${text}
    END
    log   ${Actual_dropdown}
    [Return]     ${Actual_dropdown}

Select value from filter
    [Documentation]  select the value from the Dropdown/Filter
    [Arguments]  ${filter}  ${value}
    click element until visible  ${filter}
    click element until visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${value}')]
    element should contain  ${filter}  ${value}

Wait Until Element Visible
    [Documentation]  Wait until the element is visible
    [Arguments]  ${locator}
    Set Library Search Order  seleniumlibrary
    Wait Until Element Is Visible  ${locator}  timeout=${timeout}

Element Should not Visible
    [Documentation]  Wait Until Element Are not Visible
    [Arguments]  ${locator}
    Set Library Search Order  seleniumlibrary
    Element Should Not Be Visible  ${locator}     timeout=${timeout}

Get text and Ensure the Headers are Equal
    [Documentation]  Get the header text from UI and Match with Expected text(NOTE: Path should be Common for all elements)
    [Arguments]  ${locator}   @{list}
    ${Headers_count}=    get element count  ${locator}
    ${Headers_txt}=    get webelements  ${locator}
    FOR   ${Header_count}    IN RANGE   0    ${Headers_count}
    ${Element_UI}=   get from list    ${Headers_txt}   ${Header_count}
    ${Header_UI}=    get text    ${Element_UI}
    ${Expected}=  get from list   ${list}   ${Header_count}
    should be equal   ${Header_UI}   ${Expected}
    log   ${Header_UI}
    log   ${Expected}
    END

Wait Until Page Does Not Contain Elements
    [Documentation]  Wait Until Page Not Contain Elements
    [Arguments]  @{multi_element}
    Set Library Search Order  seleniumlibrary
    FOR  ${element}  IN  @{multi_element}
      Wait Until Page Does Not Contain Element  ${element}  timeout=${timeout}
    END

Elements Should Not Visible
    [Documentation]  Wait until multiple elements Should Not Visible
    [Arguments]  @{multi_element}
    Set Library Search Order  seleniumlibrary
    FOR   ${locator}   IN    @{multi_element}
      Element Should Not Be Visible  ${locator}     timeout=${timeout}
    END

Clear the Element Text with Presskeys
   [Arguments]   ${locator}
   [Documentation]   This keyword will find the running machine OS and run the Presskeys based on OS
   ${platform}=   Evaluate  sys.platform  sys
   log  ${platform}
   run keyword if   '${platform}' == 'win32'   Presskeys for Windows   ${locator}
   ...  ELSE IF   '${platform}' == 'darwin'   Presskeys for Mac   ${locator}

Presskeys for Windows
   [Documentation]   Presskeys for clear the textfield in Windows
   [Arguments]  ${locator}
   press keys  ${locator}  CTRL+a+BACKSPACE

Presskeys for Mac
   [Documentation]   Presskeys for clear the textfield in Mac
   [Arguments]  ${locator}
   press keys   ${locator}   shift+BACKSPACE+command

Get Text and Assert
    [Documentation]  Get the text and check UI showed expected result
    [Arguments]    ${TextID}  ${text}
    Set Library Search Order  seleniumlibrary
    Wait Until Element Is Visible  ${TextID}   timeout=${timeout}
    ${TEXTData}=    get text    ${TextID}
    should be equal   ${TEXTData}   ${text}