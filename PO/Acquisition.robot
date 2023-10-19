*** Settings ***
Documentation    Suite description
Library    SeleniumLibrary
Variables  ../utils/CMC-API.py
*** Variables ***
${Acquisitionlink}=    link=Acquisition
${Subscriber}=    xpath=//*[@id="left-menu-control-div"]
${Tableview}=   xpath=//*[@id="map_controls_div_from_html"]/div[2]/span[1]/button
${exportText}=  xpath=//*[@id="map_controls_div_from_html"]/div[2]/span[2]/button
${MenuIcon_acquisition}=  xpath=//*[@id="map_controls_div_from_html"]/div[2]/span[3]/button
${Drawbutton}=    xpath=//*[@id="freehandControlOptionDiv"]
${PanControlbutton}=    xpath=//*[@id="panControlOptionDivId"]
${SubMenubar}=    xpath=//*[@id="show-all-subscribers"]/label
${heatmapmenubar}=    xpath=//*[@id="show-attainable-heat-map"]/label
${upsellmenubar}=   xpath=//*[@id="upsell-oppurtunity"]
${technologiesmenubar}=    xpath=//*[@id="technologies"]
${customer-type}=    xpath=//*[@id="customer-type"]
${selectAllSubscriber}=    xpath=//*[@id="span-6DXbCQ4696w8bhwrr"]/input
${clickback}=    xpath=//*[@class="row "]/div/div[1]/i
${selectSubscriber}=    xpath=//*[@id="tabledropdownMenuContent"]/a[1]
${AcqTablerow}=     xpath=//tbody[@id='existing-append-table-list']//tr
${Acqablecolumn}=     xpath=//tbody[@id='existing-append-table-list']//tr[1]/td
${CreateAquisition}=    xpath=//*[text()='Aquisition Target Segmentation']
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
${AcquisitionsaveBtn}=     xpath=//button[contains(text(),'Save')]
${selectcreated}=       xpath=//div[@title='automation']/input
${editbtn}=     xpath=//span[@class='input-group-append target-side-menu-edit active']/button
${deletebtn}=    xpath=//button[contains(text(),'Delete')]
${deleteNotificationmsg}=   xpath=//div[@class='confirm-delete']//*[@class='row']
${confirmdeletebtn}=    xpath=//button[@class='btn btn-primary btn-sm pull-right confirm-delete-btn-delete']
${previewbtn}=      xpath=//button[contains(text(),'Preview')]
${previewcount}=    xpath=//div[@class='mt-2']/p
${MovetoTop}=   xpath=//a[@class='logo']//img
${SwitchtoMAP}=     xpath=//span[contains(text(),'Map View')]
${Loader}=      xpath=//span[@class='spin-circle']
*** Keywords ***
Check the Acquisition link in Dashboard
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
    sleep    100
    wait until element is not visible       ${Loader}
    ${present}=    Run Keyword And Return Status    Element Should Be Visible   ${Acquisitionlink}

    Run Keyword If    ${present}    Click on Acquisition link in Dashboard
                  ...  ELSE     log to console    Acquisition Not available
    Run Keyword If    ${present}    validate the Acquisition Screen Content Tabs
                  ...  ELSE     log to console    Acquisition Not available
    Run Keyword If    ${present}    validate the Acquisition Right Menu Map Controls Tab
                  ...  ELSE     log to console    Acquisition Not available
    Run Keyword If    ${present}    validate the All Subscribers Table Data in Acquisition Screen
                  ...  ELSE     log to console    Acquisition Not available
    Run Keyword If    ${present}    validate the prospectsubscribers Table Data in Acquisition Screen
                  ...  ELSE     log to console    Acquisition Not available

#    Run Keyword If    ${present}    validate the Acquisition Create Target Segmentation
#                  ...  ELSE     log to console    Acquisition Not available
#
#    Run Keyword If    ${present}    validate the Preview Tab in Target Segmentation in Acquisition
#                  ...  ELSE     log to console    Acquisition Not available
#
#    Run Keyword If    ${present}    validate the Acquisition edit Target Segmentation
#                  ...  ELSE     log to console    Acquisition Not available

Click on Acquisition link in Dashboard
    wait until element is not visible       ${Loader}
    click link    ${Acquisitionlink}

click on Map view for Acquisition
    click element    ${SwitchtoMAP}
     sleep    30
     wait until element is not visible       ${Loader}
