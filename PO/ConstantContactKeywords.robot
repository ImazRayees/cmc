*** Settings ***
Resource  ../PO/Campigns_po.robot


*** Keywords ***
##ConstantContact-singleChannel
Step 2 channel with ConstantContact
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
     Verify dropdown and select NON-MOBILE MESSAGE for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}

Step 3 deploy with ConstantContact
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${consContact_headerTxt}  ${consContact_helpTxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    @{elements}=   Create List   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deployPopup_actionSingleTxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results with ConstantContact
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...   ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4
    @{elements}=  Create List  ${results_inProgress}   ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_constantContact}
    Constantcontact redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mobileNoti}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}
-----------------------ConstantContact-2channels
##MobileNotiAndConstantContact
Step 2 select MobileNoti and ConstantContact
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select ALL for selected channel  Mobile Notification
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    [Return]    ${count}

Step 3 validate and click deploy popup for MobileNoti and ConstantContact
    [Arguments]  ${campName}  ${segment}  ${Mobile_segmentsize}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list   ${consContact_headerTxt}  ${consContact_helpTxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling   ${Mobile_segmentsize}
    Step 3 for event driven  Competitor Visit Minutes   4.24*10Hz   UTC   ${Mobile_segmentsize}
    click element until visible   ${deploy-btn}
    Verify the Elements for Deploy Popup   ${Mobile_segmentsize}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for MobileNoti and ConstantContact
    [Arguments]  ${campName}  ${seletedSegment}  ${Mobile_count}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...   ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_consContactDeploymentStatus}  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    run keyword if   '${Mobile_count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify the Mobile Notification Elements in Results
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    run keyword if   '${Mobile_count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mobileNotification}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_constantContact}
    log  Mobile notification redeployment functions - immediate
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
    Constantcontact redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mobileNoti}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

Verify the Mobile Notification Elements in Results
    [Documentation]   CCL-58822   verify the mobile elements in results page
    @{elements}=  Create List  ${results_mobilenoti}   ${results_mobileNotiSubTitles_schedule}  ${results_mobileNotiSubTitles_segmentMembers}  ${results_mobileNotiSubTitles_notificationsSent}
    wait until page contain elements  @{elements}

##MailchimpAndConstantContact
Step 2 select Mailchimp and ConstantContact
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}

Step 3 validate and click deploy popup for Mailchimp and ConstantContact
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${mailchimp_headertxt}  ${mailchimp_helptxt}
    ...  2. ${consContact_headerTxt}  ${consContact_helpTxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    @{elements}=   Create List   ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}
    ...  ${deploypopup_mailchimptxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for Mailchimp and ConstantContact
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_mailchimp}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mailchimpdeploymentstatus}  ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mailChimp}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_constantContact}
    Mailchimp redeployment check
    Constantcontact redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mobileNoti}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

##FbAndConstantContact
Step 2 select Fb and ConstantContact
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_fbCheckbox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}

Step 3 validate and click deploy popup for Fb and ConstantContact
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${fb_headertxt}  ${fb_helptxt}
    ...  2. ${consContact_headerTxt}  ${consContact_helpTxt}
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    @{elements}=   Create List  ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}
    ...  ${deployPopup_fbTxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for Fb and ConstantContact
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...   ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_facebookDeploymentStatus}  ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_facebook}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_constantContact}
    Constantcontact redeployment check
    Facebook redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mobileNoti}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

##HubspotAndConstantContact
Step 2 select Hubspot and ConstantContact
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select ALL for selected channel  Hubspot
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}

Step 3 validate and click deploy popup for Hubspot and ConstantContact
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${hubspot_headertxt}  ${hubspot_helpTxt}
    ...  2. ${consContact_headerTxt}  ${consContact_helpTxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    @{elements}=   Create List  ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}

    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}
    ...  ${deployPopup_hubspotTxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for Hubspot and ConstantContact
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...    ${results_hubspot}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}    ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_hubspotDeploymentStatus}  ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_hubspot}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_constantContact}
    Hubspot redeployment check
    Constantcontact redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mobileNoti}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

##CsvAndConstantContact
Step 2 select CSV and ConstantContact
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_csvDownloadCheckBox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  ConstantContact
    Verify dropdown and select ALL for selected channel  Download CSV
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}

