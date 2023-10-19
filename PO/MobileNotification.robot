*** Settings ***
Documentation    Suite description

Library    SeleniumLibrary
Library     Collections
Variables   ../utils/MobileNotificationApi.py
Variables  ../utils/CMC-API.py
*** Variables ***

${MobileNotificationlink}=    link=Mobile Notifications
${Header}=  xpath=//span[@class='heading']
${ScheduleTab}=     xpath=//a[contains(text(),'Scheduled')]
${EventTab}=    xpath=//a[contains(text(),'Event')]
${NewScheduleform}=     xpath=//*[@class='pull-left']
${leftMobileNotificationTab}=   xpath=//*[@class='active']//*[text()="Mobile Notifications"]
${HistoryTab}=  xpath=//a[contains(text(),'History')]
${ScheduleNotificationText}=    xpath=//h6[contains(text(),'Schedule Notification')]
${NotificationLabel}=    xpath=//label[contains(text(),'Notification Name')]
${NotificationTab}=     xpath=//input[@name='Notification Name']
${ImageLabel}=  xpath=//label[contains(text(),'Image')]
${LinkLabel}=   xpath=//label[contains(text(),'Link')]
${LinkTab}=     xpath=//input[@name='link']
${ImmediateRadioBtn}=    xpath=//label[contains(text(),'Immediate')]
${ScheduleRadioBtn}=    xpath=//label[contains(text(),'Schedule')]
${SegmentTypeLabel}=    xpath=//label[contains(text(),'Segment Type')]
${SegmentTypeDD}=   xpath=//select[@id='segmentTypes']
${SelectUpsell}=    xpath=//option[@class='ng-star-inserted'][contains(text(),'Upsell')]
${SelectRetention}=     xpath=//option[@class='ng-star-inserted'][contains(text(),'Retention')]
${SegmentLabel}=    xpath=//div[@class='ng-star-inserted']//div[2]//label[1]
${SegmentDD}=   xpath=//select[@id='segments']
${eventDD}=     xpath=//select[@id='eventType']
${SelectSegment}=   xpath=//option[contains(text(),'upsell_seg_cmdiq')]
${ApplyBtn}=    xpath=//button[@id='promotion_submit']
${MobileCancelBtn}=   xpath=//a[contains(text(),'Cancel')]
${TableData}=  xpath=//tbody[1]//tr[1]/td
${Alertok}=     xpath=//button[@class='btn-danger pull-right dismiss']
${MobileEditBtn}=     xpath=//*[@id="promotions"]/tbody[1]/tr/td[6]/a[1]
${MobileCancelBtn}=   xpath=//*[@id="promotions"]/tbody[1]/tr/td[6]/a[2]
${MobileDeleteMsg}=   xpath=//*[@class="cdk-overlay-pane"]/nb-dialog-container/nb-card/nb-card-body
${YesBtn}=   xpath=//button[contains(text(),'Yes')]
${NoBtn}=   xpath=//button[contains(text(),'No')]
${Viewad}=      xpath=//*[@id="promotions"]/tbody[1]/tr/td[8]/a
${NotificationName}=    xpath=//nb-card-body/div[3]/dl/dd[1]
${AdName}=      xpath=//nb-card-body/div[3]/dl/dd[2]/a
${NotificationDate}=    xpath=//nb-card-body/div[3]/dl/dd[3]
${NotificationTime}=    xpath=//nb-card-body/div[3]/dl/dd[4]
${NotificationZone}=    xpath=//nb-card-body/div[3]/dl/dd[6]
${BacktoHistory}=   xpath=//a[@id='backtoHistory']
${imagelink}=     https://pngimg.com/uploads/pubg/pubg_PNG45.png
${Loader}=      xpath=//span[@class='spin-circle']
${path_to_image}=    /CalixCloud_logo_marketing.png
${scheduled_radioBtn}=      xpath=//label[contains(text(),'Schedule ')]/input
${event_radioBtn}=      xpath=//label[contains(text(),'Event ')]/input
${TimezoneDD}=    xpath=//select[@id='promotionTimeZone']
${NotificationTimezone}=        xpath=//select[@id='notificationTimeZone']
${Datepicker}=    xpath=//div[@id='promotionDate']/span/p-calendar/span/button
${EndDatepicker}=     xpath=//div[@id='endDate']/span/p-calendar/span/button
${EventNotificationTime}=        xpath=//div[@id='notificationTime']/span/p-calendar/span/input
${NextbuttonDate}=     xpath=//div[@class='ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all']/a[2]
${selectDateTime}=      xpath=//table[@class='ui-datepicker-calendar']/tbody/tr[2]/td[4]
${Threshold}=       xpath=//div[@id='threshold']/input
*** Keywords ***

