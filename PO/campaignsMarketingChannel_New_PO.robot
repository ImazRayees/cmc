*** Settings ***
Library    SeleniumLibrary
Resource   ../PO/CommonWrapper.robot
Resource   ../PO/Campigns_po.robot
Resource   ../PO/PageTitleKeywords.robot

Variables  ../utils/CMC-API.py


*** Variables ***
${campaigns_MC_ciqMobileMsgHeaderTxt}=   CommandIQ Notification
${campaigns_MC_calixLogo}=  (//*[contains(@class,'cm-logo')])[1]
${campaigns_MC_ciqMobileMsg_activeStatus}=  (//div[contains(text(),'Active')])[1]
${campaigns_MC_ciqMobileMsg_viewCR}=  (//button[contains(.,'Channel Results')])[1]
${campaigns_MC_ciqMobileMsg_segmentsCount}=  (//*[contains(@class,'campaigns-list-item')])[1]//*[contains(text(),'Calix Cloud Campaigns')]
${campaigns_MC_ciqMobileMsg_pageHeadertxt}=  Command IQ Mobile Notifications Results
${campaigns_MC_lastUpdateTime}=  //*[@class='last-update']
${campaigns_MC_ciqMobileMsg_thName}=  Name
${campaigns_MC_ciqMobileMsg_thSegment}=  Segment
${campaigns_MC_ciqMobileMsg_thStatus}=  Status
${campaigns_MC_ciqMobileMsg_thSchedType}=  Schedule Type
${campaigns_MC_ciqMobileMsg_thSubs}=  Subscribers
${campaigns_MC_ciqMobileMsg_thNotiSent}=  Notification Sent
${campaigns_MC_ciqMobileMsg_thStartDate}=  Start Date
${campaigns_MC_ciqMobileMsg_thEndDate}=  End Date
${campaigns_MC_ciqMobileMsg_thBudget}=  Budget
${campaigns_MC_ciqMobileMsg_timeFrametxt}=  Timeframe
${campaigns_MC_ciqMobileMsg_timeFrameDropDown}=  id=typemobId
${campaigns_MC_searchField}=  //*[@type='search']
${campaigns_MC_tableDataCheck}=  //*[@id='campaigns']//tbody//tr[1]//td[2]
${campaigns_MC_closeBtn}=  //*[contains(@class,'close')]//span


${campaigns_MC_mailChimp_headertxt}=  Mailchimp
${campaigns_MC_mailchimpLogo}=  //*[contains(@src,'Mailchimp_Logo')]
${campaigns_MC_mailChimp_activeStatus}=  (//*[contains(@class,'campaigns-list-item')])[2]//div[contains(text(),'Active')]
${campaigns_MC_mailChimp_inActiveStatus}=  (//*[contains(@class,'campaigns-list-item')])[2]//div[contains(text(),'Inactive')]
${campaigns_MC_mailChimp_viewCR}=  (//*[contains(@class,'campaigns-list-item')])[2]//button[contains(.,'Channel Results')]
${campaigns_MC_mailChimp_segmentsCount}=  (//*[contains(@class,'campaigns-list-item')])[2]//*[contains(text(),'Calix Cloud Campaigns')]
${campaigns_MC_mailChimp_configSettings}=  (//*[contains(@class,'campaigns-list-item')])[2]//button[contains(.,'Configuration Settings')]
${campaigns_MC_mailChimp_pageHeaderTxt}=  Mailchimp Engagement Channel Results
${campaigns_MC_mailChimp_timeFrameDropDown}=  id=typeId
${campaigns_MC_mailChimp_thName}=  Name
${campaigns_MC_mailChimp_thType}=  Type
${campaigns_MC_mailChimp_thSendDate}=  Send Date
${campaigns_MC_mailChimp_thSent}=  Emails Sent
${campaigns_MC_mailChimp_thOpened}=  Opened
${campaigns_MC_mailChimp_thClicked}=  Clicked
${campaigns_MC_mailChimp_thBounced}=  Bounced
${campaigns_MC_mailChimp_thUnsubscribed}=  Unsubscribed
${campaigns_MC_mailChimp_configSettingsHeadertxt}=  Mailchimp Marketing Channel Configuration
${campaigns_MC_mailChimp_configSettingsInstructionsTitle}=  //*[contains(text(),'Instructions')]
${campaigns_MC_mailChimp_instructionsDataTxt}=  //*[@class='conf-sec']
${campaigns_MC_mailChimp_signUpHyperLink}=  //*[@href='https://login.mailchimp.com/signup/']
${campaigns_MC_mailChimp_calixCommunityHL}=  //*[@href='https://community.calix.com/s/']
${campaigns_MC_mailChimp_configSet_testConnectionTxt}=  1. Test Connection
${campaigns_MC_mailChimp_configSet_testConnectionBtn}=  //button[contains(.,'Test Connection')]
${campaigns_MC_mailChimp_configSet_removeConnectionDots}=  //div[contains(@class,'dot-drop')]
${campaigns_MC_mailChimp_configSet_removeConnectionBtn}=  //button[contains(.,'Remove')]
${campaigns_MC_mailChimp_configSet_removeConnectionConfirmTxt}=   Are you sure want to remove the Mailchimp channel configuration?
${campaigns_MC_mailChimp_configSet_removeConnectionHelpTxt}=  Remove the Mailchimp configuration will clear all connection data, including the Channel campaign history
${campaigns_MC_mailChimp_configSet_removeConnection_popupCloseBtn}=  (//*[@class='close']//*)[2]
${campaigns_MC_mailChimp_configSet_removeConnectionPopupBtn}=  (//button[contains(.,'Remove')])[2]
${campaigns_MC_mailChimp_configSet_connectionSuccesPopup}=  //*[@class='modal-body']
${campaigns_MC_mailChimp_connection_popupOkbtn}=  //button[contains(.,'Okay')]
${campaigns_MC_mailChimp_connection_popupCloseBtn}=  (//*[@class='close']//span)[2]
${campaigns_MC_mailChimp_successfullConnectiontxt}=    Successful Connection
${campaigns_MC_mailChimp_successfullConnectiontxt2}=   Mailchimp Engagement Channel has been successfully configured.
${campaigns_MC_mailChimp_mailchimpAudTxt}=  2. Mailchimp Audience
${campaigns_MC_mailChimp_refreshIcon}=  //*[@class='refresh-icon']//img
${campaigns_MC_mailChimp_audienceDropdown}=  id=statusId
${campaigns_MC_mailChimp_dropdown_calixMailchimp}=  //*[text()='Calix Mailchimp']
${campaigns_MC_mailChimp_updateAudienceBtn}=  //button[contains(.,'Update Audience')]
${campaigns_MC_mailChimp_saveAudienceBtn}=  //button[contains(.,'Save Audience')]
${campaigns_MC_mailChimp_saveAudiencePopupTxt}=  Successfully Saved
${savedAudience}=  id=updateId
${campaigns_MC_mailChimp_configureBtn}=  (//*[contains(@class,'list-item')])[2]//button[contains(.,'Configure')]
${campaigns_MC_mailChimp_connectMailchimpBtn}=  //button[contains(.,'Connect to Mailchimp')]
${campaigns_MC_mailChimp_loginMailchimpBtn}=  //button[contains(.,'Log in')]
${campaigns_MC_mailChimpLogin_loginHeaderTxt}=  Log in and authorize
${campaigns_MC_mailChimpLogin_cmcStgBtn}=  //a[contains(.,'CMC Stage')]
${campaigns_MC_mailChimpLogin_usernameField}=  id=username
${campaigns_MC_mailChimpLogin_showPasswrdIcon}=  id=show-password
${campaigns_MC_mailChimpLogin_passworddField}=  id=password
${campaigns_MC_mailChimpLogin_createAccountBtn}=   //a[contains(.,'Create An Account')]
${campaigns_MC_mailChimpLogin_cookiesStatementClose}=  //*[contains(@id,'onetrust-close')]//button
${campaigns_MC_mailChimp_pendo_quesIcons}=  //*[@id='pendo-image-badge-2bf3ba20']
${campaigns_MC_mailChimp_pendo_updateAudienceHelpTxt}=  Click on the "Update Audience" button to re-select the Mailchimp Audience that Marketing Cloud contacts will be assigned to.
${campaigns_MC_mailChimp_pendo_testConnectionHelpTxt}=  Test the status of the marketing cloud connection with Mailchimp.

${campaigns_MC_facebookHeadertxt}=  Facebook
${campaigns_MC_fbLogo}=  //*[contains(@src,'Facebook-logo')]
${campaigns_MC_fb_segmentsCount}=  (//*[contains(@class,'campaigns-list-item')])[3]//*[contains(text(),'Calix Cloud Campaigns')]
${campaigns_MC_fb_activeStatus}=  (//*[contains(@class,'campaigns-list-item')])[3]//div[contains(text(),'Active')]
${campaigns_MC_fb_InactiveStatus}=  (//*[contains(@class,'campaigns-list-item')])[3]//div[contains(text(),'Inactive')]
${campaigns_MC_fb_StatusElement}=  (//*[contains(@class,'campaigns-list-item')])[3]//div[contains(@class,'Small-title')]
${campaigns_MC_fb_channelResultsBtn}=  (//*[contains(@class,'campaigns-list-item')])[3]//button[contains(.,'Channel Results')]
${campaigns_MC_fb_configSettingsBtn}  (//*[contains(@class,'campaigns-list-item')])[3]//button[contains(.,'Configuration Settings')]
${campaigns_MC_fb_configureBtn}=  (//*[contains(@class,'list-item')])[3]//button[contains(.,'Configure')]
${campaigns_MC_fb_configScreen_headertxt}=  Facebook Marketing Channel Configuration
${campaigns_MC_fb_configScreen_connectConfigTxt}=  Connection Configuration
${campaigns_MC_fb_configScreen_dotDropdown}=  (//*[@id='dropdownPeriod'])[2]
${campaigns_MC_fb_configScreen_dotRemoveConnectionBtn}=  //button[contains(.,'Remove Connection')]
${campaigns_MC_fb_configScreen_removeConnectionConfirmTxt}=   Are you sure want to remove the Facebook channel configuration?
${campaigns_MC_fb_configScreen_removeConnectionHelpTxt}=  Remove the Facebook configuration will clear all connection data, including the channel campaign history
${campaigns_MC_fb_configScreen_popupCloseBtn}=  (//*[@class='close'])[2]
${campaigns_MC_fb_configScreen_popupRemoveConnectionBtn}=   //button[contains(.,' Remove Connection ')]
${campaigns_MC_fb_configScreen_apiKeyFieldheaderTxt}=  Enter Facebook API Key
${campaigns_MC_fb_configScreen_apiKeyField}=  (//*[@type='text'])[2]
${apiKey_helpMsg}=  Enter valid API Key
${campaigns_MC_fb_configScreen_accountIdHeaderTxt}=  Facebook Ad Account ID
${campaigns_MC_fb_configScreen_accountIdField}=  (//*[@type='text'])[3]
${accountId_helpMsg}=  Enter valid Account ID
${campaigns_MC_fb_configScreen_checkbox}=  //*[@type='checkbox']
${campaigns_MC_fb_configScreen_checkboxHelpMsg}=   By checking this box you agree to
${campaigns_MC_fb_configScreen_checkboxMsgT&C}=  //*[@href='https://www.facebook.com/legal/terms/customaudience ']
${campaigns_MC_fb_configScreen_saveBtn}=  //button[contains(.,'Save')]
${campaigns_MC_fb_configScreen_successfulySavedTxt}=  Facebook Successfully Saved
${campaigns_MC_fb_configScreen_testConnectionTxt}=  //*[text()=' Test Connection ']
${campaigns_MC_fb_configScreen_testConnectionBtn}=  //button[contains(.,'Test Connection')]
${campaigns_MC_fb_configScreen_successfullyConfiguredText}=  //*[text()='Facebook channel configuration is complete']
${campaigns_MC_fb_configScreen_connectionErrorTxt}=  Connection Error
${campaigns_MC_fb_configScreen_connectionErrorOkBtn}=  //button[contains(.,'Okay')]
${campaigns_MC_fb_configScreen_invalidApiKeyHelpMsg}=  Follow the configuration instructions to make sure you have the correct API key and AD Account ID.
${campaigns_MC_fb_configScreen_instructionsHere}=  //*[@href='https://business.facebook.com/']
${campaigns_MC_fb_configScreen_instrictionsDev}=  //*[@href='https://developers.facebook.com/']
${campaigns_MC_fb_configScreen_calixCommunityLink}=  //*[@href='https://community.calix.com/s/']
${campaigns_MC_fb_resultsHeaderTxt}=  Facebook Engagement Channel Results
${campaigns_MC_fb_searchField}=  //*[@type='search']
${campaigns_MC_fb_searchBtn}=  //*[@class='add-search-icon']
${campaigns_MC_fb_timeFrameTxt}=  //*[text()=' Timeframe ']
${campaigns_MC_fb_timeFrameDD}=  //*[contains(@class,'selectbox')]
${campaigns_MC_fb_thName}=  //*[text()='Name']
${campaigns_MC_fb_thImpression}=  //*[text()='Impressions']
${campaigns_MC_fb_thClicks}=  //*[text()='Total Clicks']
${campaigns_MC_fb_thUclicks}=  //*[text()='Total Unique Clicks']
${campaigns_MC_fb_thReach}=  //*[text()='Reach']
${campaigns_MC_fb_thSpend}=  //*[text()='Spend']
${campaigns_MC_fb_thCpm}=  //*[text()='CPM']
${campaigns_MC_fb_thCpc}=  //*[text()='CPC']
${campaigns_MC_fb_thLinkClicks}=   //*[text()=' Link Clicks']
${campaigns_MC_fb_thFrequency}=   //*[text()='Frequency']
${campaigns_MC_fb_thStartDate}=  //*[text()=' Start Date']
${campaigns_MC_fb_thEndDate}=  //*[text()=' End Date']
${campaigns_MC_fb_tableInfo}=  //*[@class='dataTables_info']
${campaigns_MC_fb_expiredStatus}=  (//*[contains(@class,'campaigns-list-item')])[3]//div[contains(text(),'Failed - Expired')]
${campaigns_MC_fb_regenerateApiKeyHelpMessage}=  Regenerate the API key and enter it here to re-configure the channel
${campaigns_MC_fb_}=
${campaigns_MC_trow}=  //tbody//tr
${campaigns_MC_tcol}=  //tbody//tr[1]//td
${home_Fb_regenerateApiKeyToastMsg}=  Facebook marketing channel error. Regenerate the API key to reconfigure the channel
${home_Fb_configSettingsButton}=  //*[contains(text(),'Facebook Configuration Settings')]

${campaigns_MC_hubspot_headertxt}=  (//*[contains(@class,'campaigns-list-item')])[4]//div[contains(text(),'HubSpot')]
${campaigns_MC_hubspotLogo}=  (//*[contains(@class,'cm-logo')])[4]
${campaigns_MC_hubspot_activeStatus}=  (//*[contains(@class,'campaigns-list-item')])[4]//div[contains(text(),'Active')]
${campaigns_MC_hubspot_inactiveStatus}=  (//*[contains(@class,'campaigns-list-item')])[4]//div[contains(text(),'Inactive')]
${campaigns_MC_hubspot_channelResults}=  (//*[contains(@class,'campaigns-list-item')])[4]//button[contains(.,'Channel Results')]
${campaigns_MC_hubspot_segmentsCount}=  (//*[contains(@class,'campaigns-list-item')])[4]//*[contains(text(),'Calix Cloud Campaigns')]
${campaigns_MC_hubspot_configSettings}=  (//*[contains(@class,'campaigns-list-item')])[4]//button[contains(.,'Configuration Settings')]
${campaigns_MC_hubspot_pageHeaderTxt}=  //*[contains(text(),'HubSpot Engagement Channel Results')]
${campaigns_MC_hubspot_lastUpdate}=   //*[@class='last-update']
${campaigns_MC_hubspot_closeBtn}=  //*[contains(@class,'close')]//span
${campaigns_MC_hubspot_timeFrameDropDown}=  id=typeId
${campaigns_MC_hubspot_searchField}=  //*[@type='search']
${campaigns_MC_hubspot_thName}=  //th[contains(text(),'Name')]
${campaigns_MC_hubspot_thSent}=  //th[contains(text(),'Sent')]
${campaigns_MC_hubspot_thDelivered}=  //th[contains(text(),'Delivered')]
${campaigns_MC_hubspot_thOpened}=  //th[contains(text(),'Opened')]
${campaigns_MC_hubspot_thProcessed}=  //th[contains(text(),'Processed')]
${campaigns_MC_hubspot_configSettingsHeadertxt}=  //*[contains(text(),'HubSpot Marketing Channel Configuration')]
${campaigns_MC_hubspot_configSettingsInstructionsTitle}=  //*[contains(text(),'Instructions')]
${campaigns_MC_hubspot_instructionsDataTxt}=  //*[@class='conf-sec']
${campaigns_MC_hubspot_configSet_testConnectionTxt}=  //*[contains(text(),'1. Test Connection ')]
${campaigns_MC_hubspot_configSet_testConnectionBtn}=  //button[contains(.,'Test Connection')]
${campaigns_MC_hubspot_configSet_removeConnectionDots}=  //div[contains(@class,'dot-drop')]
${campaigns_MC_hubspot_configSet_removeConnectionBtn}=  //button[contains(.,'Remove')]
${campaigns_MC_hubspot_configSet_removeConnectionConfirmTxt}=   Are you sure want to remove the HubSpot channel configuration?
${campaigns_MC_hubspot_configSet_removeConnectionHelpTxt}=  Remove the HubSpot configuration will clear all connection data, including the Channel campaign history
${campaigns_MC_hubspot_configSet_removeConnection_popupCloseBtn}=  (//*[@class='close']//*)[2]
${campaigns_MC_hubspot_configSet_removeConnectionPopupBtn}=  (//button[contains(.,'Remove')])[2]
${campaigns_MC_hubspot_configSet_connectionSuccesPopup}=  //*[@class='modal-body']
${campaigns_MC_hubspot_connection_popupOkbtn}=  //button[contains(.,'Okay')]
${campaigns_MC_hubspot_connection_popupCloseBtn}=  (//*[@class='close']//span)[2]
${campaigns_MC_hubspot_successfullConnectiontxt}=    Successful Connection
${campaigns_MC_hubspot_successfullConnectiontxt2}=   To complete HubSpot marketing channel setup, select a HubSpot audience
${campaigns_MC_hubspot_hubspotAudTxt}=  2. HubSpot Audience
${campaigns_MC_hubspot_refreshIcon}=  //*[@class='refresh-icon']//img
${campaigns_MC_hubspot_audienceDropdown}=  id=statusId
${campaigns_MC_hubspot_dropdown_calixHubspot}=  //*[text()='Calix HubSpot']
${campaigns_MC_hubspot_updateAudienceBtn}=  //button[contains(.,'Update Audience')]
${campaigns_MC_hubspot_saveAudienceBtn}=  //button[contains(.,'Save Audience')]
${campaigns_MC_hubspot_saveAudiencePopupTxt}=  Successfully Saved
${savedAudience}=  id=updateId
${campaigns_MC_hubspot_configureBtn}=  (//*[contains(@class,'list-item')])[4]//button[contains(.,'Configure')]
${campaigns_MC_hubspot_setupHubspotTxt}=  //*[contains(text(),'Set Up HubSpot Channel')]
${campaigns_MC_hubspot_connecthubspotBtn}=  //button[contains(.,'Connect to HubSpot')]
${campaigns_MC_hubspot_hubSpotPopupLogo}=  //*[@src='assets/img/Hubspot_Logo.png']
${campaigns_MC_hubspot_loginhubspotBtn}=  //button[contains(.,'Log in HubSpot')]
${campaigns_MC_hubspotLogin_signUpBtn}=  //a[contains(.,'Sign up')]
${campaigns_MC_hubspotLogin_usernameField}=  id=username
${campaigns_MC_hubspotLogin_showPasswrdIcon}=  for=password
${campaigns_MC_hubspotLogin_passworddField}=  id=password
${campaigns_MC_hubspotLogin_forgotPasswrdBtn}=   password-description
${campaigns_MC_hubspotLogin_loginBtn}=  id=loginBtn
${campaigns_MC_hubspotLogin_invalidPasswordAlert}=  You've entered an invalid password.
${campaigns_MC_hubspotDashboard_Title}=  //*[contains(text(),'HubSpot Accounts')]
${campaigns_MC_hubspotDashboard_chooseAccountTitle}=  =  //*[contains(text(),'Choose an account')]
${campaigns_MC_hubspotDashboard_firstAccount}=  (//*[contains(@id,'radio')])[1]
${campaigns_MC_hubspotDashboard_chooseAccountBtn}=  //button[contains(.,'Choose Account')]

${campaigns_MC_ConstContact_headertxt}=  (//*[contains(@class,'campaigns-list-item')])[5]//div[contains(text(),'Constant Contact')]
${campaigns_MC_ConstContact_Logo}=  //*[contains(@src,'constant-contact')]
${campaigns_MC_ConstContact_activeStatus}=  (//*[contains(@class,'campaigns-list-item')])[5]//div[contains(text(),'Active')]
${campaigns_MC_ConstContact_inactiveStatus}=  (//*[contains(@class,'campaigns-list-item')])[5]//div[contains(text(),'Inactive')]
${campaigns_MC_ConstContact_channelResults}=  (//*[contains(@class,'campaigns-list-item')])[5]//button[contains(.,'Channel Results')]
${campaigns_MC_ConstContact_segmentsCount}=  (//*[contains(@class,'campaigns-list-item')])[5]//*[contains(text(),'Calix Cloud Campaigns')]
${campaigns_MC_ConstContact_configSettings}=  (//*[contains(@class,'campaigns-list-item')])[5]//button[contains(.,'Configuration Settings')]
${campaigns_MC_ConstContact_pageHeaderTxt}=  //*[contains(text(),'Constant Contact Engagement Channel Results')]
${campaigns_MC_ConstContact_lastUpdate}=   //*[@class='last-update']
${campaigns_MC_ConstContact_closeBtn}=  //*[contains(@class,'close')]//span
${campaigns_MC_ConstContact_timeFrameDropDown}=  id=typeId
${campaigns_MC_ConstContact_searchField}=  //*[@type='search']
${campaigns_MC_ConstContact_searchBtn}=  //*[@class='add-search-icon']
${campaigns_MC_ConstContact_thName}=  //th[contains(text(),'Name')]
${campaigns_MC_ConstContact_thType}=  //th[contains(text(),'Send Date')]
${campaigns_MC_ConstContact_thSent}=  //th[contains(text(),'Sent')]
${campaigns_MC_ConstContact_thDelivered}=  //th[contains(text(),'Delivered')]
${campaigns_MC_ConstContact_thOpened}=  //th[contains(text(),'Opened')]
${campaigns_MC_ConstContact_thClicked}=  //th[contains(text(),'Clicked')]
${campaigns_MC_ConstContact_thForwarded}=  //th[contains(text(),'Forwarded')]
${campaigns_MC_ConstContact_thBounced}=  //th[contains(text(),'Bounced')]
${campaigns_MC_ConstContact_thOptouts}=  //th[contains(text(),'Optouts')]
${campaigns_MC_ConstContact_thAbuse}=  //th[contains(text(),'Abuse')]
${campaigns_MC_ConstContact_configSettingsHeadertxt}=  //*[contains(text(),'Constant Contact Marketing Channel Configuration')]
${campaigns_MC_ConstContact_configSettingsInstructionsTitle}=  //*[contains(text(),'Instructions')]
${campaigns_MC_ConstContact_configSettingsInstructionsA}=  To configure your connection from Calix Marketing Cloud to Constant Contact, click the “Connect to Constant Contact” button. A pop-up notification will appear and you’ll then need to login to your Constant Contact account to complete the configuration process.
${campaigns_MC_ConstContact_configSettingsInstructionsB}=  Once it’s set up, you can test the connection by clicking on the “Test Connection” button. After you click, you’ll get a pop-up notification confirming if the connection is successful.
${campaigns_MC_ConstContact_configSettingsInstructionsC}=  If the connection is successful, you’ll be able to send your Calix Marketing Cloud segments directly to your Constant Contact account by deploying a Calix Marketing Cloud campaign to Constant Contact. The campaign name will show up as a tag on your existing records (or new records will appear if they are not existing contacts within Constant Contact).
${campaigns_MC_ConstContact_configSettingsInstructionsD}=  From there, you can utilize your segment in Constant Contact. Once you’ve deployed a campaign in Constant Contact you will start seeing channel results (sent, opened, processed, etc.) in Calix Marketing Cloud (this information is pulled back, automatically, every night).
${campaigns_MC_ConstContact_configSettingsInstructionsE}=  Need more help?
${campaigns_MC_ConstContact_instructionsDataTxt}=  //*[@class='conf-sec']
${campaigns_MC_ConstContact_configSet_testConnectionTxt}=  //*[contains(text(),'1. Test Connection ')]
${campaigns_MC_ConstContact_configSet_testConnectionBtn}=  //button[contains(.,'Test Connection')]
${campaigns_MC_ConstContact_configSet_removeConnectionDots}=  //div[contains(@class,'dot-drop')]
${campaigns_MC_ConstContact_configSet_removeConnectionBtn}=  //button[contains(.,'Remove')]
${campaigns_MC_ConstContact_configSet_removeConnectionConfirmTxt}=   Are you sure want to remove the Constant Contact channel configuration?
${campaigns_MC_ConstContact_configSet_removeConnectionHelpTxt}=  Remove the Constant Contact configuration will clear all connection data, including the Channel campaign history.
${campaigns_MC_ConstContact_configSet_removeConnection_popupCloseBtn}=  (//*[@class='close']//*)[2]
${campaigns_MC_ConstContact_configSet_removeConnectionPopupBtn}=  (//button[contains(.,'Remove')])[2]
${campaigns_MC_ConstContact_configSet_connectionSuccesPopup}=  //*[@class='modal-body']
${campaigns_MC_ConstContact_connection_popupOkbtn}=  //button[contains(.,'Okay')]
${campaigns_MC_ConstContact_connection_popupCloseBtn}=  (//*[@class='close']//span)[2]
${campaigns_MC_ConstContact_successfullConnectiontxt}=    Successful Connection
${campaigns_MC_ConstContact_successfullConnectiontxt2}=   To complete Constant Contact marketing channel setup, select a Constant Contact audience
${campaigns_MC_ConstContact_configureBtn}=  (//*[contains(@class,'list-item')])[5]//button[contains(.,'Configure Channel')]
${campaigns_MC_ConstContact_setupConstantContactTitle}=  //*[contains(text(),'Set Up Constant Contact Channel')]
${campaigns_MC_ConstContact_connectConstantContactBtn}=  //button[contains(.,'Connect to Constant Contact')]
${campaigns_MC_ConstContact_popuploginBtn}=  //button[contains(.,'Log In Constant Contact')]
${campaigns_MC_ConstContactLogin_usernameField}=  id=okta-signin-username
${campaigns_MC_ConstContactLogin_passwordField}=  id=okta-signin-password
${campaigns_MC_ConstContactLogin_signInBtn}=  id=okta-signin-submit
${campaigns_MC_ConstContactLogin_allowAccess}=  id=Allow Access

${campaigns_MC_connectionSuccessTick}=  //*[@class='path circle']

${campaignsUrl}=  https://cloud-stg.calix.com/marketing/marketing-channel

${pagination_previous}=  //*[contains(@class,'previous')]
${pagination_first}=  //*[contains(@class,'first')]
${pagination_next}=  //*[contains(@class,'next')]
${pagination_last}=  //*[contains(@class,'last')]
${tableEntriesInfo}=  //*[@class='dataTables_info']
*** Keywords ***
go to marketing channel in campaigns
    click element until visible  ${Campaigns}
    click element until visible  ${campaigns_marketingChannelBtn}
    sleep  10
    Capture the Screen  marketingChannelScreen
    verify page title for campaigns-marketingchannel screen

verify elements on marketing channel screen
    log  CCL-39729-1
    @{txt}=  Create List  ${campaigns_MC_ciqMobileMsgHeaderTxt}  ${campaigns_MC_mailChimp_headertxt}  ${campaigns_mc_facebookheadertxt}
    wait until page contains multiple text  @{txt}

    @{elements}=  Create List  ${campaigns_mc_calixlogo}  ${campaigns_MC_mailchimpLogo}  ${campaigns_mc_fblogo}
    ...  ${campaigns_MC_hubspotlogo}  ${campaigns_MC_ConstContact_Logo}
    ...  ${campaigns_MC_ciqMobileMsg_activeStatus}  ${campaigns_MC_ciqMobileMsg_viewCR}  ${campaigns_mc_ciqmobilemsg_segmentscount}
    wait until page contain elements  @{elements}

    Verify campaigns count in CIQ column

    ${mailchimpStatus}=  Run Keyword And Return Status  element should be visible  (//*[contains(@class,'campaigns-list-item')])[2]//div[contains(text(),'Active')]
    Run Keyword If  ${mailchimpStatus}  verify elements in mailchimp column
    ...  ELSE  click on configure and login to mailchimp

#    ${facebookStatus}=  Run Keyword And Return Status  element should be visible  (//*[contains(@class,'campaigns-list-item')])[3]//div[contains(text(),'Active')]
#    Run Keyword If  ${facebookStatus}  verify elements in facebook column
#    ...  ELSE  configure facebook marketing channel
    ${facebookStatus}=  get the text from the element  ${campaigns_MC_fb_StatusElement}
    Run Keyword If  "${facebookstatus}" == "Active"  verify elements in facebook column
    ...  ELSE IF  "${facebookstatus}" == "Inactive"  configure facebook marketing channel
    ...  ELSE IF  "${facebookstatus}" == "Failed - Expired"  Verify the toast msg is visible if unReportedChannelExpiredStatus api is 'True' in homescreen
#    ...  Verify facebook api status should be true in homescreen if facebook api key expired
#    ...  AND  Navigate to homescreen and verify facebook api expired toast message
#    ...  AND  click on 'x' and verify the fb api expired toast message should be closed
#    ...  AND  Click on Facebook Config Settings and verify "Regenerate api key" help message
     ...  ELSE  fail  no status available..

#    log  CCL-29620_02
    ${hubspotStatus}=  Run Keyword And Return Status  element should be visible   (//*[contains(@class,'campaigns-list-item')])[4]//div[contains(text(),'Active')]
    Run Keyword If  ${hubspotStatus}  verify elements in hubspot column
#    ...  ELSE  click on configure and login to the hubspot

    ${constantContactStatus}=  Run Keyword And Return Status  element should be visible   (//*[contains(@class,'campaigns-list-item')])[5]//div[contains(text(),'Active')]
    Run Keyword If  ${constantContactStatus}  verify elements in constant contact column
    ...  ELSE  click on configure and login to constant contact




view CIQ channel results and validate
    click element until enabled  ${campaigns_mc_ciqmobilemsg_viewcr}
    Capture the Screen  ciqTableScreen
    @{txt}=  Create List  ${campaigns_MC_ciqMobileMsg_pageHeadertxt}  ${campaigns_MC_ciqMobileMsg_thName}
    ...  ${campaigns_MC_ciqMobileMsg_thSegment}  ${campaigns_MC_ciqMobileMsg_thStatus}  ${campaigns_MC_ciqMobileMsg_thSchedType}
    ...  ${campaigns_MC_ciqMobileMsg_thSubs}  ${campaigns_MC_ciqMobileMsg_thNotiSent}  ${CAMPAIGNS_MC_CIQMOBILEMSG_THSTARTDATE}
    ...  ${campaigns_mc_ciqmobilemsg_thenddate}
    wait until page contains multiple text  @{txt}

    @{elements}=  Create List  ${campaigns_MC_ciqMobilemsg_timeFrameDropDown}  ${campaigns_MC_searchField}
    ...  ${campaigns_MC_closeBtn}  ${pagination_previous}  ${pagination_first}  ${pagination_next}  ${pagination_last}
    ...  ${tableEntriesInfo}
    wait until page contain elements  @{elements}

    Dropdown validation  ciqResults

    ${status}=  Run Keyword And Return Status  element should be visible  //*[@id='campaigns']//tbody//tr[1]//td[2]
    Run Keyword If  ${status}  Run Keywords
    ...  get table data from mc
    ...  AND  search and verify result in Mobile notification screen
    ...  AND  search with invalid string and validate entries should show 0  ciqScreen
    ...  ELSE  log no data present in table

    click element until enabled  ${campaigns_mc_closebtn}
    sleep  5


search and verify result in Mobile notification screen
    ${data}=  get the text from the element  //tbody//tr[1]//td[1]
    enter the value untill visible  ${campaigns_mc_searchfield}  ${data}
    sleep  2
    page should contain the element  ${data}
    sleep  5


###mailchimpSection
validate mailchimp channel

Navigate to mailchimp channel results
    click element until enabled  ${campaigns_mc_mailchimp_viewcr}
    sleep  10

view mailchimp channel results and validate
    [Documentation]  CCL-68673_03 Mailchimp channel result page
    go to marketing channel in campaigns
    click element until enabled  ${campaigns_mc_mailchimp_viewcr}
    sleep  10
    Capture the Screen  mailchimpTableScreen
    click on close X button in results page and verify navigation to marketing channel
    click element until enabled  ${campaigns_mc_mailchimp_viewcr}
    sleep  10
    @{txt}=  Create List  ${campaigns_MC_mailChimp_pageHeaderTxt}  ${campaigns_MC_mailChimp_thName}
    ...  ${campaigns_MC_mailChimp_thType}  ${campaigns_MC_mailChimp_thSendDate}  ${campaigns_MC_mailChimp_thSent}
    ...  ${campaigns_MC_mailChimp_thOpened}  ${campaigns_MC_mailChimp_thClicked}  ${campaigns_MC_mailChimp_thBounced}
    ...  ${campaigns_MC_mailChimp_thUnsubscribed}
    wait until page contains multiple text  @{txt}

     @{elements}=  Create List   ${campaigns_MC_mailChimp_timeFrameDropDown}  ${campaigns_MC_searchField}
    ...  ${campaigns_MC_closeBtn}  ${pagination_previous}  ${pagination_first}  ${pagination_next}  ${pagination_last}
    ...  ${tableEntriesInfo}
    wait until page contain elements  @{elements}

    Dropdown validation  mailchimpResultsScreen

    ${status}=  Run Keyword And Return Status  element should be visible  //*[@id='campaigns']//tbody//tr[1]//td[2]
    Run Keyword If  ${status}  Run Keywords
    ...  get table data from mc
    ...  AND  search and verify result in Mailchimp screen
    ...  AND  search with invalid string and validate entries should show 0  mailchimpScreen
    ...  ELSE  log no data present in table

    click element until enabled  ${campaigns_mc_closebtn}
    sleep  10


search and verify result in Mailchimp screen
    ${data}=  get the text from the element  //tbody//tr[1]//td[1]
    enter the value untill visible  ${campaigns_mc_searchfield}  ${data}
    sleep  2
    page should contain the element  ${data}
    sleep  5


click on configuration settings for mailchimp and verify elements on the screen
    [Documentation]   CCL-68673_07  Mailchimp Configuration Setting
    click element until enabled  ${campaigns_mc_mailchimp_configsettings}
    @{txt}=  Create List  ${campaigns_MC_mailChimp_configSet_testConnectionTxt}  ${campaigns_MC_mailChimp_mailchimpAudTxt}
    wait until page contains multiple text  @{txt}
    Get Text and Assert  ${locators_params['Campaigns']['Engagement_channels']}[Mail_Instruct_1]   ${test_data_config['env']['Campaigns']['Engagement_channels']}[Mailchimp_instruction_1]
    @{Instructions}=  create list  ${locators_params['Campaigns']['Engagement_channels']}[Mailchimp_instruction_2]  ${locators_params['Campaigns']['Engagement_channels']}[Mailchimp_instruction_3]
    ...  ${locators_params['Campaigns']['Engagement_channels']}[Mailchimp_instruction_4]  ${locators_params['Campaigns']['Engagement_channels']}[Mailchimp_instruction_5]
    Get text and Ensure the Headers are Equal  ${locators_params['Campaigns']['Engagement_channels']}[Mail_Instruct_2]  @{Instructions}
    Get Text and Assert  ${locators_params['Campaigns']['Engagement_channels']}[Mail_Instruct_3]   ${test_data_config['env']['Campaigns']['Engagement_channels']}[Mailchimp_instruction_6]
    @{elements}=  Create List  ${campaigns_MC_mailChimp_configSet_testConnectionBtn}  ${campaigns_mc_mailchimp_updateaudiencebtn}  ${campaigns_mc_mailchimp_instructionsdatatxt}
    ...  ${campaigns_mc_mailchimp_configsettingsinstructionstitle}
    ...  ${campaigns_mc_mailchimp_signuphyperlink}  ${campaigns_mc_mailchimp_calixcommunityhl}
    wait until page contain elements  @{elements}
    Capture the Screen  configSettingsScreen
    @{updateAudienceHelpTxt}=  Create List  ${campaigns_MC_mailChimp_pendo_updateAudienceHelpTxt}
    Pendo ques icon validation in mailchimp configsetttings  mailchimp-updAud  (${campaigns_mc_mailchimp_pendo_quesicons})[1]   ${updateAudienceHelpTxt}
    @{testConHelpTxt}=  Create List  ${campaigns_MC_mailChimp_pendo_testConnectionHelpTxt}
    Pendo ques icon validation in mailchimp configsetttings  mailchimp-testCon  (${campaigns_mc_mailchimp_pendo_quesicons})[2]   ${testConHelpTxt}
    ${instr}=  get the text from the element  ${campaigns_mc_mailchimp_instructionsdatatxt}
    log to console  ${instr}
    validate remove connection function in mailchimp marketing Channel config screen




click on test connection in mailchimp and validate the popup
    click element until enabled  ${campaigns_mc_mailchimp_configset_testconnectionbtn}
    sleep  10
    @{txt}=  Create List  ${campaigns_mc_mailchimp_successfullconnectiontxt}  ${campaigns_mc_mailchimp_successfullconnectiontxt2}
    wait until page contains multiple text  @{txt}

    @{elements}=  Create List  ${campaigns_mc_closebtn}  ${campaigns_mc_mailchimp_configset_connectionsuccespopup}  ${campaigns_mc_mailchimp_connection_popupokbtn}
    ...  ${campaigns_MC_connectionSuccessTick}
    wait until page contain elements  @{elements}

    click element until enabled  ${campaigns_mc_mailchimp_connection_popupokbtn}

click on update audience and verify visible elements
    click element until enabled  ${campaigns_mc_mailchimp_updateaudiencebtn}
    @{elements}=  create list  ${campaigns_mc_mailchimp_saveaudiencebtn}  ${campaigns_mc_mailchimp_audiencedropdown}
    wait until page contain elements  @{elements}



select calix mailchimp audience and verify its saved
    click element until enabled  ${campaigns_mc_mailchimp_audiencedropdown}
    click element until enabled  //*[contains(@class,'scroll')]//*[contains(@class,'label')]
    click element until enabled  ${campaigns_mc_mailchimp_saveaudiencebtn}
    wait until page contains   ${campaigns_mc_mailchimp_saveaudiencepopuptxt}  5s
    capture the screen  saveAudiencePopup
    click element until enabled  ${campaigns_mc_mailchimp_connection_popupokbtn}
    wait until page contains element   ${campaigns_mc_mailchimp_configsettings}  5s
    click element until enabled  ${campaigns_mc_mailchimp_configsettings}
    wait until page contains element  ${savedAudience}  5s
    click element until visible  ${campaigns_mc_closebtn}
    sleep  5

###facebookSection
view facebook channel results and validate
    [Documentation]  CCL-68673_04 Facebook channel result page
    go to marketing channel in campaigns
    click element until visible  ${campaigns_mc_fb_channelresultsbtn}
    sleep  5
    capture the screen  facebookChannelResults
    click on close X button in results page and verify navigation to marketing channel
    click element until visible  ${campaigns_mc_fb_channelresultsbtn}
    sleep  5
    @{elements}=  create list  ${campaigns_mc_fb_timeframedd}  ${campaigns_mc_fb_thname}  ${campaigns_mc_fb_thimpression}  ${campaigns_mc_fb_thclicks}
    ...  ${campaigns_mc_fb_thuclicks}  ${campaigns_mc_fb_threach}  ${campaigns_mc_fb_thspend}  ${campaigns_mc_fb_thcpm}
    ...  ${campaigns_mc_fb_thcpc}  ${campaigns_MC_fb_thLinkClicks}  ${campaigns_MC_fb_thFrequency}
    ...  ${pagination_previous}  ${pagination_first}  ${pagination_next}  ${pagination_last}
    ...  ${tableEntriesInfo}
    wait until page contain elements  @{elements}
    page should contain  ${campaigns_MC_fb_resultsHeaderTxt}
    Dropdown validation  facebookResultsScreen

    ${status}=  Run Keyword And Return Status  element should be visible  //tbody//tr[1]//td[2]
    Run Keyword if  ${status}  Run Keywords
    ...  get table data from mc
    ...  AND  search and verify results in facebook results screen
    ...  AND  search with invalid string and validate entries should show 0  facebookScreen
    ...  ELSE  log no data present in table
    click element until visible  ${campaigns_mc_closebtn}
    sleep  5



search and verify results in facebook results screen
    ${data}=  get the text from the element  //tbody//tr[1]//td[1]
    enter the value untill visible  ${campaigns_mc_searchfield}  ${data}
    sleep  2
    page should contain the element  ${data}
    sleep  5

click on configuration setting for facebook and verify elements
    [Documentation]   CCL-68673_08  Facebook Configuration Setting
    click element until enabled  ${campaigns_mc_fb_configsettingsbtn}
    @{txt}=  create list  ${campaigns_mc_fb_configscreen_headertxt}  ${campaigns_mc_fb_configscreen_apikeyfieldheadertxt}  ${campaigns_mc_fb_configscreen_accountidheadertxt}
    ...  ${campaigns_mc_fb_configscreen_checkboxhelpmsg}
    ...  ${campaigns_mc_fb_configscreen_connectconfigtxt}
    wait until page contains multiple text  @{txt}
    @{Instructions}=  create list  ${locators_params['Campaigns']['Engagement_channels']}[Facebook_instruction_1]  ${locators_params['Campaigns']['Engagement_channels']}[Facebook_instruction_5]
    Get text and Ensure the Headers are Equal  ${locators_params['Campaigns']['Engagement_channels']}[Mail_Instruct_1]  @{Instructions}
    @{Face_Instructions}=  create list  ${locators_params['Campaigns']['Engagement_channels']}[Facebook_instruction_2]  ${locators_params['Campaigns']['Engagement_channels']}[Facebook_instruction_3]  ${locators_params['Campaigns']['Engagement_channels']}[Facebook_instruction_4]
    Get text and Ensure the Headers are Equal  ${locators_params['Campaigns']['Engagement_channels']}[Facebook_Instruct_1]  @{Face_Instructions}
    @{Face_Instructions_2}=  create list  ${locators_params['Campaigns']['Engagement_channels']}[Facebook_instruction_6]  ${locators_params['Campaigns']['Engagement_channels']}[Facebook_instruction_7]
    ...  ${locators_params['Campaigns']['Engagement_channels']}[Facebook_instruction_8]  ${locators_params['Campaigns']['Engagement_channels']}[Facebook_instruction_9]  ${locators_params['Campaigns']['Engagement_channels']}[Facebook_instruction_10]
    ...  ${locators_params['Campaigns']['Engagement_channels']}[Facebook_instruction_11]  ${locators_params['Campaigns']['Engagement_channels']}[Facebook_instruction_12]
    Get text and Ensure the Headers are Equal  ${locators_params['Campaigns']['Engagement_channels']}[Facebook_Instruct_2]  @{Face_Instructions_2}
    Get Text and Assert  ${locators_params['Campaigns']['Engagement_channels']}[Facebook_Instruct_3]   ${test_data_config['env']['Campaigns']['Engagement_channels']}[Mailchimp_instruction_6]
    @{elements}=  create list  ${campaigns_mc_mailchimp_configsettingsinstructionstitle}  ${campaigns_mc_fb_configscreen_apikeyfield}  ${campaigns_mc_fb_configscreen_accountidfield}  ${campaigns_mc_fb_configscreen_checkbox}
    ...  ${campaigns_MC_fb_configScreen_checkboxMsgT&C}
    ...  ${campaigns_MC_fb_configScreen_instructionsHere}  ${campaigns_MC_fb_configScreen_instrictionsDev}  ${campaigns_MC_fb_configScreen_calixCommunityLink}
    wait until page contain elements  @{elements}
    Capture the Screen  facebookConfigSettingsScreen
    validate remove connection fucntion in facebook channel config screen



click save with empty fields and validate help message
    clear element text  ${campaigns_mc_fb_configscreen_apikeyfield}
    clear element text  ${campaigns_mc_fb_configscreen_accountidfield}
    click element until visible  ${campaigns_mc_fb_configscreen_checkbox}
    click element until visible  ${campaigns_mc_fb_configscreen_savebtn}
    page should contain  ${apikey_helpmsg}
    enter the value untill visible  ${campaigns_mc_fb_configscreen_apikeyfield}   asdfg
    click element until visible  ${campaigns_mc_fb_configscreen_savebtn}
    page should contain  ${accountid_helpmsg}


click on test connection in facebook and validate popup
    click element until enabled  ${campaigns_mc_fb_configscreen_checkbox}
    click element until enabled  ${campaigns_mc_fb_configscreen_testconnectionbtn}
    @{txt}=  Create List  ${campaigns_mc_mailchimp_successfullconnectiontxt}
    wait until page contains multiple text  @{txt}

    @{elements}=  Create List  ${campaigns_mc_closebtn}  ${campaigns_mc_mailchimp_configset_connectionsuccespopup}  ${campaigns_mc_mailchimp_connection_popupokbtn}
    ...  ${campaigns_MC_connectionSuccessTick}
    wait until page contain elements  @{elements}
    capture the screen  fbTestConnectionPopup
    click element until enabled  ${campaigns_mc_mailchimp_connection_popupokbtn}
    log  CCL-39082-7 & CCL-39082-8
    click element until visible  ${campaigns_mc_closebtn}
    wait until page contains element   ${campaigns_MC_fbLogo}  30s
    capture the screen  marketingChannelScreen


Removing mailchimp, facebook, hubspot, and constantContact connection then verify the cant be selected in campaigns step2
    log  CCL-29620_02
    remove mailchimp, facebook and hubspot connection from marketing channel
    @{status}=  Create List  ${campaigns_mc_mailchimp_inactivestatus}  ${campaigns_mc_fb_inactivestatus}  ${campaigns_mc_hubspot_inactivestatus}
    wait until page contain elements  @{status}
    @{elements}=  Create List  ${campaigns_mc_mailchimp_viewcr}  ${campaigns_mc_fb_channelresultsbtn}  ${campaigns_mc_hubspot_channelresults}
    page should not contain multiple element  @{elements}
    ${PO_Number}    Generate random string    8    0123456789
    ${campName5}    Set Variable    campgnMcFbHsTest${PO_Number}
    step 1 define  ${campName5}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    step 2 click on all channel checkbox and verify mailchimp, facebook and hubspot should not be selected

step 2 click on all channel checkbox and verify mailchimp, facebook and hubspot should not be selected
    capture the screen  campaignsStep2
    @{txt}=  create list  ${campaigns_channel_mobnotidesc}  ${campaigns_channel_mailchimpdesc}  ${campaigns_channel_csvdesc}
    wait until page contains multiple text  @{txt}
    click element until enabled  ${campaigns_channel_channelCheckBox}
    Checkbox should not be selected  ${campaigns_channel_mailchimpcheckbox}
    checkbox should not be selected  ${campaigns_channel_fbCheckbox}
    checkbox should not be selected  ${campaigns_channel_hubspotCheckbox}
    checkbox should not be selected  ${campaigns_channel_constantContactCheckbox}
#    click element until enabled   ${next_btn_}
#    sleep  10
#    @{txt}=  Create List  Facebook  Mailchimp
#    page should not contain multiple text  @{txt}


###hubspotSection
Navigate to hubspot channel results
    click element until visible  ${campaigns_mc_hubspot_channelresults}


view hubspot channel results and validate
    [Documentation]  CCL-29620_22,CCL-29620_23,CCL-29620_05,CCL-29620_04,CCL-29620_20,CCL-68673_05 Hubspot channel result page
    go to marketing channel in campaigns
    click element until visible  ${campaigns_mc_hubspot_channelresults}
    sleep  10
    capture the screen  hubspotChannelResults
    click on close X button in results page and verify navigation to marketing channel
    click element until visible  ${campaigns_mc_hubspot_channelresults}
    @{elements}=  Create List  ${campaigns_MC_hubspot_pageHeadertxt}  ${campaigns_mc_hubspot_lastupdate}  ${campaigns_mc_hubspot_searchfield}
    ...  ${campaigns_mc_hubspot_closebtn}  ${campaigns_MC_hubspot_timeFrameDropDown}
    ...  ${campaigns_MC_hubspot_thName}  ${campaigns_MC_hubspot_thSent}  ${campaigns_MC_hubspot_thDelivered}
    ...  ${campaigns_MC_hubspot_thOpened}  ${campaigns_MC_hubspot_thProcessed}
    ...  ${pagination_previous}  ${pagination_first}  ${pagination_next}  ${pagination_last}
    ...  ${tableEntriesInfo}
    wait until page contain elements  @{elements}

    ${date}=  get text  ${campaigns_mc_hubspot_lastupdate}

    Dropdown validation  hubspotChannelResultsScreen

    ${status}=  Run Keyword And Return Status  element should be visible  //tbody//tr[1]//td[2]
    Run Keyword if  ${status}  Run Keywords
    ...  get table data from mc
    ...  AND  search and verify result in Hubspot screen
    ...  AND  search with invalid string and validate entries should show 0  hubspotScreen
    ...  ELSE  log no data present in table
    click element until visible  ${campaigns_mc_closebtn}
    sleep  5

search and verify result in Hubspot screen
    log  CCL-29620_06
    ${data}=  get the text from the element  //tbody//tr[1]//td[1]
    enter the value untill visible  ${campaigns_mc_searchfield}  ${data}
    sleep  2
    page should contain the element  ${data}
    sleep  5
    capture the screen  searchedData
    clear element text  ${campaigns_mc_searchfield}

search with invalid string and validate entries should show 0
    [Arguments]  ${screenName}
    enter the value untill visible  ${campaigns_mc_searchfield}  invalidString%$@
    sleep  5
    capture the screen  ${screenName}-invalidSearch
    page should not contain  invalidString%$@
    page should contain  Showing 0 to 0 of 0 entries
    clear element text  ${campaigns_mc_searchfield}

verify table data should be 10 count for a page
    log  CCL-29620_09
    ${count}=  get element count  //tbody//tr
    Should Be Equal As Strings  "${count}"  "10"

click on configuration settings for hubspot and verify elements
    [Documentation]   CCL-29620_38,CCL-68673_09  Hubspot Configuration Setting
    click element until visible  ${campaigns_mc_hubspot_configsettings}
    sleep  5
    @{Hubspot_Instructions}=  create list  ${locators_params['Campaigns']['Engagement_channels']}[Hubspot_instruction_1]  ${locators_params['Campaigns']['Engagement_channels']}[Mailchimp_instruction_6]
    Get text and Ensure the Headers are Equal  ${locators_params['Campaigns']['Engagement_channels']}[Mail_Instruct_1]  @{Hubspot_Instructions}
    @{Hubspot_Instructions_2}=  create list  ${locators_params['Campaigns']['Engagement_channels']}[Hubspot_instruction_2]  ${locators_params['Campaigns']['Engagement_channels']}[Hubspot_instruction_3]
    ...  ${locators_params['Campaigns']['Engagement_channels']}[Hubspot_instruction_4]  ${locators_params['Campaigns']['Engagement_channels']}[Hubspot_instruction_5]
    Get text and Ensure the Headers are Equal  ${locators_params['Campaigns']['Engagement_channels']}[Mail_Instruct_2]  @{Hubspot_Instructions_2}
    capture the screen  hubspotConfigSettingsScreen
    @{elements}=  Create List  ${campaigns_MC_hubspot_configSettingsHeadertxt}  ${campaigns_MC_hubspot_configSettingsInstructionsTitle}  ${campaigns_MC_hubspot_instructionsDataTxt}  ${campaigns_MC_hubspot_configSet_testConnectionTxt}
    ...  ${campaigns_MC_hubspot_configSet_testConnectionBtn}  ${campaigns_MC_hubspot_configSet_removeConnectionDots}  ${campaigns_mc_hubspot_closebtn}
    wait until page contain elements  @{elements}

click on test connection in hubspot and validate the popup
    log  CCL-29620_31
    log  CCL-29620_33
    log  CCL-29620_34
    log  CCL-29620_35
    click element until visible  ${campaigns_MC_hubspot_configSet_testConnectionBtn}
    sleep  6
    capture the screen  testConnectionPopup
    @{popupElements}=  Create List  ${campaigns_MC_hubspot_connection_popupOkbtn}  ${campaigns_MC_connectionSuccessTick}
    wait until page contain elements  @{popupElements}
    @{popupTxt}=  Create List  ${campaigns_MC_hubspot_successfullConnectiontxt}
    wait until page contains multiple text  @{popupTxt}
    click element until visible  ${campaigns_MC_hubspot_connection_popupOkbtn}
    capture the screen  hubspotConfigSettingsScreen


##ConstantContactDiv
View ConstantContact channel results and validate
    [Documentation]  CCL-68673_06 Constant Contact channel result page
    go to marketing channel in campaigns
    click element until visible  ${campaigns_MC_ConstContact_channelResults}
    @{elements}=  Create List  ${campaigns_MC_ConstContact_pageHeaderTxt}  ${campaigns_MC_ConstContact_lastUpdate}
    ...  ${campaigns_MC_ConstContact_closeBtn}  ${campaigns_MC_ConstContact_timeFrameDropDown}
    ...  ${campaigns_MC_ConstContact_searchField}   ${campaigns_MC_ConstContact_thName}
    ...  ${campaigns_MC_ConstContact_thType}   ${campaigns_MC_ConstContact_thSent}
    ...  ${campaigns_MC_ConstContact_thOpened}  ${campaigns_MC_ConstContact_thClicked}
    ...  ${campaigns_MC_ConstContact_thForwarded}  ${campaigns_MC_ConstContact_thOptouts}
    ...  ${campaigns_MC_ConstContact_thAbuse}  ${pagination_previous}  ${pagination_first}
    ...  ${pagination_next}  ${pagination_last}  ${tableEntriesInfo}
    wait until page contain elements  @{elements}
    capture the screen  constantContact-channelResults
    click on close X button in results page and verify navigation to marketing channel
    click element until visible  ${campaigns_MC_ConstContact_channelResults}
    sleep  5
    ${lasUpdate}=  get text  ${campaigns_MC_ConstContact_lastUpdate}
    log  ${lasUpdate}

    Dropdown validation  constantContactChannelResultsScreen

    ${status}=  Run Keyword And Return Status  element should be visible  //tbody//tr[1]//td[2]
    Run Keyword if  ${status}  Run Keywords
    ...  get table data from mc
    ...  AND  search and verify result in constantContact screen
    ...  AND  search with invalid string and validate entries should show 0  constantContact
    ...  ELSE  log no data present in table
    click element until visible  ${campaigns_mc_closebtn}
#    verify elements in constant contact column
    capture the screen  navigatedBackToMarketingChannel

Click on configuration settings for ConstantContact and verify elements
    click element until visible  ${campaigns_MC_ConstContact_configSettings}
    verify elements on configuration setting screen - ConstantContact

verify elements on configuration setting screen - ConstantContact
    [Documentation]   CCL-68673_10  Constant Contact Configuration Setting
    sleep  5
    @{CC_Instructions}=  create list  ${locators_params['Campaigns']['Engagement_channels']}[CC_instruction_1]  ${locators_params['Campaigns']['Engagement_channels']}[Mailchimp_instruction_6]
    Get text and Ensure the Headers are Equal  ${locators_params['Campaigns']['Engagement_channels']}[Mail_Instruct_1]  @{CC_Instructions}
    @{CC_Instructions_2}=  create list  ${locators_params['Campaigns']['Engagement_channels']}[CC_instruction_2]  ${locators_params['Campaigns']['Engagement_channels']}[CC_instruction_3]
    ...  ${locators_params['Campaigns']['Engagement_channels']}[CC_instruction_4]  ${locators_params['Campaigns']['Engagement_channels']}[CC_instruction_5]
    Get text and Ensure the Headers are Equal  ${locators_params['Campaigns']['Engagement_channels']}[Mail_Instruct_2]  @{CC_Instructions_2}
    @{elements}=  Create List  ${campaigns_MC_ConstContact_configSettingsHeadertxt}  ${campaigns_MC_ConstContact_configSettingsInstructionsTitle}
    ...  ${campaigns_MC_ConstContact_instructionsDataTxt}  ${campaigns_MC_ConstContact_configSet_testConnectionTxt}
    ...  ${campaigns_MC_ConstContact_configSet_testConnectionBtn}  ${campaigns_MC_ConstContact_configSet_removeConnectionDots}
    wait until page contain elements  @{elements}
    @{instructionsDesc}=  Create List  ${campaigns_MC_ConstContact_configSettingsInstructionsA}  ${campaigns_MC_ConstContact_configSettingsInstructionsB}
    ...  ${campaigns_MC_ConstContact_configSettingsInstructionsC}  ${campaigns_MC_ConstContact_configSettingsInstructionsD}
    ...  ${campaigns_MC_ConstContact_configSettingsInstructionsE}
    capture the screen  constantContact-configSettingsScreen


click on test connection in constantcontact and validate the popup
    click element until visible  ${campaigns_MC_ConstContact_configSet_testConnectionBtn}
    wait until page contains element  ${campaigns_MC_connectionSuccessTick}  60s
    @{popupTxt}=  Create List
    ...  ${campaigns_MC_ConstContact_successfullConnectiontxt}
    wait until page contains multiple text  @{popupTxt}
    capture the screen  testConnectionPOpup-constantContact
    click element until visible  ${campaigns_MC_ConstContact_connection_popupOkbtn}


###customKeys
click on close X button in results page and verify navigation to marketing channel
    log  CCL-29620_19
    click element until visible  ${campaigns_mc_closebtn}
    sleep  6
    @{elements}=  Create List  ${campaigns_marketingchannelbtn}  ${campaigns_mc_calixlogo}  ${campaigns_mc_fblogo}
    ...  ${campaigns_mc_hubspotlogo}  ${campaigns_mc_mailchimplogo}
    wait until page contain elements  @{elements}
    capture the screen  marketingChannelScreen


click on configure and login to mailchimp
    page should contain element  ${campaigns_MC_mailChimp_inActiveStatus}
    click element until enabled  ${campaigns_MC_mailChimp_configureBtn}
    sleep  5
    @{elements}=  Create List  ${campaigns_mc_mailchimp_connectmailchimpbtn}  ${campaigns_mc_mailchimp_instructionsdatatxt}
    ...  ${campaigns_mc_mailchimp_instructionsdatatxt}
    wait until page contain elements  @{elements}
    click element until enabled  ${campaigns_mc_mailchimp_connectmailchimpbtn}
    page should contain element  ${campaigns_MC_mailChimp_loginMailchimpBtn}
    Login to mailchimp and verify configuratin screen

Login to mailchimp and verify configuratin screen
    click element until visible  ${campaigns_MC_mailChimp_loginMailchimpBtn}
    @{elements}=  Create List  ${campaigns_mc_mailchimplogin_cmcStgbtn}  ${campaigns_mc_mailchimplogin_usernamefield}  ${campaigns_mc_mailchimplogin_showpasswrdicon}  ${campaigns_mc_mailchimplogin_passworddfield}
    ...  ${campaigns_mc_mailchimp_loginmailchimpbtn}  ${campaigns_mc_mailchimplogin_createaccountbtn}
    wait until page contain elements  @{elements}
    page should contain the element  ${campaigns_MC_mailChimpLogin_loginHeaderTxt}
    Capture the Screen  mailchimpLoginScreen
    ${username}=  call method  ${ObjconfigReader}  mailChimpUsername
    ${password}=  call method  ${ObjconfigReader}  mailChimpPassword

    enter the value untill visible  ${campaigns_mc_mailchimplogin_usernamefield}  ${username}
    enter the value untill visible  ${campaigns_mc_mailchimplogin_passworddfield}  ${password}
    click element until enabled  ${campaigns_mc_mailchimp_loginmailchimpbtn}
    sleep  10
    Capture the screen  mailchimpAuthScreen
    ${status}=  Run Keyword And Return Status  element should be visible  //*[@value='Allow']
    Run Keyword If  ${status}  Authorize cmc stage for mailchimp
    ...  ELSE  log auth page not present
    capture the screen  mailchimpConfiguredScreen
    click element until visible  ${campaigns_mc_closebtn}
    sleep  5
    capture the screen  mailchimpActiveScreen
    verify elements in mailchimp column

verify elements in mailchimp column
    @{elements}=  Create List  ${campaigns_mc_mailchimplogo}  ${campaigns_MC_mailChimp_activeStatus}  ${campaigns_MC_mailChimp_viewCR}  ${campaigns_MC_mailChimp_configSettings}
    ...  ${campaigns_mc_mailchimp_segmentscount}
    wait until page contain elements  @{elements}
    Verify campaigns count in Mailchimp column

verify elements in facebook column
    @{elements}=  Create List  ${campaigns_mc_fblogo}  ${campaigns_mc_fb_activestatus}  ${campaigns_mc_fb_channelresultsbtn}
    ...  ${campaigns_mc_fb_configsettingsbtn}  ${campaigns_mc_fb_segmentscount}
    wait until page contain elements  @{elements}
    Verify campaigns count in Facebook column

verify elements in hubspot column
    log  CCL-29620_01
    @{elements}=  Create List  ${campaigns_mc_hubspot_headertxt}  ${campaigns_mc_hubspot_hubspotpopuplogo}  ${campaigns_mc_hubspot_channelresults}
    ...  ${campaigns_mc_hubspot_configsettings}  ${campaigns_mc_hubspot_segmentscount}
    wait until page contain elements  @{elements}
    Verify campaigns count in Hubspot column

verify elements in constant contact column
    log  CCL-39730-10
    @{elements}=  Create List  ${campaigns_MC_ConstContact_headertxt}  ${campaigns_MC_ConstContact_Logo}  ${campaigns_MC_ConstContact_activeStatus}
    ...  ${campaigns_MC_ConstContact_configSettings}  ${campaigns_MC_ConstContact_segmentsCount}
    wait until page contain elements  @{elements}
    Verify campaigns count in Constant contact column


search and verify result in constantContact screen
    ${data}=  get the text from the element  //tbody//tr[1]//td[1]
    enter the value untill visible  ${campaigns_mc_searchfield}  ${data}
    sleep  2
    page should contain the element  ${data}
    sleep  5
    capture the screen  constantContact-searchResult

get table data from mc
    @{elements}=  get webelements  ${campaigns_mc_trow}
    FOR  ${element}  IN  @{elements}
    ${tabledata}=  get text  ${element}
    END



log no data present in table
    log to console  no data present in table..


Authorize cmc stage for mailchimp
    ${cookiesStatement}=  Run Keyword And Return Status  //*[contains(@id,'onetrust-close')]//button
    Run Keyword If  ${cookiesStatement}  Close cookies statement
    ...  ELSE  Log cookies statement not present
#    click element  ${campaigns_MC_mailChimpLogin_cookiesStatementClose}
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    click element until visible  //*[@value='Allow']
    sleep  10
    page should contain the element  ${campaigns_mc_mailchimp_configsettingsheadertxt}


Close cookies statement
    click element  ${campaigns_MC_mailChimpLogin_cookiesStatementClose}

Log cookies statement not present
    log to console  cookies statement not present

Log auth page not present
    log to console  Authorization page not present..

validate remove connection function in mailchimp marketing Channel config screen
    click element until visible  ${campaigns_mc_mailchimp_configset_removeconnectiondots}
    click element until visible  ${campaigns_mc_mailchimp_configset_removeconnectionbtn}
    page should contain the element  ${campaigns_mc_mailchimp_configset_removeconnectionconfirmtxt}
    @{elements}=  Create List  ${campaigns_mc_mailchimp_configset_removeconnection_popupclosebtn}  ${campaigns_mc_mailchimp_configset_removeconnectionpopupbtn}
    wait until page contain elements  @{elements}
    click element until visible  ${campaigns_mc_mailchimp_configset_removeconnection_popupclosebtn}


validate remove connection fucntion in facebook channel config screen
    log  CCL-39082-9 to CCL-39082-13
     click element until visible  ${campaigns_mc_fb_configscreen_dotdropdown}
    click element until visible  ${campaigns_mc_fb_configscreen_dotremoveconnectionbtn}
    page should contain the element  ${campaigns_mc_fb_configscreen_removeconnectionconfirmtxt}
    @{elements}=  Create List  ${campaigns_mc_fb_configscreen_popupclosebtn}  ${campaigns_mc_fb_configscreen_popupremoveconnectionbtn}
    wait until page contain elements  @{elements}
    click element until visible  ${campaigns_mc_fb_configscreen_popupclosebtn}


configure facebook marketing channel
    click element until visible  ${campaigns_mc_fb_configurebtn}
    sleep  5
    Capture the Screen  facebookConfigChannelScreen
    Enter invalid facebook api key and validate connection error popup
    Enter invalid facebook account id and validate connection error popup
    ${apiKey}=  Call Method  ${ObjconfigReader}  fbApiKey
    ${accountId}=  Call Method  ${ObjconfigReader}  fbAccountId
    enter the value untill visible  ${campaigns_mc_fb_configscreen_apikeyfield}  ${apiKey}
    enter the value untill visible  ${campaigns_mc_fb_configscreen_accountidfield}  ${accountId}
#    click element until visible  ${campaigns_mc_fb_configscreen_checkbox}
    click element until visible  ${campaigns_MC_fb_configScreen_testConnectionBtn}
    sleep  5
    page should contain element  ${campaigns_mc_fb_configscreen_successfullyconfiguredtext}
    click element until visible     ${campaigns_mc_mailchimp_connection_popupokbtn}
    click element until visible   ${campaigns_mc_closebtn}
    verify elements in facebook column
    capture the screen  facebookOnlineScreen

Enter invalid facebook account id and validate connection error popup
    ${apiKey}=  Call Method  ${ObjconfigReader}  fbApiKey
    enter the value untill visible  ${campaigns_mc_fb_configscreen_apikeyfield}  ${apiKey}
    enter the value untill visible  ${campaigns_mc_fb_configscreen_accountidfield}  12345678901234
#    click element until visible  ${campaigns_mc_fb_configscreen_checkbox}
    click element until visible  ${campaigns_MC_fb_configScreen_testConnectionBtn}
    @{text}=  Create List  ${campaigns_mc_fb_configscreen_invalidapikeyhelpmsg}  ${campaigns_mc_fb_configscreen_connectionerrortxt}
    wait until page contains multiple text  @{text}
    capture the screen  connectionErrorPopup-invalidAcId
    click element until visible  ${campaigns_mc_fb_configscreen_connectionerrorokbtn}
    capture the screen  facebookConfigChannelScreen-invalidAcId

Click on test connection and verify connection error status
    click element until visible  ${campaigns_MC_fb_configScreen_testConnectionBtn}
    @{text}=  Create List  ${campaigns_mc_fb_configscreen_invalidapikeyhelpmsg}  ${campaigns_mc_fb_configscreen_connectionerrortxt}
    wait until page contains multiple text  @{text}
    capture the screen  connectionErrorPopup-expiredApi
    click element until visible  ${campaigns_mc_fb_configscreen_connectionerrorokbtn}
    capture the screen  facebookConfigChannelScreen-expiredApi

Enter invalid facebook api key and validate connection error popup
    ${invalidapiKey}=  Call Method  ${ObjconfigReader}  fbInvalidApiKey
    ${accountId}=  Call Method  ${ObjconfigReader}  fbAccountId
    enter the value untill visible  ${campaigns_mc_fb_configscreen_apikeyfield}  ${invalidapiKey}
    enter the value untill visible  ${campaigns_mc_fb_configscreen_accountidfield}  ${accountId}
    click element until visible  ${campaigns_mc_fb_configscreen_checkbox}
    click element until visible  ${campaigns_MC_fb_configScreen_testConnectionBtn}
    @{text}=  Create List  ${campaigns_mc_fb_configscreen_invalidapikeyhelpmsg}  ${campaigns_mc_fb_configscreen_connectionerrortxt}
    wait until page contains multiple text  @{text}
    capture the screen  connectionErrorPopup-invalidApiKey
    click element until visible  ${campaigns_mc_fb_configscreen_connectionerrorokbtn}
    capture the screen  facebookConfigChannelScreen-invalidApiKey

remove mailchimp, facebook and hubspot connection from marketing channel
    click element until enabled  ${Campaigns}
    sleep  5
    click element until enabled  ${campaigns_marketingChannelBtn}
    sleep  10
    Remove mailchimp connection
    Remove facebook connection
    Remove hubspot connection
    Remove constant contact connection

Remove mailchimp connection
    click element until visible  ${campaigns_mc_mailchimp_configsettings}
    sleep  8
    click element until visible  ${campaigns_mc_mailchimp_configset_removeconnectiondots}
    click element until visible  ${campaigns_mc_mailchimp_configset_removeconnectionbtn}
    capture the screen  mailchimpRemovePopup
    @{txt}=  Create List  ${campaigns_MC_mailChimp_configSet_removeConnectionConfirmTxt}  ${campaigns_MC_mailChimp_configSet_removeConnectionHelpTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${campaigns_MC_mailChimp_configSet_removeConnection_popupCloseBtn}  ${campaigns_mc_mailchimp_configset_removeconnectionpopupbtn}
    wait until page contain elements  @{elements}
    click element until visible  ${campaigns_mc_mailchimp_configset_removeconnectionpopupbtn}
    @{mElements}=  Create List  ${campaigns_MC_mailChimp_inActiveStatus}  ${campaigns_MC_mailChimp_configureBtn}
    wait until page contain elements  @{mElements}
    capture the screen  mailchimpInactiveScreen

Remove facebook connection
    log  CCL-39082-14
    click element until visible  ${campaigns_mc_fb_configsettingsbtn}
    sleep  8
    click element until visible  ${campaigns_mc_fb_configscreen_dotdropdown}
    click element until visible  ${campaigns_mc_fb_configscreen_dotremoveconnectionbtn}
    capture the screen  facebookRemovePopup
    @{txt}=  Create List  ${campaigns_MC_fb_configScreen_removeConnectionConfirmTxt}  ${campaigns_MC_fb_configScreen_removeConnectionHelpTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${campaigns_MC_fb_configScreen_popupCloseBtn}  ${campaigns_MC_fb_configScreen_popupRemoveConnectionBtn}
    wait until page contain elements  @{elements}
    click element until visible  ${campaigns_mc_fb_configscreen_popupremoveconnectionbtn}
    @{fElements}=  Create List  ${campaigns_MC_fb_InactiveStatus}  ${campaigns_MC_fb_configureBtn}
    wait until page contain elements  @{fElements}
    capture the screen  facebookInactiveScreen


Remove hubspot connection
    log  CCL-29620_36
    log  CCL-29620_37
    click element until visible  ${campaigns_mc_hubspot_configsettings}
    wait until page contains element  ${campaigns_mc_hubspot_configset_removeconnectiondots}  60s
    click element until visible  ${campaigns_mc_hubspot_configset_removeconnectiondots}
    click element until visible  ${campaigns_mc_hubspot_configset_removeconnectionbtn}
    capture the screen  hubspotRemovePopup
    @{txt}=  Create List  ${campaigns_MC_hubspot_configSet_removeConnectionConfirmTxt}  ${campaigns_MC_hubspot_configSet_removeConnectionHelpTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${campaigns_MC_hubspot_configSet_removeConnection_popupCloseBtn}  ${campaigns_MC_hubspot_configSet_removeConnectionPopupBtn}
    wait until page contain elements  @{elements}
    click element until visible  ${campaigns_mc_hubspot_configset_removeconnectionpopupbtn}
    @{hElements}=  Create List  ${campaigns_MC_hubspot_inactiveStatus}  ${campaigns_MC_hubspot_configureBtn}
    wait until page contain elements  @{hElements}
    capture the screen  hubspotInactiveScreen

Remove constant contact connection
    click element until visible  ${campaigns_MC_ConstContact_configSettings}
    wait until page contains element  ${campaigns_MC_ConstContact_configSet_removeConnectionDots}  60s
    click element until visible  ${campaigns_MC_ConstContact_configSet_removeConnectionDots}
    click element until visible  ${campaigns_MC_ConstContact_configSet_removeConnectionBtn}
    @{txt}=  Create List  ${campaigns_MC_ConstContact_configSet_removeConnectionConfirmTxt}  ${campaigns_MC_ConstContact_configSet_removeConnectionHelpTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${campaigns_MC_ConstContact_configSet_removeConnection_popupCloseBtn}  ${campaigns_MC_hubspot_configSet_removeConnectionPopupBtn}
    wait until page contain elements  @{elements}
    capture the screen  constantContact-RemovePopup
    click element until visible  ${campaigns_MC_ConstContact_configSet_removeConnectionPopupBtn}
    @{cElements}=  Create List  ${campaigns_MC_ConstContact_inactiveStatus}  ${campaigns_MC_ConstContact_configureBtn}
    wait until page contain elements  @{cElements}
    capture the screen  constantContact-InactiveScreen

Add mailchimp, fb, hubspot and ConstantContact
    go to marketing channel in campaigns
    ${mailchimpStatus}=  Run Keyword And Return Status  element should be visible  (//*[contains(@class,'campaigns-list-item')])[2]//div[contains(text(),'Active')]
    Run Keyword If  ${mailchimpStatus}  verify elements in mailchimp column
    ...  ELSE  click on configure and login to mailchimp

    ${facebookStatus}=  Run Keyword And Return Status  element should be visible  (//*[contains(@class,'campaigns-list-item')])[3]//div[contains(text(),'Active')]
    Run Keyword If  ${facebookStatus}  verify elements in facebook column
    ...  ELSE  configure facebook marketing channel


#    log  CCL-29620_02
#    ${hubspotStatus}=  Run Keyword And Return Status  element should be visible   (//*[contains(@class,'campaigns-list-item')])[4]//div[contains(text(),'Active')]
#    Run Keyword If  ${hubspotStatus}  verify elements in hubspot column
#    ...  ELSE  click on configure and login to the hubspot

    ${constantContactStatus}=  Run Keyword And Return Status  element should be visible   (//*[contains(@class,'campaigns-list-item')])[5]//div[contains(text(),'Active')]
    Run Keyword If  ${constantContactStatus}  verify elements in constant contact column
    ...  ELSE  click on configure and login to constant contact


Hubspot Config screen validation
    log  CCL-29620_26
    log  CCL-29620_27
    log  CCL-29620_28
    log  CCL-29620_29
    click element until visible  ${campaigns_mc_hubspot_connecthubspotbtn}
    sleep  4
    capture the screen  hubspotLoginPopup
    @{elements}=  Create List  ${campaigns_mc_hubspot_hubspotpopuplogo}  ${campaigns_MC_hubspot_loginhubspotBtn}
    ...  ${campaigns_mc_hubspot_connection_popupclosebtn}
    wait until page contain elements  @{elements}
    click element until visible  ${campaigns_mc_hubspot_connection_popupclosebtn}
    capture the screen  hubspotConfigScreen
    click element until visible  ${campaigns_mc_closebtn}
    sleep  5
    capture the screen  marketingChannelScreen


Click on configure and login to the hubspot
    page should contain element  ${campaigns_MC_hubspot_inactiveStatus}
    click element until visible  ${campaigns_mc_hubspot_configurebtn}
    sleep  5
    capture the screen  hubspotConfigScreen
    @{elements}=  Create List  ${campaigns_mc_hubspot_configsettingsheadertxt}  ${campaigns_mc_hubspot_setuphubspottxt}  ${campaigns_mc_hubspot_connecthubspotbtn}
    ...  ${campaigns_mc_hubspot_configsettingsinstructionsTitle}  ${campaigns_MC_hubspot_instructionsDataTxt}
    wait until page contain elements  @{elements}
    hubspot config screen validation
    click element until visible  ${campaigns_mc_hubspot_configurebtn}
    sleep  5
    capture the screen  hubspotConfigScreen
    check and login to the hubspot


Check and login to the hubspot
    log  CCL-29620_30
    click element until visible  ${campaigns_mc_hubspot_connecthubspotbtn}
    sleep  4
    capture the screen  hubspotLoginPopup
    @{elements}=  Create List  ${campaigns_mc_hubspot_hubspotpopuplogo}  ${campaigns_MC_hubspot_loginhubspotBtn}
    ...  ${campaigns_mc_hubspot_connection_popupclosebtn}
    wait until page contain elements  @{elements}
    click element until visible   ${campaigns_MC_hubspot_loginhubspotBtn}
    sleep  10
    capture the screen  hubspotLoginScreen
    Enter invalid password and verify alert message
#    ${status}=  run keyword and return status  element should be visible  id=username
#    run keyword if  ${status}  login to hubspot
#    ...  ELSE  choose an account in hubspot dashboard

login to hubspot
    log  CCL-29620_33
#    ${userName}=  Call Method   ${ObjconfigReader}  hubSpotUsername
#    ${passWord}=  Call Method   ${ObjconfigReader}  hubSpotPassword
    enter the value untill visible  ${campaigns_mc_hubspotlogin_usernamefield}  sivaprakash51094@gmail.com
    enter the value untill visible  ${campaigns_mc_hubspotlogin_passworddfield}  Sivaprakash@123
    click element until visible   (//button[contains(.,'Log in')])[1]
#    sleep  5
#    go to  https://app.hubspot.com/login
    sleep  10
    capture the screen  hubspotDashboard
    Choose an account in hubspot dashboard
    log  CCL-29620_31
    capture the screen  hubspotConfigurationScreen
    click element until visible  ${campaigns_mc_closebtn}
    sleep  8
    log  CCL-29620_03
    verify elements in hubspot column

Enter invalid password and verify alert message
    log  CCL-29620_32
#    ${userName}=  Call Method   ${ObjconfigReader}  hubSpotUsername
    enter the value untill visible  ${campaigns_mc_hubspotlogin_usernamefield}  sivaprakash51094@gmail.com
    enter the value untill visible  ${campaigns_mc_hubspotlogin_passworddfield}  invalidPassword
    click element until visible   (//button[contains(.,'Log in')])[1]
    wait until page contains  ${campaigns_MC_hubspotLogin_invalidPasswordAlert}  10s
    clear element text  ${campaigns_mc_hubspotlogin_usernamefield}
    clear element text  ${campaigns_mc_hubspotlogin_passworddfield}

Choose an account in hubspot dashboard
    click element until visible  ${campaigns_MC_hubspotDashboard_firstAccount}
    click element until visible  ${campaigns_MC_hubspotDashboard_chooseAccountBtn}
    sleep  20


Configure mailchimp channel
    click element until enabled  ${Campaigns}
    sleep  5
    click element until enabled  ${campaigns_marketingChannelBtn}
    sleep  15
    Capture the Screen  marketingChannelScreen
    click on configure and login to mailchimp
    sleep  10
    capture the screen  mailchimpOnlineScreen

Configure facebook channel
    click element until enabled  ${Campaigns}
    sleep  5
    click element until enabled  ${campaigns_marketingChannelBtn}
    sleep  10
    configure facebook marketing channel
    sleep  5

Pagination validation
    log  CCL-29620_10
    log  CCL-29620_11
    log  CCL-29620_12
    log  CCL-29620_13
    log  CCL-29620_14
    log  CCL-29620_15
    log  CCL-29620_16
    log  CCL-29620_17
    log  CCL-29620_18
    click element until visible  ${campaigns_pagination_2}
    ${txt}=  get the text from the element  ${campaigns_pagination_current}
    should be equal as strings  "${txt}"  "2"

    click element until visible  ${campaigns_pagination_1}
    ${txt1}=  get the text from the element  ${campaigns_pagination_current}
    should be equal as strings  "${txt1}"   "1"
    @{disabledFirstPrev}=  Create List  ${campaigns_pagination_First_disabled}  ${campaigns_pagination_Previous_disabled}
    page should contain multiple element  @{disabledFirstPrev}

    click element until visible  ${campaigns_pagination_2}
    page should contain element  ${campaigns_pagination_Previous}
    click element until visible  ${campaigns_pagination_1}
    page should contain element  ${campaigns_pagination_Previous_disabled}

    click elemment until visible  ${campaigns_pagination_next}
    ${txt}=  get the text from the element  ${campaigns_pagination_current}
    should be equal as strings  "${txt}"  "2"

    click element until visible  ${campaigns_pagination_last}
    @{disabledNextLast}=  Create List  ${campaigns_pagination_next_disabled}  ${campaigns_pagination_last_disabled}
    page shoudl contain multiple element  @{disabledNextLast}

    clic element until visible  ${campaigns_pagination_First}


Click on configure and login to constant contact
    log  CCL-39729-2
    page should contain element  ${campaigns_MC_ConstContact_inactiveStatus}
    click element until visible  ${campaigns_MC_ConstContact_configureBtn}
    Login to ConstantContact

Login to ConstantContact
    log  CCL-39729-3, CCL-39729-4, CCL-39730-5, CCL-39730-6, CCL-39730-7, CCL-39730-8, CCL-39730-9
    Verify elements on constant contact config screen
    Click Element Until Visible  ${campaigns_MC_ConstContact_connectConstantContactBtn}
    @{popupelements}=  Create List  ${campaigns_MC_ConstContact_Logo}  ${campaigns_MC_ConstContact_popuploginBtn}
    ...  ${campaigns_MC_ConstContact_connection_popupCloseBtn}
    wait until page contain elements  @{popupelements}
    capture the screen  consContactLoginPOpup
    log  closing popup and validating its closed
    click element until visible  ${campaigns_MC_ConstContact_connection_popupCloseBtn}
    @{popupelements}=  Create List  ${campaigns_MC_ConstContact_Logo}  ${campaigns_MC_ConstContact_popuploginBtn}
    ...  ${campaigns_MC_ConstContact_connection_popupCloseBtn}
    page should not contain multiple element  @{popupelements}
    Click Element Until Visible  ${campaigns_MC_ConstContact_connectConstantContactBtn}
    @{popupelements}=  Create List  ${campaigns_MC_ConstContact_Logo}  ${campaigns_MC_ConstContact_popuploginBtn}
    ...  ${campaigns_MC_ConstContact_connection_popupCloseBtn}
    wait until page contain elements  @{popupelements}
    click element until visible  ${campaigns_MC_ConstContact_popuploginBtn}
    Verify elements on constant contact login screen
    log  Entering credentials in constant contact login screen
    ${username}=  Call Method   ${ObjconfigReader}  constantContactUsername
    ${password}=  Call Method   ${ObjconfigReader}  constantContactPassword
    Enter the Value Untill Visible  ${campaigns_MC_ConstContactLogin_usernameField}  ${username}
    Enter the Value Untill Visible  ${campaigns_MC_ConstContactLogin_passwordField}  ${password}
    click element until visible  ${campaigns_MC_ConstContactLogin_signInBtn}
    verify elements on configuration setting screen - ConstantContact
    click on test connection in constantcontact and validate the popup
#    wait until page contains element  ${campaigns_MC_ConstContactLogin_allowAccess}
#    capture the screen  constantContact-allowAccess
#    click element until visible  ${campaigns_MC_ConstContactLogin_allowAccess}
    click element until visible  ${campaigns_MC_closeBtn}
    verify elements in constant contact column


Verify elements on constant contact config screen
    @{elements}=  Create List  ${campaigns_MC_ConstContact_setupConstantContactTitle}   ${campaigns_MC_ConstContact_connectConstantContactBtn}
    ...  ${campaigns_MC_closeBtn}
    wait until page contain elements  @{elements}
    capture the screen   constantcontact-configScreen

Verify elements on constant contact login screen
    @{elements}=  Create List  ${campaigns_MC_ConstContactLogin_usernameField}  ${campaigns_MC_ConstContactLogin_passwordField}
    ...  ${campaigns_MC_ConstContactLogin_signInBtn}
    wait until page contain elements  @{elements}
    capture the screen  constantContactLoginScreen




############### HubSpot Marketing Channel Results - Name Field ############
Verify Hubspot Marketing Channels Results Name column data with API
    ${response}=   call method     ${CMCconnectionObj}     Campaign_Hubspot_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    run keyword if    '''${response}[1]''' == 'Data Found'    Table Data Name column DataCheckin Hubspot
    ...    ELSE     Hubspot Marketing channel Results zero
#%%%%%%%
Table Data Name column DataCheckin Hubspot
    ${response}=   call method     ${CMCconnectionObj}     Campaign_Hubspot_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    FOR    ${row}  IN RANGE  1  ${rows}+1
    HubSpot Name List Table  ${row}  ${response}
    END
#%%%%%%%%
HubSpot Name List Table
       [Arguments]  ${test_row}  ${test_response_Retention_Table_Data}
       set selenium implicit wait    60 seconds
       set selenium timeout    60 seconds
       FOR   ${column}    IN RANGE   1    2
       ${row_data1}=    Evaluate   ${test_row}-${1}
       ${column_data1}=   Evaluate    ${column}-${1}
       log     ${test_response_Retention_Table_Data}[1][${row_data1}][${column_data1}]
       ${ConvertAPI}=    convert to string    ${test_response_Retention_Table_Data}[2][${row_data1}]
       Page Should Contain Multiple Element  //td[1]//span[contains(text(),'${ConvertAPI}')]
       END


############### HubSpot Marketing Channel Results - Sent Field ############
Verify Hubspot Marketing Channels Results Sent column data with API
    ${response}=   call method     ${CMCconnectionObj}     Campaign_Hubspot_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    run keyword if    '''${response}[1]''' == 'Data Found'    Table Data Sent column DataCheckin Hubspot
    ...    ELSE     Hubspot Marketing channel Results zero
#%%%%%%%
Table Data Sent column DataCheckin Hubspot
    ${response}=   call method     ${CMCconnectionObj}     Campaign_Hubspot_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    FOR    ${row}  IN RANGE  1  ${rows}+1
    HubSpot Name List Table  ${row}  ${response}
    END
#$$$$$$$
HubSpot Sent List Table
       [Arguments]    ${test_row}    ${test_response_Retention_Table_Data}
       set selenium implicit wait    60 seconds
       set selenium timeout    60 seconds
       FOR   ${column}    IN RANGE   1    2
       ${row_data1}=    Evaluate   ${test_row}-${1}
       ${column_data1}=   Evaluate    ${column}-${1}
       ${ConvertAPI}=    convert to string    ${test_response_Retention_Table_Data}[3][${row_data1}]
       Page Should Contain Multiple Element  //td[2]//div[contains(text(),'${ConvertAPI}')]
       END




############### HubSpot Marketing Channel Results - Delivered Field ############
Verify Hubspot Marketing Channels Results Delivered column data with API
    ${response}=   call method     ${CMCconnectionObj}     Campaign_Hubspot_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    run keyword if    '''${response}[1]''' == 'Data Found'    Table Data Delivered column DataCheckin Hubspot
    ...    ELSE     Hubspot Marketing channel Results zero
#%%%%%%%
Table Data Delivered column DataCheckin Hubspot
    ${response}=   call method     ${CMCconnectionObj}     Campaign_Hubspot_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    FOR    ${row}  IN RANGE  1  ${rows}+1
    HubSpot Delivered List Table  ${row}  ${response}
    END
#$$$$$$$
HubSpot Delivered List Table
       [Arguments]    ${test_row}    ${test_response_Retention_Table_Data}
       set selenium implicit wait    60 seconds
       set selenium timeout    60 seconds
       FOR   ${column}    IN RANGE   1    2
       ${row_data1}=    Evaluate   ${test_row}-${1}
       ${column_data1}=   Evaluate    ${column}-${1}
       ${ConvertAPI}=    convert to string    ${test_response_Retention_Table_Data}[4][${row_data1}]
       Page Should Contain Multiple Element  //td[3]//div[contains(text(),'${ConvertAPI}')]
       END

############### HubSpot Marketing Channel Results - Opened Field ############
Verify Hubspot Marketing Channels Results Opened column data with API
    ${response}=   call method     ${CMCconnectionObj}     Campaign_Hubspot_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    run keyword if    '''${response}[1]''' == 'Data Found'    Table Data Opened column DataCheckin Hubspot
    ...    ELSE     Hubspot Marketing channel Results zero
#%%%%%%%
Table Data Opened column DataCheckin Hubspot
    ${response}=   call method     ${CMCconnectionObj}     Campaign_Hubspot_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    FOR    ${row}  IN RANGE  1  ${rows}+1
    HubSpot Opened List Table  ${row}  ${response}
    END
#$$$$$$$
HubSpot Opened List Table
       [Arguments]    ${test_row}    ${test_response_Retention_Table_Data}
       set selenium implicit wait    60 seconds
       set selenium timeout    60 seconds
       FOR   ${column}    IN RANGE   1    2
       ${row_data1}=    Evaluate   ${test_row}-${1}
       ${column_data1}=   Evaluate    ${column}-${1}
       ${ConvertAPI}=    convert to string    ${test_response_Retention_Table_Data}[5][${row_data1}]
       Page Should Contain Multiple Element  //td[4]//div[contains(text(),'${ConvertAPI}')]
       END

############### HubSpot Marketing Channel Results - Processed Field ############
Verify Hubspot Marketing Channels Results Processed column data with API
    ${response}=   call method     ${CMCconnectionObj}     Campaign_Hubspot_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    run keyword if    '''${response}[1]''' == 'Data Found'    Table Data Processed column DataCheckin Hubspot
    ...    ELSE     Hubspot Marketing channel Results zero
#%%%%%%%
Table Data Processed column DataCheckin Hubspot
    ${response}=   call method     ${CMCconnectionObj}     Campaign_Hubspot_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    FOR    ${row}  IN RANGE  1  ${rows}+1
    HubSpot Processed List Table  ${row}  ${response}
    END
#$$$$$$$
HubSpot Processed List Table
       [Arguments]    ${test_row}    ${test_response_Retention_Table_Data}
       set selenium implicit wait    60 seconds
       set selenium timeout    60 seconds
       FOR   ${column}    IN RANGE   1    2
       ${row_data1}=    Evaluate   ${test_row}-${1}
       ${column_data1}=   Evaluate    ${column}-${1}
       ${ConvertAPI}=    convert to string    ${test_response_Retention_Table_Data}[6][${row_data1}]
       Page Should Contain Multiple Element  //td[5]//div[contains(text(),'${ConvertAPI}')]
       END

############### Mailchimp Marketing Channel Results - Name Field ############
Verify Mailchimp Marketing Channels Results Name column data with API
    ${response}=   call method     ${CMCconnectionObj}     Campaign_MailChimp_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    run keyword if    '''${response}[1]''' == 'Data Found'    Table Data Name column DataCheckin Mailchimp
    ...    ELSE     Mailchimp Marketing channel Results zero
#%%%%%%%
Table Data Name column DataCheckin Mailchimp
    ${response}=   call method     ${CMCconnectionObj}     Campaign_MailChimp_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    FOR    ${row}  IN RANGE  1  ${rows}+1
    Mailchimp Name List Table  ${row}  ${response}
    END
#%%%%%%%%
Mailchimp Name List Table
       [Arguments]  ${test_row}  ${test_response_Retention_Table_Data}
       set selenium implicit wait    60 seconds
       set selenium timeout    60 seconds
       FOR   ${column}    IN RANGE   1    2
       ${row_data1}=    Evaluate   ${test_row}-${1}
       ${column_data1}=   Evaluate    ${column}-${1}
       log     ${test_response_Retention_Table_Data}[1][${row_data1}][${column_data1}]
       ${ConvertAPI}=    convert to string    ${test_response_Retention_Table_Data}[2][${row_data1}]
       Page Should Contain Multiple Element  //td[1]//span[contains(text(),'${ConvertAPI}')]
       END

############### Mailchimp Marketing Channel Results - Type Field ############
Verify Mailchimp Marketing Channels Results Type column data with API
    ${response}=   call method     ${CMCconnectionObj}     Campaign_MailChimp_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    run keyword if    '''${response}[1]''' == 'Data Found'    Table Data Type column DataCheckin Mailchimp
    ...    ELSE     Mailchimp Marketing channel Results zero
#%%%%%%%
Table Data Type column DataCheckin Mailchimp
    ${response}=   call method     ${CMCconnectionObj}     Campaign_MailChimp_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    FOR    ${row}  IN RANGE  1  ${rows}+1
    Mailchimp Type List Table  ${row}  ${response}
    END
#%%%%%%%%
Mailchimp Type List Table
       [Arguments]  ${test_row}  ${test_response_Retention_Table_Data}
       set selenium implicit wait    60 seconds
       set selenium timeout    60 seconds
       FOR   ${column}    IN RANGE   1    2
       ${row_data1}=    Evaluate   ${test_row}-${1}
       ${column_data1}=   Evaluate    ${column}-${1}
       log     ${test_response_Retention_Table_Data}[1][${row_data1}][${column_data1}]
       ${ConvertAPI}=    convert to string    ${test_response_Retention_Table_Data}[3][${row_data1}]
       Page Should Contain Multiple Element  //td[2]//div[contains(text(),'${ConvertAPI}')]
       END



############### Mailchimp Marketing Channel Results - Send Date Field ############
Verify Mailchimp Marketing Channels Results Send Date column data with API
    ${response}=   call method     ${CMCconnectionObj}     Campaign_MailChimp_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    run keyword if    '''${response}[1]''' == 'Data Found'    Table Data Send Date column DataCheckin Mailchimp
    ...    ELSE     Mailchimp Marketing channel Results zero
#%%%%%%%
Table Data Send Date column DataCheckin Mailchimp
    ${response}=   call method     ${CMCconnectionObj}     Campaign_MailChimp_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    FOR    ${row}  IN RANGE  1  ${rows}+1
    Mailchimp Send Date List Table  ${row}  ${response}
    END
#%%%%%%%%
Mailchimp Send Date List Table
       [Arguments]  ${test_row}  ${test_response_Retention_Table_Data}
       set selenium implicit wait    60 seconds
       set selenium timeout    60 seconds
       FOR   ${column}    IN RANGE   1    2
       ${row_data1}=    Evaluate   ${test_row}-${1}
       ${column_data1}=   Evaluate    ${column}-${1}
       log     ${test_response_Retention_Table_Data}[1][${row_data1}][${column_data1}]
       ${ConvertAPI}=    convert to string    ${test_response_Retention_Table_Data}[4][${row_data1}]
       Page Should Contain Multiple Element  //td[3]//div[contains(text(),'${ConvertAPI}')]
       END


############### Mailchimp Marketing Channel Results - Emails Sent Field ############
Verify Mailchimp Marketing Channels Results Emails Sent column data with API
    ${response}=   call method     ${CMCconnectionObj}     Campaign_MailChimp_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    run keyword if    '''${response}[1]''' == 'Data Found'    Table Data Emails Sent column DataCheckin Mailchimp
    ...    ELSE     Mailchimp Marketing channel Results zero
#%%%%%%%
Table Data Emails Sent column DataCheckin Mailchimp
    ${response}=   call method     ${CMCconnectionObj}     Campaign_MailChimp_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    FOR    ${row}  IN RANGE  1  ${rows}+1
    Mailchimp Emails Sent List Table  ${row}  ${response}
    END
#%%%%%%%%
Mailchimp Emails Sent List Table
       [Arguments]  ${test_row}  ${test_response_Retention_Table_Data}
       set selenium implicit wait    60 seconds
       set selenium timeout    60 seconds
       FOR   ${column}    IN RANGE   1    2
       ${row_data1}=    Evaluate   ${test_row}-${1}
       ${column_data1}=   Evaluate    ${column}-${1}
       log     ${test_response_Retention_Table_Data}[1][${row_data1}][${column_data1}]
       ${ConvertAPI}=    convert to string    ${test_response_Retention_Table_Data}[5][${row_data1}]
       Page Should Contain Multiple Element  //td[4]//div[contains(text(),'${ConvertAPI}')]
       END


############### Mailchimp Marketing Channel Results - Opened Field ############
Verify Mailchimp Marketing Channels Results Opened column data with API
    ${response}=   call method     ${CMCconnectionObj}     Campaign_MailChimp_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    run keyword if    '''${response}[1]''' == 'Data Found'    Table Data Opened column DataCheckin Mailchimp
    ...    ELSE     Mailchimp Marketing channel Results zero
#%%%%%%%
Table Data Opened column DataCheckin Mailchimp
    ${response}=   call method     ${CMCconnectionObj}     Campaign_MailChimp_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    FOR    ${row}  IN RANGE  1  ${rows}+1
    Mailchimp Opened List Table  ${row}  ${response}
    END
#%%%%%%%%
Mailchimp Opened List Table
       [Arguments]  ${test_row}  ${test_response_Retention_Table_Data}
       set selenium implicit wait    60 seconds
       set selenium timeout    60 seconds
       FOR   ${column}    IN RANGE   1    2
       ${row_data1}=    Evaluate   ${test_row}-${1}
       ${column_data1}=   Evaluate    ${column}-${1}
       log     ${test_response_Retention_Table_Data}[1][${row_data1}][${column_data1}]
       ${ConvertAPI}=    convert to string    ${test_response_Retention_Table_Data}[6][${row_data1}]
       Page Should Contain Multiple Element  //td[5]//div[contains(text(),'${ConvertAPI}')]
       END

############### Mailchimp Marketing Channel Results - Clicked Field ############
Verify Mailchimp Marketing Channels Results Clicked column data with API
    ${response}=   call method     ${CMCconnectionObj}     Campaign_MailChimp_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    run keyword if    '''${response}[1]''' == 'Data Found'    Table Data Clicked column DataCheckin Mailchimp
    ...    ELSE     Mailchimp Marketing channel Results zero
#%%%%%%%
Table Data Clicked column DataCheckin Mailchimp
    ${response}=   call method     ${CMCconnectionObj}     Campaign_MailChimp_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    FOR    ${row}  IN RANGE  1  ${rows}+1
    Mailchimp Clicked List Table  ${row}  ${response}
    END
#%%%%%%%%
Mailchimp Clicked List Table
       [Arguments]  ${test_row}  ${test_response_Retention_Table_Data}
       set selenium implicit wait    60 seconds
       set selenium timeout    60 seconds
       FOR   ${column}    IN RANGE   1    2
       ${row_data1}=    Evaluate   ${test_row}-${1}
       ${column_data1}=   Evaluate    ${column}-${1}
       log     ${test_response_Retention_Table_Data}[1][${row_data1}][${column_data1}]
       ${ConvertAPI}=    convert to string    ${test_response_Retention_Table_Data}[7][${row_data1}]
       Page Should Contain Multiple Element  //td[6]//div[contains(text(),'${ConvertAPI}')]
       END

############### Mailchimp Marketing Channel Results - Bounced Field ############
Verify Mailchimp Marketing Channels Results Bounced column data with API
    ${response}=   call method     ${CMCconnectionObj}     Campaign_MailChimp_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    run keyword if    '''${response}[1]''' == 'Data Found'    Table Data Bounced column DataCheckin Mailchimp
    ...    ELSE     Mailchimp Marketing channel Results zero
#%%%%%%%
Table Data Bounced column DataCheckin Mailchimp
    ${response}=   call method     ${CMCconnectionObj}     Campaign_MailChimp_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    FOR    ${row}  IN RANGE  1  ${rows}+1
    Mailchimp Bounced List Table  ${row}  ${response}
    END
#%%%%%%%%
Mailchimp Bounced List Table
       [Arguments]  ${test_row}  ${test_response_Retention_Table_Data}
       set selenium implicit wait    60 seconds
       set selenium timeout    60 seconds
       FOR   ${column}    IN RANGE   1    2
       ${row_data1}=    Evaluate   ${test_row}-${1}
       ${column_data1}=   Evaluate    ${column}-${1}
       log     ${test_response_Retention_Table_Data}[1][${row_data1}][${column_data1}]
       ${ConvertAPI}=    convert to string    ${test_response_Retention_Table_Data}[8][${row_data1}]
       Page Should Contain Multiple Element  //td[7]//div[contains(text(),'${ConvertAPI}')]
       END


############### Mailchimp Marketing Channel Results - Unsubscribed Field ############
Verify Mailchimp Marketing Channels Results Unsubscribed column data with API
    ${response}=   call method     ${CMCconnectionObj}     Campaign_MailChimp_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    run keyword if    '''${response}[1]''' == 'Data Found'    Table Data Unsubscribed column DataCheckin Mailchimp
    ...    ELSE     Mailchimp Marketing channel Results zero
#%%%%%%%
Table Data Unsubscribed column DataCheckin Mailchimp
    ${response}=   call method     ${CMCconnectionObj}     Campaign_MailChimp_Marketing_Channel_Results
    ${rows}=    get element count    //*[@class='dataTables_wrapper no-footer']//tbody/tr
    FOR    ${row}  IN RANGE  1  ${rows}+1
    Mailchimp Unsubscribed List Table  ${row}  ${response}
    END
#%%%%%%%%
Mailchimp Unsubscribed List Table
       [Arguments]  ${test_row}  ${test_response_Retention_Table_Data}
       set selenium implicit wait    60 seconds
       set selenium timeout    60 seconds
       FOR   ${column}    IN RANGE   1    2
       ${row_data1}=    Evaluate   ${test_row}-${1}
       ${column_data1}=   Evaluate    ${column}-${1}
       log     ${test_response_Retention_Table_Data}[1][${row_data1}][${column_data1}]
       ${ConvertAPI}=    convert to string    ${test_response_Retention_Table_Data}[9][${row_data1}]
       Page Should Contain Multiple Element  //td[7]//div[contains(text(),'${ConvertAPI}')]
       END


Mailchimp Marketing channel Results zero
     log     No data found

Hubspot Marketing channel Results zero
     log     No data found


Dropdown validation
    [Arguments]  ${screenName}
    @{list}=  Create List  1 month  3 months  6 months  12 months
    FOR  ${month}  IN  @{list}
    click element until visible  //*[contains(@class,'arrow-wrapper')]
    click element until visible  //*[contains(@class,'scroll')]//*[text()='${month}']
    sleep  10
    wait until page contains element  //th[contains(text(),'Name')]  60s
    capture the screen  ${screenName}-${month}
    get table data from mc	
    END



Pendo ques icon validation in mailchimp configsetttings
    [Arguments]  ${screenName}  ${pendoelement}  ${text}
    Mouse Over    ${pendoelement}
    wait until page contains multiple text  @{text}
    capture the screen  ${screenName}-pendo
    click element until visible  ${pendo_close}

Verify the toast msg is visible if unReportedChannelExpiredStatus api is 'True' in homescreen
    click element until enabled  ${homebtn}
    sleep  5
    log  CCL-39084-9
    ${status}=  Call Method  ${CMCconnectionObj}  getFacebookChannelExpirdStatus
#    should be equal  ${status}  True
    Run Keyword If  "${status}" == "(200, True)"  Run Keywords
    ...  Navigate to homescreen and verify facebook api expired toast message
    ...  AND  click on 'x' and verify the fb api expired toast message should be closed
    ...  AND  Click on Facebook Config Settings and verify "Regenerate api key" help message
    ...  ELSE  log  channel expired status is not true

    go to marketing channel in campaigns



Navigate to homescreen and verify facebook api expired toast message
    log  CCL-39084-1, CCL-39084-2, CCL-39084-3, CCL-39084-4
    click element until enabled  ${homebtn}
    @{elements}=  create list    ${home_Fb_configSettingsButton}
    wait until page contain elements  @{elements}
    page should contain  ${home_Fb_regenerateApiKeyToastMsg}
    capture the screen  facebookExpiredToast-homeScreen

click on 'x' and verify the fb api expired toast message should be closed
    log  CCL-39084-5, CCL-39084-6
    click element until visible  ${campaigns_MC_closeBtn}
    page should not contain element  ${home_Fb_configSettingsButton}
    page should not contain  ${home_Fb_regenerateApiKeyToastMsg}
    capture the screen  facebookExpiredToastClosed-homeScreen
    To Reload Page

Click on Facebook Config Settings and verify "Regenerate api key" help message
    log  CCL-39084-7, CCL-39084-8
    click element until visible  ${home_Fb_configSettingsButton}
    @{txt}=  create list  ${campaigns_mc_fb_configscreen_headertxt}  ${campaigns_mc_fb_configscreen_apikeyfieldheadertxt}  ${campaigns_mc_fb_configscreen_accountidheadertxt}
    ...  ${campaigns_mc_fb_configscreen_checkboxhelpmsg}
    ...  ${campaigns_mc_fb_configscreen_connectconfigtxt}  ${campaigns_MC_fb_regenerateApiKeyHelpMessage}
    wait until page contains multiple text  @{txt}

    @{elements}=  create list  ${campaigns_mc_mailchimp_configsettingsinstructionstitle}  ${campaigns_mc_fb_configscreen_apikeyfield}  ${campaigns_mc_fb_configscreen_accountidfield}  ${campaigns_mc_fb_configscreen_checkbox}
    ...  ${campaigns_MC_fb_configScreen_checkboxMsgT&C}
    ...  ${campaigns_MC_fb_configScreen_instructionsHere}  ${campaigns_MC_fb_configScreen_instrictionsDev}  ${campaigns_MC_fb_configScreen_calixCommunityLink}
    wait until page contain elements  @{elements}
    capture the screen  regenrateApi-configSettings
    click element until visible  ${campaigns_mc_fb_configscreen_checkbox}
    Click on test connection and verify connection error status
    click element until visible  ${campaigns_MC_closeBtn}

Verify campaigns count in CIQ column
    ${ciqCampaignsCount}=  Call Method  ${CMCconnectionObj}  Marketing_Channel
    element should contain  ${campaigns_MC_ciqMobileMsg_segmentsCount}  ${ciqCampaignsCount}[2]

Verify campaigns count in Mailchimp column
    ${mailchimpCampaignsCount}=  Call Method  ${CMCconnectionObj}  Marketing_Channel
    element should contain  ${campaigns_mc_mailchimp_segmentscount}  ${mailchimpCampaignsCount}[1]

Verify campaigns count in Facebook column
    ${fbCampaignsCount}=  Call Method  ${CMCconnectionObj}  Marketing_Channel
    element should contain  ${campaigns_MC_fb_segmentsCount}  ${fbCampaignsCount}[3]

Verify campaigns count in Hubspot column
    ${hubspotCampaignsCount}=  Call Method  ${CMCconnectionObj}  Marketing_Channel
    element should contain  ${campaigns_MC_hubspot_segmentsCount}  ${hubspotCampaignsCount}[4]

Verify campaigns count in Constant contact column
    ${consContactCampaignsCount}=  Call Method  ${CMCconnectionObj}  Marketing_Channel
    element should contain  ${campaigns_MC_ConstContact_segmentsCount}  ${consContactCampaignsCount}[5]