Step 3 validate and click deploy popup for CSV and ConstantContact
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${csv_headertxt}  ${csv_helptxt}
    ...  2. ${consContact_headerTxt}  ${consContact_helpTxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    @{elements}=   Create List  ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}
    ...  ${deploypopup_csvtxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for CSV and ConstantContact
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_csvdownloadbtn}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_constantContact}
    Constantcontact redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mobileNoti}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

-----------------------ConstantContact-3channels
##MobileNoti,MailchimpAndConstantContact
Step 2 select MobileNoti, Mailchimp and ConstantContact
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select ALL for selected channel  Mobile Notification
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    [Return]   ${count}

Step 3 validate and click deploy popup for MobileNoti, Mailchimp and ConstantContact
    [Arguments]  ${campName}  ${segment}  ${Mobile_count}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  ${mailchimp_headertxt}  ${mailchimp_helptxt}
    ...  ${consContact_headerTxt}  ${consContact_helpTxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling   ${Mobile_count}
    Step 3 for event driven  Competitor Visit Minutes   5.24*10Hz   America/New_York (East Coast)  ${Mobile_count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}
    ...  ${deploypopup_mailchimptxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    run keyword if  '${Mobile_count}' == '0'   log  Mobile notification not available
    ...  ELSE  run keywords   @{mobile_text}=   create list   ${deploypopup_ciqmobilenottxt}  ${deploypopup_ciqmobilenottxt}
    ...  AND  wait until page contains multiple text
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for MobileNoti, Mailchimp and ConstantContact
    [Arguments]  ${campName}  ${seletedSegment}  ${Mobile_count}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...   ${results_mailchimp}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}   ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mailchimpdeploymentstatus}  ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    run keyword if   '${Mobile_count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify the Mobile Notification Elements in Results
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    run keyword if   '${Mobile_count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mobileNotification}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mailChimp}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_constantContact}
    log  Mobile notification redeployment functions - scheduled
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Validation Step 3(1) for scheduled
    ...  AND  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
    Mailchimp redeployment check
    Constantcontact redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mobileNoti}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

##MobileNoti,FbAndConstantContact
Step 2 select MobileNoti, Fb and ConstantContact
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    click element until enabled  ${campaigns_channel_fbCheckbox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    Verify dropdown and select ALL for selected channel  Mobile Notification
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    [Return]  ${count}

Step 3 validate and click deploy popup for MobileNoti, Fb and ConstantContact
    [Arguments]  ${campName}  ${segment}  ${Mobile_segmentsize}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  ${fb_headertxt}  ${fb_helptxt}
    ...  ${consContact_headerTxt}  ${consContact_helpTxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling  ${Mobile_segmentsize}
    Step 3 for event driven  Speed Test Minutes   4.24*10Hz   UTC  ${Mobile_segmentsize}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}
    ...  ${deployPopup_fbTxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    run keyword if  '${Mobile_segmentsize}' == '0'   log  Mobile notification not available
    ...  ELSE   page should contain element   ${deploypopup_ciqmobilenottxt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for MobileNoti, Fb and ConstantContact
    [Arguments]  ${campName}  ${seletedSegment}  ${Mobile_count}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}   ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_facebookDeploymentStatus}  ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...  ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...  ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    run keyword if   '${Mobile_count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify the Mobile Notification Elements in Results
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    run keyword if   '${Mobile_count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mobileNotification}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_facebook}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_constantContact}
    log  Mobile notification redeployment functions - eventDriven
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Competitor Visit Minutes   4.24*10Hz   UTC
    ...  AND  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
    Constantcontact redeployment check
    Facebook redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mobileNoti}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

##MobileNoti,HubspotAndConstantContact
Step 2 select MobileNoti, Hubspot and ConstantContact
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select ALL for selected channel  Mobile Notification
    Verify dropdown and select ALL for selected channel  Hubspot
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    [Return]  ${count}