Check the Mobile Notifications link in Dashboard
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
    sleep    10
    wait until element is visible   ${MobileNotificationlink}


Click on Mobile Notifications link in Dashboard
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
    page should contain    Mobile Notifications
    sleep    30
    click link    ${MobileNotificationlink}
    wait until element is not visible       ${Loader}
    ${HeaderText}=  get text    ${Header}
    should contain    ${HeaderText}     Mobile Notification

validate the Scheduled Data in Mobile Notifications
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
    ${response_ConfigReader}=   call method    ${CMCconnectionObj}   ConfigReaderStage
    ${response_Login}=   call method    ${CMCconnectionObj}   loginAPI
    ${response}=   call method    ${CMCconnectionObj}   MOBILE_NOTIFICATIONS_SCHEDULED_LIST
    click element    ${leftMobileNotificationTab}
    sleep    5
    @{Schedule_Data}=    Create List
    click element    ${scheduletab}
    ${Rowcount}=    get element count    ${tabledata}
    FOR    ${a}  IN RANGE  1  ${Rowcount}
        ${data_table}  get text   xpath=//tbody[1]//tr[1]/td[${a}]
        log to console    ${data_table}
        Append To List    ${Schedule_Data}    ${data_table}
     ${Categories_cnt}=    Get length    ${Schedule_Data}
      ${ConvertAPI}=    convert to string   ${response}
#      should contain  ${ConvertAPI}    ${data_table}
    END
    log to console   ${Schedule_Data}[0]

validate the Event Data in Mobile Notifications
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
    sleep    2
    ${response}=   call method    ${CMCconnectionObj}   MOBILE_NOTIFICATIONS_EVENT_LIST
    click element    ${EventTab}
    @{Event_Data}=    Create List
    sleep    5
     ${Rowcount}=    get element count    ${tabledata}
    FOR    ${a}  IN RANGE  1  ${Rowcount}
        ${data_table}  get text   xpath=//tbody[1]//tr[1]/td[${a}]
        log to console    ${data_table}
        Append To List    ${Event_Data}    ${data_table}
        ${ConvertAPI}=    convert to string   ${response}
#        should contain  ${ConvertAPI}    ${data_table}
    END

valiate the Scheduled Data in History
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
    ${response}=   call method    ${CMCconnectionObj}   MOBILE_NOTIFICATIONS_HISTORY_LIST
    click element    ${HistoryTab}
    sleep    5
    @{Schedule_HData}=    Create List
    ${HeaderText}=  get text    ${Header}
    should contain    ${HeaderText}     History
    click element    ${ScheduleTab}
    ${Rowcount}=    get element count    ${tabledata}
    FOR    ${a}  IN RANGE  1  ${Rowcount}
        ${data_table}  get text   xpath=//tbody[1]//tr[1]/td[${a}]
        log to console    ${data_table}
        Append To List    ${Schedule_HData}    ${data_table}
        ${ConvertAPI}=    convert to string   ${response}
#        should contain  ${ConvertAPI}    ${data_table}
    END


validate the Event Data in History
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
    ${response}=   call method    ${CMCconnectionObj}   MOBILE_NOTIFICATIONS_Campaign_Event_history_view_by_orgid
    click element    ${EventTab}
    sleep    5
    @{Event_HData}=    Create List
     ${Rowcount}=    get element count    ${tabledata}
    FOR    ${a}  IN RANGE  1  ${Rowcount}
        ${data_table}  get text   xpath=//tbody[1]//tr[1]/td[${a}]
        log to console    ${data_table}
        Append To List    ${Event_HData}    ${data_table}
        log to console    ${Event_HData}[0]
        ${ConvertAPI}=    convert to string   ${response}
#        should contain  ${ConvertAPI}    ${Event_HData}

    END


validate the New Scheduled Notification form
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
    sleep    15
    click element    ${newscheduleform}
    Empty form
    Empty Segment Type in form filling
    Empty Segment in form filling
    Empty time zone in form filling
    Submit the Schedule Notification form
    validate the with scheduled notification
    validate the with Event scheduled notification

Empty form
    set selenium timeout    30 seconds
    set selenium implicit wait    30 seconds
     click element    ${ApplyBtn}
     page should contain    Notification name missing
     click element    ${Alertok}

Empty Name with form filling
     set selenium timeout    30 seconds
     set selenium implicit wait    30 seconds
      Choose File    xpath=//*[@id="campaignImage"]     ${CURDIR}${path_to_image}
