*** Settings ***
Documentation    Suite description
Library    SeleniumLibrary
Variables  ../utils/CMC-API.py
*** Variables ***
${upselllink}=    link=Upsell
${Subscriber}=    xpath=//*[@id="left-menu-control-div"]
${Tableview}=   xpath=//*[@id="map_controls_div_from_html"]/div[2]/span[1]/button
${exportText}=  xpath=//*[@id="map_controls_div_from_html"]/div[2]/span[2]/button
${MenuIcon_upsell}=  xpath=//*[@id="map_controls_div_from_html"]/div[2]/span[3]/button
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
${Tablerow}=     xpath=//*[@id="otherThanProspectTable"]/tbody/tr
${Tablecolumn}=     xpath=//*[@id="otherThanProspectTable"]/tbody/tr[1]/td
${createUpsell}=    xpath=//button[@class='btn btn-success plus']
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
${MobileAPPDD}=      xpath=//*[@id="target-segment-form"]/div[16]/ng-select
${selectAPP}=       xpath=//span[text()='Has Mobile App']
${inputparental}=      xpath=//*[@id="target-segment-form"]/div[17]/input
${RevenueDD}=       xpath=//*[@id="target-segment-form"]/div[18]/ng-select
${selectRevenue}=       xpath=//span[text()='ExperienceIQ']
${saveBtn}=     xpath=//button[contains(text(),'Save')]
${selectcreated}=       xpath=//*[@id="span-aKhJR3fMECH2Ymxbf"]/input
${editbtn}=     xpath=//*[@title="validation purpose for automation"]//button
${deletebtn}=   xpath=//button[contains(text(),'Delete')]
${deleteNotificationmsg}=   xpath=//div[@class='confirm-delete']//*[@class='row']
${confirmdeletebtn}=    xpath=//button[@class='btn btn-primary btn-sm pull-right confirm-delete-btn-delete']
${previewbtn}=      xpath=//button[contains(text(),'Preview')]
${previewcount}=    xpath=//div[@class='mt-2']/p
${MovetoTop}=   xpath=//a[@class='logo']//img
${SwitchtoMAP}=     xpath=//span[contains(text(),'Map View')]
${CreateName}=  automation
${Connection_response}=     connected
${Loader}=      xpath=//span[@class='spin-circle']
*** Keywords ***
Check the Upsell link in Dashboard
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
    execute javascript    window.scrollTo(0,-document.body.scrollHeight)
    sleep    10
    wait until element is not visible       ${Loader}
    wait until element is visible   ${upselllink}
    log to console    Check the Upsell link in Dashboard - completed

Click on Upsell link in Dashboard
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
    page should contain    Upsell
    click link    ${upselllink}
    log to console    Click on Upsell link in Dashboard - completed

click on Map view
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
    click element    ${SwitchtoMAP}
    log to console    click on Map view - completed

validate the Upsell Screen Content Tabs
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
    sleep    10
#    wait until element is not visible       ${Loader}
    ${present}=    Run Keyword And Return Status    Element Should Be Visible   ${SwitchtoMAP}
    Run Keyword If    ${present}    click on Map view

                  ...  ELSE     log to console    Map View displayed
    wait until element is visible   ${Subscriber}
    ${text}=    get text    ${Subscriber}
    wait until element is visible   ${Tableview}
    ${Tabletext}=    get text    ${Tableview}
    ${ExportText}=  get text    ${exportText}
    page should contain element    ${MenuIcon_upsell}
    page should contain element    ${Drawbutton}
    page should contain element    ${PanControlbutton}
    log to console    validate the Upsell Screen Content Tabs - completed

validate the Upsell Right Menu Map Controls Tab
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
     sleep    10
#    wait until element is not visible       ${Loader}
    click element    ${MenuIcon_upsell}
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
    click element    ${MenuIcon_upsell}

validate the Upsell Create Target Segmentation
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
    sleep    15
    wait until element is visible   ${Subscriber}
    sleep    5
    click button    ${Subscriber}
#    wait until element is not visible       ${Loader}
    sleep    5
    wait until element is visible   ${createUpsell}
    wait until element is enabled    ${createUpsell}
    click button    ${createUpsell}
    input text    ${Namefield}   ${CreateName}
    input text    ${descriptionfield}   validation purpose for automation
    scroll element into view    ${RevenueDD}
#    input text       ${WIFIDevices}     5
#    click element    ${WifiScore}
#    click element    ${selectwifiscore}
#    click element    ${WAPOptionDD}
#    click element    ${selectwap}
    click element    ${MobileAPPDD}
    click element    ${selectAPP}
#    input text       ${inputparental}  5
#    click element    ${RevenueDD}
#    click element    ${selectRevenue}
    click element    ${saveBtn}
    sleep    10
    wait until element is not visible       ${Loader}

validate the All Subscribers Table Data in Upsell Screen
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
    sleep    10
    wait until element is enabled    ${Tableview}
    click element    ${Tableview}
    click element    ${selectSubscriber}
    sleep    5
    wait until element is not visible       ${Loader}
    element should be visible    ${Tablecolumn}
    ${rows}=    get element count    ${Tablerow}
    ${cols}=    get element count    ${Tablecolumn}
    ${response}=   call method    ${CMCconnectionObj}   UPSELL_MAP_VIEW_user_report
    FOR    ${a}  IN RANGE  1  ${cols}+1
        ${data_table}  get text   xpath=//*[@id="otherThanProspectTable"]/tbody/tr[1]/td[${a}]
        ${ConvertAPI}=    convert to string   ${response}
#        should contain    ${data_table}    ${ConvertAPI}
        log to console    ${data_table}
     END
    click element    ${switchtomap}


validate the Preview Tab in Target Segmentation
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
#    wait until element is enabled    ${Subscriber}
    sleep    10
    wait until element is not visible       ${Loader}
#    click element    ${Subscriber}
    wait until element is enabled    ${editbtn}
    sleep    10
    click element    ${editbtn}
    click element    ${previewbtn}
#     wait until element is enabled    ${previewcount}
#    ${Usercount}=   get text    ${previewcount}
#    Upsell API Connection
#    ${Response_Previewcount}=   call method    ${connectionObj}     previewcount
#     ${ConvertAPI}=    convert to string    ${Response_Previewcount}
#    should contain      ${ConvertAPI}       ${Usercount}
    click element    ${saveBtn}

validate the Upsell edit Target Segmentation
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
    sleep    10
    wait until element is not visible       ${Loader}
    wait until element is enabled    ${editbtn}
    sleep    5
    wait until element is not visible       ${Loader}
    click element    ${editbtn}
    click element    ${deletebtn}
    ${Notifiation_Msg}      get text    ${deleteNotificationmsg}
    click element    ${confirmdeletebtn}
    sleep    10
    wait until element is not visible       ${Loader}
    click element    ${clickback}

Upsell API Connection
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
#       ${response_connection}=    call method    ${connectionObj}   WebsocketConnection
#       ${LoginResponse}=    call method    ${connectionObj}   login
#       should contain   ${response_connection}    ${Connection_response}

