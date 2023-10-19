*** Settings ***
Library     SeleniumLibrary
Resource    ../utils/GlobVariables.robot
Resource    ../PO/CommonWrapper.robot
Resource   ../PO/ExploreDataPO_applications.robot
Resource   ../PO/ExploreDataAdvPO_subscribers.robot
Resource   ../PO/Campigns_po.robot
Resource   ../PO/PageTitleKeywords.robot
Variables  ../utils/OptimizeAPI.py

*** Variables ***

${homeBtn}=   id=homeMarketingSection
${pendo_search_videoIcon}=  //*[@id='pendo-image-badge-75e242dd']
${pendo_videoIcons}=  //*[@id='pendo-image-badge-cf9c4248']
${pendo_videoPopup}=  //*[@class='_pendo-row']
${searchField}=   id=search-input
${home_searchBtn}=   id=search-btn
${home_Insightstxt}=   Insights
${home_insights_past30DaysTxt}=   Past 30 Days
${home_insights_quesBtn}=   //*[@class='btn-round info-round']
${home_insights_quesBtn_stringAttribute}=
${home_AllSubscriberslabelTxt}=   Subscribers
${home_insights_subscribersPendo}=  //*[contains(text(),'Subscribers')]//img[contains(@id,'pendo-image')]
${home_insights_subscribersPendo_stringAttribute}=  Total number of active subscribers over the past 30 days. An active subscriber is counted only if that subscriber has a mapped endpoint and has active IP flows.
${home_insights_streamingPendo}=  //*[contains(text(),'Streaming')]//img[contains(@id,'pendo-image')]
${home_insights_streamingPendo_stringAttribute}=  Number of subscribers who consume the equivalent of 1G per day, for the selected period of days, of streaming media.
${home_insights_gamingPendo}=  //*[contains(text(),'Gaming')]//img[contains(@id,'pendo-image')]
${home_insights_gamingPendo_stringAttribute}=  Subscribers who consume at least 1MB of data each month through consoles such as PlayStation, services such as Xbox Live, and content on Twitch.tv.
${home_insights_wfhPendo}=  //*[contains(text(),'Work from Home')]//img[contains(@id,'pendo-image')]
${home_insights_wfhPendo_stringAttribute}=  Number of subscribers who spend at least an average of 80 minutes per day using business applications.
${home_insights_acquisitionRatePendo}=  //*[contains(text(),'Acquisition Rate')]//img[contains(@id,'pendo-image')]
${home_insights_acquisitionPendo_stringAttribute}=  Total number of new subscribers added in the past 30 days divided by the current total active subscribers over the past 30 days.
${home_insights_churnRatePendo}=  //*[contains(text(),'Churn Rate')]//img[contains(@id,'pendo-image')]
${home_insights_churnRatePendo_stringAttribute}=  Total number of subscribers lost in the past 30 days divided by the current total active subscribers.
${home_insights_arpuPendo}=  //*[contains(text(),'ARPU')]//img[contains(@id,'pendo-image')]
${home_insights_arpuPendo_stringAttribute}=  Average Revenue Per User is calculated by taking total revenue and dividing it by the total active subscribers.
${home_insights_newSubsPendo}=  //*[contains(text(),'New Subs (Past 30 Days)')]//img[contains(@id,'pendo-image')]
${home_insights_newSubsPendo_stringAttribute}=  Total number of new subscribers over the past 30 days.
${home_gamerLabeltxt}=   Gaming
${home_streamerLabeltxt}=   Streaming
${home_workFrmHomelabeltxt}=   Work from Home
${home_insights_acquisitionRateTxt}=   Acquisition Rate
${home_insights_churnRate}=   Churn Rate
${home_insights_ARPU}=   ARPU
${home_insights_newSubsPerDay}=   New Subs (Past 30 Days)
${home_insights_kpvPath}=  (//*[@class='flex overview-row']//*[@class='ov-col'])

${string_exportData}=   Export Data
${string_maximize}=   Maximize

${home_close_btn}=   //button[contains(@class,'close')]
${home_cancel_btn}=   //button[contains(., "Cancel")]

${home_subscriberTrendsHeaderTxt}=   New Subscribers
${home_subscriberTrends_quesBtn}=   (//*[@class='btn-round btn-small-24 btn-grey btn-que'])[3]
${home_subscriberTrends_quesBtn_stringAttribute}=
${home_subscriberTrends_downloadBtn}=   (//*[@class='btn-round btn-small-24 btn-grey btn-dload'])[3]



${home_campaignstxt}=   Campaigns
${home_campaigns_tableRow}=  id=campaigns-table
${home_campaigns_table_1stData}=   //*[@id='campaigns-table']//tbody//tr[1]//td[1]//a//span
${home_campaigns_tableRow}=  //*[@id='campaigns-table']//tbody//tr
${home_campaigns_tableCol}=  //*[@id='campaigns-table']//tbody//tr[1]//td
${home_campaigns_newBtn}=   id=campaigns-new-btn
${home_campaigns_createCampaignBtn}=   //*[@class='insts-col ng-star-inserted']
${home_campaigns_quesBtn}=   id=campaigns-info
${home_campaigns_quesBtn_stringAttribute}=
${home_campaigns_newCampaignsTxt}=   New Campaign

${home_segmentsheaderTxt}=   Segments
${home_segments_newBtn}=   id=segments-new-btn
${home_segments_createSegmentImage}=  (//div[contains(@class,'insts-col')])[3]//img
${home_segments_quesBtn}=    //*[contains(text(),'Recommended')]//img[contains(@id,'pendo-image')]
${home_segments_quesBtn_stringAttribute}=  Recommended segments are new insightful segments that are created for you based off of your subscriber behavior.
${home_segments_recmndTab}=   id=segmnents-recommended
${home_segments_recmndTab_tRow}=   //*[@id='segmnents-recommended-table']//tbody//tr
${home_segments_recmndTab_tCol}=   //*[@id='segmnents-recommended-table']//tbody//tr[1]//td
${home_segments_savedTab_1stSegment}=  //*[@id='segmnents-saved-table']//tbody//tr[1]//td[1]
${home_segments_savedTab}=   id=segmnents-saved
${home_segments_savedTab_tRow}=   //*[@id='segmnents-saved-table']//tbody//tr
${home_segments_savedTab_tCol}=   //*[@id='segmnents-saved-table']//tbody//tr[1]//td
${basicTab}=   //a[contains(.,"Basic")]

${home_churnTrendsHeaderTxt}=  Churn Trends
${home_churnTrends_quesBtn}=   (//*[@class='btn-round btn-small-24 btn-grey btn-que'])[4]
${home_churnTrends_quesBtn_stringAttribute}=
${home_churnTrends_downloadBtn}=   (//*[@class='btn-round btn-small-24 btn-grey btn-dload'])[4]

${home_subscribersBySttHeaderTxt}=   Service Tier & Technology
${home_subscribersByStt_quesBtn}=   (//*[@class='btn-round btn-small-24 btn-grey btn-que'])[1]
${home_SubscribersByStt_quesBtn_stringAttrubute}=   The distribution of subscribers among the service tiers and technology types.
${home_subscribersByStt_downloadBtn}=   (//*[@class='btn-round btn-small-24 btn-grey btn-dload'])[1]
${home_subscribersByStt_fiberBtn}=   (//*[@class='highcharts-legend-item highcharts-column-series highcharts-color-0 highcharts-series-0'])[1]
${home_subscribersByStt_fiberBtnHidden}=   //*[@class='highcharts-legend-item highcharts-column-series highcharts-color-0 highcharts-series-0 highcharts-legend-item-hidden']
${home_subscribersByStt_barLocation}=   (//*[@id='subscriber-tier-home-chart']//*[@class='highcharts-point highcharts-color-0'])
${home_subscribersByStt_bar1Location}=   (//*[@id='subscriber-tier-home-chart']//*[@class='highcharts-point highcharts-color-0'])[1]
${home_subscribersByStt_bar2Location}=   (//*[@id='subscriber-tier-home-chart']//*[@class='highcharts-point highcharts-color-0'])[2]
${home_subscribersByStt_bar3Location}=   (//*[@id='subscriber-tier-home-chart']//*[@class='highcharts-point highcharts-color-0'])[3]
${home_subscribersByStt_bar4Location}=   (//*[@id='subscriber-tier-home-chart']//*[@class='highcharts-point highcharts-color-0'])[4]
${home_subscribersByStt_bar5Location}=   (//*[@id='subscriber-tier-home-chart']//*[@class='highcharts-point highcharts-color-0'])[5]
${home_subscribersByStt_tooltipData}=   (//*[contains(@class,'highcharts-label highcharts-tooltip highcharts-color')])[1]



${home_SCHHeaderTxt}=   Social Channel Heatmap
${home_SCH_quesBtn}=   (//*[@class='btn-round btn-small-24 btn-grey btn-que'])[2]
${home_SCH_dropdown}=  //*[contains(@class,'selectbox')]//*[contains(@class,'arrow-')]
${home_SCH_placeholder}=  //*[contains(@class,'selectbox')]
${home_SCH_downloadBtn}=   (//*[@class='btn-round btn-small-24 btn-grey btn-dload'])[2]
${home_SCH_dropdownlist}=   //*[contains(@class,'ng-option-label')]

${home_resourceAndFaqHeaderTxt}=   Resources and FAQs
${home_resourceAndFaq_askCalixBtn}=   //a[contains(.,'Ask Calix')]

${home_t&CBtnFooter}=   id=terms-conditions
${home_aboutBtnFooter}=   id=about-calix
${home_aboutCalix_currentPath}=  https://www.calix.com/content/dam/calix/mycalix-misc/lib/cloud/rn/current/marketing-cloud-rn.htm
${home_contactBtnFooter}=   id=contact-calix
${home_contactNumTxt}=  1.877.766.3500

#feedback
${feedback}=    //*[@class='bb-text _pendo-simple-text _pendo-badge-text']
${feedback_closeIcon}=     //*[@class='_pendo-close-guide']
${feedback_submitFeedback}=    //*[@class='bb-button _pendo-button-primaryButton _pendo-button']
${feedback_titleTxt}=    Share your feedback
${feedback_ContentText}=     Thanks for using the new Calix Engagement Cloud. We would love to know what you think of it!
${feedback_ContentText1}=   Please share your feedback and suggestions
${feedback_NoteTxt}=     NOTE: If a feature is not working please open a case through the Service Station in My Calix

${Retention_home}=   (//*[@id='segmnents-saved-table']//tbody//tr//td[contains(text(),'Retention')])[1]
${Upsell_home}=   (//*[@id='segmnents-saved-table']//tbody//tr//td[contains(text(),'Upsell')])[1]
${Acquisition_home}=   (//*[@id='segmnents-saved-table']//tbody//tr//td[contains(text(),'Acquisition')])[1]
${Retention_advanced}=   (//*[@id='segmnents-saved-table']//tbody//tr//td[contains(text(),'Retention')])[1]/parent::tr/td[1]
${Upsell_advanced}=  (//*[@id='segmnents-saved-table']//tbody//tr//td[contains(text(),'Upsell')])[1]/parent::tr/td[1]
${Acquisition_prospects}=  (//*[@id='segmnents-saved-table']//tbody//tr//td[contains(text(),'Acquisition')])[1]/parent::tr/td[1]
${advanced_navigation}=   //a[contains(text(),'Advanced')]
${prospects_navigation}=   //a[contains(text(),'Prospects')]
${home_savedseg}=    //a[contains(text(),'Saved')]
${ECB_name}=  Electronic Content Builder
${ECB_namepath}=  //*[contains(text(),'Electronic Content Builder')]
${ECB_redirect_img}=  //*[contains(text(),'Electronic Content Builder')]//*[@src='./assets/img/Preview-icon.svg']
${ECB_redirecttoNew_btn}=  //*[@src='./assets/img/Preview-icon.svg']/parent::span/parent::a/parent::span/following-sibling::button
${ECB_redirectURL}=   https://calix.my.site.com/s/login/?startURL=%2Fidp%2Flogin%3Fapp%3D0sp4u0000008OKk
${CC_username}=  (//*[@class='inputContainer'])[1]/div/input[contains(@placeholder,'Username')]
${CC_password}=  (//*[@class='inputContainer'])[2]/div/input[contains(@placeholder,'Password')]
${CC_loginbtn}=  //button[contains(.,'Log in')]
${Home_pagetitle}=  Home- Engagement- Calix Cloud
${ECB_pagetitle}=  Login
${SCH_APItxt}=  Data available
${Create_1st_seg_img}=  //*[@src='assets/img/insight-img-2.png']
*** Keywords ***

navigate to homescreen
    [Documentation]   Navigate to CMC-homepage
    click element until enabled  ${homebtn}
    sleep   30

navigate to homescreen Saved segments
    [Documentation]   Navigate to CMC-homepage Saved segments
    click element until enabled  ${homebtn}
    sleep   30
    ${Segments}=  Run Keyword And Return Status  page should not contain element    ${Create_1st_seg_img}
    Run Keyword If  "${Segments}" == "True"    click element until visible  ${home_savedseg}
#    click element until visible  ${home_savedseg}

verify elements in homescreen
    [Documentation]   CCL-68673_16 - Validate the CMC-homepage
    verify page title for homescreen

    @{multiTxt}=  Create List   ${home_insightstxt}    ${home_allsubscriberslabeltxt}  ${home_streamerlabeltxt}
    ...  ${home_gamerlabeltxt}  ${home_workfrmhomelabeltxt}  ${home_insights_acquisitionRateTxt}
    ...  ${home_insights_churnRate}  ${home_insights_ARPU}  ${home_insights_newSubsPerDay}
    ...  ${home_insights_past30daystxt}  ${home_segmentsheadertxt}  ${home_churntrendsheadertxt}
    ...  ${home_subscribersbysttheadertxt}  ${home_campaignstxt}  ${home_contactnumtxt}   ${ECB_name}
    wait until page contains multiple text  @{multiTxt}

    @{elements}=  Create List  ${home_campaigns_newbtn}    ${home_churntrends_downloadbtn}
    ...  ${home_segments_newbtn}   ${ECB_namepath}   ${ECB_redirect_img}   ${ECB_redirecttoNew_btn}
    ...  ${home_subscribersbystt_downloadbtn}   ${home_subscribersbystt_fiberbtn}
    ...  ${searchfield}  ${home_searchbtn}
    ...  ${home_aboutbtnfooter}  ${home_contactbtnfooter}  ${home_t&cbtnfooter}
    wait until page contain elements  @{elements}
    Capture the Screen  cmcHomescreen
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    Capture the Screen  cmcHomescreenBottom



click on about calix and verify it opens up marketing cloud release notes
    log  CCL-40575
    click element until visible  ${home_aboutBtnFooter}
    sleep  5
    switch window   About Calix Marketing Cloud
    wait until page contains  About Calix Marketing Cloud  30s
    ${currentUrl}=  Get Location
    should be equal as strings  ${home_aboutCalix_currentPath}  ${currentUrl}
    capture the screen  aboutCalixMarketingCloud
    switch window  ${Home_pagetitle}


validate the pendo Feedback
    click element until enabled     ${feedback}
    Capture the Screen     FeedBackTC01
    verify the feedback alert page Texts
    click element until enabled    ${feedback_closeIcon}
    click element until enabled     ${feedback}
    click element until enabled     ${feedback_submitFeedback}
    Capture the Screen     FeedBackTC02

verify the feedback alert page Texts
    [Documentation]  CCL-68673_14  Verify the Engagement in Feedback
    @{multi_txt}=   Create List   ${feedback_titleTxt}    ${feedback_ContentText}
    ...    ${feedback_ContentText1}      ${feedback_NoteTxt}
    page should contain multiple text    @{multi_txt}


getting data from insights in homescreen
    execute javascript  window.scrollTo(0,-document.body.scrollHeight)
    ${list}=  Create List
    ${count}=  get element count  ${home_insights_kpvPath}
    FOR  ${num}  IN RANGE  1  ${count}
    ${data}=  Get the Text from the Element  (//*[@class='flex overview-row']//*[@class='ov-col'])[${num}]
    append to list  ${list}  ${data}
    log  ${data}
    END





validating widget icons data with mouse over in home screen
    [Arguments]  ${testData}  ${webElement}  ${comparingString}
    set selenium implicit wait  10 seconds
    Mouse Over  ${webElement}
    ${tooltipData}=  Get WebElement   ${webElement}
    ${tooltipTitle}=   Call Method   ${tooltipData}   get_attribute   title
    should be equal as strings  ${tooltipTitle}  ${comparingString}



validate clicking info icons for insights, campaigns and segments
    [Arguments]   ${testName}  ${quesBtn}  ${headerlbl}
    set selenium implicit wait   10 seconds
    click element until enabled  ${quesBtn}
    page should contain the element  ${headerlbl}
    click element until enabled  ${home_cancel_btn}
    click element until enabled  ${quesBtn}
    page should contain the element  ${headerlbl}
    click element until enabled  ${home_close_btn}

Validate pendo ques icons in homescreen
    Click on pendo ques icon and verify the text  Insights Subscribers  ${home_insights_subscribersPendo}  ${home_insights_subscribersPendo_stringAttribute}
    Click on pendo ques icon and verify the text  Insights Streaming  ${home_insights_streamingPendo}  ${home_insights_streamingPendo_stringAttribute}
    Click on pendo ques icon and verify the text  Insights Gaming  ${home_insights_gamingPendo}  ${home_insights_gamingPendo_stringAttribute}
    Click on pendo ques icon and verify the text  Insights WFH  ${home_insights_wfhPendo}  ${home_insights_wfhPendo_stringAttribute}
    Click on pendo ques icon and verify the text  Insights AcquisitionRate  ${home_insights_acquisitionRatePendo}  ${home_insights_acquisitionPendo_stringAttribute}
    Click on pendo ques icon and verify the text  Insights ChurnRate  ${home_insights_churnRatePendo}  ${home_insights_churnRatePendo_stringAttribute}
    Click on pendo ques icon and verify the text  Insights ARPU  ${home_insights_arpuPendo}  ${home_insights_arpuPendo_stringAttribute}
    Click on pendo ques icon and verify the text  Insights NewSubscribers  ${home_insights_newSubsPendo}  ${home_insights_newSubsPendo_stringAttribute}
    Click on pendo ques icon and verify the text  SegmentsRecommended  ${home_segments_quesBtn}  ${home_segments_quesBtn_stringAttribute}

validate clicking widget icons in home screen
    [Arguments]   ${testName}  ${downloadBtn}
    set selenium implicit wait   10 seconds
#    click element until enabled  ${quesBtn}
#    page should contain the element  ${headerlbl}
#    click element until enabled  ${home_cancel_btn}
#    click element until enabled  ${quesBtn}
#    page should contain the element  ${headerlbl}
#    click element until enabled  ${home_close_btn}
    click element until enabled   ${downloadBtn}


getting tooltip data from Subscriber By STT widget
    get tooltip data from bar graph widget  ${home_subscribersByStt_barLocation}  ${home_subscribersByStt_tooltipData}

click on new campaigns and verify it is navigated to Scheduled Campaign
    [Documentation]   CCL-67771,CCL-39080_21,CCL-39080_22,CCL-39080_23,CCL-39080_24
    click element until visible  ${home_campaigns_newbtn}
    click element until visible  ${locators_params['Campaigns']['Scheduled_campaign']}[Select_campaign]
    wait until page contains  ${home_campaigns_newCampaignsTxt}  30s
    Capture the Screen  homeToCampaignsScreen
    click element until visible  ${campaigns_close_X}
    wait until page contains element  ${locators_params['Campaigns']['Scheduled_campaign']}[Scheduled_active]  30s
    click element until visible  ${homebtn}

click on new campaigns and verify it is navigated to Triggered Campaign
    [Documentation]   CCL-67771  Triggered Campaign navigation from Home page
    click element until visible  ${home_campaigns_newbtn}
    click element until visible  ${locators_params['Campaigns']['Triggered_campaign']}[Select_campaign]
    wait until page contains  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[New_trig_txt]  30s
    Capture the Screen  homeToCampaignsScreen
    click element until visible  ${locators_params['Campaigns']['Triggered_campaign']}[Close_btn]
    wait until page contains element  ${locators_params['Campaigns']['Triggered_campaign']}[Triggered_active]  30s
    click element until visible  ${homebtn}

validate table data for campaigns
     [Documentation]   CCL-64016  Campaign table validations
     @{Campaign_headers}=  create list   ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_name]   ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_status]
     ...   ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_type]   ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_sub]
     Get text and Ensure the Headers are Equal  ${locators_params['Campaigns']['Scheduled_campaign']}[Camp_table_header]   @{Campaign_headers}
     @{Headers_txt}=    get webelements  ${locators_params['Campaigns']['Scheduled_campaign']}[Camp_status]
     FOR   ${Header_count}  IN  @{Headers_txt}
     ${Status_txt}=  get text   ${Header_count}
     run keyword if   '${Status_txt}' == '${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_txt]'   run keyword   Get Text and Assert   ${locators_params['Campaigns']['Scheduled_campaign']}[Camp_type]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Trigger_txt]
     ...  ELSE IF   '${Status_txt}' == '${test_data_config['env']['Campaigns']['Triggered_campaign']}[Paused_txt]'   run keyword   Get Text and Assert   ${locators_params['Campaigns']['Scheduled_campaign']}[Camp_type]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Trigger_txt]
     ...  ELSE   log   Triggered Campaign not available
     END
     ${Num}    Generate random string    4    0123456789
     Capture the Screen   Campaign_home-${Num}
     click on a data in campaigns table and verify its navigated

click on a data in campaigns table and verify its navigated
    ${dataTxt}=  get the text from the element  ${home_campaigns_table_1stData}
    click element until enabled  ${home_campaigns_table_1stData}
    sleep  15
    Capture the Screen  campaignsStep4DataScreen
    @{Test_datas}=  create list  ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_segment]   ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_budget]
    page should contain multiple text  @{Test_datas}
    page should contain the element  ${dataTxt}
    click element until enabled  ${homebtn}

click on new segments and verify it is navigated
    set selenium implicit wait   10 seconds
    click element until enabled  ${home_segments_newbtn}
    sleep  2
    Capture the Screen  exploreDataScreen
    page should contain element  ${basicTab}
    click element until enabled  ${homebtn}

segments validation in homescreen
    ${status}=  Run Keyword And Return Status  element should be visible  //*[@id='segmnents-recommended-table']//tbody//tr[2]//td
    Run Keyword If  ${status}  Run Keywords
    ...  recommended tab validation in segments
    ...  AND  saved tab validation in segments
    ...  ELSE  log no data error



recommended tab validation in segments
    click element until enabled  ${home_segments_recmndtab}
    sleep  2
    Click on pendo ques icon and verify the text  SegmentsRecommended  ${home_segments_quesBtn}  ${home_segments_quesBtn_stringAttribute}
    ${status}=  Run Keyword And Return Status  element should be visible  //*[@id='segmnents-recommended-table']//tbody//tr[2]//td
    Run Keyword If  ${status}  validate table data for recommended tab in segments
    ...  ELSE  log no data error


validate table data for recommended tab in segments
    @{list}=  Create List
    ${columns}=  get element count  ${home_segments_recmndtab_trow}
    FOR  ${row}  IN RANGE  1  ${columns}+1
    ${data_table}=  handle table data for recommended tab in segments   ${row}
    append to list  ${list}  ${data_table}
    END

handle table data for recommended tab in segments
    [Arguments]  ${test_row}
    ${columns}=   get element count  ${home_segments_recmndtab_tcol}
    FOR  ${column}  IN RANGE  1  ${columns}
    ${data_table}=  get text  xpath=//*[@id='segmnents-recommended-table']//tbody/tr[${test_row}]/td[${column}]
    log to console  ${data_table}
    END


saved tab validation in segments
    click element until enabled  ${home_segments_savedtab}
    sleep  2
    ${status}=  Run Keyword And Return Status  element should be visible  //*[@id='segmnents-saved-table']//tbody//tr[2]//td
    Run Keyword If  ${status}  Run Keywords
    ...  validate table data for saved tab in segments
    ...  AND  click on a saved segment and verify its navigating to advanced tab
    ...  ELSE  log no data error


click on a saved segment and verify its navigating to advanced tab
    click element until visible  //*[@id='segmnents-saved-table']//tbody//tr[2]//td[1]
    wait until page contains element   ${exploreData_advancedTab}  30s
    capture the screen  advancdNav
    click element until visible  ${homebtn}

validate table data for saved tab in segments
    @{list}=  Create List
    ${columns}=  get element count  ${home_segments_savedtab_trow}
    FOR  ${row}  IN RANGE  1  ${columns}+1
    ${data_table}=  handle table data for saved tab in segments  ${row}
    append to list  ${list}  ${data_table}
    END

handle table data for saved tab in segments
    [Arguments]  ${test_row}
    ${columns}=  get element count  ${home_segments_savedtab_tcol}
    FOR  ${column}  IN RANGE  1  ${columns}
    ${data_table}=  get text  xpath=//*[@id='segmnents-saved-table']//tbody/tr[${test_row}]/td[${column}]
    log to console  ${data_table}
    END


click on fiber button under subscriber by stt and validate
    click element until enabled  ${home_subscribersbystt_fiberbtn}
    page should contain element  ${home_subscribersbystt_fiberbtnhidden}
    click element until enabled  ${home_subscribersbystt_fiberbtnhidden}
    page should contain element  ${home_subscribersbystt_fiberbtn}

Validate clicking dropdown list data in SCH lense
    [Documentation]  This validation is because sometimes the chart data not available in UI
    ${response}=    call method    ${API_CMCObj}   Social_Channel_Heatmap_charts
    ${response_text}=  convert to string   ${response}[1]
    Run Keyword If   "${response_text}" == "${SCH_APItxt}"    Validate the different social channel in Home page
    ...   ELSE   log    No data available in Charts

Validate the different social channel in Home page
    ${response}=    call method    ${API_CMCObj}   Social_Channel_Heatmap_charts
    ${response_text}=  convert to string   ${response}[2][0]
    ${Social_txt}=   remove string   ${response_text}   [  ]  (  )  '  dict_keys
    run keyword if   '${test_data_config['env']['Home']}[Youtube_txt]' == '${Social_txt}'    Validate the Social channel heatmap Youtube only
    ...   ELSE IF   '${test_data_config['env']['Home']}[Fb_Yt_txt]' == '${Social_txt}'    Validate the Social channel heatmap
    ...   ELSE   '${test_data_config['env']['Home']}[Facebook_txt]' == '${Social_txt}'   Validate the Social channel heatmap Facebook only

Validate the Social channel heatmap Youtube only
    [Documentation]  Dropdown only contains Youtube
    click element until visible  ${home_sch_dropdown}
    click element until visible  //*[contains(@class,'host')]//*[text()='${test_data_config['env']['Home']}[Youtube_txt]']
    Element Should Contain   ${home_SCH_placeholder}    ${test_data_config['env']['Home']}[Youtube_txt]
    capture the screen   Youtube_only
    click element until visible   ${home_sch_dropdown}
    ${Actual_dropdown}=  get text  ${home_SCH_dropdownlist}
    Should be Equal    ${Actual_dropdown}   ${test_data_config['env']['Home']}[Youtube_txt]

Validate the Social channel heatmap Facebook only
    [Documentation]  Dropdown only contains Facebook
    click element until visible  ${home_sch_dropdown}
    click element until visible  //*[contains(@class,'host')]//*[text()='${test_data_config['env']['Home']}[Facebook_txt]']
    Element Should Contain   ${home_SCH_placeholder}   ${test_data_config['env']['Home']}[Facebook_txt]
    capture the screen   Facebook_only
    click element until visible   ${home_sch_dropdown}
    ${Actual_dropdown}=  get text  ${home_SCH_dropdownlist}
    Should be Equal    ${Actual_dropdown}   ${test_data_config['env']['Home']}[Facebook_txt]

Validate the Social channel heatmap
    [Documentation]  CCL-52639 Dropdown only contains Facebookb and Youtube
    @{list}=  Create List  ${test_data_config['env']['Home']}[Facebook_txt]   ${test_data_config['env']['Home']}[Youtube_txt]
    FOR  ${social}  IN  @{list}
    click element until visible  ${home_sch_dropdown}
    click element until visible  //*[contains(@class,'host')]//*[text()='${social}']
    Element Should Contain   ${home_SCH_placeholder}    ${social}
    capture the screen   ${social}
    END
    ${Actual_dropdown}=  Get dropdown Actual Lists   ${home_sch_dropdown}   ${home_SCH_dropdownlist}
    Should be Equal    ${Actual_dropdown}   ${list}

Verify homescreen pendo validation - videoGuide
    [Documentation]   Pendo validation for Homescreen
    Pendo video icon validation  SCH  (${pendo_videoicons})[1]
    Pendo video icon validation  segmentsWidget  (${pendo_videoicons})[2]
    Pendo video icon validation  churnTrendsWidget  (${pendo_videoicons})[3]
    Pendo video icon validation  newSubsWidget  (${pendo_videoicons})[4]
    Pendo video icon validation  campaignsWidget  (${pendo_videoicons})[5]
    Pendo video icon validation  servTierTechWidget  (${pendo_videoicons})[6]
    Pendo video icon validation  search  (${pendo_search_videoIcon})[1]

log campaigns table absent error
    log to console  campaigns table not present

log no data error
    log to console  no data present..

click on Saved segments and verify the navigation for Retention
   [Documentation]  CCL-50953  Navigation checking, If click Retention page should navigate to Explore Data-Advanced Tab
   ${Segments}=  Run Keyword And Return Status  page should not contain element    ${Create_1st_seg_img}
   Run Keyword If  "${Segments}" == "True"    Verify the Navigation for Retention Segments
    ...  ELSE  log  Segments Not Available

Verify the Navigation for Retention Segments
   click element until visible  ${home_savedseg}
   ${Status}=  Run Keyword and Return Status    element should be visible    ${Retention_home}
   Run Keyword If  ${status}  Run Keyword    validate the Advanced_Retention tab
   ...    ELSE   log   Retention not available

validate the Advanced_Retention tab
   click element until visible    ${Retention_advanced}
   element should be visible   ${advanced_navigation}
   Capture Page Screenshot   RetentionNavigationinhome

click on Saved segments and verify the navigation for Upsell
   ${Status}=  Run Keyword and Return Status    element should be visible    ${Upsell_home}
   Run Keyword If  ${status}  Run Keyword    validate the Advanced_Upsell tab
   ...    ELSE   log   Upsell not available

validate the Advanced_Upsell tab
   click element until visible    ${Upsell_advanced}
   element should be visible   ${advanced_navigation}
   Capture Page Screenshot   UpsellNavigationinhome

click on Saved segments and verify the navigation for Acquisition
   ${Status}=  Run Keyword and Return Status    element should be visible    ${Acquisition_home}
   Run Keyword If  ${status}  Run Keyword    validate the Prospects_Acquisition tab
   ...    ELSE   log   Acquisition not available

validate the Prospects_Acquisition tab
   [Documentation]  When click Acquistion type Page should redirect to Prospects tab
   click element until visible    ${Acquisition_prospects}
   element should be visible   ${prospects_navigation}
   Capture Page Screenshot   AcquisitionNavigationinhome

Verify the Electronic Content Builder
   [Documentation]   CCL-52239_01,CCL-52239_02,CCL-52239_03,CCL-54332 Check the redirection URL for Electronic Content Builder
   @{elements}=   Create List    ${ECB_redirecttoNew_btn}    ${ECB_namepath}   ${ECB_redirect_img}
   wait until page contain elements  @{elements}
   capture the screen   ECB-Homepage
   click element until visible   ${ECB_redirect_img}
   Switch window   ${ECB_pagetitle}
   ${current_URL}=   get location
   Should be equal   ${current_URL}   ${ECB_redirectURL}
   capture the screen   ECB redirect login
   @{CC_elements}=   Create List    ${CC_username}    ${CC_password}   ${CC_loginbtn}
   wait until page contain elements  @{CC_elements}
   Switch window   ${Home_pagetitle}
   capture the screen   After switch back to Home
   verify elements in homescreen

