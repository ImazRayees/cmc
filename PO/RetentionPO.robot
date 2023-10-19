*** Settings ***
Documentation    Suite description
Library    SeleniumLibrary
Variables   ../utils/RetentionAPI.py
*** Variables ***
${Retentionlink}=    link=Retention
${Subscriber}=    xpath=//*[@id="left-menu-control-div"]
${Tableview}=   xpath=//*[@id="map_controls_div_from_html"]/div[2]/span[1]/button
${exportText}=  xpath=//*[@id="map_controls_div_from_html"]/div[2]/span[2]/button
${MenuIcon_retension}=  xpath=//*[@id="map_controls_div_from_html"]/div[2]/span[3]/button
${Drawbutton}=    xpath=//*[@id="freehandControlOptionDiv"]
${PanControlbutton}=    xpath=//*[@id="panControlOptionDivId"]
${SubMenubar}=    xpath=//*[@id="show-all-subscribers"]/label
${heatmapmenubar}=    xpath=//*[@id="show-attainable-heat-map"]/label
${upsellmenubar}=   xpath=//*[@id="upsell-oppurtunity"]
${technologiesmenubar}=    xpath=//*[@id="technologies"]
${customer-type}=    xpath=//*[@id="customer-type"]
${selectAllSubscriber}=    xpath=//*[@id="span-6DXbCQ4696w8bhwrr"]/input
${clickback}=    xpath=//*[@class="fa fa-backward"]
${selectSubscriber}=    xpath=//*[@id="tabledropdownMenuContent"]/a[1]
${RetenTablerow}=     xpath=//*[@id="retention-append-table-list"]/tr
${RetenTablecolumn}=     xpath=//*[@id="retention-append-table-list"]/tr[1]/td
${CreateRetension}=    xpath=//button[@class='btn btn-success plus']
${Namefield}=    xpath=//*[@id="target-segment-form"]/div[1]/input
${descriptionfield}=    xpath=//*[@id="target-segment-form"]/div[2]/textarea
${regionDD}=    xpath=//*[@id="target-segment-form"]/div[3]/ng-select
${selectregion}=    xpath=//span[text()='SCOTTSBLUFF & GERING']
${locationDD}=    xpath=//*[@id="target-segment-form"]/div[4]/ng-select
${selectlocation}=  xpath=//*[@id="target-segment-form"]/div[4]/ng-select//span[text()='SCOTTSBLUFF & GERING']
${technologytype}=      xpath=//*[@id="target-segment-form"]/div[5]/ng-select
${selecttechtype}=      xpath=//span[text()='DSL']
${customertype}=    xpath=//*[@id="target-segment-form"]/div[8]/ng-select
${selectcustomertype}=  xpath=//span[text()='Residential']
${optDD}=    xpath=//*[@id="target-segment-form"]/div[9]/ng-select
${selectOPT}=  xpath=//span[text()='Opt-Out']
${excessBandwith}=  xpath=//*[@id="target-segment-form"]/div[10]/div[1]/ng-select
${selectbandwith}=  xpath=//ng-dropdown-panel//*[text()='Greater than']
${attainablerate}=  xpath=//*[@id="target-segment-form"]/div[11]/div[1]/ng-select
${WIFIDevices}=     xpath=//*[@id="target-segment-form"]/div[13]/input
${WifiScore}=       xpath=//*[@id="target-segment-form"]/div[14]/ng-select
${selectwifiscore}=     xpath=//span[text()='1']
${WAPOptionDD}=     xpath=//*[@id="target-segment-form"]/div[15]/ng-select
${selectWAP}=       xpath=//span[text()='Does not have WAP']
${MobileDD}=      xpath=//*[@id="target-segment-form"]/div[19]/ng-select
${selectAPP}=       xpath=//span[text()='Has Mobile App']
${inputparental}=      xpath=//*[@id="target-segment-form"]/div[17]/input
${RevenueDD}=       xpath=//*[@id="target-segment-form"]/div[18]/ng-select
${selectRevenue}=       xpath=//span[text()='ExperienceIQ']
${RetentionsaveBtn}=    xpath=//button[contains(text(),'Save')]
${selectcreated}=       xpath=//*[@title="All Subscribers"]/input
${editbtn}=            xpath=//*[@title="validation purpose for automation"]//button
${Retentiondeletebtn}=  xpath=//button[contains(text(),'Delete')]
${deleteNotificationmsg}=   xpath=//div[@class='confirm-delete']//*[@class='row']
${confirmdeletebtn}=    xpath=//button[@class='btn btn-primary btn-sm pull-right confirm-delete-btn-delete']
${Retentionpreviewbtn}=      xpath=//button[contains(text(),'Preview')]
${previewcount}=    xpath=//div[@class='mt-2']/p
${MovetoTop}=   xpath=//a[@class='logo']//img
${SwitchtoMAP}=     xpath=//span[contains(text(),'Map View')]
${CreateName}=  automation1
${Loader}=      xpath=//span[@class='spin-circle']
*** Keywords ***
Check the Retention link in Dashboard
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
    wait until element is visible   ${Retentionlink}

Click on Retention link in Dashboard
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
    sleep    15
    wait until element is not visible       ${Loader}
    page should contain    Retention
    click link    ${Retentionlink}