Step 3 validate and click deploy popup for MobileNoti, Hubspot and ConstantContact
    [Arguments]  ${campName}  ${segment}  ${Mobile_segmentsize}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  ${hubspot_headertxt}  ${hubspot_helpTxt}
    ...  ${consContact_headerTxt}  ${consContact_helpTxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling   ${Mobile_segmentsize}
    Step 3 for event driven  Speed Test Minutes   5.24*10Hz   America/New_York (East Coast)  ${Mobile_segmentsize}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deployPopup_hubspotTxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    run keyword if  '${Mobile_segmentsize}' == '0'   log  Mobile notification not available
    ...  ELSE   page should contain element   ${deploypopup_ciqmobilenottxt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for MobileNoti, Hubspot and ConstantContact
    [Arguments]  ${campName}  ${seletedSegment}  ${Mobile_segmentsize}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...    ${results_hubspot}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}    ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_hubspotDeploymentStatus}  ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    run keyword if   '${Mobile_segmentsize}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify the Mobile Notification Elements in Results
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    run keyword if   '${Mobile_segmentsize}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mobileNotification}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_hubspot}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_constantContact}
    log  Mobile notification redeployment functions - eventDriven
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Competitor Visit Minutes   5.24*10Hz   America/New_York (East Coast)
    ...  AND  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
    Hubspot redeployment check
    Constantcontact redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mobileNoti}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

##Facebook,CsvAndConstantContact
Step 2 select Facebook, CSV and ConstantContact
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_fbCheckbox}
    click element until enabled  ${campaigns_channel_csvDownloadCheckBox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}

Step 3 validate and click deploy popup for Facebook, CSV and ConstantContact
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${fb_headertxt}  ${fb_helptxt}
    ...  2. ${csv_headertxt}  ${csv_helptxt}
    ...  3. ${consContact_headerTxt}  ${consContact_helpTxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    @{elements}=   Create List   ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}
    ...  ${deployPopup_fbTxt}  ${deploypopup_csvtxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for Facebook, CSV and ConstantContact
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_csvdownloadbtn}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_facebookDeploymentStatus}  ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...  ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...  ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_facebook}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_constantContact}
    Constantcontact redeployment check
    Facebook redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mobileNoti}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

##Mailchimp,HubspotAndConstantContact
Step 2 select Mailchimp, CSV and ConstantContact
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    click element until enabled  ${campaigns_channel_csvDownloadCheckBox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}

Step 3 validate and click deploy popup for Mailchimp, CSV and ConstantContact
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${mailchimp_headertxt}  ${mailchimp_helptxt}  2. ${csv_headertxt}  ${csv_helptxt}
    ...  3. ${consContact_headerTxt}  ${consContact_helpTxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    @{elements}=   Create List  ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}
    ...  ${deploypopup_csvtxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for Mailchimp, CSV and ConstantContact
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_mailchimp}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_csvdownloadbtn}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mailchimpdeploymentstatus}   ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mailChimp}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_constantContact}
    Mailchimp redeployment check
    Constantcontact redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mobileNoti}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

-----------------------ConstantContact-4channels
##MobileNoti,Mailchimp,FacebookAndConstantContact
Step 2 select MobileNoti,Mailchimp,Fb and ConstantContact
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    click element until enabled  ${campaigns_channel_fbCheckbox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    run keyword if   '${count}' == '0'   log  No Mobile Notification
    ...  ELSE  Verify dropdown and select ALL for selected channel  Mobile Notification
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    [Return]   ${count}

Step 3 validate and click deploy popup for MobileNoti,Mailchimp,Fb and ConstantContact
    [Arguments]  ${campName}  ${segment}  ${Mobile_count}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  ${mailchimp_headertxt}  ${mailchimp_helptxt}  ${fb_headertxt}  ${fb_helptxt}
    ...  ${consContact_headerTxt}  ${consContact_helpTxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling  ${Mobile_count}
    Step 3 for event driven  Competitor Visit Minutes   4.24*10Hz   UTC  ${Mobile_count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}
    ...  ${deployPopup_fbTxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    run keyword if  '${Mobile_count}' == '0'   log  Mobile notification not available
    ...  ELSE   page should contain element   ${deploypopup_ciqmobilenottxt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for MobileNoti,Mailchimp,Fb and ConstantContact
    [Arguments]  ${campName}  ${seletedSegment}  ${Mobile_count}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_mailchimp}  ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}    ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mailchimpdeploymentstatus}  ${results_facebookDeploymentStatus}  ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    run keyword if   '${Mobile_count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify the Mobile Notification Elements in Results
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    run keyword if   '${Mobile_count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mobileNotification}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mailChimp}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_facebook}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_constantContact}
    log  Mobile notification redeployment functions - eventDriven
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Speed Test Minutes   4.24*10Hz   UTC
    ...  AND  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
    Mailchimp redeployment check
    Constantcontact redeployment check
    Facebook redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mobileNoti}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

