*** Settings ***
Library    SeleniumLibrary
Resource   ../PO/CommonWrapper.robot
Resource   ../PO/Campigns_po.robot

*** Variables ***
${define_zipcode}=  (//*[contains(@class,'arrow-wrapper')])[1]
${define_zipPlusFourArrow}=  (//*[contains(@class,'arrow-wrapper')])[2]
${define_zipcodeArrow}=  (//*[contains(@class,'arrow-wrapper')])[1]
${zipcodeDD_zipcodeLabels}=  //*[contains(@class,'value-label')]
*** Keywords ***
###tests



####Keys
step 1 define with acquisition segment
    [Arguments]  ${campName}  ${segmentName}  ${zipcodeA}  ${zipcodeB}  ${zipplusfourA}  ${zipplusfourB}
    Navigate to Scheduled Campaign Define page
    @{elements_list}=  Create List  ${define_name}
    ...   ${define_segment}   ${define_budget}
    ...   ${define_conversion_target}   ${define_start_date}
    ...   ${define_end_date}   ${next_btn_}
    wait until page contain elements  @{elements_list}
    Validation for CMC and CMC Pro user
    Capture the Screen  campaignsStep1-AcqSegment
    enter the value untill visible  ${define_name}  ${campName}
    click element until visible   ${define_segment}
    wait until page contains element  ${define_segmentSearchField}  10s
    enter the value untill visible  ${define_segmentSearchField}  ${segmentName}
    click element until visible    //*[contains(@class,'dropdown-item')]//*[text()='${segmentName}']/following-sibling::span[contains(text(),'Acquisition')]
    After Select the Acquistion Segment Validate Dataset for CMC user
    @{drops}=  Create List  ${define_regiondropdown}  ${define_locationdropdown}  ${define_servicedropdown}
    Page Should Not Contain Multiple Element  @{drops}
    click element until visible  ${define_zipcode}
    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${zipcodeA}')]
    Run Keyword If  ${status}  click element until visible   //*[contains(@class,'scroll-host')]//*[contains(text(),'${zipcodeA}')]
    ...  ELSE  click element until visible  ${define_zipcodeArrow}

    click element until visible  ${define_zipcode}
    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${zipcodeB}')]
    Run Keyword If  ${status}  click element until visible   //*[contains(@class,'scroll-host')]//*[contains(text(),'${zipcodeB}')]
    ...  ELSE  click element until visible  ${define_zipcodeArrow}
#    @{selectedZipcodes}=  Create List  ${zipcodeA}  ${zipcodeB}
#    @{zipcodeLabelsElement}=  get webelements  ${zipcodeDD_zipcodeLabels}
#    @{actualZipcodes}=  Create List
#    FOR  ${element}  IN  @{zipcodeLabelsElement}
#    ${zipcode}=  get text  ${element}
#    Append To List  ${actualZipcodes}  ${zipcode}
#    END
#    lists should be equal  ${selectedZipcodes}  ${actualZipcodes}
    click element until visible  ${define_zipPlusFourArrow}
    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${zipplusfourA}')]
    Run Keyword If  ${status}  click element until visible   //*[contains(@class,'scroll-host')]//*[contains(text(),'${zipplusfourA}')]
    ...  ELSE  click element until visible  ${define_zipPlusFourArrow}
    click element until visible  ${define_zipPlusFourArrow}
    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${zipplusfourB}')]
    Run Keyword If  ${status}  click element until visible   //*[contains(@class,'scroll-host')]//*[contains(text(),'${zipplusfourB}')]
    ...  ELSE  click element until visible  ${define_zipPlusFourArrow}
    enter the value untill visible  ${define_budget}   75
    enter the value untill visible  ${define_conversion_target}  10
    click element until visible   ${define_start_date}
    ${current_date}=   Get Current Date   result_format=%m-%d-%Y
    Enter the Value Untill Visible  ${define_start_date}  ${current_date}
    click element until visible      ${testData_highLightedDate}
    click element until visible  ${define_end_date}
    ${2DaysAfterDate}=   Get Current Date   result_format=%m-%d-%Y  increment= +2 days
    Enter the Value Untill Visible  ${define_end_date}  ${2DaysAfterDate}
    click element until visible      ${testData_highLightedDate}
    click element until visible   ${savecampaign}
    wait until page contains   Campaign Defined Successfully!  30s
    click element until visible   ${next_btn_}



#####
####onlyMailchimp
Step 2 Channel with Mailchimp - acquisition segment
    [Arguments]  ${campName}
    verify elements on campaigns step 2 screen - acquisition segment
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_mailchimpcheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    sleep  5

Step 3 deploy with mailchimp - acquisition segment
    [Documentation]   CCL-67008  Deploy page validations
    [Arguments]  ${campName}  ${segment}
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    @{txt}=  Create List  1. ${mailchimp_headertxt}
    wait until page contains multiple text  @{txt}
    Verify the Additional Direct Mail for Mailchimp  ${campName}
    Selected segment should be highlighted in step 3  ${segment}
    click element until visible   ${deploy-btn}
    @{txt1}=  Create List  ${deploypopupheader}  ${deploypopup_actionsingletxt}  ${deploypopup_mailchimptxt}
    wait until page contains multiple text  @{txt1}

    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}


Step 4 results with mailchimp - acquisition segment
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  120s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_mailchimp}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4
    @{elements}=  Create List  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mailchimpdeploymentstatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    Wait Until Page Contain Elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Mailchimp redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
    wait until page contains element  ${results_segmentWidget_xAxisLabel_mailchimp}
    expand segment distribution widget and validate
    Verify the months dropdown
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}