click on Map view of Retention
     click element    ${SwitchtoMAP}
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
     sleep    10
     wait until element is not visible       ${Loader}
validate the Retention Screen Content Tabs
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
    sleep    10
    wait until element is not visible       ${Loader}
    ${present}=    Run Keyword And Return Status    Element Should Be Visible   ${SwitchtoMAP}
    Run Keyword If    ${present}    click on Map view of Retention

                  ...  ELSE     log to console    Map View displayed
    wait until element is visible   ${Subscriber}
    ${text}=    get text    ${Subscriber}
    wait until element is visible   ${Tableview}
    ${Tabletext}=    get text    ${Tableview}
    ${ExportText}=  get text    ${exportText}
    page should contain element    ${MenuIcon_retension}
    page should contain element    ${Drawbutton}
    page should contain element    ${PanControlbutton}

validate the Retention Right Menu Map Controls Tab
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
    sleep    10
    wait until element is not visible       ${Loader}
    click element    ${MenuIcon_retension}
    ${Text}=    get text    ${SubMenubar}
    ${Heatmap}=    get text    ${heatmapmenubar}
    ${Upsel}=    get text    ${upsellmenubar}
    ${Technology}=    get text    ${technologiesmenubar}
    ${Customer}=    get text    ${customer-type}
    should contain    ${Text}     Show All Subscribers
    should contain    ${Heatmap}     Show Attainable Bitrate Heatmap
    should contain    ${Upsel}       Upsell Opportunity
    should contain    ${Technology}        Technologies
    should contain    ${Customer}       Customer Type
    click element    ${MenuIcon_retension}

validate the Retention Create Target Segmentation
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
    sleep    10
    wait until element is not visible       ${Loader}
    wait until element is visible   ${Subscriber}
    sleep    10
    click button    ${Subscriber}
#    wait until element is not visible       ${Loader}
    sleep    5
    wait until element is visible   ${CreateRetension}
    click button    ${CreateRetension}
    input text    ${Namefield}  ${CreateName}
    input text    ${descriptionfield}   validation purpose for automation
    scroll element into view    ${RevenueDD}
#    input text       ${WIFIDevices}     5
#    click element    ${WifiScore}
#    click element    ${selectwifiscore}
#    click element    ${WAPOptionDD}
#    click element    ${selectwap}
    click element    ${MobileDD}
    click element    ${selectAPP}
#    input text       ${inputparental}  5
#    click element    ${RevenueDD}
#    click element    ${selectRevenue}
    click element    ${RetentionsaveBtn}
#    Retention API Connection
#    ${Response_Newfilter}=     call method    ${connectionObj}   createprofile
#     ${ConvertAPI}=    convert to string     ${Response_Newfilter}
#    should contain    ${CreateName}      ${ConvertAPI}

validate the All Subscribers Table Data in Retention Screen
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
    sleep    10
#    wait until element is not visible       ${Loader}
    wait until element is enabled    ${Tableview}
    sleep    10
    click element    ${Tableview}
    click element    ${selectSubscriber}
    wait until element is not visible       ${Loader}
    sleep    5
    element should be visible    ${RetenTablecolumn}
    ${rows}=    get element count    ${RetenTablerow}
    ${cols}=    get element count    ${RetenTablecolumn}
#    Retention API Connection
#    ${Response_TargetSegment}=  call method    ${connectionObj}     RetentionData
#     ${ConvertAPI}=    convert to string    ${Response_TargetSegment}
    FOR    ${a}  IN RANGE  1  ${cols}+1
        ${data_table}  get text   xpath=//*[@id="retention-append-table-list"]/tr[1]/td[${a}]
#        should contain    ${data_table}    ${Response_TargetSegment}
        log to console    ${data_table}
     END
    click element    ${switchtomap}


validate the Preview Tab in Target Segmentation in Retention
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
    sleep    10
    wait until element is enabled    ${Subscriber}
    click button    ${Subscriber}
    wait until element is not visible       ${Loader}
    wait until element is enabled    ${editbtn}
    sleep    5
    click element    ${editbtn}
    click element    ${Retentionpreviewbtn}
#     wait until element is enabled    ${previewcount}
#    ${Usercount}=   get text    ${previewcount}
#    Retention API Connection
#    ${Response_Previewcount}=   call method    ${connectionObj}     previewcount_retention
#    ${ConvertAPI}=    convert to string     ${Response_Previewcount}
#    should contain      ${ConvertAPI}       ${Usercount}
    click element    ${RetentionsaveBtn}


validate the Retention edit Target Segmentation
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
    wait until element is not visible       ${Loader}
#    wait until element is enabled    ${Subscriber}
#    click button    ${Subscriber}
    sleep    10
    wait until element is enabled    ${editbtn}
    click element    ${editbtn}
    click element    ${Retentiondeletebtn}
    ${Notifiation_Msg}      get text    ${deleteNotificationmsg}
    click element    ${confirmdeletebtn}
    sleep    10
    wait until element is not visible       ${Loader}
    click element    ${clickback}


Retention API Connection
#       ${response_connection}=    call method    ${connectionObj}   WebsocketConnection
#       ${LoginResponse}=    call method    ${connectionObj}   login