#      input text    ${LinkTab}      ${imagelink}
      Select From List By Index     ${SegmentTypeDD}    1
      sleep    5
      select from list by index     ${SegmentDD}        1
      click element    ${ApplyBtn}
      page should contain    Notification name missing
      click element    ${Alertok}

Empty Segment Type in form filling
      set selenium timeout    30 seconds
      set selenium implicit wait    30 seconds
       input text    ${NotificationTab}     test
       Choose File    xpath=//*[@id="campaignImage"]     ${CURDIR}${path_to_image}
       click element    ${ApplyBtn}
       page should contain    Please select segment type
       click element    ${Alertok}

Empty Segment in form filling
       set selenium timeout    30 seconds
       set selenium implicit wait    30 seconds
       input text    ${NotificationTab}     test
       Choose File    xpath=//*[@id="campaignImage"]     ${CURDIR}${path_to_image}
       Select From List By Index     ${SegmentTypeDD}    1
       sleep    5
       click element    ${ApplyBtn}
       page should contain    Please select a segment
       click element    ${Alertok}

Empty time zone in form filling
      set selenium timeout    30 seconds
      set selenium implicit wait    30 seconds
       input text    ${NotificationTab}     test
       Choose File    xpath=//*[@id="campaignImage"]     ${CURDIR}${path_to_image}
       click element    ${ScheduleRadioBtn}
       Select From List By Index     ${SegmentTypeDD}    2
       sleep    5
#       select from list by index     ${SegmentDD}        1
       click element    ${ApplyBtn}
#       page should contain    Schedule timezone missing
       click element    ${Alertok}

Submit the Schedule Notification form
       set selenium timeout    30 seconds
       set selenium implicit wait    30 seconds
       input text    ${NotificationTab}     Notifiation
       Choose File    xpath=//*[@id="campaignImage"]     ${CURDIR}${path_to_image}
       click element    ${immediateradiobtn}
       Select From List By Index     ${SegmentTypeDD}    2
       sleep    5
       select from list by index     ${SegmentDD}        1
       click element    ${ApplyBtn}

validate the delete Mobile Notifications
        set selenium timeout    30 seconds
        set selenium implicit wait    30 seconds
        sleep    5
        click element    ${MobileNotificationlink}
        sleep    5
        click element    ${leftMobileNotificationTab}
        sleep    10
        wait until element is enabled    ${MobileEditBtn}
        click element    ${MobileCancelBtn}
        element should be visible    ${yesbtn}
        element should be visible    ${NoBtn}
        ${NotificationText}=    get text    ${MobileDeleteMsg}
        click element    ${yesbtn}

validate the view add in History
        set selenium timeout    30 seconds
        set selenium implicit wait    30 seconds
        sleep    15
        click element    ${HistoryTab}
        sleep    5
        click element    ${viewad}
        ${Notification_Name}=   get text    ${NotificationName}
        ${Add_name}=    get text    ${AdName}
        ${Notification_date}=   get text    ${NotificationDate}
        ${Notification_time}=   get text    ${NotificationTime}
        ${Notification_Zone}=   get text    ${NotificationZone}
        click element   ${BacktoHistory}

validate the with scheduled notification
        set selenium timeout    30 seconds
        set selenium implicit wait    30 seconds
        sleep    15
        click element    ${newscheduleform}
        input text    ${NotificationTab}     ScheduleNotifiation
        Choose File    xpath=//*[@id="campaignImage"]     ${CURDIR}${path_to_image}
        click element    ${scheduled_radioBtn}
        Select From List By Index     ${SegmentTypeDD}    2
        sleep    5
        select from list by index     ${SegmentDD}        1
        sleep    5
        click element    ${Datepicker}
        sleep    2
        click element    ${NextbuttonDate}
        click element    ${SELECTDATETime}
        select from list by index      ${TimezoneDD}       1
        click element    ${ApplyBtn}

validate the with Event scheduled notification
        set selenium timeout    30 seconds
        set selenium implicit wait    30 seconds
        sleep    15
        click element    ${newscheduleform}
        input text    ${NotificationTab}     EventNotifiation
        Choose File    xpath=//*[@id="campaignImage"]     ${CURDIR}${path_to_image}
        click element    ${event_radioBtn}
        Select From List By Index     ${eventDD}    1
        sleep    5
        click element    ${EndDatepicker}
        click element    ${NextbuttonDate}
        click element    ${SELECTDATETime}
        input text    ${Threshold}      1
        input text    ${EventNotificationTime}       01:11 PM
        select from list by index      ${NotificationTimezone}       1
        click element    ${ApplyBtn}
        sleep    2
#        handle alert    accept