##onlyFacebook
Step 2 channel with facebook - acquisition segment
    [Arguments]  ${campName}
    verify elements on campaigns step 2 screen - acquisition segment
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_fbcheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}


Step 3 deploy with facebook - acquisition segment
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    @{txt}=  Create list  1. ${fb_headertxt}  ${fb_helptxt}
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    @{elements}=   Create List  ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsingletxt}  ${deploypopup_fbtxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}


Step 4 results with facebook - acquisition segment
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  120s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4
    @{elements}=  Create List  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    Wait Until Page Contain Elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
    wait until page contains element  ${results_segmentWidget_xAxisLabel_facebook}
    expand segment distribution widget and validate
    Verify the months dropdown
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

###onlyHubspot
Step 2 channel with hubspot - acquisition segment
    [Arguments]  ${campName}
    verify elements on campaigns step 2 screen - acquisition segment
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    Verify dropdown and select ALL for selected channel  Hubspot
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    sleep  5

Step 3 deploy with hubspot - acquisition segment
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    @{txt}=  Create list  1. ${hubspot_headertxt}
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Verify the Additional Direct Mail for Hubspot   ${campName}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsingletxt}  ${deployPopup_hubspotTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}


Step 4 results with hubspot - acquisition segment
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  120s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_hubspot}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4
    @{elements}=  Create List  ${results_inProgress}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  (${results_hubspotDeploymentStatus})[1]
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Hubspot redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
    wait until page contains element  ${results_segmentWidget_xAxisLabel_Hubspot}
    expand segment distribution widget and validate
    Verify the months dropdown
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

##onlyConstantContact
Step 2 with ConstantContact - Acquisition Segment
    [Arguments]  ${campName}
    verify elements on campaigns step 2 screen - acquisition segment
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    sleep  5

Step 3 deploy with ConstantContact - Acquisition Segment
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    @{txt}=  Create list  1. ${consContact_headerTxt}  ${consContact_helpTxt}
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsingletxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results with ConstantContact - Acquisition Segment
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  120s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4
    @{elements}=  Create List  ${results_inProgress}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Constantcontact redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
    wait until page contains element  ${results_segmentWidget_xAxisLabel_Constant}
    expand segment distribution widget and validate
    Verify the months dropdown
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

