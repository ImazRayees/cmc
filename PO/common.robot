*** Settings ***
Documentation    keyword library
Library         SeleniumLibrary  timeout=0.5 seconds  run_on_failure=None
Library         OperatingSystem
Library         DateTime
Library         String
Library         Collections
Variables        ../utils/CalixAdmin-APIv2.py
*** Variables ***
${timeout} =    0.5 seconds

*** Keywords ***
#Capture screenshot if failed
#    Set Library Search Order  seleniumlibrary
#    Run Keyword If Test Failed    Capture Page Screenshot  ${screenshot_directory}${TEST NAME}.png

API Response Validation
     [Arguments]     ${APIMethod}     ${Responsecode}
     ${response}=   call method    ${CMCAdminconnectionObj}   ${APIMethod}
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
    [Arguments]  ${locator}    ${timeout}
    Set Library Search Order  seleniumlibrary
    Wait Until Element Is Visible  ${locator}  timeout=${timeout}
    click element  ${locator}
    Sleep  2

Enter the Value Untill Visible
    [Documentation]  Wait until element is visible and then Enter the Value
    [Arguments]  ${locator}  ${TextValue}
    Set Library Search Order  seleniumlibrary
    Wait Until Element Is Visible  ${locator}  timeout=${timeout}
    input text    ${locator}      ${TextValue}

Page should contain the element
    [Documentation]  wait until Page should contains element
    [Arguments]    ${TextValue}       ${short_timeout}
    Set Library Search Order  seleniumlibrary
    Wait Until Element Is Visible  ${TextValue}  timeout=${timeout}
    page should contain    ${TextValue}

Get the Text from the Element
    [Documentation]  wait until Text should be displayed
    [Arguments]    ${TextID}
    Set Library Search Order  seleniumlibrary
    Wait Until Element Is Visible  ${TextID}  timeout=${timeout}
    ${TEXTData}=    get text    ${TextID}
    [Return]    ${TEXTData}


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
     ${response}=   call method       ${CMCAdminconnectionObj}    ${methodname}
     ${columns}=    get element count  ${Rowxpath}
     FOR    ${row}  IN RANGE  1  ${columns}+1
         ${data_table}=    Handle Table Data    ${row}     ${columnxpath}
         append to list    ${Tablelist}     ${data_table}    ${columnxpath}    ${response}
     END
     [Return]    ${data_table}

Get the Data from Bar Graph Widgets
        [Arguments]    ${DataXpath}    ${TipXpath}    ${methodname}
        ${Tooltip_defauld}=  Set Variable    0
        ${response}=   call method    ${CMCAdminconnectionObj}    ${methodname}
        @{Tooltip_List}=    Create List
        @{Get_tooltip}=   Get WebElements  ${DataXpath}
        ${sum}=   Set Variable    ${0}
        FOR  ${tooltiplocation}  IN   @{Get_tooltip}
        ${height_value}=   Get Element Attribute  ${tooltiplocation}    height
        ${height_value1}=    CONVERT TO INTEGER  ${height_value}
        Run Keyword If    ${height_value1} == 0      append to list    ${Tooltip_List}    ${Tooltip_defauld}
        ...    ELSE    ${Tooltip_defauld} =    Get the ToolTip Value of Bar Graph Widgets   ${tooltiplocation}    ${TipXpath}    ${response}    ${sum}
        ${sum} =    Evaluate  ${sum}+${1}
#        append to list    ${Tooltip_List}       ${Tooltip_defauld}
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
      Wait Until Element Is Visible  ${locator}  timeout=${timeout}

Wait Until Page Contain Elements
    [Documentation]  Wait Until Page Contain Elements
    [Arguments]  @{multi_element}
    Set Library Search Order  seleniumlibrary
    FOR  ${element}  IN  @{multi_element}
      Wait Until Page Contains Element  ${element}  timeout=${timeout}

Page Should Contain Multiple Text
    [Documentation]  Page should contain multiple text at the same time
    [Arguments]  @{multi_text}
    FOR  ${text}  IN  @{multi_text}
    \  Page Should Contain  ${text}

Table Header Should Contain Mutiple Text
    [Documentation]  Table header should contain mutiple text at the same time
    [Arguments]  ${locator}  @{multi_text}
    FOR  ${text}  IN  @{multi_text}
    \  Table Header Should Contain  ${locator}  ${text}

Page Should Contain Multiple Element
    [Documentation]  Page should contain multiple element at the same time
    [Arguments]  @{multi_element}
    FOR  ${element}  IN  @{multi_element}
    \  Page Should Contain Element  ${element}

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