##MobileNoti,Mailchimp,HubspotAndConstantContact
Step 2 select MobileNoti,Hubspot,Fb and ConstantContact
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    click element until enabled  ${campaigns_channel_fbCheckbox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    run keyword if   '${count}' == '0'   log  No Mobile Notification
    ...  ELSE  Verify dropdown and select ALL for selected channel  Mobile Notification
    Verify dropdown and select ALL for selected channel  Hubspot
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    [Return]   ${count}

Step 3 validate and click deploy popup for MobileNoti,Hubspot,Fb and ConstantContact
    [Arguments]  ${campName}  ${segment}  ${Mobile_count}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  ${fb_headertxt}  ${fb_helptxt}
    ...  ${hubspot_headertxt}  ${hubspot_helpTxt}  ${consContact_headerTxt}  ${consContact_helpTxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling  ${Mobile_count}
    Step 3 for event driven  Competitor Visit Minutes   5.24*10Hz   America/New_York (East Coast)  ${Mobile_count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}
    ...  ${deployPopup_fbTxt}  ${deployPopup_hubspotTxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    run keyword if  '${Mobile_count}' == '0'   log  Mobile notification not available
    ...  ELSE   page should contain element   ${deploypopup_ciqmobilenottxt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for MobileNoti,Hubspot,Fb and ConstantContact
    [Arguments]  ${campName}  ${seletedSegment}  ${Mobile_count}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...    ${results_hubspot}  ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}    ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mobilenoti}   ${results_mobileNotiSubTitles_schedule}  ${results_mobileNotiSubTitles_segmentMembers}  ${results_mobileNotiSubTitles_notificationsSent}
    ...  ${results_facebookDeploymentStatus}  ${results_hubspotDeploymentStatus}  ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    run keyword if   '${Mobile_count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify the Mobile Notification Elements in Results
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    run keyword if   '${Mobile_count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mobileNotification}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_facebook}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_hubspot}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_constantContact}
    log  Mobile notification redeployment functions - eventDriven
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Speed Test Minutes   5.24*10Hz   America/New_York (East Coast)
    ...  AND  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
    Hubspot redeployment check
    Constantcontact redeployment check
    Facebook redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mobileNoti}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

##MobileNoti,Mailchimp,CsvAndConstantContact
Step 2 select MobileNoti,Mailchimp,Csv and ConstantContact
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    click element until enabled  ${campaigns_channel_csvDownloadCheckBox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    run keyword if   '${count}' == '0'   log  No Mobile Notification
    ...  ELSE  Verify dropdown and select ALL for selected channel  Mobile Notification
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    [Return]   ${count}

Step 3 validate and click deploy popup for MobileNoti,Mailchimp,Csv and ConstantContact
    [Arguments]  ${campName}  ${segment}  ${Mobile_count}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  ${mailchimp_headertxt}  ${mailchimp_helptxt}  ${csv_headertxt}  ${csv_helptxt}  Image  Preview
    ...  ${consContact_headerTxt}  ${consContact_helpTxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling  ${Mobile_count}
    Validation Step 3(1) for scheduled
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}
    ...  ${deploypopup_csvtxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    run keyword if  '${Mobile_count}' == '0'   log  Mobile notification not available
    ...  ELSE   page should contain element   ${deploypopup_ciqmobilenottxt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for MobileNoti,Mailchimp,Csv and ConstantContact
    [Arguments]  ${campName}  ${seletedSegment}  ${Mobile_count}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_mailchimp}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_csvdownloadbtn}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mailchimpdeploymentstatus}   ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    run keyword if   '${Mobile_count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify the Mobile Notification Elements in Results
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    run keyword if   '${Mobile_count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mobileNotification}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mailChimp}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_constantContact}
    log  Mobile notification redeployment functions - eventDriven
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Service Limit Hits   4.24*10Hz   UTC
    ...  AND  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
    Mailchimp redeployment check
    Constantcontact redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mobileNoti}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