####2Combinations
###mailchimpFacebook
step 2 select facebook and mailchimp - acquisition segment
    [Arguments]  ${campName}
    verify elements on campaigns step 2 screen - acquisition segment
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    click element until enabled  ${campaigns_channel_fbcheckbox}
    Verify dropdown and select ALL for selected channel  Facebook
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    sleep  5

step 3 validate and click deploy popup for facebook and mailchimp - acquisition segment
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    @{txt}=  Create list  1. ${mailchimp_headertxt}  2. ${fb_headertxt}  ${fb_helptxt}
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Verify the Additional Direct Mail for Mailchimp  ${campName}
    @{elements}=   Create List  ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}  ${deployPopup_fbTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}


Step 4 Results screen verification for facebook and mailchimp - acquisition segment
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  120s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_mailchimp}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4
    @{elements}=  Create List   ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    Wait Until Page Contain Elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Mailchimp redeployment check
    Facebook redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    Verify the months dropdown
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

#####hubspot and mailchimp
step 2 select hubspoit and mailchimp - acquisition segment
    [Arguments]  ${campName}
    verify elements on campaigns step 2 screen - acquisition segment
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    Verify dropdown and select ALL for selected channel  Mailchimp
    click element until visible  ${campaigns_channel_hubspotCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Hubspot
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}

step 3 validate and click deploy for hubspot and mailchimp - acquisition segment
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  campaignsStep3HbMc(2)-AcqSegment
    @{txt}=  Create list  1. ${mailchimp_headertxt}   2. ${hubspot_headertxt}    Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Verify the Additional Direct Mail for Hubspot   ${campName}
    @{elements}=   Create List   ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}
    ...   ${deployPopup_hubspotTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}


Step 4 Results screen verification for hubspot and mailchimp - acquisitin segment
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  120s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_hubspot}  ${results_mailchimp}   ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4
    @{elements}=  Create List  ${results_inProgress}   ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mailchimpdeploymentstatus}  ${results_hubspotDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Mailchimp redeployment check
    Hubspot redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_Hubspot}
    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    Verify the months dropdown
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

###hubspotandFacebook
step 2 select hubspot and facebook - acquisition segment
    [Arguments]  ${campName}
    verify elements on campaigns step 2 screen - acquisition segment
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_fbcheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    click element until visible  ${campaigns_channel_hubspotCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Hubspot
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}

step 3 vaidate and click deploy for hubspot and facebook - acquisition segment
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${fb_headertxt}  ${fb_helptxt}
    ...  2. ${hubspot_headertxt}    Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    @{elements}=   Create List   ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}
    ...  ${deployPopup_fbTxt}   ${deployPopup_hubspotTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}


step 4 results screen verification for hubspot and facebook - acquisition segment
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  120s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_hubspot}  ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4
    @{elements}=  Create List  ${results_inProgress}   ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_facebookDeploymentStatus}  ${results_hubspotDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Facebook redeployment check
    Hubspot redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_facebook}   ${results_segmentWidget_xAxisLabel_Hubspot}
    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    Verify the months dropdown
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

Step 2 select Fb and ConstantContact - Acquisition Segment
    [Arguments]  ${campName}
    verify elements on campaigns step 2 screen - acquisition segment
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_fbCheckbox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}

Step 3 validate and click deploy popup for Fb and ConstantContact - Acquisition Segment
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${fb_headertxt}  ${fb_helptxt}
    ...  2. ${consContact_headerTxt}  ${consContact_helpTxt}   Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    @{elements}=   Create List   ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}
    ...  ${deployPopup_fbTxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for Fb and ConstantContact - Acquisition Segment
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  120s
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
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Constantcontact redeployment check
    Facebook redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_facebook}   ${results_segmentWidget_xAxisLabel_Constant}
    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    Verify the months dropdown
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

##MailchimpAndConstantContact
step 2 select Mailchimp and ConstantContact - Acquisition Segment
    [Arguments]  ${campName}
    verify elements on campaigns step 2 screen - acquisition segment
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}