validate the Acquisition Screen Content Tabs
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
    sleep    30
    wait until element is not visible       ${Loader}
    ${present}=    Run Keyword And Return Status    Element Should Be Visible   ${SwitchtoMAP}
    Run Keyword If    ${present}    click on Map view for Acquisition

                  ...  ELSE     log to console    Map View displayed
    wait until element is visible   ${Subscriber}
    ${text}=    get text    ${Subscriber}
#    wait until element is visible   ${Tableview}
    ${Tabletext}=    get text    ${Tableview}
    ${ExportText}=  get text    ${exportText}
    page should contain element    ${MenuIcon_acquisition}
    page should contain element    ${Drawbutton}
    page should contain element    ${PanControlbutton}

validate the Acquisition Right Menu Map Controls Tab
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
    sleep    15
    wait until element is not visible       ${Loader}
    click element    ${MenuIcon_acquisition}
    ${Text}=    get text    ${SubMenubar}
    ${Heatmap}=    get text    ${heatmapmenubar}
    ${prospect}=    get text    ${upsellmenubar}
    ${Technology}=    get text    ${technologiesmenubar}
    ${Customer}=    get text    ${customer-type}
    should contain    ${Text}     Show All Subscribers
    should contain    ${Heatmap}     Show Attainable Bitrate Heatmap
    should contain    ${prospect}        Prospect Opportunity
    should contain    ${Technology}        Technologies
    should contain    ${Customer}       Customer Type
    click element    ${MenuIcon_acquisition}

validate the Acquisition Create Target Segmentation
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
    sleep    30
    wait until element is not visible       ${Loader}
    wait until element is visible   ${Subscriber}
    sleep    30
    click button    ${Subscriber}
    sleep    5
    wait until element is visible   ${CreateAquisition}
    click button    ${CreateAquisition}
    input text    ${Namefield}  automation
    input text    ${descriptionfield}   validation purpose for automation
    click element    ${AcquisitionsaveBtn}

validate the All Subscribers Table Data in Acquisition Screen
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
    wait until element is not visible       ${Loader}
    wait until element is enabled    ${Tableview}
    sleep    10
    click element    ${Tableview}
    click element    ${selectSubscriber}
    sleep    5
    ${response}=   call method    ${CMCconnectionObj}   ACQUISITION_MAP_VIEW_acquisition_existing_report
    ${rows}=    get element count    ${AcqTablerow}
    ${cols}=    get element count    ${Acqablecolumn}
    FOR    ${a}  IN RANGE  1  ${cols}+1
        ${data_table}  get text   xpath=//tbody[@id='existing-append-table-list']//tr[1]/td[${a}]
        log to console    ${data_table}
        ${ConvertAPI}=    convert to string   ${response}
        should contain  ${ConvertAPI}    ${data_table}
     END
#    click element    ${switchtomap}

validate the prospectsubscribers Table Data in Acquisition Screen
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
    wait until element is not visible       ${Loader}
    wait until element is enabled    //span[contains(text(),'Table View')]
    sleep    10
    click element    //span[contains(text(),'Table View')]
    click element    //*[@id='tableDropdown']/a[2]
    sleep    3
    ${response}=   call method    ${CMCconnectionObj}   ACQUISITION_MAP_VIEW_acquisition_prospect_report
    ${rows}=    get element count    //tbody[@id='prospect-append-table-list']//tr
    ${cols}=    get element count    //tbody[@id='prospect-append-table-list']//tr[1]/td
    FOR    ${a}  IN RANGE  1  ${cols}+1
        ${data_table}  get text   xpath=//tbody[@id='prospect-append-table-list']//tr[1]/td[${a}]
        log to console    ${data_table}
        ${ConvertAPI}=    convert to string   ${response}
        should contain  ${ConvertAPI}    ${data_table}
     END
    click element    ${switchtomap}


validate the Preview Tab in Target Segmentation in Acquisition
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
    sleep    10
    wait until element is not visible       ${Loader}
#    wait until element is enabled    ${Subscriber}
#    click button    ${Subscriber}
#    wait until element is enabled    ${editbtn}
    sleep    5
#    click element    ${editbtn}
    click element    ${previewbtn}
#     wait until element is enabled    ${previewcount}
#    ${Usercount}=   get text    ${previewcount}
    click element    ${AcquisitionsaveBtn}


validate the Acquisition edit Target Segmentation
    set selenium implicit wait    60 seconds
    set selenium timeout    60 seconds
    sleep    10
     wait until element is not visible       ${Loader}
#    wait until element is enabled    ${editbtn}
    sleep    10
#    click element    ${editbtn}
    click element    ${deletebtn}
    ${Notifiation_Msg}      get text    ${deleteNotificationmsg}
    click element    ${confirmdeletebtn}
    sleep    5
    click element    ${clickback}