##Mailchimp,Hubspot,CsvAndConstantContact
Step 2 select Mailchimp,Hubspot,Csv and ConstantContact
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    click element until enabled  ${campaigns_channel_csvDownloadCheckBox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    Verify dropdown and select ALL for selected channel  Hubspot
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}

Step 3 validate and click deploy popup for Mailchimp,Hubspot,Csv and ConstantContact
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${mailchimp_headertxt}  ${mailchimp_helptxt}  2. ${hubspot_headertxt}  ${hubspot_helpTxt}
    ...  3. ${csv_headertxt}  ${csv_helptxt}  4. ${consContact_headerTxt}  ${consContact_helpTxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    @{elements}=   Create List  ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}
    ...  ${deploypopup_csvtxt}  ${deployPopup_hubspotTxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for Mailchimp,Hubspot,Csv and ConstantContact
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...    ${results_hubspot}  ${results_mailchimp}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_csvdownloadbtn}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mailchimpdeploymentstatus}  ${results_hubspotDeploymentStatus}  ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mailChimp}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_hubspot}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_constantContact}
    Mailchimp redeployment check
    Hubspot redeployment check
    Constantcontact redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mobileNoti}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

##Facebook,Csv,HubspotAndConstantContact
Step 2 select Fb,Hubspot,Csv and ConstantContact
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_fbCheckbox}
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    click element until enabled  ${campaigns_channel_csvDownloadCheckBox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    Verify dropdown and select ALL for selected channel  Hubspot
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}

Step 3 validate and click deploy popup for Fb,Hubspot,Csv and ConstantContact
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${fb_headertxt}  ${fb_helptxt}  2. ${hubspot_headertxt}  ${hubspot_helpTxt}
    ...  3. ${csv_headertxt}  ${csv_helptxt}  4. ${consContact_headerTxt}  ${consContact_helpTxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    @{elements}=   Create List  ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}
    ...  ${deployPopup_fbTxt}  ${deploypopup_csvtxt}  ${deployPopup_hubspotTxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for Fb,Hubspot,Csv and ConstantContact
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...    ${results_hubspot}  ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_csvdownloadbtn}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_facebookDeploymentStatus}  ${results_hubspotDeploymentStatus}  ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_facebook}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_hubspot}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_constantContact}
    Hubspot redeployment check
    Constantcontact redeployment check
    Facebook redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mobileNoti}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}


----------5channels
##MobileNoti,Mailchimp,Fb,Hubspot and CSV
Step 2 select MobileNoti,Mailchimp,Fb,Hubspot and CSV
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_mobileMsgCheckBox}
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    click element until enabled  ${campaigns_channel_fbCheckbox}
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    click element until enabled  ${campaigns_channel_csvDownloadCheckBox}
     Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    Verify dropdown and select ALL for selected channel  Mobile Notification
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    Verify dropdown and select ALL for selected channel  Hubspot
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}

Step 3 validate and click deploy popup for MobileNoti,Mailchimp,Fb,Hubspot and CSV
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  2. ${mailchimp_headertxt}  ${mailchimp_helptxt}  3. ${fb_headertxt}  ${fb_helptxt}
    ...  4. ${hubspot_headertxt}  ${hubspot_helpTxt}  5. ${csv_headertxt}  ${csv_helptxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling
    Validation Step 3(1) for scheduled
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}  ${deploypopup_ciqmobilenottxt}
    ...  ${deployPopup_fbTxt}  ${deploypopup_csvtxt}  ${deployPopup_hubspotTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for MobileNoti,Mailchimp,Fb,Hubspot and CSV
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...    ${results_hubspot}  ${results_mailchimp}  ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_csvdownloadbtn}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mobilenoti}   ${results_mobileNotiSubTitles_schedule}  ${results_mobileNotiSubTitles_segmentMembers}  ${results_mobileNotiSubTitles_notificationsSent}
    ...  ${results_mailchimpdeploymentstatus}  ${results_facebookDeploymentStatus}  ${results_hubspotDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mobileNotification}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mailChimp}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_facebook}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_hubspot}
    log  Mobile notification redeployment functions - eventDriven
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Service Limit Hits   5.24*10Hz   America/New_York (East Coast)
    ...  AND  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
    Mailchimp redeployment check
    Facebook redeployment check
    Hubspot redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mobileNoti}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