step 3 validate and click deploy popup for Mailchimp and ConstantContact - Acquisition Segment
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${mailchimp_headertxt}
    ...  2. ${consContact_headerTxt}  ${consContact_helpTxt}   Image  Preview
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

Step 4 Results screen verification for Mailchimp and ConstantContact - Acquisition Segment
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  120s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_mailchimp}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4
    @{elements}=  Create List  ${results_inProgress}   ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mailchimpdeploymentstatus}   ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Mailchimp redeployment check
    Constantcontact redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_Constant}
    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    Verify the months dropdown
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

##HubspotAndConstantContact
step 2 select Hubspot and ConstantContact - Acquisition Segment
    [Arguments]  ${campName}
    verify elements on campaigns step 2 screen - acquisition segment
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select ALL for selected channel  Hubspot
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}


step 3 validate and click deploy popup for Hubspot and ConstantContact - Acquisition Segment
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list
    ...  1. ${hubspot_headertxt}  2. ${consContact_headerTxt}  ${consContact_helpTxt}   Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Verify the Additional Direct Mail for Hubspot
    @{elements}=   Create List   ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}
    ...  ${deployPopup_hubspotTxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}


Step 4 Results screen verification for Hubspot and ConstantContact - Acquisition Segment
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  120s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_hubspot}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4
    @{elements}=  Create List  ${results_inProgress}   ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_hubspotDeploymentStatus}  ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Hubspot redeployment check
    Constantcontact redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_Constant}  ${results_segmentWidget_xAxisLabel_Hubspot}
    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    Verify the months dropdown
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}



##3channelsCombination
##Mailchimp,Fb&CC
step 2 select Mailchimp, Fb, and ConstantContact - Acquisition Segment
    [Arguments]  ${campName}
    verify elements on campaigns step 2 screen - acquisition segment
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    click element until enabled  ${campaigns_channel_fbCheckbox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}


step 3 validate and click deploy popup for Mailchimp, Fb, and ConstantContact - Acquisition Segment
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${mailchimp_headertxt}  2. ${fb_headertxt}  ${fb_helptxt}
    ...  3. ${consContact_headerTxt}  ${consContact_helpTxt}   Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Verify the Direct Mail for Mailchimp   ${campName}
    @{elements}=   Create List   ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}
    ...  ${deployPopup_fbTxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}


Step 4 Results screen verification for Mailchimp, Fb, and ConstantContact - Acquisition Segment
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  120s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_mailchimp}  ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4
    @{elements}=  Create List  ${results_inProgress}   ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mailchimpdeploymentstatus}  ${results_facebookDeploymentStatus}  ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Mailchimp redeployment check
    Constantcontact redeployment check
    Facebook redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_Constant}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    Verify the months dropdown
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

##Hubspot,Fb&CC
step 2 select Hubspot,Fb, and ConstantContact - Acquisition Segment
    [Arguments]  ${campName}
    verify elements on campaigns step 2 screen - acquisition segment
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    click element until enabled  ${campaigns_channel_fbCheckbox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    Verify dropdown and select ALL for selected channel  Hubspot
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}


step 3 validate and click deploy popup for Hubspot,Fb, and ConstantContact - Acquisition Segment
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${fb_headertxt}  ${fb_helptxt}
    ...  2. ${hubspot_headertxt}  3. ${consContact_headerTxt}  ${consContact_helpTxt}   Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    @{elements}=   Create List   ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}
    ...  ${deployPopup_fbTxt}   ${deployPopup_hubspotTxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}


Step 4 Results screen verification for Hubspot,Fb, and ConstantContact - Acquisition Segment
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  120s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_hubspot}  ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4
    @{elements}=  Create List  ${results_inProgress}   ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_facebookDeploymentStatus}  ${results_hubspotDeploymentStatus}  ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Constantcontact redeployment check
    Facebook redeployment check
    Hubspot redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_Constant}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_Hubspot}
    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    Verify the months dropdown
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

