*** Settings ***
Library     SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Resource    ../PO/CommonWrapper.robot
Resource   ../PO/ExploreDataAdvPO_services.robot
Resource   ../PO/ExploreDataAdvPO_applications.robot
Resource   ../PO/ExploreDataAdvPO_retention.robot
Resource   ../PO/ExploreDataAdvPO_upsellCrossSell.robot
Resource   ../PO/ExploreDataAdvPO_acquisition.robot





*** Variables ***
${exploreData_advancedTab}=  id=advancedData-list-tab
${exploreData_advanced_segmentsDropDown}=   //*[@class='input-wrapper']
${segment_casualUsers}=   //span[contains(.,'Casual users')]
${segment_gamers}=  //span[contains(.,'Gamers')]
${segment_powerUsers}=  //span[contains(.,'Power Users')]
${segment_streamer}=  //span[contains(.,'Streamer')]
${segment_wfhUsers}=  //span[contains(.,'WFH')]
${exploreData_advanced_saveSegmentBtn}=  //button[contains(.,'Save as New Segment')]
${exploreData_advanced_addFilterBtn}=   //a[contains(.,'+ Add filter')]
${exploreData_advanced_clearFilterBtn}=   id=clear-options
${exploreData_advanced_undoBtn}=   (//*[@class='d-block undo-redo-btn'])[1]
${exploreData_advanced_reDoBtn}=   (//*[@class='d-block undo-redo-btn'])[2]
${exploreData_advanced_regionDropdown}=   (//*[contains(@class,'collapsed-listbox')])[1]
${exploreData_advanced_locationDropdown}=   (//*[contains(@class,'collapsed-listbox')])[2]
${exploreData_advanced_dropdownUnlock}=  //*[text()='Click to unlock']
${exploreData_advanced_timeFrameDropdown}=   (//*[contains(@class,'collapsed-listbox')])[3]
${advanced_2priorMonth}=  //*[text()='2 Prior Month']
${advanced_dropdown_confirmBtn}=  //button[contains(@class,'confirm')]
${exploreData_advanced_currentSelectionPeriod}=   (//*[@class='item ng-scope'])[1]
${exploreData_advanced_currentSelectionRegion}=  (//*[@class='item ng-scope'])[2]
${exploreData_advanced_currentSelectionDow}=  (//*[@class='item ng-scope'])[3]
${exploreData_advanced_currentSelectionMonth}=  (//*[@class='item ng-scope'])[4]
${exploreData_advanced_chartsTab}=   //p[contains(.,'Charts')]
${exploreData_advanced_mapTab}=  //p[contains(.,'Map')]
${exploreData_advanced_smartTableTab}=  //p[contains(.,'SmartTable')]
${exploreData_advanced_subscribersTab}=  (//*[contains(@class,'nav-item')])[1]



${exploreData_advanced_collapseBtn}=   //*[@class='btn ss-btn-menu-collapse']

${exploreData_advanced_subscribersDatasPath}=  (//*[@class='kpi-data'])
${exploreData_advanced_subscribersWidgetDatapath}=  (//*[@class='qv-object-subtitle qvt-visualization-subtitle ng-binding ng-scope'])
${exploreData_advanced_subscribersLabelTxt}=  Subscribers
${exploreData_advanced_streamingLabelTxt}=   Streaming
${exploreData_advanced_gamingLabelTxt}=  Gaming
${exploreData_advanced_wfhLabelTxt}=  Work From Home

${exploreData_advanced_subscibers_devperHouseholdLabelTxt}=  Devices Per Household
${exploreData_advanced_subscibers_devperHousehold_quesIcon}=  //*[@id='Popover-380']
${exploreData_advanced_subscibers_devperHousehold_quesPopup}=
${exploreData_advanced_subscibers_devperHousehold_popupClose}=
${exploreData_advanced_subscibers_devperHousehold_popupCancel}=
${exploreData_advanced_subscibers_devperHousehold_downloadIcon}=  (//*[@id='ic_download'])[7]
${exploreData_advanced_subscibers_devperHousehold_expandIcon}=  (//*[contains(@class,'resize')])[7]
${exploreData_advanced_subscibers_devperHousehold_expandInvert}=
${exploreData_advanced_subscibers_devperHousehold_}=


${exploreData_advanced_subscibers_streamingSubscribersLabelTxt}=  Streaming Subscribers
${exploreData_advanced_subscibers_streamingSubscribers_quesIcon}=  //*[@id='Popover-386']
${exploreData_advanced_subscibers_streamingSubscribers_quesPopup}=
${exploreData_advanced_subscibers_streamingSubscribers_popupClose}=
${exploreData_advanced_subscibers_streamingSubscribers_popupCancel}=
${exploreData_advanced_subscibers_streamingSubscribers_downloadIcon}=  (//*[@id='ic_download'])[4]
${exploreData_advanced_subscibers_streamingSubscribers_expandIcon}=  (//*[contains(@class,'resize')])[4]
${exploreData_advanced_subscibers_streamingSubscribers_expandInvert}=
${exploreData_advanced_subscibers_streamingSubscribers_streamingBtn}=  (//*[@data-label='Streaming'])[1]
${exploreData_advanced_subscibers_streamingSubscribers_nonStreamingBtn}=  (//*[@data-label='Non-Streaming'])[1]

${exploreData_advanced_subscibers_gamingSubscribersLabelTxt}=  Gaming Subscribers
${exploreData_advanced_subscibers_gamingSubscribers_quesIcon}=  //*[@id='Popover-387']
${exploreData_advanced_subscibers_gamingSubscribers_quesPopup}=
${exploreData_advanced_subscibers_gamingSubscribers_popupClose}=
${exploreData_advanced_subscibers_gamingSubscribers_popupCancel}=
${exploreData_advanced_subscibers_gamingSubscribers_downloadIcon}=  (//*[@id='ic_download'])[5]
${exploreData_advanced_subscibers_gamingSubscribers_expandIcon}=  (//*[contains(@class,'resize')])[5]
${exploreData_advanced_subscibers_gamingSubscribers_expandInvert}=
${exploreData_advanced_subscibers_gamingSubscribers_}=

${exploreData_advanced_subscibers_wfhSubscribersLabelTxt}=  Work From Home Subscribers
${exploreData_advanced_subscibers_wfhSubscribers_quesIcon}=  //*[@id='Popover-377']
${exploreData_advanced_subscibers_wfhSubscribers_quesPopup}=
${exploreData_advanced_subscibers_wfhSubscribers_popupClose}=
${exploreData_advanced_subscibers_wfhSubscribers_popupCancel}=
${exploreData_advanced_subscibers_wfhSubscribers_downloadIcon}=  (//*[@id='ic_download'])[6]
${exploreData_advanced_subscibers_wfhSubscribers_expandIcon}=  (//*[contains(@class,'resize')])[6]
${exploreData_advanced_subscibers_wfhSubscribers_expandInvert}=
${exploreData_advanced_subscibers_wfhSubscribers_wfhBtn}=  (//*[@data-label='WFH'])[1]
${exploreData_advanced_subscibers_wfhSubscribers_nonwfhBtn}=  (//*[@data-label='Non-WFH'])[1]

${exploreData_advanced_subscibers_subscriberDataUsageLabelTxt}=  Subscriber Data Usage
${exploreData_advanced_subscibers_subscriberDataUsage_quesIcon}=  //*[@id='Popover-383']
${exploreData_advanced_subscibers_subscriberDataUsage_quesPopup}=
${exploreData_advanced_subscibers_subscriberDataUsage_popupClose}=
${exploreData_advanced_subscibers_subscriberDataUsage_popupCancel}=
${exploreData_advanced_subscibers_subscriberDataUsage_downloadIcon}=  (//*[@id='ic_download'])[1]
${exploreData_advanced_subscibers_subscriberDataUsage_expandIcon}=  (//*[contains(@class,'resize')])[1]
${exploreData_advanced_subscibers_subscriberDataUsage_expandInvert}=

${exploreData_advanced_subscibers_subscriberActTrendsLabelTxt}=  Subscriber Activity Trends
${exploreData_advanced_subscibers_subscriberActTrends_quesIcon}=  //*[@id='Popover-384']
${exploreData_advanced_subscibers_subscriberActTrends_quesPopup}=
${exploreData_advanced_subscibers_subscriberActTrends_popupClose}=
${exploreData_advanced_subscibers_subscriberActTrends_popupCancel}=
${exploreData_advanced_subscibers_subscriberActTrends_downloadIcon}=  (//*[@id='ic_download'])[2]
${exploreData_advanced_subscibers_subscriberActTrends_expandIcon}=  (//*[contains(@class,'resize')])[2]
${exploreData_advanced_subscibers_subscriberActTrends_expandInvert}=
${exploreData_advanced_subscibers_subscriberActTrends_streamingSubsBtn}=  (//*[@data-label='Streaming Subscribers'])[1]
${exploreData_advanced_subscibers_subscriberActTrends_wfhSubsBtn}=  (//*[@data-label='Work From Home Subscribers'])[1]
${exploreData_advanced_subscibers_subscriberActTrends_gamingSubsBtn}=  (//*[@data-label='Gaming Subscribers'])[1]

${exploreData_advanced_subscibers_dataUsageTrendsLabelTxt}=  Data Usage Trends
${exploreData_advanced_subscibers_dataUsageTrends_quesIcon}=  //*[@id='Popover-385']
${exploreData_advanced_subscibers_dataUsageTrends_quesPopup}=
${exploreData_advanced_subscibers_dataUsageTrends_popupClose}=
${exploreData_advanced_subscibers_dataUsageTrends_popupCancel}=
${exploreData_advanced_subscibers_dataUsageTrends_downloadIcon}=  (//*[@id='ic_download'])[3]
${exploreData_advanced_subscibers_dataUsageTrends_expandIcon}=  (//*[contains(@class,'resize')])[3]
${exploreData_advanced_subscibers_dataUsageTrends_expandInvert}=
${exploreData_advanced_subscibers_dataUsageTrends_totalUsageBtn}=  (//*[@data-label='Total Usage(TB)'])[1]
${exploreData_advanced_subscibers_dataUsageTrends_streamingUsageBtn}=  (//*[@data-label='Streaming Usage(TB)'])[1]

${exploreData_advanced_fullScreenCollapseBtn}=   (//*[@class='minimize_icon'])[7]
${exploreData_advanced_expandInvertBtn}=   (//*[@id='ic_expand'])[7]
${exploreData_advanced_}=
${exploreData_advanced_}=

${exploreData_advanced_subscibers_quesPopup}=  //*[@class='popover-body']
${widgetfullviewscreenadvanced}=
${popupInner}=  //*[@class='popover-inner']
${popupClose}=

${advancedFrame}=  id=advanced-iframe



*** Keywords ***

go to advanced tab
    click element until enabled  ${exploredata_advancedtab}
    sleep  130
    capture the screen  advancedTabScreen

verify elements in advanced tab
    select frame  ${advancedFrame}
    ${count}=  get element count  ${exploredata_advanced_subscribersdataspath}
    FOR  ${num}  IN RANGE  1   ${count}
    ${txt}=  get text  (//*[@class='kpi-data'])[${num}]
    log to console  ${txt}
    END

    @{elements}=  Create List   ${exploredata_advanced_savesegmentbtn}
    ...  ${exploredata_advanced_clearfilterbtn}  ${exploredata_advanced_undobtn}  ${exploredata_advanced_redobtn}
    ...  ${exploredata_advanced_regiondropdown}  ${exploredata_advanced_locationdropdown}  ${exploredata_advanced_timeframedropdown}  ${exploreData_advanced_currentSelectionPeriod}
    ...  ${exploredata_advanced_chartstab}   ${exploredata_advanced_maptab}  ${exploredata_advanced_smarttabletab}  ${exploredata_advanced_subscriberstab}
    ...  ${exploredata_advanced_collapsebtn}  ${exploreData_advanced_servicesTab}  ${exploreData_advanced_applicationsTab}  ${exploreData_advanced_retentionTab}
    ...  ${exploredata_advanced_upsell/crossselltab}  ${exploredata_advanced_acquisitiontab}
    wait until page contain elements  @{elements}


    @{multi_txt}=  Create List  ${exploredata_advanced_subscriberslabeltxt}  ${exploredata_advanced_streaminglabeltxt}  ${exploredata_advanced_gaminglabeltxt}
    ...  ${exploredata_advanced_wfhlabeltxt}
    page should contain multiple text  @{multi_txt}



filter 2 prior months data
    select frame  ${advancedFrame}
    click element until enabled  ${exploreData_advanced_timeFrameDropdown}
    ${present}=  Run Keyword And Return Status  element should be visible  //*[text()='Click to unlock']
    Run Keyword If  ${present}  click unlock
    ...  ELSE  log to console  dropdown not locked
    sleep  4
    click element until enabled  ${advanced_2priorMonth}
    click element until enabled  ${advanced_dropdown_confirmBtn}
    capture the screen  2monthsFilter

click unlock
    click element until enabled  ${exploreData_advanced_dropdownUnlock}


go to subscribers in advanced tab
    click element until enabled  ${exploredata_advanced_subscriberstab}
    sleep  15
    capture the screen  subscribersTabAdvanced


verify elements in advanced tab, subscribers
    @{txt}=  Create List  ${exploreData_advanced_subscibers_devperHouseholdLabelTxt}  ${exploreData_advanced_subscibers_streamingSubscribersLabelTxt}
    ...  ${exploreData_advanced_subscibers_gamingSubscribersLabelTxt}  ${exploreData_advanced_subscibers_wfhSubscribersLabelTxt}  ${exploreData_advanced_subscibers_subscriberDataUsageLabelTxt}
    ...  ${exploreData_advanced_subscibers_subscriberActTrendsLabelTxt}  ${exploreData_advanced_subscibers_dataUsageTrendsLabelTxt}
    page should contain multiple text  @{txt}
    select frame  ${advancedFrame}

    @{elements}=  Create List  ${exploreData_advanced_subscibers_devperHousehold_quesIcon}  ${exploreData_advanced_subscibers_devperHousehold_downloadIcon}  ${exploreData_advanced_subscibers_devperHousehold_expandIcon}
    ...  ${exploreData_advanced_subscibers_streamingSubscribers_quesIcon}  ${exploreData_advanced_subscibers_streamingSubscribers_downloadIcon}  ${exploreData_advanced_subscibers_streamingSubscribers_expandIcon}
    ...  ${exploreData_advanced_subscibers_streamingSubscribers_streamingBtn}  ${exploreData_advanced_subscibers_streamingSubscribers_nonStreamingBtn}
    ...  ${exploreData_advanced_subscibers_gamingSubscribers_quesIcon}  ${exploreData_advanced_subscibers_gamingSubscribers_downloadIcon}  ${exploreData_advanced_subscibers_gamingSubscribers_expandIcon}
    ...  ${exploreData_advanced_subscibers_wfhSubscribers_quesIcon}  ${exploreData_advanced_subscibers_wfhSubscribers_downloadIcon}  ${exploreData_advanced_subscibers_wfhSubscribers_expandIcon}
    ...  ${exploreData_advanced_subscibers_wfhSubscribers_wfhBtn}  ${exploreData_advanced_subscibers_wfhSubscribers_nonwfhBtn}
    ...  ${exploreData_advanced_subscibers_subscriberDataUsage_quesIcon}  ${exploreData_advanced_subscibers_subscriberDataUsage_downloadIcon}  ${exploreData_advanced_subscibers_subscriberDataUsage_expandIcon}
    ...  ${exploreData_advanced_subscibers_subscriberActTrends_quesIcon}  ${exploreData_advanced_subscibers_subscriberActTrends_downloadIcon}  ${exploreData_advanced_subscibers_subscriberActTrends_expandIcon}
    ...  ${exploreData_advanced_subscibers_subscriberActTrends_streamingSubsBtn}  ${exploreData_advanced_subscibers_subscriberActTrends_wfhSubsBtn}  ${exploreData_advanced_subscibers_subscriberActTrends_gamingSubsBtn}
    ...  ${exploreData_advanced_subscibers_dataUsageTrends_quesIcon}  ${exploreData_advanced_subscibers_dataUsageTrends_downloadIcon}  ${exploreData_advanced_subscibers_dataUsageTrends_expandIcon}
    ...  ${exploreData_advanced_subscibers_dataUsageTrends_totalUsageBtn}  ${exploreData_advanced_subscibers_dataUsageTrends_streamingUsageBtn}
    page should contain multiple element  @{elements}





getting each widget total subscribers details in subscribers tab, advanced
    click element until enabled  ${exploredata_advanced_subscriberstab}
    sleep  5
    ${count}=  get element count  ${exploredata_advanced_subscriberswidgetdatapath}
    FOR  ${num}  IN RANGE  1  ${count}
    ${txt}=  get text  ${exploredata_advanced_subscriberswidgetdatapath}[${num}]
    log to console  ${txt}
    END


validate clicking icons for all the widgets in subscribers tab, advanced
    [Arguments]  ${ques}
    click element until enabled  ${ques}
    page should contain element  ${popupInner}
    click element until enabled  ${popupClose}
    click element until enabled  ${dLoad}
    click element until enabled  ${expand}
    page should contain the element  ${headerTxt}
    click element until enabled  ${ques}
    page should contain element  ${popupInner}
    click element until enabled  ${popupClose}
    click element until enabled  ${dLoad}
    click element until enabled  ${minimize}