##MobileNoti,Fb,Hubspot,CSV and ConstantContact
Step 2 select MobileNoti,Fb,Hubspot,CSV and ConstantContact
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    click element until enabled  ${campaigns_channel_fbCheckbox}
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    click element until enabled  ${campaigns_channel_csvDownloadCheckBox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    run keyword if   '${count}' == '0'   log  No Mobile Notification
    ...  ELSE  Verify dropdown and select ALL for selected channel  Mobile Notification
    Verify dropdown and select ALL for selected channel  Hubspot
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    [Return]   ${count}

Step 3 validate and click deploy popup for MobileNoti,Fb,Hubspot,CSV and ConstantContact
    [Arguments]  ${campName}    ${segment}   ${Mobile_count}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  ${fb_headertxt}  ${fb_helptxt}
    ...  ${hubspot_headertxt}  ${hubspot_helpTxt}  ${csv_headertxt}  ${csv_helptxt}
    ...  ${consContact_headerTxt}  ${consContact_helpTxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling   ${Mobile_count}
    Validation Step 3(1) for scheduled
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}
    ...  ${deployPopup_fbTxt}  ${deploypopup_csvtxt}  ${deployPopup_hubspotTxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    run keyword if  '${Mobile_count}' == '0'   log  Mobile notification not available
    ...  ELSE   page should contain element   ${deploypopup_ciqmobilenottxt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for MobileNoti,Fb,Hubspot,CSV and ConstantContact
    [Arguments]  ${campName}  ${seletedSegment}   ${Mobile_count}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...    ${results_hubspot}  ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_csvdownloadbtn}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_facebookDeploymentStatus}  ${results_hubspotDeploymentStatus}  ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...  ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...  ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    run keyword if   '${Mobile_count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify the Mobile Notification Elements in Results
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    run keyword if   '${Mobile_count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mobileNotification}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_facebook}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_hubspot}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_constantContact}
    log  Mobile notification redeployment functions - scheduled
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Validation Step 3(1) for scheduled
    ...  AND  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
    Hubspot redeployment check
    Constantcontact redeployment check
    Facebook redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mobileNoti}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

##MobileNoti,Mailchimp,Hubspot,CSV and ConstantContact
Step 2 select MobileNoti,Mailchimp,Hubspot,CSV and ConstantContact
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    click element until enabled  ${campaigns_channel_csvDownloadCheckBox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    run keyword if   '${count}' == '0'   log  No Mobile Notification
    ...  ELSE  Verify dropdown and select ALL for selected channel  Mobile Notification
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    Verify dropdown and select ALL for selected channel  Hubspot
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    [Return]   ${count}

Step 3 validate and click deploy popup for MobileNoti,Mailchimp,Hubspot,CSV and ConstantContact
    [Arguments]  ${campName}  ${segment}  ${Mobile_count}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  ${mailchimp_headertxt}  ${mailchimp_helptxt}  ${hubspot_headertxt}  ${hubspot_helpTxt}
    ...  ${csv_headertxt}  ${csv_helptxt}  Image  Preview
    ...  ${consContact_headerTxt}  ${consContact_helpTxt}
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling  ${Mobile_count}
    Validation Step 3(1) for scheduled
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}
    ...  ${deploypopup_csvtxt}  ${deployPopup_hubspotTxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    run keyword if  '${Mobile_count}' == '0'   log  Mobile notification not available
    ...  ELSE   page should contain element   ${deploypopup_ciqmobilenottxt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for MobileNoti,Mailchimp,Hubspot,CSV and ConstantContact
    [Arguments]  ${campName}  ${seletedSegment}  ${Mobile_count}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...    ${results_hubspot}  ${results_mailchimp}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_csvdownloadbtn}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mailchimpdeploymentstatus}  ${results_hubspotDeploymentStatus}  ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    run keyword if   '${Mobile_count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify the Mobile Notification Elements in Results
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    run keyword if   '${Mobile_count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mobileNotification}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mailChimp}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_hubspot}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_constantContact}
    log  Mobile notification redeployment functions - immediate
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
    Mailchimp redeployment check
    Hubspot redeployment check
    Constantcontact redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mobileNoti}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