##Mailchmip,Hubspot&CC
step 2 select Mailchimp, Hubspot, and, ConstantContact - Acquisition Segment
    [Arguments]  ${campName}
    verify elements on campaigns step 2 screen - acquisition segment
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    click element until enabled  ${campaigns_channel_constantContactCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    Verify dropdown and select ALL for selected channel  Hubspot
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}

step 3 validate and click deploy popup for Mailchimp, Hubspot, and, ConstantContact - Acquisition Segment
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${mailchimp_headertxt}
    ...  2. ${hubspot_headertxt}  3. ${consContact_headerTxt}  ${consContact_helpTxt}   Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Verify the Direct Mail for Mailchimp   ${campName}
    Verify the Additional Direct Mail for Hubspot   ${campName}
    @{elements}=   Create List   ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}
    ...   ${deployPopup_hubspotTxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 Results screen verification for Mailchimp, Hubspot, and, ConstantContact - Acquisition Segment
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  120s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_hubspot}  ${results_mailchimp}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4
    @{elements}=  Create List  ${results_inProgress}   ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mailchimpdeploymentstatus}  ${results_hubspotDeploymentStatus}  ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Mailchimp redeployment check
    Hubspot redeployment check
    Constantcontact redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_Hubspot}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_Constant}
    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    Verify the months dropdown
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

##Mailchimp,Fb&Hubspot
step 2 select Mailchimp, Fb, and Hubspot - Acquisition Segment
    [Arguments]  ${campName}
    verify elements on campaigns step 2 screen - acquisition segment
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    click element until enabled  ${campaigns_channel_fbCheckbox}
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    Verify dropdown and select ALL for selected channel  Hubspot
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}


step 3 validate and click deploy popup for Mailchimp, Fb, and Hubspot - Acquisition Segment
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${mailchimp_headertxt}  ${mailchimp_helptxt}  2. ${fb_headertxt}  ${fb_helptxt}
    ...  3. ${hubspot_headertxt}  ${hubspot_helpTxt}   Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    @{elements}=   Create List   ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}
    ...  ${deployPopup_fbTxt}   ${deployPopup_hubspotTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}


Step 4 Results screen verification for Mailchimp, Fb, and Hubspot - Acquisition Segment
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  120s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_hubspot}  ${results_mailchimp}  ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4
    @{elements}=  Create List  ${results_inProgress}   ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mailchimpdeploymentstatus}  ${results_facebookDeploymentStatus}  ${results_hubspotDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Mailchimp redeployment check
    Facebook redeployment check
    Hubspot redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_Hubspot}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    Verify the months dropdown
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

####allChannels
step 2 select all channels - acquisition segment
    [Arguments]  ${campName}
    verify elements on campaigns step 2 screen - acquisition segment
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_channelCheckBox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    Verify dropdown and select ALL for selected channel  Hubspot
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}

step 3 validate and click deploy popup for all channels - acquisitin segment
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${mailchimp_headertxt}  2. ${fb_headertxt}  ${fb_helptxt}
    ...  3. ${hubspot_headertxt}  4. ${consContact_headerTxt}  ${consContact_helpTxt}   Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Verify the Additional Direct Mail for Mailchimp  ${campName}
    Verify the Additional Direct Mail for Hubspot  ${campName}
    @{elements}=   Create List   ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}
    ...  ${deployPopup_fbTxt}   ${deployPopup_hubspotTxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}


Step 4 Results screen verification for all channels - acquisitin segment
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  120s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_hubspot}  ${results_mailchimp}  ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4
    @{elements}=  Create List  ${results_inProgress}   ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mailchimpdeploymentstatus}  ${results_facebookDeploymentStatus}  ${results_hubspotDeploymentStatus}  ${results_consContactDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Mailchimp redeployment check
    Constantcontact redeployment check
    Facebook redeployment check
    Hubspot redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_Hubspot}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}  ${results_segmentWidget_xAxisLabel_Constant}
    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    Verify the months dropdown
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}



step 1 define for all zipcodes
    [Arguments]  ${campName}  ${segmentName}
    Navigate to Scheduled Campaign Define page
    @{elements_list}=  Create List  ${define_name}
    ...   ${define_segment}   ${define_budget}
    ...   ${define_conversion_target}   ${define_start_date}
    ...   ${define_end_date}   ${next_btn_}
    wait until page contain elements  @{elements_list}
    Validation for CMC and CMC Pro user
    Capture the Screen  campaignsStep1Screen
#    ${PO_Number}    Generate random string    5    0123456789
#    ${Name}    Set Global Variable    test_campgn${PO_Number}
    enter the value untill visible  ${define_name}  ${campName}
    click element until visible   ${define_segment}
    wait until page contains element  ${define_segmentSearchField}  10s
    enter the value untill visible  ${define_segmentSearchField}  ${segmentName}
    click element until visible    //*[contains(@class,'dropdown-item')]//*[text()='${segmentName}']/following-sibling::span[contains(text(),'Acquisition')]
    sleep  1
    After Select the Acquistion Segment Validate Dataset for CMC user
    enter the value untill visible  ${define_budget}   75
    enter the value untill visible  ${define_conversion_target}  10
    click element until visible   ${define_start_date}
    ${current_date}=   Get Current Date   result_format=%m-%d-%Y
    Enter the Value Untill Visible  ${define_start_date}  ${current_date}
    click element until visible      ${testData_highLightedDate}
    click element until visible  ${define_end_date}
    ${2DaysAfterDate}=   Get Current Date   result_format=%m-%d-%Y  increment= +2 days
    Enter the Value Untill Visible  ${define_end_date}  ${2DaysAfterDate}
    click element until visible      ${testData_highLightedDate}
    click element until visible   ${savecampaign}
    wait until page contains   Campaign Defined Successfully!  30s
    click element until visible   ${next_btn_}


Create a drafted campaign for acquisition segment and verify it's created
    [Arguments]  ${campName}  ${segmentName}  ${zipcodeA}  ${zipcodeB}  ${zipplusfourA}  ${zipplusfourB}
    click element until visible  id=homeMarketingSection
    sleep  5
    Navigate to Scheduled Campaign Define page
    @{elements_list}=  Create List  ${define_name}
    ...   ${define_segment}   ${define_budget}
    ...   ${define_conversion_target}   ${define_start_date}
    ...   ${define_end_date}   ${next_btn_}
    wait until page contain elements  @{elements_list}
    Validation for CMC and CMC Pro user
    enter the value untill visible  ${define_name}  ${campName}
    click element until visible   ${define_segment}
    wait until page contains element  ${define_segmentSearchField}  10s
    enter the value untill visible  ${define_segmentSearchField}  ${segmentName}
    click element until visible    //*[contains(@class,'dropdown-item')]//*[contains(text(),'${segmentName}')]/following-sibling::span[contains(text(),'Acquisition')]
    sleep  1
    After Select the Acquistion Segment Validate Dataset for CMC user
    @{drops}=  Create List  ${define_regiondropdown}  ${define_locationdropdown}  ${define_servicedropdown}
    Page Should Not Contain Multiple Element  @{drops}
    click element until visible  ${define_zipcode}
    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${zipcodeA}')]
    Run Keyword If  ${status}  click element until visible   //*[contains(@class,'scroll-host')]//*[contains(text(),'${zipcodeA}')]
    ...  ELSE  click element until visible  ${define_zipcodeArrow}

    click element until visible  ${define_zipcode}
    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${zipcodeB}')]
    Run Keyword If  ${status}  click element until visible   //*[contains(@class,'scroll-host')]//*[contains(text(),'${zipcodeB}')]
    ...  ELSE  click element until visible  ${define_zipcodeArrow}