##MobileNoti,Mailchimp,Fb,Hubspot and ConstantContact
Step 2 select MobileNoti,Mailchimp,Fb,Hubspot and ConstantContact
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    click element until enabled  ${campaigns_channel_fbCheckbox}
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    run keyword if   '${count}' == '0'   log  No Mobile Notification
    ...  ELSE  Verify dropdown and select ALL for selected channel  Mobile Notification
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    Verify dropdown and select ALL for selected channel  Hubspot
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    [Return]   ${count}

Step 3 validate and click deploy popup for MobileNoti,Mailchimp,Fb,Hubspot and ConstantContact
    [Arguments]  ${campName}  ${segment}   ${Mobile_count}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list   ${mailchimp_headertxt}  ${mailchimp_helptxt}  ${fb_headertxt}  ${fb_helptxt}
    ...  ${hubspot_headertxt}  ${hubspot_helpTxt}   ${consContact_headerTxt}  ${consContact_helpTxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling  ${Mobile_count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}
    ...  ${deployPopup_hubspotTxt}
    wait until page contains multiple text  @{txt}
    run keyword if  '${Mobile_count}' == '0'   log  Mobile notification not available
    ...  ELSE   page should contain element   ${deploypopup_ciqmobilenottxt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for MobileNoti,Mailchimp,Fb,Hubspot and ConstantContact
    [Arguments]  ${campName}  ${seletedSegment}   ${Mobile_count}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...    ${results_hubspot}  ${results_mailchimp}  ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mailchimpdeploymentstatus}  ${results_facebookDeploymentStatus}  ${results_hubspotDeploymentStatus}  ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    run keyword if   '${Mobile_count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify the Mobile Notification Elements in Results
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    run keyword if   '${Mobile_count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mobileNotification}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mailChimp}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_facebook}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_hubspot}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_constantContact}
    log  Mobile notification redeployment functions - eventDriven
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Competitor Visit Minutes   4.24*10Hz   UTC
    ...  AND  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
    Mailchimp redeployment check
    Hubspot redeployment check
    Constantcontact redeployment check
    Facebook redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mobileNoti}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

##Mailchimp,Fb,Hubspot,CSV and ConstantContact
Step 2 select Mailchimp,Fb,Hubspot,CSV and ConstantContact
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    click element until enabled  ${campaigns_channel_fbCheckbox}
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    click element until enabled  ${campaigns_channel_csvDownloadCheckBox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    Verify dropdown and select ALL for selected channel  Hubspot
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}

Step 3 validate and click deploy popup for Mailchimp,Fb,Hubspot,CSV and ConstantContact
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${mailchimp_headertxt}  ${mailchimp_helptxt}  2. ${fb_headertxt}  ${fb_helptxt}
    ...  3. ${hubspot_headertxt}  ${hubspot_helpTxt}  4. ${csv_headertxt}  ${csv_helptxt}
    ...  5. ${consContact_headerTxt}  ${consContact_helpTxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}
    ...  ${deployPopup_fbTxt}  ${deploypopup_csvtxt}  ${deployPopup_hubspotTxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for Mailchimp,Fb,Hubspot,CSV and ConstantContact
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...    ${results_hubspot}  ${results_mailchimp}  ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_csvdownloadbtn}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mailchimpdeploymentstatus}  ${results_facebookDeploymentStatus}  ${results_hubspotDeploymentStatus}  ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mailChimp}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_facebook}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_hubspot}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_constantContact}
    Mailchimp redeployment check
    Hubspot redeployment check
    Constantcontact redeployment check
    Facebook redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mobileNoti}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}