#    @{selectedZipcodes}=  Create List  ${zipcodeA}  ${zipcodeB}
#    @{zipcodeLabelsElement}=  get webelements  ${zipcodeDD_zipcodeLabels}
#    @{actualZipcodes}=  Create List
#    FOR  ${element}  IN  @{zipcodeLabelsElement}
#    ${zipcode}=  get text  ${element}
#    Append To List  ${actualZipcodes}  ${zipcode}
#    END
#    lists should be equal  ${selectedZipcodes}  ${actualZipcodes}
    click element until visible  ${define_zipPlusFourArrow}
    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${zipplusfourA}')]
    Run Keyword If  ${status}  click element until visible   //*[contains(@class,'scroll-host')]//*[contains(text(),'${zipplusfourA}')]
    ...  ELSE  click element until visible  ${define_zipPlusFourArrow}
    click element until visible  ${define_zipPlusFourArrow}
    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${zipplusfourB}')]
    Run Keyword If  ${status}  click element until visible   //*[contains(@class,'scroll-host')]//*[contains(text(),'${zipplusfourB}')]
    ...  ELSE  click element until visible  ${define_zipPlusFourArrow}
    enter the value untill visible  ${define_budget}   75
    enter the value untill visible  ${define_conversion_target}  10
    click element until visible   ${define_start_date}
    sleep  1
    click element until visible      ${testData_todaysDate}
    click element until visible  ${define_end_date}
    sleep  1
    click element until visible      ${testData_todaysDate}
    click element until visible   ${savecampaign}
    wait until page contains   Campaign Defined Successfully!  30s
    click element until visible   ${campaigns}
    wait until page contains element  ${campaigns_searchField}  80s
    enter the value untill visible  ${campaigns_searchField}  ${campName}
    wait until page contains element  //*[@title='Draft']  20s
    capture the screen  ${campName}draftedCampaign-acqSegment
    click element until visible  //*[text()='${campName}']
    sleep  5
    @{elements}=  Create List  //*[text()='${campName}']  ${define_name}
    ...   ${define_segment}   ${define_budget}
    ...   ${define_conversion_target}   ${define_start_date}
    ...   ${define_end_date}  ${next_btn_}
    wait until page contain elements  @{elements}
    After Select the Acquistion Segment Validate Summary for CMC user
    click element until visible  ${next_btn_}


Complete the draft campaign for acquisition segment
    [Arguments]  ${draftedCampName}
    click element until visible  //*[text()='${draftedCampName}']
    @{elements}=  Create List  //*[text()='${draftedCampName}']  ${define_name}
    ...   ${define_segment}   ${define_budget}
    ...   ${define_conversion_target}   ${define_start_date}
    ...   ${define_end_date}   ${next_btn_}
    wait until page contain elements  @{elements}
    After Select the Acquistion Segment Validate Summary for CMC user
    click element until visible  ${next_btn_}
    step 2 select all channels - acquisition segment  ${draftedCampName}
    step 3 validate and click deploy popup for all channels - acquisitin segment  ${draftedCampName}
    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
    Run Keyword Unless  ${status}  step 4 results screen verification for all channels - acquisitin segment  ${draftedCampName}  ${globVar_segment7}
    Search and delete the created campaign  ${draftedCampName}



verify elements on campaigns step 2 screen - acquisition segment
   @{ellements}=   Create List    ${previous_btn_}
    ...  ${campaigns_channel_channelcheckbox}  ${campaigns_channel_fbcheckbox}
    ...  ${campaigns_channel_mailchimpCheckbox}  ${campaigns_channel_hubspotCheckbox}  ${campaigns_channel_constantContactCheckbox}
    Wait Until Page Contain Elements    @{ellements}
    @{txt}=  create list    ${campaigns_channel_mailchimpdesc}  ${campaigns_channel_facebookDesc}  ${campaigns_channel_hubspotdesc}
    ...  ${campaigns_channel_consContactDesc}     ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[Channel_head]
    wait until page contains multiple text  @{txt}
    @{mobileNotiCSV}=  Create List  ${campaigns_channel_mobilemsgcheckbox}  ${campaigns_channel_csvdownloadcheckbox}
    Page Should Not Contain Multiple Element  @{mobileNotiCSV}

