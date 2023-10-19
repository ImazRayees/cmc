*** Settings ***
Library    SeleniumLibrary
Resource   ../PO/CommonWrapper.robot
Resource   ../PO/ExploreDataPO_subscriber.robot
Resource   ../PO/PageTitleKeywords.robot
Variables  /utils/CMC-API.py


*** Variables ***
${Campaigns}=    id=campaignMarketingSection
${testData_empty}=

${img_file_path}=  /doNotDelete.png

${testData_nameRequiredHelpMsg}=   Campaign Name Required.
${testData_segmentRequiredMsg}=   Segment Required
${testData_startDateRequiredMsg}=   Start Date Required
${testData_endDateRequiredMsg}=   End Date Required
${testData_name}=  CampTst
${testData_segment1}=   //*[text()='seda']
${testData_Date_29}=  //td[6][contains(.,'29')]
${testData_Date_26}=  //td[6][contains(.,'26')]
${testData_todaysDate}=   //td[contains(@class,'p-datepicker-today')]
${testData_highLightedDate}=  //span[contains(@class,'highlight')]


${campaigns_headerTitle}=  //*[@class='subs-title']//*[text()='Campaigns']
${campaigns_statusData}=  //*[@id='DataTables_Table_2']//tbody[1]//tr//td[2]
${campaigns_sideDots}=  (//*[@id='dropdownPeriod'])[2]
${campaigns_editPencilicon}=  (//*[@class='nor-wrap cur-pointer show'])[1]
${campaigns_deleteBtn}=   (//span[@title='Delete'])[1]
${campaigns_viewBtn}=  (//span[@title='View'])[1]
${string_edit}=  Edit
${string_delete}=  Delete
${string_view}=  View
${campaigns_deleteConfirmPOpup}=  id=addModal
${campaigns_deleteConfirmText}=   Are you sure want to delete?
${campaigns_deleteCloseBtn}=   //*[@class="close"]
${campaigns_deleteYesBtn}=  //button[contains(.,'Yes')]
${campaigns_deleteNoBtn}=  //button[contains(.,'No')]
${campaigns_deleteSuccessMsg}=  Campaign Deleted Successfully!
${campaigns_zeroEntries}=  Showing 0 to 0 of 0 entries
${campaigns_marketingChannelBtn}=  //*[text()='Marketing Channels']
${campaigns_searchField}=  css=[placeholder='Search']
${campaigns_searchBtn}=  //*[@class='search-box-icon']
${campaigns_campaignsHeaderTxt}=  Campaigns
${campaigns_typeTxt}=  Type
${campaigns_typeDropdown}=  id=typeId
${campaigns_typeDropdown_acquisation}=  //*[text()='Acquisation']
${campaigns_typeDropdown_acquisation_string}=  Acquisation
${campaigns_typeDropdown_retention}=  //*[text()='Retention']
${campaigns_typeDropdown_retention_string}=  Retention
${campaigns_typeDropdown_upsell}=  //*[text()='Upsell']
${campaigns_typeDropdown_upshell_string}=  Upsell
${campaigns_Dropdown_all}=  //*[text()='All']
${campaigns_statusTxt}=  Status
${campaigns_statusDropdown}=  id=statusId
${campaigns_statusDropdown_complete}=  //*[text()='Complete']
${campaigns_statusDropdown_complete_string}=  Complete
${campaigns_statusDropdown_draft}=  //*[text()='Draft']
${campaigns_statusDropdown_draft_string}=  Draft
${campaigns_statusDropdown-inProgress}=  //*[text()='In-Progress']
${campaigns_statusDropdown-inProgress_string}=  In-Progress
${campaigns_pagination_tableEntriesInfo}=  //*[@class='dataTables_info']
${campaigns_pagination_First}=  //*[text()='First']
${campaigns_pagination_First_disabled}=  //*[@class='paginate_button first disabled']
${campaigns_pagination_Previous}=  //*[text()='Previous']
${campaigns_pagination_Previous_disabled}=  //*[@class='paginate_button previous disabled']
${campaigns_pagination_11to20}=  Showing 11 to 20
${campaigns_pagination_1to10}=  Showing 1 to 10
${campaigns_pagination_41to44}=   Showing 41 to 44
${campaigns_pagination_1}=  //*[text()='1']
${campaigns_pagination_1_string}=  1
${campaigns_pagination_2}=  //*[text()='2']
${campaigns_pagination_2_string}=  2
${campaigns_pagination_lastNum}=  (//*[@class='paginate_button next'])[1]/preceding::a[@class='paginate_button '][1]
${campaigns_pagination_next}=  //*[text()='Next']
${campaigns_pagination_next_disabled}=  //*[@class='paginate_button next disabled']
${campaigns_pagination_last}=   //*[text()='Last']
${campaigns_pagination_last_disabled}=  //*[@class='paginate_button last disabled']
${campaigns_pagination_current}=  //*[@class='paginate_button current']
${campaigns_pagination_all}=   //*[@id='DataTables_Table_1_paginate']//span//a

#Need to delete once done CCL-64901
${campaigns_th_name}=  Name
${campaigns_th_status}=  Status
${campaigns_th_type}=  Type
${campaigns_th_segment}=  Segment
${campaigns_th_audienceSize}=  Audience Size
${campaigns_th_start}=  Start Date
${campaigns_th_end}=  End Date
${campaigns_th_budget}=  Budget
${campaigns_th_channel}=  Channel(s)

${campaigns_close_X}=  //*[contains(@class,'btn-no')]//img
${campaigns_refresh}=  //*[contains(@class,'refreshicon')]
${new_campaign_btn}=    //button[contains(.,'New')]
${saveCampaign}=  //button[contains(.,'Save Campaign')]
${define_Tab}=  //*[@title='Define']
${define_duplicateAlertTxt}=   Error! same campaign name already exists.
${define_campaignUpdateSuccess}=   Campaign Updated Successfully!
${define_dropdownList}=  //*[contains(@class,'host')]//*[contains(@class,'option-label')]
${define_name}=      id=campaign-name
${define_segment}=    id=segmentDropdown
${define_segmentSearchField}=  id=search-focus
${segment_casualUsers}=   //span[contains(.,'Casual users')]
${segment_gamers}=  //span[contains(.,'Gamers')]
${segment_powerUsers}=  //span[contains(.,'Power Users')]
${segment_streamer}=  //span[contains(.,'Streamer')]
${segment_wfhUsers}=  //span[contains(.,'WFH')]
${segment_recmndRandomValue}=
${segment_savedRandomValue}=  //*[@class='dropdown-menu show']//button[3]
${define_regionDropDown}=   id=regionId
${define_regionDropDownArrow}=  //*[@id='regionId']//*[@class='ng-arrow-wrapper']
${define_regionALL}=  //*[@id='regionId']//*[@class='ng-arrow-wrapper']
${define_regionALLIANCE}=  //*[text()='ALLIANCE']
${define_regionASHLANDLAKES}=  //*[text()='ASHLAND LAKES']
${define_regionBRECKENRIDGE}=  //*[text()='BRECKENRIDGE']
${define_regionBRIDGEPORT}=  //*[text()='BRIDGEPORT']
${define_regionEXTENDEDREACH}=  //*[text()='EXTENDED REACH']
${define_regionFORTMORGAN}=  //*[text()='FORT MORGAN']
${define_regionHASTINGS}=  //*[text()='HASTINGS']
${define_regionIMPERIAL}=  //*[text()='IMPERIAL']
${define_regionLINCOLN}=  //*[text()='LINCOLN']
${define_regionNORFOLK}=  //*[text()='NORFOLK']
${define_regionNORTHPLATTE}=  //*[text()='NORTH PLATTE']
${define_regionOGALLALA}=  //*[text()='OGALLALA']
${define_regionPAPILLION}=  //*[text()='PAPILLION']
${define_regionSCOTTSBLUFF&GERING}=  //*[text()='SCOTTSBLUFF & GERING']

${define_locationDropdown}=  id=locationId
${define_locationDropdownArrow}=  //*[@id='locationId']//*[@class='ng-arrow-wrapper']
${define_locationAll}=    //*[@id='locationId']//*[@class='ng-arrow-wrapper']
${define_serviceDropdown}=  id=serviceId
${define_serviceDropdownArrow}=  //*[@id='serviceId']//*[@class='ng-arrow-wrapper']
${define_serviceAll}=    //*[@id='serviceId']//*[@class='ng-arrow-wrapper']
${define_service<20M}=  //*[text()='<20M']
${define_service20M+}=  //*[text()='20M+']
${define_service50M+}=  //*[text()='50M+']
${define_service300M+}=  //*[text()='300M+']
${define_service1G}=  //*[text()='1G']

${define_propensityDropdown}=  id=prpensity
${define_propensityDropdownArrow}=  //*[@id='prpensity']//*[@class='ng-arrow-wrapper']
${define_propensityAll}=  //*[@id='prpensity']//*[@class='ng-arrow-wrapper']
${propensity_high}=  //*[text()='High']
${define_budget}=    id=campaign-budget
${define_conversion_target}=   id=campaign-target
${define_start_date}=  //*[@placeholder='Select Start Date']
${date_31}=    //*[@class='ng-tns-c65-3 p-ripple ng-star-inserted']
${define_end_date}=   //*[@placeholder='Select End Date']


${select_markrting_channel_title}=     //*[@class='greyaa title-second']
${previous_btn_}=   //*[text()=' Previous ']
${next_btn_}=   //button[contains(.,'Next')]
${channel_Tab}=  //*[@title='Channel']
${channel_alert}=   Please select at least one channel.
${channel_alertClose}=  //*[@class='close']//span
${campaigns_channel_channelCheckBox}=   id=headerCheckBox
${channel_count_mobile}=   //*[@value='Mobile Notification']/parent::div/parent::td/parent::tr/td[3]
${campaigns_channel_mobileMsgCheckBox}=   //*[@value='Mobile Notification']
${campaigns_channel_mailchimpCheckbox}=  //*[@value='Mailchimp']
${campaigns_channel_fbCheckbox}=  //*[@value='Facebook']
${campaigns_channel_hubspotCheckbox}=  //*[@value='Hubspot']
${campaigns_channel_constantContactCheckbox}=  //*[@value='ConstantContact']
${campaigns_channel_csvDownloadCheckBox}=   id=csvCheckBox
${campaigns_channel_segmentSize1_mailchimp}=  //*[text()='Mailchimp']/following-sibling::td[1]
${campaigns_channel_segmentSize2_fb}=  //*[text()='Facebook']/following-sibling::td[1]
${campaigns_channel_segmentSize3_mobileNoti}=  //*[text()='Mobile Notification']/following-sibling::td[1]
${campaigns_channel_segmentSize4_hubspot}=  //*[text()='Hubspot']/following-sibling::td[1]
${campaigns_channel_segmentSize5_csv}=  //*[text()='Download CSV']/following-sibling::td[1]
${campaigns_channel4_mailchimp}=  //*[contains(@class,'hover')]//tbody//tr[4]//td[4]
${campaigns_channel1_fb}=  //*[contains(@class,'hover')]//tbody//tr[1]//td[4]
${campaigns_channel3_mobileNoti}=  //*[contains(@class,'hover')]//tbody//tr[3]//td[4]
${campaigns_channel5_csv}=  //*[contains(@class,'hover')]//tbody//tr[5]//td[4]
${campaigns_mailchimpChannelDropdown}=  (//*[@id='dropdownPeriod'])[2]
${campaigns_csvChannelDropdown}=  (//*[@id='dropdownPeriod'])[3]
${campaigns_channelDropdown_allBtn}=  //*[contains(@class,'dropdown-menu ')]//button[contains(.,'All')]
${campaigns_channelDropdown_nonMobMessageBtn}=  //*[contains(@class,'dropdown-menu ')]//button[contains(.,'Non-Mobile Message')]
${campaigns_channel_mailchimpDesc}=  Sync subscriber information to Mailchimp audience list
${campaigns_channel_mobNotiDesc}=  Messages can only be sent to subscribers that have CommandIQ installed
${campaigns_channel_csvDesc}=  Download a CSV file for use with other applications
${campaigns_channel_facebookDesc}=  Sync subscriber information to Facebook custom audience
${campaigns_channel_hubspotDesc}=  Sync subscriber information to Hubspot contacts list
${campaigns_channel_consContactDesc}=  Sync subscriber information to Constant Contact contacts list
${row_xpath}=  //tbody/tr
${column_xpath}=  //tbody/tr[1]/td
${img_file_path}=   \\CalixCloud_logo_marketing.png
${Mobile_Message_Command_IQ}=    Mobile Message - CommandIQ

${mobile_message_imageRequiredHelpMsg}=  Campaign Image Required.
${mobile_message_eventRequiredHelpMsg}=  Event Required.
${mobile_message_thresholdRequiredHelpMsg}=   Threshold Required.
${mobile_message_notificationTimeRequiredHelpMsg}=  Notification Time Required.
${mobile_message_timeZoneRequiredHelpMsg}=   Timezone Required.
${mobile_message_notificationName}=  id=notification-name
${notificationNameRequiredTxt}=  Notification Message Required
${campaignLinkRequiredTxt}=  Campaign Link Required
${campaignImageRequiredTxt}=  Campaign Image Required
${mobile_message_link}=     id=campaign-link
${mobile_message_browse}=     id=file-upload
${mobile_message_shedule}=    id=scheduleId
${mobileMesssage_shcedule_immediate}=  //*[@class='ng-dropdown-panel-items scroll-host']//*[text()='Immediate']
${mobileMesssage_shcedule_immediateHelpmsg}=  Note: This notification will go out immediately when you click the "deploy" button above, even though your campaign start date is 2021-03-31
${mobileMesssage_shcedule_eventDriven}=  //*[@class='ng-dropdown-panel-items scroll-host']//*[text()='Event-Driven']
${mobileMessage_schedule_scheduled}=  //*[@class='ng-dropdown-panel-items scroll-host']//*[text()='Scheduled']
${mobile_message_event}=    id=eventId
${mobiemessage_eventDropdown_CVM}=  //*[text()='Competitor Visit Minutes']
${mobiemessage_eventDropdown_SLH}=  //*[text()='Service Limit Hits']
${mobiemessage_eventDropdown_STM}=  //*[text()='Speed Test Minutes']
${mobile_message_thresh}=   id=campaign-threshold
${mobile_message_notification}=    id=notify_time
${mobile_message_notification_hour}=  //div[contains(@class,'hour-picker')]
${mobile_message_notification_mins}=  //div[contains(@class,'minute-picker')]
${mobile_message_notification_aMpM}=  //div[contains(@class,'ampm-picker')]
${mobile_message_timezone}=   id=timeZoneId
${timeZone_UTC}=  //*[text()='UTC']
${timeZone_America/New_York}=  //*[text()='America/New_York (East Coast)']
${timeZone_America/Chicago}=  //*[text()='America/Chicago (Central)']
${timeZone_America/Denver}=  //*[text()='America/Denver (Mountain)']
${timeZone_America/LA}=  //*[text()='America/Los_Angeles (West Coast)']
${timeZone_clockIcon}=  //*[contains(@class,'clock')]

${insideMobile_commandIcon}=  (//*[@class='mobile-box']//img)[1]
${insideMobile_notificationMessage}=  //*[@class='info-msg']
${mobileNoti_previewImage}=  //*[@class='img-flex-box']//img
${mobileNoti_previewImageInMobile}=  //*[contains(@class,'img-icon-prv')]//img

${eventRequired_helpMsg}=  Event Required
${thresholdRequired_helpMsg}=  Threshold Required
${timezoneRequired_helpMsg}=  Timezone Required
${notificationTimeRequired_helpMsg}=  Notification Time Required

${mailchimp_title}=  1. Mailchimp
${mailchimp_textHelp}=  Casual users will be deployed to Mailchimp when you click "Deploy Campaign."


${mobile_message_title}=      //*[text()='1. CommandIQ Mobile Notification ']
${deploy_Tab}=  //*[@title='Deploy']
${deploy-btn}=   (//button[contains(.,'Deploy')])[2]
${deployPopup}=  //*[@class='modal-content']
${deployPopupHeader}=  Deploy Campaign
${deploy_confirmBtn}=  (//button[contains(.,'Deploy')])[3]
${deploy_cancelBtn}=  //button[contains(.,'Cancel')]
${deployPopup_actionSingleTxt}=  The following action will be executed
${deployPopup_actionsMiltipleTxt}=  The following actions will be executed
${deployPopup_ciqMobileNotTxt}=  Send Command IQ Mobile Notification
${deployPopup_mailChimpTxt}=  Send segment to Mailchimp. This action may take up to 60 minutes
${deployPopup_fbTxt}=  Send segment to Facebook. This action may take up to 60 minutes
${deployPopup_csvTxt}=  Download CSV file
${deployPopup_hubspotTxt}=  Send segment to Hubspot. This action may take up to 60 minutes
${deployPopup_consContactTxt}=  Send segment to Constant Contact. This action may take up to 60 minutes


${mailchimp_headerTxt}=  Mailchimp
${mailchimp_helpTxt}=  will be deployed to Mailchimp when you click "Deploy Campaign".

${fb_headerTxt}=  Facebook
${fb_helpTxt}=  will be deployed to Facebook when you click "Deploy Campaign".

${csv_headertxt}=  CSV Download
${csv_helpTxt}=  CSV file will be downloaded when you click "Deploy Campaign".

${hubspot_headertxt}=  HubSpot
${hubspot_helpTxt}=   will be deployed to Hubspot when you click "Deploy Campaign".

${consContact_headerTxt}=  Constant Contact
${consContact_helpTxt}=  will be deployed to Constant Contact when you click "Deploy Campaign".

${deploy_facebook}=    1.Facebook
${deploy_facebook_text}=    Download this Facebook-formatted file lorem ipsum dolar sit amet
${Generic_CSV}=    2.Generic CSV
${Generic_CSV_text}=   Download this Generic CSV file lorem ipsum dolar sit amet
${download_btn1}=   (//*[text()='Download'])[1]
${download_btn2}=   (//*[text()='Download'])[2]

${results_tab}=  //*[@title='Results']
${results_inProgress}=  //*[contains(text(),'In-Progress')]
${results_segment}=    Segment
${results_segmentContent}=  //span[contains(text(),'Segment')]/following-sibling::h5
${results_segmentSize}=  Segment Size
${results_segmentSizeContent}=  //span[contains(text(),'Audience')]/following-sibling::h5
${results_subscriber}=    SUBSCRIBERS
${results_subscriberContent}=  //span[contains(text(),'SUBSCRIBERS')]/following-sibling::h5
${results_start}=     Start Date
${results_startContent}=  //span[contains(text(),'Start Date')]/following-sibling::h5
${results_end}=    End Date
${results_endContent}=  //span[contains(text(),'End Date')]/following-sibling::h5
${results_conversion_target}=    Conversion Rate
${results_conversion_targetContent}=  //span[contains(text(),'Conversion Rate')]/following-sibling::h5
${results_budget}=  Budget
${results_budgetContent}=  //span[contains(text(),'Budget')]/following-sibling::h5
${results_mobileNoti}=  //*[contains(@class,'mobile_cont title')]//*[contains(text(),'CommandIQ Mobile Notification')]
${results_mobileNotiSubTitles_schedule}=  (//*[@class='box_cont'])[7]//*[contains(text(),'Schedule')]
${results_mobileNotiSubTitles_segmentMembers}=  (//*[@class='box_cont'])[8]//*[contains(text(),'Segment Members Included')]
${results_mobileNotiSubTitles_notificationsSent}=   (//*[@class='box_cont'])[9]//*[contains(text(),'Notifications Sent')]
${results_mobileNotification}=  Mobile Notification
${results_hubspot}=  HubSpot
${results_mailChimp}=  Mailchimp
${results_facebook}=  Facebook
${results_constantContact}=  ConstantContact

${results_xaxis_mobileNotification}=  Mobile Notification
${results_xaxis_hubspot}=  Hubspot
${results_xaxis_mailChimp}=  Mailchimp
${results_xaxis_facebook}=  Facebook
${results_xaxis_constantContact}=  ConstantContact

${results_mobileNotiDeploymentStatus}=  (//*[@class='box_cont'])[10]//*[contains(text(),'Deployment Status')]/following-sibling::*
${mobileNoti_deployError}=  (//*[@class='box_cont'])[10]//*[contains(text(),'Deployment Status')]/following-sibling::div//label[contains(text(),'Error')]
${results_mobileNoti_redeployBtn}=  (//*[@class='box_cont'])[10]//*[contains(text(),'Deployment Status')]/following-sibling::div//button[contains(.,'Re-Deploy')]
${results_mobileNoti_redeployErrorElement}=  (//*[@class='box_cont'])[10]//*[contains(@class,'error-summary')]
${results_mobileNoti_redeployPopupTitle}=  Re-Deploy CommandIQ Mobile Notification
${results_mobileNoti_redeployPopup_Descrption}=  Re-Deploy CommandIQ Mobile Notification.
${results_mobileNoti_review_Title}=  //*[contains(text(),'Review CommandIQ Mobile Notification')]
${results_mobileNoti_review_notiMsgLabel}=  //label[contains(text(),'Notification Message')]
${results_mobileNoti_review_notiMsgField}=  id=notification-name
${results_mobileNoti_review_linkLabel}=  //label[contains(text(),'Link')]
${results_mobileNoti_review_linkField}=  id=campaign-link
${results_mobileNoti_review_imageLabel}=  //label[contains(text(),'Image')]
${results_mobileNoti_review_browse}=  //*[@type='file']
${results_mobileNoti_review_scheduleLabel}=  //label[contains(text(),'Schedule')]
${results_mobileNoti_review_notiDateTimeLabel}=  //label[contains(text(),'Notification Date and Time')]
${results_mobileNoti_review_eventLabel}=  //label[contains(text(),'Event')]
${results_mobileNoti_review_thresholdLabel}=  //label[contains(text(),'Threshold')]
${results_mobileNoti_review_timezoneLabel}=  //label[contains(text(),'Timezone')]
${results_mobileNoti_review_notiTimeLabel}=  //label[contains(text(),'Notification Time')]
${results_mobileNoti_review_reDeployBtn}=  id=submitReviewCiq
${results_mobileNoti_review_reDeployCancel}=  id=cancelReviewCiq

${results_mailChimpDeploymentStatus}=  //*[@class='title_with_bar']//*[contains(text(),'Mailchimp')]/following-sibling::div//*[normalize-space()='Deployment Status']/following-sibling::*
${mailchimp_deployError}=    //*[@class='title_with_bar']//*[contains(text(),’Mailchimp’)]/following-sibling::div//*//*[contains(text(),'Error')]
${results_mailchimp_redeployBtn}=  //*[@class='title_with_bar']//*[contains(text(),'Mailchimp')]/following-sibling::div//*//*[contains(text(),'Re-Deploy')]
${results_mailchimp_deploymentErrorMsgElement}=   //*[@class='title_with_bar']//*[contains(text(),'Mailchimp')]/following-sibling::div//*[contains(@class,'error-summary')]
${results_mailchimp_redeployPopupTitle}=  Re-Deploy Mailchimp
${results_mailchimp_redeployPopup_Descrption}=  Send segment to Mailchimp. This action may take up to 60 minutes.


${results_facebookDeploymentStatus}=  //*[@class='title_with_bar']//*[contains(text(),'Facebook')]/following-sibling::div//*[normalize-space()='Deployment Status']/following-sibling::*
${facebook_deployError}=  //*[@class='title_with_bar']//*[contains(text(),’Facebook’)]/following-sibling::div//*//*[contains(text(),'Error')]
${results_facebook_redeployBtn}=  //*[@class='title_with_bar']//*[contains(text(),'Facebook')]/following-sibling::div//*//*[contains(text(),'Re-Deploy')]
${results_facebook_deploymentErrorMsgElement}=   //*[@class='title_with_bar']//*[contains(text(),'Facebook')]/following-sibling::div//*[contains(@class,'error-summary')]
${results_facebook_redeployPopupTitle}=  Re-Deploy Facebook
${results_facebook_redeployPopup_Descrption}=  Send segment to Facebook. This action may take up to 60 minutes.

${results_hubspotDeploymentStatus}=  //*[@class='title_with_bar']//*[contains(text(),'HubSpot')]/following-sibling::div//*[normalize-space()='Deployment Status']/following-sibling::*
${hubspot_deployError}=  //*[@class='title_with_bar']//*[contains(text(),'HubSpot')]/following-sibling::div//*//*[contains(text(),'Error')]
${results_hubspot_redeployBtn}=  //*[@class='title_with_bar']//*[contains(text(),'HubSpot')]/following-sibling::div//*//*[contains(text(),'Re-Deploy')]
${results_hubspot_deploymentErrorMsgElement}=  //*[@class='title_with_bar']//*[contains(text(),'HubSpot')]/following-sibling::div//*[contains(@class,'error-summary')]
${results_hubspot_redeployPopupTitle}=  Re-Deploy HubSpot
${results_hubspot_redeployPopup_Descrption}=  Send segment to Hubspot. This action may take up to 60 minutes.


${results_consContactDeploymentStatus}=  //*[@class='title_with_bar']//*[contains(text(),'Constant Contact')]/following-sibling::div//*[normalize-space()='Deployment Status']/following-sibling::*
${consCont_deployError}=  //*[@class='title_with_bar']//*[contains(text(),'Constant Contact')]/following-sibling::div//*//*[contains(text(),'Error')]
${results_consContact_redeployBtn}=  //*[@class='title_with_bar']//*[contains(text(),'Constant Contact')]/following-sibling::div//*//*[contains(text(),'Re-Deploy')]
${results_consContact_deploymentErrorMsgElement}=  //*[@class='title_with_bar']//*[contains(text(),'Constant Contact')]/following-sibling::div//*[contains(@class,'error-summary')]
${results_consContact_redeployPopupTitle}=  Re-Deploy Constant Contact
${results_consContact_redeployPopup_Descrption}=  Send segment to Constant Contact. This action may take up to 60 minutes.

${results_redeploy_popupRedeployBtn}=  //*[@class='modal-body']//button[contains(.,'Re-Deploy')]
${results_redeploy_popupCancelBtn}=  //*[contains(@class,'modal-')]//button[contains(.,'Cancel')]
${results_redeploy_popupCloseBtn}=  //*[contains(@class,'modal-')]//*[@class='close']//span

${results_segmentDistByChannel}=  Audience Distribution
${results_segmentsDistSubTitle}=  Audience Members Included in Selected Channels
${results_csvDownLoadBtn}=  //button[contains(.,'CSV')]
${results_segmentsDownloadBtn}=  id=Campaign-Segmentchannel-Download
${results_segmentsExpand}=  id=Campaign-Segmentchannel-ExpandSection
${results_segments_pendoHelpTxt}=  This chart shows the number of segment members included in each marketing channel
${results_fullView_segmentsDownload}=  id=ChannelAppDownloadSection
${results_fullView_segmentsClose}=  id=Campaign-Channel-AppExpandSection
${results_segmentWidget_barXpath}=  //*[@id='subscriber-tier-home-chart']//*[@class='highcharts-point highcharts-color-0']
${results_segmentWidget_tooltip}=  //*[@id='subscriber-tier-home-chart']//*[@class='highcharts-label highcharts-tooltip highcharts-color-0']//*[5]
${results_segmentDist_xAxisLabels}=  //*[@id='subscriber-tier-home-chart']//*[contains(@class,'xaxis-labels')]//*
${results_segmentWidget_xAxisLabel_mailchimp}=  //*[@id='subscriber-tier-home-chart']//*[contains(text(),'Mailchimp')]
${results_segmentWidget_xAxisLabel_mobileNoti}=  //*[@id='subscriber-tier-home-chart']//*[contains(text(),'Mobile Notification')]
${results_segmentWidget_xAxisLabel_facebook}=  //*[@id='subscriber-tier-home-chart']//*[contains(text(),'Facebook')]
${results_segmentWidget_xAxisLabel_Hubspot}=  //*[@id='subscriber-tier-home-chart']//*[contains(text(),'Hubspot')]
${results_segmentWidget_xAxisLabel_Constant}=  //*[@id='subscriber-tier-home-chart']//*[contains(text(),'ConstantContact')]
${results_segmentWidget_fullview_dloadBtn}=  id=ChannelAppDownloadSection
${results_segmentWidget_fullview_closeBtn}=  id=Campaign-Channel-AppExpandSection
${results_segmentWidget_fullview_barXpath}=  //*[@id='subscriber-home-chart']//*[@class='highcharts-point highcharts-color-0']
${results_segmentWidget_fullview_tooltip}=  //*[@id='subscriber-home-chart']//*[@class='highcharts-label highcharts-tooltip highcharts-color-0']//*[5]
${results_segmentWidget_fullview_xAxisLabel_mobileNoti}=  //*[@id='subscriber-home-chart']//*[contains(text(),'Mobile Notification')]
${results_segmentWidget_fullview_xAxisLabel_mailchimp}=  //*[@id='subscriber-home-chart']//*[contains(text(),'Mailchimp')]
${results_campPerformance}=  Campaign Performance
${results_totalRevenuetab}=  id=subscribeData-list-menu

${results_Revenuetab}=  id=subscribeData-list-menu
${results_segmentRevenueHeaderTxt}=  Segment Revenue
${results_segmentRevenue_dLoadBtn}=  (//*[@id='CMCsegmentchannelDownload'])[1]
${results_segmentRevenue_expandBtn}=  (//*[@id='CMCsegmentchannelExpandSection'])[1]
${results_segmentRevenue_subTitle}=  (//*[contains(text(),'Campaign Segment Revenue')])[1]/following-sibling::*
${results_segmentRevenue_lgndBtn}=  (//*[contains(text(),'Campaign Segment Revenue')])[2]
${results_segmentRevenue_lgndNotOpted}=  (//*[@id='revenue-home-chart']//*[normalize-space()='Campaign Segment Revenue - Not Opted Out'])[2]
${results_segmentRevenue_fullview_subTitle}=  Campaign Segment Revenue
${results_segmentRevenue_fullview_dLoadBtn}=  (//*[@id='Campaign-Segmentchannel-Download'])[2]
${results_segmentRevenue_fullview_closeBtn}=  (//*[@id='Campaign-Segmentchannel-ExpandSection'])[2]
${results_segmentRevenue_csvOnly_fullview_dLoadBtn}=  (//*[@id='Campaign-Segmentchannel-Download'])[1]
${results_segmentRevenue_csvOnly_fullview_closeBtn}=  (//*[@id='Campaign-Segmentchannel-ExpandSection'])[1]
${results_segmentRevenue_fullview_lgndBtn}=  (//*[contains(text(),'Campaign Segment Revenue')])[4]
${results_segmentRevenue_csvOnly_fullview_lgndBtn}=  (//*[contains(text(),'Campaign Segment Revenue')])[4]
${results_totalRevenueTxt}=  Total Revenue
${results_totalRevenue_subTitle}=  (//*[contains(text(),'Total Business Revenue')])[1]/following-sibling::*
${results_totalRevenue_PendoHelpTxt}=  Total revenue for the business. It is the sum of the current fee from the billing file.
${results_campPeriod}=  //*[text()='- Campaign Period']
${results_prePostCampPeriod}=  //*[text()='.. Pre/Post Campaign Period']
${results_totalRev/SubsContent}=  (//div[contains(@class,'rev')])[2]
${results_totalRevenue_expandBtn}=  (//*[@id='CMCsegmentchannelExpandSection'])[2]
${results_totalRevenue_dloadBtn}=  (//*[@id='CMCsegmentchannelDownload'])[2]
${results_totalRevLB}=  (//*[text()='Total Revenue'])[1]
${results_maxRevLb}=  (//*[text()='Revenue'])
${results_totalRevenue_fullview_dloadBtn}=  id=segmentchannelDownloadrev
${results_totalRevenue_fullview_closeBtn}=  id=segmentchannelExpandSectionrev
${results_totalRevenue_fullview_totalRevLb}=  (//*[contains(@class,'legend-item')])[3]
${results_totalRevenue_fullview_maxRevLb}=  (//*[contains(@class,'legend-item')])[4]

${results_SubscribersTab}=  id=serviceData-list-menu
${results_monthsDropdown}=  //*[contains(@id,'typeId')]//*[contains(@class,'arrow-wrapper')]

${results_segmentSubsTxt}=  Campaign Subscribers
${results_segmentSubs_subtitle}=  (//*[contains(text(),'Total Segment Subscribers')])[1]/following-sibling::h3
${results_segmentSubs_dloadBtn}=  id=segmentsubchannelDownloadss
${results_segmentSubs_expandBtn}=  id=segmentsubchannelExpandSections2
${results_segmentSubs_fullview_dloadBtn}=  id=segmentchannelDownloadsub1
${results_segmentSubs_fullview_closeBtn}=  id=segmentchannelExpandSectionsub1
${results_segmentSubs_fullvew_totalSubsLb}=  (//*[contains(@class,'legend-item')])[2]
${results_segmentSubsLB}=  (//*[@class='cco-secondary-title']//*[normalize-space()='Segment Subscribers'])[1]

${results_totalSubsTxt}=  Total Subscribers
${results_totalSubs_subtitle}=  (//*[contains(text(),'Total Subscribers')])[2]/following-sibling::h3
${results_totalSubs_expandBtn}=  id=segmentchannelExpandSections2
${results_totalSubs_dloadBtn}=  id=segmentchannelDownloadss
${results_totalSubsContent}=  (//div[contains(@class,'rev')])[3]
${results_totalSubsLB}=  (//*[@class='cco-secondary-title']//*[normalize-space()='Total Subscribers'])[1]
${results_totalSubs_fullview_dloadBtn}=  id=segmentchannelDownloadsub
${results_totalSubs_fullview_closeBtn}=  id=segmentchannelExpandSectionsub
${results_totalSubs_fullvew_totalSubsLb}=  (//*[contains(@class,'legend-item')])[2]
${results_tablecontentPath}=  (//*[@class='d-block'])[2]

${results_segmentSubsTxt}=  Campaign Subscribers

${summary_link}=   id=tab-link-summary
${map_link}=    id=tab-link-map
${dataset_link}=   id=tab-link-dataset

${Results_campPerf_Title}=  Campaign Performance
${Results_RevTab}=  //*[@id='subscribeData-list-menu']//a[contains(text(),'Revenue')]
${Results_RevTab_SegRev_Title}=  //*[contains(@class,'title_')]/*[normalize-space()='Segment Revenue']
${Results_RevTab_SegRev_subTitle}=  (//*[contains(text(),'Campaign Segment Revenue')])[1]/following-sibling::*
${Results_RevTab_SegRev_dLoadBtn}=  (//*[@id='CMCsegmentchannelDownload'])[1]
${Results_RevTab_SegRev_expandBtn}=  (//*[@id='CMCsegmentchannelExpandSection'])[1]
${Results_RevTab_SegRev_yaxisTitle}=  //*[@id='revenue-home-chart']//*[contains(text(),'Revenue ($)')]
${Results_RevTab_SegRev_legend1}=  (//*[contains(@class,'legend-item')]//*[normalize-space()='Campaign Segment Revenue'])[1]
${Results_RevTab_SegRev_legend2}=  (//*[contains(@class,'legend-item')]//*[normalize-space()='Campaign Segment Revenue - Not Opted Out'])[1]
${Results_RevTab_SegRev_expanded_Title}=  //*[contains(@class,'secondary-title')]/*[normalize-space()='Segment Revenue']
${Results_RevTab_SegRev_expanded_subTitle}=  (//*[contains(@class,'mwc-content')])[3]//*[contains(text(),'Campaign Segment Revenue')]/following-sibling::h3
${Results_RevTab_SegRev_expanded_dLoadBtn}=  (//*[@id='Campaign-Segmentchannel-Download'])[2]
${Results_RevTab_SegRev_expanded_closeBtn}=  (//*[@id='Campaign-Segmentchannel-ExpandSection'])[2]
${Results_RevTab_SegRev_expanded_yaxisTitle}=  //*[@id='revenue-home-chart-ex']//*[contains(text(),'Revenue ($)')]
${Results_RevTab_SegRev_expanded_legend1}=  (//*[contains(@class,'legend-item')]//*[normalize-space()='Campaign Segment Revenue'])[2]
${Results_RevTab_SegRev_expanded_legend2}=  (//*[contains(@class,'legend-item')]//*[normalize-space()='Campaign Segment Revenue - Not Opted Out'])[2]

${Results_RevTab_TotlRev_Title}=  //*[contains(@class,'title_')]//*[normalize-space()='Total Revenue']
${Results_RevTab_TotlRev_subTitle}=  (//*[contains(text(),'Total Business Revenue')])[1]/following-sibling::*
${Results_RevTab_TotlRev_dLoadBtn}=  (//*[@id='CMCsegmentchannelDownload'])[2]
${Results_RevTab_TotlRev_expandBtn}=  (//*[@id='CMCsegmentchannelExpandSection'])[2]
${Results_RevTab_TotlRev_yaxisTitle}=  //*[@id='subscribe-home-chart']//*[contains(text(),'Revenue ($)')]
${Results_RevTab_TotlRev_legend1}=  (//*[contains(@class,'legend-item')]//*[normalize-space()='Total Revenue'])[1]
${Results_RevTab_TotlRev_legend2}=  (//*[contains(@class,'legend-item')]//*[normalize-space()='Max Potential Revenue'])[1]
${Results_RevTab_TotlRev_expanded_Title}=  //*[contains(@class,'secondary-title')]//*[normalize-space()='Total Revenue']
${Results_RevTab_TotlRev_expanded_subTitle}=  (//*[contains(@class,'mwc-content')])[4]//*[contains(text(),'Total Business Revenue')]/following-sibling::*
${Results_RevTab_TotlRev_expanded_dLoadBtn}=  id=segmentchannelDownloadrev
${Results_RevTab_TotlRev_expanded_closeBtn}=  id=segmentchannelExpandSectionrev
${Results_RevTab_TotlRev_expanded_yaxisTitle}=  //*[@id='subscribe-home-chart-ex']//*[contains(text(),'Revenue ($)')]
${Results_RevTab_TotlRev_expanded_legend1}=  (//*[contains(@class,'legend-item')]//*[normalize-space()='Total Revenue'])[2]
${Results_RevTab_TotlRev_expanded_legend2}=  (//*[contains(@class,'legend-item')]//*[normalize-space()='Max Potential Revenue'])[2]


${Results_SubsTab}=  //*[@id='serviceData-list-menu']//a[contains(text(),'Subscribers')]
${Results_SubsTab_SegSubs_Title}=  (//*[contains(@class,'title')]/*[normalize-space()='Segment Subscribers'])[1]
${Results_SubsTab_SegSubs_subTitle}=  (//*[contains(text(),'Total Segment Subscribers')])[1]/following-sibling::*
${Results_SubsTab_SegSubs_dLoadBtn}=  id=segmentsubchannelDownloadss
${Results_SubsTab_SegSubs_expandBtn}=  id=segmentsubchannelExpandSections2
${Results_SubsTab_SegSubs_yaxisTitle}=  (//*[@id='subscriber-total-chart']//*[contains(text(),'Subscribers')])[1]
${Results_SubsTab_SegSubs_legend1}=  (//*[contains(@class,'legend-item')]//*[normalize-space()='Segment Subscribers'])[1]
${Results_SubsTab_SegSubs_expanded_Title}=  (//*[contains(@class,'title')]/*[normalize-space()='Segment Subscribers'])[2]
${Results_SubsTab_SegSubs_expanded_subTitle}=  (//*[contains(@class,'mwc-content')])[4]//*[contains(text(),'Total Segment Subscribers')]/following-sibling::h3
${Results_SubsTab_SegSubs_expanded_dLoadBtn}=  id=segmentchannelDownloadsub1
${Results_SubsTab_SegSubs_expanded_closeBtn}=  id=segmentchannelExpandSectionsub1
${Results_SubsTab_SegSubs_expanded_yaxisTitle}=  (//*[@id='subscriber-total-chart-ex']//*[contains(text(),'Subscribers')])[1]
${Results_SubsTab_SegSubs_expanded_legend1}=  (//*[contains(@class,'legend-item')]//*[normalize-space()='Segment Subscribers'])[2]

${Results_SubsTab_TotlSubs_Title}=  (//*[contains(@class,'title')]/*[normalize-space()='Total Subscribers'])[1]
${Results_SubsTab_TotlSubs_subTitle}=  (//*[contains(text(),'Total Subscribers')])[2]/following-sibling::*
${Results_SubsTab_TotlSubs_dLoadBtn}=  id=segmentchannelDownloadss
${Results_SubsTab_TotlSubs_expandBtn}=  id=segmentchannelExpandSections2
${Results_SubsTab_TotlSubs_yaxisTitle}=  (//*[@id='subscribe-total-chart']//*[contains(text(),'Subscribers')])[1]
${Results_SubsTab_TotlSubs_legend1}=  (//*[contains(@class,'legend-item')]//*[normalize-space()='Total Subscribers'])[1]
${Results_SubsTab_TotlSubs_expanded_Title}=  (//*[contains(@class,'title')]/*[normalize-space()='Total Subscribers'])[2]
${Results_SubsTab_TotlSubs_expanded_subTitle}=  (//*[contains(@class,'mwc-content')])[3]//*[contains(text(),'Total Subscribers')]/following-sibling::h3
${Results_SubsTab_TotlSubs_expanded_dLoadBtn}=  //*[@id='segmentchannelDownloadsub']
${Results_SubsTab_TotlSubs_expanded_closeBtn}=  //*[@id='segmentchannelExpandSectionsub']
${Results_SubsTab_TotlSubs_expanded_yaxisTitle}=  (//*[@id='subscribe-total-chart-ex']//*[contains(text(),'Subscribers')])[1]
${Results_SubsTab_TotlSubs_expanded_legend1}=  (//*[contains(@class,'legend-item')]//*[normalize-space()='Total Subscribers'])[2]
${dropdown_names}=  //*[contains(@class,'ng-option-label')]
@{listof_types}=  All  Acquisition  Retention  Upload  Upsell
@{listof_status}=  All  Complete  Draft  In-Progress

${Campaigns_ECB}=  //*[contains(text(),'Electronic Content Builder')]
${Campaigns_ECB_link}=  //*[contains(text(),'Electronic Content Builder')]//*[@src='../../../assets/img/arrow-up-right-from-square.svg']
${ECB_redirecttoNew_campbtn}=  //*[@src='../../../assets/img/arrow-up-right-from-square.svg']/parent::span/parent::button/following-sibling::button
${Campaigns_ECB_name}=   Electronic Content Builder
${Home_marketing}=  id=homeMarketingSection
${Campaigns_pagetitle}=   Scheduled Campaigns-Marketing-Calix Cloud
${CreateCampaigns_pagetitle}=   New Campaign-Marketing-Calix Cloud
${FB_available_check}=   id=deploy-facebook
${FB_ECB_link}=  //*[@id='deploy-facebook']/parent::div/parent::div/button[text()='Electronic Content Builder ']
${MC_available_check}=   id=deploy-mailchimp
${MC_ECB_link}=  //*[@id='deploy-mailchimp']/parent::div/parent::div/button[text()='Electronic Content Builder ']
${HS_available_check}=   id=deploy-hubspot
${HS_ECB_link}=  //*[@id='deploy-hubspot']/parent::div/parent::div/button[text()='Electronic Content Builder ']
${CC_available_check}=   id=deploy-constant-contact
${CC_ECB_link}=  //*[@id='deploy-constant-contact']/parent::div/parent::div/button[text()='Electronic Content Builder ']


*** Keywords ***
Naviagate to Campaigns Tab
    [Documentation]   Navigate to the Campaign page
    click element until visible    ${Campaigns}

verify elements on campaigns screen
    [Documentation]   CCL-63901_02,CCL-63901_03,CCL-68673_02 - Verify the Campaigns Landing page, CCL-52239
    sleep  5s
    capture page screenshot   Scheduled Table
    @{multi_txt}=  Create List  ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_name]   ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_status]   ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_type]
    ...  ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_segment]  ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_audienceSize]   ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_channel]
    ...  ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_start]   ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_end]   ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_budget]   ${EMPTY}
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']}[Campaign_sub_th]   @{multi_txt}
    @{elements}=  Create List  ${new_campaign_btn}  ${campaigns_marketingchannelbtn}  ${campaigns_searchfield}  ${campaigns_typedropdown}  ${campaigns_statusdropdown}
    ...  ${campaigns_pagination_tableentriesinfo}  ${campaigns_pagination_previous_disabled}  ${campaigns_pagination_first_disabled}  ${campaigns_pagination_1}
    ...  ${campaigns_pagination_2}  ${campaigns_pagination_next}  ${campaigns_pagination_last}   ${Campaigns_ECB}   ${Campaigns_ECB_link}   ${ECB_redirecttoNew_campbtn}
    Wait Until Page Contain Elements  @{elements}
    @{List}=  Create List  ${test_data_config['env']['Campaigns']}[Sched_campaign]  ${test_data_config['env']['Campaigns']}[Trigg_campaign]  ${test_data_config['env']['Campaigns']}[Market_channel]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']}[Campaign_sub_tabs]   @{List}
    Capture the Screen  campaignsTableScreen

Verify the Electronic Content Builder in Campaigns
    [Documentation]   CCL-52239_04,CCL-52239_05,CCL-52239_06,CCL-54332 Verify the Electronic Content Builder in Campaigns
    @{elements}=  Create List   ${Campaigns_ECB_link}   ${Campaigns_ECB}   ${ECB_redirecttoNew_campbtn}
    Wait Until Page Contain Elements  @{elements}
    capture the screen   ECB-Home
    click element until visible    ${Campaigns_ECB}
    sleep  5s
    Switch window   ${ECB_pagetitle}
    ${current_URL}=   get location
    Should be equal   ${current_URL}   ${ECB_redirectURL}
    capture the screen   ECB redirect login
    @{CC_elements}=   Create List    ${CC_username}    ${CC_password}   ${CC_loginbtn}
    wait until page contain elements  @{CC_elements}
    Switch window   ${Campaigns_pagetitle}
    verify elements on campaigns screen

click on delete icon and validate popup is showing
    [Documentation]   Click the delete icon to validate the Popup
    click element until visible   ${Home_marketing}
    click element until visible  ${campaigns}
    sleep  20
    filter drafted campaigns
    click element until visible  ${campaigns_deletebtn}
    @{elements}=  Create List  ${campaigns_deleteconfirmpopup}  ${campaigns_deleteclosebtn}  ${campaigns_deleteyesbtn}  ${campaigns_deletenobtn}
    Wait Until Page Contain Elements  @{elements}


click on delete icon and validate buttons in popup
    log  Campaigns_03
    click element until visible  ${campaigns_deleteclosebtn}
    page should contain the element  ${campaigns_campaignsheadertxt}
    click element until visible  ${campaigns_deletebtn}
    click element until visible  ${campaigns_deletenobtn}
    page should contain the element  ${campaigns_campaignsheadertxt}
    click element until visible  ${campaigns_deletebtn}
    click element until visible  ${campaigns_deleteyesbtn}
    sleep  10
    page should not contain  Completed

mouse over and verify titles for icons in campaigns list
    log   Campaigns_04
    get value from title attribute and compare  ${campaigns_editpencilicon}  ${string_edit}
    get value from title attribute and compare  ${campaigns_deletebtn}  ${string_delete}
    filter completed campaigns
    log  CCL-40343
    page should not contain element  ${campaigns_viewbtn}
#    get value from title attribute and compare  ${campaigns_viewbtn}  ${string_view}


verify campaigns in progress should not contain edit option
    log  Campaigns_05
    filter in progress campaigns
    page should not contain element  ${campaigns_editpencilicon}

validating paginations and capturing data
    ${count}=  get element count  ${row_xpath}
    Run Keyword if  ${count} >= 10   validate pagination
    ...   ELSE  entries less than 10
    FOR


#keyword
validate pagination
     @{Tablelist}=    Create List
     ${columns}=    get element count  ${row_xpath}
     FOR    ${row}  IN RANGE  1  ${columns}+1
     ${data_table}=    Handle Table Data pagination   ${row}     ${column_xpath}
     append to list    ${Tablelist}     ${data_table}
     END


Handle Table Data pagination
       [Arguments]    ${test_row}    ${column_xpath}
       @{Tablelist}=    Create List
       ${columns}=    get element count  ${column_xpath}
       FOR   ${column}    IN RANGE   1    ${columns}
       ${data_table}    get text   xpath=//tbody/tr[${test_row}]/td[${column}]
       log to console    ${data_table}
       END



#keyword#
entries less than 10
    log to console  entries are less than 10


validation of TYPE dropdown in campaigns screen
    [Documentation]    Validate the TYPE dropdown in campaigns screen
    [Arguments]  ${testName}  ${ddValue}
    set selenium implicit wait   10
    click element until visible  ${campaigns_typedropdown}
    ${Types_dropdown}=   Create List
    @{elements}=   Get WebElements   ${dropdown_names}
    FOR  ${element}  IN  @{elements}
    ${text}=  get text   ${element}
    Append to list  ${Types_dropdown}  ${text}
    log   ${Types_dropdown}
    END
    log   ${Types_dropdown}
    log   ${listof_types}
    should be Equal  ${Types_dropdown}   ${listof_types}
    capture the screen   TYPE dropdown
    click element until visible  //*[contains(@class,'scroll')]//*[text()='${ddValue}']
    sleep  2
    ${count}=  get element count  //tbody//tr//td[3]
    FOR  ${num}  IN RANGE  ${count}
    ${text}=  get the text from the element  //tbody//tr//td[3]
    should be equal as strings  ${text}  ${ddValue}
    END
    capture the screen  ${ddValue}

validation of STATUS dropdown in campaigns screen
    [Documentation]    Validate the STATUS dropdown in campaigns screen
    [Arguments]  ${testName}  ${ddValue}
    set selenium implicit wait   20
    click element until visible  ${campaigns_statusdropdown}
    ${Status_dropdown}=   Create List
    @{elements}=   Get WebElements   ${dropdown_names}
    FOR  ${element}  IN  @{elements}
    ${text}=  get text   ${element}
    Append to list  ${Status_dropdown}  ${text}
    log   ${Status_dropdown}
    END
    log   ${Status_dropdown}
    log   ${listof_status}
    should be Equal  ${Status_dropdown}   ${listof_status}
    capture the screen   STATUS dropdown
    click element until visible  //*[contains(@class,'scroll')]//*[text()='${ddValue}']
    sleep  2
    ${count}=  get element count  //tbody//tr//td[2]
    FOR  ${num}  IN RANGE  ${count}
    ${text}=  get the text from the element  //tbody//tr//td[2]
    should be equal as strings  ${text}  ${ddValue}
    END
    capture the screen  ${ddValue}


Validation of both Type and Status dropdown combinations
    [Documentation]   CCL-68925 - Type and Status dropdown combinations
    [Arguments]  ${testname}  ${typeddValue}  ${statusddValue}
    click element until visible  ${campaigns_typedropdown}
    click element until visible  //*[contains(@class,'scroll')]//*[text()='${typeddValue}']
    click element until visible  ${campaigns_statusdropdown}
    click element until visible  //*[contains(@class,'scroll')]//*[text()='${statusddValue}']
    sleep  2
    ${count}=  get element count  //tbody//tr//td[3]
    FOR  ${num}  IN RANGE  ${count}
    ${text}=  get the text from the element  //tbody//tr//td[3]
    should be equal as strings  ${text}  ${typeddValue}
    END

    ${count}=  get element count  //tbody//tr//td[2]
    FOR  ${num}  IN RANGE  ${count}
    ${text}=  get the text from the element  //tbody//tr//td[2]
    should be equal as strings  ${text}  ${statusddValue}
    END
    capture the screen  ${typeddValue}${statusddValue}
    ${Campaign_name}=   get text   ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_first]
    run keyword if   '${Campaign_name}' != 'No Data Available'   Verify the Campaign search   ${Campaign_name}
    ...   ELSE  log  No data available
    ${num}=   generate random string   4    0123456789
    Capture the Screen    Campaign_search_sched-${num}
    clear the element text with presskeys  ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_search]

clicking next button with empty fields and validating help message
    log  Campaigns_06
    sleep  5
    click element until visible  ${new_campaign_btn}
    click element until visible  ${locators_params['Campaigns']['Scheduled_campaign']}[Select_campaign]
    sleep  5
    click element until visible  ${next_btn_}
    @{multiTxt}=  Create List  ${testdata_namerequiredhelpmsg}  ${testdata_segmentrequiredmsg}  ${testdata_startdaterequiredmsg}  ${testdata_enddaterequiredmsg}
    wait until page contains multiple text  @{multiTxt}

clicking next with same campaign name and validate diplicate alert in campaigns step 1
    log  Campaigns_07
    click element until visible  ${campaigns}
    wait until page contains element  (//tbody)[1]//tr[1]//td[1]//span  30s
    ${campaignNameFromTable}=  Get the Text from the Element  (//tbody)[1]//tr[1]//td[1]//span
    click element until visible  ${new_campaign_btn}
    click element until visible  ${locators_params['Campaigns']['Scheduled_campaign']}[Select_campaign]
    wait until page contains element  ${define_name}
    enter the value untill visible  ${define_name}  ${campaignNameFromTable}
    click element until visible   ${define_segment}
    wait until page contains element  ${define_segmentSearchField}  10s
    enter the value untill visible  ${define_segmentSearchField}  Casual users
    click element until visible  //*[contains(@class,'dropdown-item')]//*[contains(text(),'Casual users')]/following-sibling::span[contains(text(),'Upsell')]
    enter the value untill visible  ${define_budget}   75
    enter the value untill visible  ${define_conversion_target}  10
    click element until visible   ${define_start_date}
    click element until visible      ${testData_todaysDate}
    click element until visible  ${define_end_date}
    click element until visible      ${testData_todaysDate}
    click element until visible   ${next_btn_}
    wait until page contains  ${define_duplicatealerttxt}  20s


search function validation in campaigns
    click element until visible  ${campaigns_pagination_next}
    ${txtValue}=  Get the Text from the Element  (//tbody)[1]//tr[1]//td[1]//span
    click element until visible  ${campaigns_pagination_first}
    sleep  5
    Enter the Value Untill Visible  ${campaigns_searchfield}  ${txtValue}
    click element until visible  ${campaigns_searchbtn}
    wait until page contains element   //*[contains(text(),'${txtValue}')]  30s


go to new campaigns, enter details only in first step and verify campaigns should be created as draft
    Navigate to Scheduled Campaign Define page
    sleep  5
    ${PO_Number}    Generate random string    5    0123456789
    ${Name}     Set Variable    jan_test${PO_Number}
    enter the value untill visible  ${define_name}  ${Name}
    click element until visible   ${define_segment}
    wait until page contains element  ${define_segmentSearchField}  10s
    enter the value untill visible  ${define_segmentSearchField}  Casual users
    click element until visible  //*[contains(@class,'dropdown-item')]//*[contains(text(),'Casual users')]/following-sibling::span[contains(text(),'Upsell')]
    enter the value untill visible  ${define_budget}   75
    enter the value untill visible  ${define_conversion_target}  10
    click element until visible   ${define_start_date}
    click element until visible      ${testData_todaysDate}
    click element until visible  ${define_end_date}
    click element until visible      ${testData_todaysDate}
    click element until visible   ${savecampaign}
    wait until page contains   Campaign Defined Successfully!  30s
    @{elements_list}=  Create List  ${saveCampaign}  ${define_name}
    ...   ${define_segment}   ${define_budget}
    ...   ${define_conversion_target}   ${define_start_date}
    ...   ${define_end_date}   ${next_btn_}
    wait until page contain elements  @{elements_list}
    After Select the Segment Validate Dataset for CMC user
    Validation for CMC and CMC Pro user
    click element until visible   ${campaigns}
    wait until page contains element  ${campaigns_searchField}  80s
    enter the value untill visible  ${campaigns_searchField}  ${Name}
    wait until page contains element  //*[@title='Draft']  20s
    capture the screen  draftedCampaign
    Complete the drafted campaign for all channels  ${Name}

Complete the drafted campaign for all channels
    [Arguments]  ${draftedCampaignName}  ${segment}
    click element until visible  //*[text()='${draftedCampaignName}']
    @{elements_list}=  Create List  ${saveCampaign}  ${define_name}
    ...   ${define_segment}   ${define_budget}
    ...   ${define_conversion_target}   ${define_start_date}
    ...   ${define_end_date}   ${next_btn_}
    wait until page contain elements  @{elements_list}
    After Select the Segment Validate Dataset for CMC user
    Validation for CMC and CMC Pro user
    click element until visible   ${savecampaign}
    wait until page contains   Campaign Updated Successfully!  30s
    click element until visible  ${next_btn_}
    step 2 select all channels  ${draftedCampaignName}
    step 3 validate and click deploy popup for all channels  ${draftedCampaignName}
    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
    Run Keyword Unless  ${status}  step 4 results screen verification for all channels  ${draftedCampaignName}  Casual users
    Search and delete the created campaign  ${draftedCampaignName}


Create a drafted campaign and verify it's created
    [Arguments]  ${campName}  ${segmentName}  ${region}  ${location}
    Navigate to Scheduled Campaign Define page
    @{elements_list}=  Create List  ${define_name}
    ...   ${define_segment}   ${define_budget}
    ...   ${define_conversion_target}   ${define_start_date}
    ...   ${define_end_date}
    wait until page contain elements  @{elements_list}
    Validation for CMC and CMC Pro user
    Capture the Screen  ${campName}-Step1
#    ${PO_Number}    Generate random string    5    0123456789
#    ${Name}    Set Global Variable    test_campgn${PO_Number}
    enter the value untill visible  ${define_name}  ${campName}
    click element until visible   ${define_segment}
    wait until page contains element  ${define_segmentSearchField}  10s
    enter the value untill visible  ${define_segmentSearchField}  ${segmentName}
    click element until visible    //*[contains(@class,'dropdown-item')]//*[contains(text(),'${segmentName}')]/following-sibling::span[contains(text(),'Upsell')]
    sleep  1
    After Select the Segment Validate Dataset for CMC user
    click element until visible  ${define_regiondropdown}
    sleep  1
    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${region}')]
    Run Keyword If  ${status}  click element until visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${region}')]
    ...  ELSE  click element until visible  ${define_regiondropdownarrow}

    click element until visible  ${define_locationdropdown}
    sleep  1
    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${location}')]
    Run Keyword If  ${status}  click element until visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${location}')]
    ...  ELSE  click element until visible  ${define_locationDropdownArrow}

    click element until visible  ${define_servicedropdown}
    sleep  1
    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'20M+')]
    Run Keyword If  ${status}  click element until visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'20M')]
    ...  ELSE  click element until visible  ${define_serviceDropdownArrow}

    click element until visible  ${define_propensitydropdown}
    sleep  1
    ${status}=  Run Keyword And Return Status  element should be visible   //*[contains(@class,'scroll-host')]//*[contains(text(),'High')]
    Run Keyword If  ${status}  click element until visible   //*[contains(@class,'scroll-host')]//*[contains(text(),'All')]
    ...  ELSE  click element until visible  ${define_propensityDropdownArrow}
    ${budget}=  generate random string  3  1234567890
    enter the value untill visible  ${define_budget}   ${budget}
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
    capture the screen  ${campName}drafted
    click element until visible  //*[contains(text(),'${campName}')]
    @{elements_list}=  Create List  //*[contains(text(),'${campName}')]  ${saveCampaign}  ${define_name}
    ...   ${define_segment}   ${define_budget}
    ...   ${define_conversion_target}   ${define_start_date}
    ...   ${define_end_date}   ${next_btn_}
    wait until page contain elements  @{elements_list}
    After Select the Segment Validate Dataset for CMC user
    sleep  5
    click element until visible   ${savecampaign}
    wait until page contains   Campaign Updated Successfully!  30s
    click element until visible  ${next_btn_}







clicking next button with each empty field at a time and validating help message
    [Arguments]  ${testName}  ${name}  ${segment}  ${startDate}  ${endDate}  ${helpMsg}
    Navigate to Scheduled Campaign Define page
    sleep  5
    enter the value untill visible  ${define_name}  ${name}
    click element until visible   ${define_segment}
    sleep  15
    click element until visible    //*[contains(@class,'dropdown-item')]//*[contains(text(),'Casual users')]/following-sibling::span[contains(text(),'Upsell')]
    enter the value untill visible  ${define_budget}   75
    enter the value untill visible  ${define_conversion_target}  60
    click element until visible   ${define_start_date}
    sleep  3
    click element until visible      ${startDate}
    click element until visible  ${define_end_date}
    sleep  3
    click element until visible      ${endDate}
    click element until visible   ${next_btn_}
    page should contain the element  ${helpMsg}

Verify elements on campaigns step 2 screen
    [Documentation]  CCL-68673_12 Verify the Channels page
    @{ellements}=   Create List    ${previous_btn_}
    ...  ${campaigns_channel_channelcheckbox}  ${campaigns_channel_fbcheckbox}  ${campaigns_channel_csvdownloadcheckbox}  ${campaigns_channel_mobilemsgcheckbox}
    ...  ${campaigns_channel_mailchimpCheckbox}  ${campaigns_channel_hubspotCheckbox}  ${campaigns_channel_constantContactCheckbox}
    Wait Until Page Contain Elements    @{ellements}
    @{txt}=  create list  ${campaigns_channel_mobnotidesc}  ${campaigns_channel_mailchimpdesc}  ${campaigns_channel_csvdesc}
    ...  ${campaigns_channel_facebookDesc}  ${campaigns_channel_hubspotdesc}  ${campaigns_channel_consContactDesc}   ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[Channel_head]
    wait until page contains multiple text  @{txt}


Validation of campaigns steps
    Validating campaigns step 1 define
    Validating Step 2 Channel

Validating campaigns step 1 define
    Navigate to Scheduled Campaign Define page
    @{elements_list}=  Create List  ${saveCampaign}  ${define_name}
    ...   ${define_segment}   ${define_budget}
    ...   ${define_conversion_target}   ${define_start_date}
    ...   ${define_end_date}   ${next_btn_}
    wait until page contain elements  @{elements_list}
    Validation for CMC and CMC Pro user
    verify page title for campaignscreation screen
    capture the screen  campaignStep1ScreenValidation
    ${PO_Number}    Generate random string    5    0123456789
    ${Name}     Set Variable    test_campgn${PO_Number}
    clear element text  ${define_name}
    sleep  1
    enter the value untill visible  ${define_name}  ${Name}
    click element until visible   ${define_segment}
    wait until page contains element  ${define_segmentSearchField}  10s
    enter the value untill visible  ${define_segmentSearchField}  Casual users
    click element until visible   //*[contains(@class,'dropdown-menu ')]//*[text()='Casual users']/following-sibling::span[contains(text(),'Upsell')]
    @{dropdowns}=  Create List  ${define_regiondropdown}
    ...  ${define_locationdropdown}  ${define_servicedropdown}  ${define_propensitydropdown}
    page should contain multiple element  @{dropdowns}
    After Select the Segment Validate Dataset for CMC user
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
    click element until visible    ${next_btn_}


Validating Step 2 Channel
    Verify elements on campaigns step 2 screen
    Capture the Screen  campaignsStep2ScreenValidation
    click element until visible  ${previous_btn_}
    @{dropdowns}=  Create List  ${define_regiondropdown}
    ...  ${define_locationdropdown}  ${define_servicedropdown}  ${define_propensitydropdown}
    wait until page contain elements   @{dropdowns}
    After Select the Segment Validate Dataset for CMC user
    capture the screen  navigatedToStep1
    click element until visible    ${next_btn_}
    Verify elements on campaigns step 2 screen
    page should not contain element  ${next_btn_}
    capture the screen  navigatedBackToStep2
    Click deploy tab with no channels selected and validate alert
    click element until visible  ${campaigns_channel_channelcheckbox}
    @{checkBoxesList}=  Create List  ${campaigns_channel_fbcheckbox}  ${campaigns_channel_csvdownloadcheckbox}
    ...  ${campaigns_channel_hubspotcheckbox}  ${campaigns_channel_mailchimpcheckbox}  ${campaigns_channel_mobilemsgcheckbox}
    verify checkboxes should be selected  ${checkBoxesList}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    verify dropdown and select ALL for selected channel  Mailchimp
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Hubspot
    verify dropdown and select ALL for selected channel  Mobile Notification
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
     click element until visible   ${next_btn_}
    @{elements}=   Create List  ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    capture the screen  step3AllChannelsSelected
    click element until visible  ${previous_btn_}
    Verify elements on campaigns step 2 screen
    capture the screen  navigatedBackTostep2fromStep3
    @{checkBoxesList}=  Create List  ${campaigns_channel_fbcheckbox}  ${campaigns_channel_csvdownloadcheckbox}
    ...  ${campaigns_channel_hubspotcheckbox}  ${campaigns_channel_mailchimpcheckbox}  ${campaigns_channel_mobilemsgcheckbox}
    verify checkboxes should be selected  ${checkBoxesList}
    uncheck MobileNoti and Hubspot verify navigating back from step3 to step2
    uncheck Mailchimp and Facebook verify navigating back from step3 to step2
    uncheck Mailchimp and Hubspot verify navigating back from step3 to step2
    uncheck Mailchimp and ConstantContact verify navigating back from step3 to step2
    Check the Acquistion and Verify the Acquistion in Recommended Segments
    Check the Retention and Verify the Retention in Recommended Segments
    click element until visible  ${campaigns_channel_channelcheckbox}
    uncheck MobileNoti and Hubspot verify navigating back from step3 to step2
    uncheck Mailchimp and Facebook verify navigating back from step3 to step2
    uncheck Mailchimp and Hubspot verify navigating back from step3 to step2
    uncheck Mailchimp and ConstantContact verify navigating back from step3 to step2

uncheck MobileNoti and Hubspot verify navigating back from step3 to step2
    click element until visible  ${campaigns_channel_mobilemsgcheckbox}
    click element until visible  ${campaigns_channel_hubspotcheckbox}
    click element until visible   ${next_btn_}
    @{elements}=   Create List  ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    capture the screen  step3hubspotMobileNotifcationRemoved
    click element until visible  ${previous_btn_}
    Verify elements on campaigns step 2 screen
    @{uncheckedHbMn}=  Create List  ${campaigns_channel_mobilemsgcheckbox}  ${campaigns_channel_hubspotcheckbox}   ${campaigns_channel_channelcheckbox}
    verify checkboxes should not be selected  ${uncheckedHbMn}
    capture the screen  backToStep2-hbMnUnchecked
    click element until visible  ${campaigns_channel_mobilemsgcheckbox}
    click element until visible  ${campaigns_channel_hubspotcheckbox}
    @{checkBoxesList}=  Create List  ${campaigns_channel_fbcheckbox}  ${campaigns_channel_csvdownloadcheckbox}
    ...  ${campaigns_channel_hubspotcheckbox}  ${campaigns_channel_mailchimpcheckbox}  ${campaigns_channel_mobilemsgcheckbox}
    verify checkboxes should be selected  ${checkBoxesList}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    verify dropdown and select ALL for selected channel  Facebook
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mobile Notification
    verify dropdown and select ALL for selected channel  Download CSV
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Hubspot

uncheck Mailchimp and Facebook verify navigating back from step3 to step2
    click element until visible   ${campaigns_channel_mailchimpcheckbox}
    click element until visible   ${campaigns_channel_fbcheckbox}
     click element until visible   ${next_btn_}
    @{elements}=   Create List  ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    capture the screen  step3facebook&MailchimpRemoved
    log  navigate back to step 2 and verify facebook and mailchimp remains unchecked
    click element until visible  ${previous_btn_}
    Verify elements on campaigns step 2 screen
    @{uncheckedMcFb}=  Create List  ${campaigns_channel_fbcheckbox}  ${campaigns_channel_mailchimpcheckbox}  ${campaigns_channel_channelcheckbox}
    verify checkboxes should not be selected  ${uncheckedMcFb}
    capture the screen  backToStep2 -mcFbUnchecked

uncheck Mailchimp and Hubspot verify navigating back from step3 to step2
    click element until visible  ${campaigns_channel_channelcheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    verify dropdown and select ALL for selected channel  Mailchimp
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Hubspot
    verify dropdown and select ALL for selected channel  Mobile Notification
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
    click element until visible  ${campaigns_channel_hubspotcheckbox}
    click element until visible   ${campaigns_channel_mailchimpcheckbox}
    click element until visible   ${next_btn_}
    @{elements}=   Create List  ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    capture the screen  step3hubspotMailchimpRemoved
    log  navigate back to step 2 and verify Mailchimp and hubsopt remains unchecked
    click element until visible  ${previous_btn_}
    Verify elements on campaigns step 2 screen
    @{uncheckedHbMc}=  Create List  ${campaigns_channel_mailchimpcheckbox}  ${campaigns_channel_hubspotcheckbox}   ${campaigns_channel_channelcheckbox}
    verify checkboxes should not be selected  ${uncheckedHbMc}
    capture the screen  backToStep2-hbMcUnchecked

uncheck Mailchimp and ConstantContact verify navigating back from step3 to step2
    click element until visible  ${campaigns_channel_channelcheckbox}
    click element until visible  ${campaigns_channel_constantContactCheckbox}
    click element until visible   ${campaigns_channel_mailchimpcheckbox}
    click element until visible   ${next_btn_}
    @{elements}=   Create List  ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    capture the screen  step3constantContactAndMailchimpRemoved
    log  navigate back to step 2 and verify Mailchimp and ConstantContact remains unchecked
    click element until visible  ${previous_btn_}
    Verify elements on campaigns step 2 screen
    @{uncheckedHbMc}=  Create List  ${campaigns_channel_mailchimpcheckbox}  ${campaigns_channel_constantContactCheckbox}   ${campaigns_channel_channelcheckbox}
    verify checkboxes should not be selected  ${uncheckedHbMc}
    capture the screen  backToStep2-ccMcUnchecked

uncheck Facebook and Hubspot verify navigating back from step3 to step2
    click element until visible  ${campaigns_channel_channelcheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    verify dropdown and select ALL for selected channel  Mailchimp
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Hubspot
    verify dropdown and select ALL for selected channel  Mobile Notification
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
    click element until visible  ${campaigns_channel_hubspotcheckbox}
    click element until visible   ${campaigns_channel_fbcheckbox}
    click element until visible   ${next_btn_}
    @{elements}=   Create List  ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    capture the screen  step3hubspotfacebookRemoved
    log  navigate back to step 2 and verify facebook and hubsopt remains unchecked
    click element until visible  ${previous_btn_}
    Verify elements on campaigns step 2 screen
    @{uncheckedHbMc}=  Create List  ${campaigns_channel_fbcheckbox}  ${campaigns_channel_hubspotcheckbox}   ${campaigns_channel_channelcheckbox}
    verify checkboxes should not be selected  ${uncheckedHbMc}
    capture the screen  backToStep2-hbfbUnchecked

Check the Acquistion and Verify the Acquistion in Recommended Segments
   ${Recommended_segments_list}=   call method    ${CMCconnectionObj}     Segments_Recommended_Usercmc
   ${Recommended_segments_list_2}=   convert to list    ${Recommended_segments_list}[2]
   log    ${Recommended_segments_list_2}
   ${Acq_status}=   run keyword and return status     list should contain value   ${Recommended_segments_list_2}   Acquisition
   run keyword if   "${Acq_status}" == "True"   Run Keywords    navigate to step 1 and change segment type to acquisition
   ...  AND    uncheck Facebook and Hubspot verify navigating back from step3 to step2 - acqSegment
   ...  AND    uncheck Mailchimp and Facebook verify navigating back from step3 to step2 - aqSegment
   ...  AND    uncheck Mailchimp and Hubspot verify navigating back from step3 to step2 - aqSegment
   ...  AND    uncheck Mailchimp and ConstantContact verify navigating back from step3 to step2 - aqSegment
   ...  ELSE  log  No Acquistion Segment available in Recommended Segments

Check the Retention and Verify the Retention in Recommended Segments
   ${Recommended_segments_list}=   call method    ${CMCconnectionObj}     Segments_Recommended_Usercmc
   ${Recommended_segments_list_2}=   convert to list    ${Recommended_segments_list}[2]
   log    ${Recommended_segments_list_2}
   ${Rtn_status}=   run keyword and return status     list should contain value   ${Recommended_segments_list_2}   Retention
   run keyword if   "${Rtn_status}" == "True"   Run Keywords    Navigate to step 1 and change segment type to retention
#   ...  AND    uncheck Facebook and Hubspot verify navigating back from step3 to step2 - acqSegment
#   ...  AND    uncheck Mailchimp and Facebook verify navigating back from step3 to step2 - aqSegment
#   ...  AND    uncheck Mailchimp and Hubspot verify navigating back from step3 to step2 - aqSegment
#   ...  AND    uncheck Mailchimp and ConstantContact verify navigating back from step3 to step2 - aqSegment
   ...  ELSE  log  No Retention Segment available in Recommended Segments

navigate to step 1 and change segment type to acquisition
    click element until visible  ${define_tab}
     @{elements_list}=  Create List  ${define_name}
    ...   ${define_segment}   ${define_budget}
    ...   ${define_conversion_target}   ${define_start_date}
    ...   ${define_end_date}   ${next_btn_}
    wait until page contain elements  @{elements_list}
    Validation for CMC and CMC Pro user
    Capture the Screen  campaignsStep1-AcqSegmentVal
    click element until visible   ${define_segment}
    wait until page contains element  ${define_segmentSearchField}  10s
    enter the value untill visible  ${define_segmentSearchField}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment3]
    click element until visible    //*[contains(@class,'dropdown-item')]//*[contains(text(),'${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment3]')]/following-sibling::span[contains(text(),'Acquisition')]
    @{drops}=  Create List  ${define_regiondropdown}  ${define_locationdropdown}  ${define_servicedropdown}
    Page Should Not Contain Multiple Element  @{drops}
    After Select the Acquistion Segment Validate Dataset for CMC user
    click element until visible  ${define_zipcode}
    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${globVar_zipcode1}')]
    Run Keyword If  ${status}  click element until visible   //*[contains(@class,'scroll-host')]//*[contains(text(),'${globVar_zipcode1}')]
    ...  ELSE  click element until visible  ${define_zipcodeArrow}

    click element until visible  ${define_zipcode}
    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${globVar_zipcode2}')]
    Run Keyword If  ${status}  click element until visible   //*[contains(@class,'scroll-host')]//*[contains(text(),'${globVar_zipcode2}')]
    ...  ELSE  click element until visible  ${define_zipcodeArrow}
    enter the value untill visible  ${define_budget}   75
    enter the value untill visible  ${define_conversion_target}  10
    click element until visible   ${define_start_date}
    click element until visible      ${testData_todaysDate}
    click element until visible  ${define_end_date}
    click element until visible      ${testData_todaysDate}
    click element until visible   ${savecampaign}
    click element until visible   ${next_btn_}
    sleep  5
    page should not contain element  ${next_btn_}
    verify elements on campaigns step 2 screen - acquisition segment
    Click deploy tab with no channels selected and validate alert

Selecting acquisition filter should show zipplusfour filter
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
    enter the value untill visible  ${define_segmentSearchField}  All Prospects
    click element until visible    //*[contains(@class,'dropdown-item')]//*[text()='All Prospects']/following-sibling::span[contains(text(),'Acquisition')]
    @{drops}=  Create List  ${define_regiondropdown}  ${define_locationdropdown}  ${define_servicedropdown}
    Page Should Not Contain Multiple Element  @{drops}
    After Select the Acquistion Segment Validate Dataset for CMC user
    log  CCL-44724_01
    wait until page contains element  ${define_zipPlusFourArrow}
    log  CCL-44724_02
    log  switch to different segment type and verify zipplus four should not be visible
    click element until visible   ${define_segment}
    wait until page contains element  ${define_segmentSearchField}  10s
    enter the value untill visible  ${define_segmentSearchField}  Casual users
    click element until visible    //*[contains(@class,'dropdown-item')]//*[text()='Casual users']/following-sibling::span[contains(text(),'Upsell')]
    @{drops}=  Create List  ${define_regiondropdown}  ${define_locationdropdown}  ${define_servicedropdown}
    wait until page contain elements  @{drops}
    After Select the Segment Validate Dataset for CMC user
    page should not contain element  ${define_zipPlusFourArrow}

Select different zip codes and verify they're selected
    log  CCL-44724_03
    click element until visible  ${define_zipPlusFourArrow}
    @{selectedZips}=  Create List
    @{zipListElement}=  get webelements  //*[contains(@class,'scroll-host')]//span
    FOR  ${zip}  IN  @{ipListElement}
    ${zipLabel}=  get text  ${zip}
    click element until visible  //*[contains(@class,'scroll-host')]//*[normalize-space()='${zip}']
    wait until page contains element  //*[normalize-space()='${zip}']/preceding-sibling::span[normalize-space()='×']
    append to list  ${selectedZips}  ${zipLabel}
    click element until visible  ${define_zipPlusFourArrow}
    END

    ${zipsListOnFilter}  Get list of selected values from zipplusfour filter
    set global variable  ${selectedZips}
    lists should be equal  ${selectedZips}  ${zipsListOnFilter}

Get list of selected values from zipplusfour filter
    @{zipsListOnFilter}=  Create List
    @{zipListElement}=  get webelements  (//*[contains(@class,'arrow-wrapper')])[2]//*[@class='ng-value']
    FOR  ${zip}  IN  @{zipListElement}
    ${zipLabel}=  get text  ${zip}
    append to list  ${zipsListOnFilter}  ${zipLabel}
    END
    [Return]  ${zipsListOnFilter}

Clear the zipplusfour field
    log  CCL-44724_05
    @{xElements}=  get webelements  (//*[contains(@class,'arrow-wrapper')])[2]//*[@class='ng-value']//span[normalize-space()='×']
    FOR  ${element}  IN  @{xElements}
    click element  ${element}
    END
    page should not contain multiple text  @{selectedZips}

uncheck Facebook and Hubspot verify navigating back from step3 to step2 - acqSegment
    click element until visible  ${campaigns_channel_channelcheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    verify dropdown and select ALL for selected channel  Mailchimp
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Hubspot
    click element until visible  ${campaigns_channel_hubspotcheckbox}
    click element until visible   ${campaigns_channel_fbcheckbox}
    click element until visible   ${next_btn_}
    @{elements}=   Create List  ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    capture the screen  step3hubspotfacebookRemoved-acqSegment
    log  navigate back to step 2 and verify facebook and hubsopt remains unchecked
    click element until visible  ${previous_btn_}
    verify elements on campaigns step 2 screen - acquisition segment
    @{uncheckedHbMc}=  Create List  ${campaigns_channel_fbcheckbox}  ${campaigns_channel_hubspotcheckbox}   ${campaigns_channel_channelcheckbox}
    verify checkboxes should not be selected  ${uncheckedHbMc}
    capture the screen  backToStep2-hbfbUnchecked-acqSegment

uncheck Mailchimp and Facebook verify navigating back from step3 to step2 - aqSegment
    click element until visible  ${campaigns_channel_channelcheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Hubspot
    verify dropdown and select ALL for selected channel  Facebook
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    click element until visible   ${campaigns_channel_mailchimpcheckbox}
    click element until visible   ${campaigns_channel_fbcheckbox}
     click element until visible   ${next_btn_}
    @{elements}=   Create List  ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    capture the screen  step3facebook&MailchimpRemoved-aqSegment
    log  navigate back to step 2 and verify facebook and mailchimp remains unchecked
    click element until visible  ${previous_btn_}
    verify elements on campaigns step 2 screen - acquisition segment
    @{uncheckedMcFb}=  Create List  ${campaigns_channel_fbcheckbox}  ${campaigns_channel_mailchimpcheckbox}  ${campaigns_channel_channelcheckbox}
    verify checkboxes should not be selected  ${uncheckedMcFb}
    capture the screen  backToStep2-mcFbUnchecked-aqSegment

uncheck Mailchimp and Hubspot verify navigating back from step3 to step2 - aqSegment
    click element until visible  ${campaigns_channel_channelcheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    verify dropdown and select ALL for selected channel  Mailchimp
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Hubspot
    click element until visible  ${campaigns_channel_hubspotcheckbox}
    click element until visible   ${campaigns_channel_mailchimpcheckbox}
    click element until visible   ${next_btn_}
    @{elements}=   Create List  ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    capture the screen  step3hubspotMailchimpRemoved-aqSegment
    log  navigate back to step 2 and verify Mailchimp and hubsopt remains unchecked
    click element until visible  ${previous_btn_}
    verify elements on campaigns step 2 screen - acquisition segment
    @{uncheckedHbMc}=  Create List  ${campaigns_channel_mailchimpcheckbox}  ${campaigns_channel_hubspotcheckbox}   ${campaigns_channel_channelcheckbox}
    verify checkboxes should not be selected  ${uncheckedHbMc}
    capture the screen  backToStep2-ccMcUnchecked-aqSegment

uncheck Mailchimp and ConstantContact verify navigating back from step3 to step2 - aqSegment
    click element until visible  ${campaigns_channel_channelcheckbox}
    click element until visible  ${campaigns_channel_constantContactCheckbox}
    click element until visible   ${campaigns_channel_mailchimpcheckbox}
    click element until visible   ${next_btn_}
    @{elements}=   Create List  ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    capture the screen  step3MailchimpConstantContactRemoved-aqSegment
    log  navigate back to step 2 and verify Mailchimp and ConstantContact remains unchecked
    click element until visible  ${previous_btn_}
    verify elements on campaigns step 2 screen - acquisition segment
    @{uncheckedHbMc}=  Create List  ${campaigns_channel_mailchimpcheckbox}  ${campaigns_channel_constantContactCheckbox}   ${campaigns_channel_channelcheckbox}
    verify checkboxes should not be selected  ${uncheckedHbMc}
    capture the screen  backToStep2-hbMcUnchecked-aqSegment

Navigate to step 1 and change segment type to retention
    click element until visible  ${define_tab}
    @{elements_list}=  Create List  ${saveCampaign}  ${define_name}
    ...   ${define_segment}   ${define_budget}
    ...   ${define_conversion_target}   ${define_start_date}
    ...   ${define_end_date}   ${next_btn_}
    wait until page contain elements  @{elements_list}
    Validation for CMC and CMC Pro user
    capture the screen  campaignStep1ScreenValidation
    ${PO_Number}    Generate random string    5    0123456789
    ${Name}     Set Variable    test_campgn${PO_Number}
    clear element text  ${define_name}
    sleep  1
    enter the value untill visible  ${define_name}  ${Name}
    click element until visible   ${define_segment}
    wait until page contains element  ${define_segmentSearchField}  10s
    enter the value untill visible  ${define_segmentSearchField}  Casual users
    click element until visible   //*[contains(@class,'dropdown-menu ')]//*[contains(text(),'casual user')]/following-sibling::span[contains(text(),'Retention')]
    @{dropdowns}=  Create List  ${define_regiondropdown}
    ...  ${define_locationdropdown}  ${define_servicedropdown}  ${define_propensitydropdown}
    page should contain multiple element  @{dropdowns}
    After Select the Segment Validate Dataset for CMC user
    enter the value untill visible  ${define_budget}   75
    enter the value untill visible  ${define_conversion_target}  10
    click element until visible   ${define_start_date}
    click element until visible      ${testData_todaysDate}
    click element until visible  ${define_end_date}
    click element until visible      ${testData_todaysDate}
    click element until visible    ${next_btn_}



Click deploy tab with no channels selected and validate alert
    click element until visible  ${deploy_tab}
    wait until page contains  ${channel_alert}  30s
    click element until visible  ${channel_alertclose}

Verify the Elements for Deploy Popup
    [Documentation]
    [Arguments]   ${Mobile_segmentsize}
    run keyword if  '${Mobile_segmentsize}' == '0'  Constant Contact only
    ...  ELSE   Both Mobile and Constant Contact

Both Mobile and Constant Contact
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}
    ...  ${deploypopup_ciqmobilenottxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}

Constant Contact only
    @{txt}=  Create List  ${deploypopupheader}  ${deployPopup_actionSingleTxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}

Validation Step 3(1) for immediate
    click element until visible  ${mobile_message_shedule}
    click element until visible  ${mobileMesssage_shcedule_immediate}
#    page should contain the element  ${mobilemesssage_shcedule_immediatehelpmsg}
    capture the screen



Validation Step 3(1) for scheduled
    click element until visible  ${mobile_message_shedule}
    click element until visible  ${mobileMessage_schedule_scheduled}
    click element until visible  ${mobile_message_notification}
    @{timePickerElements}=  Create List  ${mobile_message_notification_hour}  ${mobile_message_notification_mins}  ${mobile_message_notification_amPm}
    Wait Until Page Contain Elements  @{timePickerElements}
    click element until visible  (//span[contains(@class,'up')])[2]
    click element until visible  ${testdata_todaysdate}
    capture the screen  scheduled

Verify mobile notification redeployment
    [Arguments]  ${campaignName}
    naviagate to campaigns tab
    wait until page contains element  ${campaigns_searchfield}  60s
    enter the value untill visible  ${campaigns_searchfield}  ${campaignName}
    wait until page contains element  //*[text()='${campaignName}']   60s
    click element until visible  //*[text()='${campaignName}']
    wait until page contains element  ${results_mobileNotiDeploymentStatus}
    capture the screen  ${campaignName}-reDep
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Validate mobile noti redeployment poup functions
    ...  AND  Validate mobile noti review popup functions
    ...  AND  Redeploy for immediate
    ...  AND  Redeploy for scheduled
    ...  AND  Redeploy for event driven CVM - UTC
    ...  AND  Redeploy for event driven CVM - America/New_York (East Coast)
    ...  AND  Redeploy for event driven CVM - America/Chicago (Central)
    ...  AND  Redeploy for event driven CVM - America/Denver (Mountain)
    ...  AND  Redeploy for event driven CVM - America/Los_Angeles (West Coast)
    ...  AND  Redeploy for event driven SLH - UTC
    ...  AND  Redeploy for event driven SLH - America/New_York (East Coast)
    ...  AND  Redeploy for event driven SLH - America/Chicago (Central)
    ...  AND  Redeploy for event driven SLH - America/Denver (Mountain)
    ...  AND  Redeploy for event driven SLH - America/Los_Angeles (West Coast)
    ...  AND  Redeploy for event driven STM - UTC
    ...  AND  Redeploy for event driven STM - America/New_York (East Coast)
    ...  AND  Redeploy for event driven STM - America/Chicago (Central)
    ...  AND  Redeploy for event driven STM - America/Denver (Mountain)
    ...  AND  Redeploy for event driven STM - America/Los_Angeles (West Coast)

Redeploy for immediate
    Run Keywords  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Deploy the mobile notification review

Redeploy for scheduled
    Run Keywords  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Validation Step 3(1) for scheduled
    ...  AND  Deploy the mobile notification review

Redeploy for event driven CVM - UTC
    Run Keywords  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Competitor Visit Minutes  6   UTC
    ...  AND  Deploy the mobile notification review

Redeploy for event driven CVM - America/New_York (East Coast)
    Run Keywords  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Competitor Visit Minutes  7   America/New_York (East Coast)
    ...  AND  Deploy the mobile notification review

Redeploy for event driven CVM - America/Chicago (Central)
    Run Keywords  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Competitor Visit Minutes  8   America/Chicago (Central)
    ...  AND  Deploy the mobile notification review

Redeploy for event driven CVM - America/Denver (Mountain)
    Run Keywords  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Competitor Visit Minutes  9   America/Denver (Mountain)
    ...  AND  Deploy the mobile notification review

Redeploy for event driven CVM - America/Los_Angeles (West Coast)
    Run Keywords  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Competitor Visit Minutes  6   America/Los_Angeles (West Coast)
    ...  AND  Deploy the mobile notification review

Redeploy for event driven SLH - UTC
    Run Keywords  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Service Limit Hits  6   UTC
    ...  AND  Deploy the mobile notification review

Redeploy for event driven SLH - America/New_York (East Coast)
    Run Keywords  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Service Limit Hits  7   America/New_York (East Coast)
    ...  AND  Deploy the mobile notification review

Redeploy for event driven SLH - America/Chicago (Central)
    Run Keywords  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Service Limit Hits  8   America/Chicago (Central)
    ...  AND  Deploy the mobile notification review

Redeploy for event driven SLH - America/Denver (Mountain)
    Run Keywords  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Service Limit Hits  9   America/Denver (Mountain)
    ...  AND  Deploy the mobile notification review

Redeploy for event driven SLH - America/Los_Angeles (West Coast)
    Run Keywords  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Service Limit Hits  6   America/Los_Angeles (West Coast)
    ...  AND  Deploy the mobile notification review

Redeploy for event driven STM - UTC
    Run Keywords  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Speed Test Minutes  6   UTC
    ...  AND  Deploy the mobile notification review

Redeploy for event driven STM - America/New_York (East Coast)
    Run Keywords  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Speed Test Minutes  7   America/New_York (East Coast)
    ...  AND  Deploy the mobile notification review

Redeploy for event driven STM - America/Chicago (Central)
    Run Keywords  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Speed Test Minutes  8   America/Chicago (Central)
    ...  AND  Deploy the mobile notification review

Redeploy for event driven STM - America/Denver (Mountain)
    Run Keywords  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Speed Test Minutes  9   America/Denver (Mountain)
    ...  AND  Deploy the mobile notification review

Redeploy for event driven STM - America/Los_Angeles (West Coast)
    Run Keywords  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Speed Test Minutes  6   America/Los_Angeles (West Coast)
    ...  AND  Deploy the mobile notification review

Validate mobile noti redeployment poup functions
    click element until visible  ${results_mobileNoti_redeployBtn}
    Verify elements on mobileNoti redeploy popup
    Click 'Cancel' and verify re-deployment popup should be closed
    click element until visible  ${results_mobileNoti_redeployBtn}
    Verify elements on mobileNoti redeploy popup
    Click 'x' and verify re-deployment popup should be closed

Validate mobile noti review popup functions
    click element until visible  ${results_mobileNoti_redeployBtn}
    Verify elements on mobileNoti redeploy popup
    click element until visible  ${results_redeploy_popupRedeployBtn}
    Verify elements on Mobile notification review popup
    Click 'Cancel' and verify re-deployment popup should be closed

    click element until visible  ${results_mobileNoti_redeployBtn}
    Verify elements on mobileNoti redeploy popup
    click element until visible  ${results_redeploy_popupRedeployBtn}
    Verify elements on Mobile notification review popup
    Click 'x' and verify re-deployment popup should be closed

Click 'Cancel' and verify re-deployment popup should be closed
    click element until visible  ${results_redeploy_popupCancelBtn}
    page should not contain element  ${results_redeploy_popupCancelBtn}
    capture the screen  mobileNotiRedep-closed

Click 'x' and verify re-deployment popup should be closed
    click element until visible  ${results_redeploy_popupCloseBtn}
    page should not contain element  ${results_redeploy_popupCloseBtn}
    capture the screen  mobileNotiRedep-closed

No Segements found
    log    No segments found in dropodown


step 1 define
    [Arguments]  ${campName}  ${segmentName}  ${region}  ${location}
    Navigate to Scheduled Campaign Define page
    @{elements_list}=  Create List  ${define_name}
    ...   ${define_segment}   ${define_budget}
    ...   ${define_conversion_target}   ${define_start_date}
    ...   ${define_end_date}   ${next_btn_}
    wait until page contain elements  @{elements_list}
    Validation for CMC and CMC Pro user
    Capture the Screen  ${campName}-Step1
    enter the value untill visible  ${define_name}  ${campName}
    click element until visible   ${define_segment}
    wait until page contains element  ${define_segmentSearchField}  10s
    enter the value untill visible  ${define_segmentSearchField}  ${segmentName}
    click element until visible    //*[contains(@class,'dropdown-item')]//*[text()='${segmentName}']/following-sibling::span[contains(text(),'Upsell')]
    sleep  1
    After Select the Segment Validate Dataset for CMC user
    click element until visible  ${define_regiondropdown}
    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${region}')]
    Run Keyword If  ${status}  click element until visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${region}')]
    ...  ELSE  click element until visible  ${define_regiondropdownarrow}

    click element until visible  ${define_locationdropdown}
    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${location}')]
    Run Keyword If  ${status}  click element until visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${location}')]
    ...  ELSE  click element until visible  ${define_locationDropdownArrow}

    click element until visible  ${define_servicedropdown}
    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'20M+')]
    Run Keyword If  ${status}  click element until visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'20M')]
    ...  ELSE  click element until visible  ${define_serviceDropdownArrow}

    click element until visible  ${define_propensitydropdown}
    ${status}=  Run Keyword And Return Status  element should be visible   //*[contains(@class,'scroll-host')]//*[contains(text(),'High')]
    Run Keyword If  ${status}  click element until visible   //*[contains(@class,'scroll-host')]//*[contains(text(),'All')]
    ...  ELSE  click element until visible  ${define_propensityDropdownArrow}
    ${budget}=  generate random string  3  1234567890
    enter the value untill visible  ${define_budget}   ${budget}
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

Step 1 define - Retention Segment
    [Arguments]  ${campName}  ${segmentName}  ${region}  ${location}
    Navigate to Scheduled Campaign Define page
    @{elements_list}=  Create List  ${define_name}
    ...   ${define_segment}   ${define_budget}
    ...   ${define_conversion_target}   ${define_start_date}
    ...   ${define_end_date}   ${next_btn_}
    wait until page contain elements  @{elements_list}
    Validation for CMC and CMC Pro user
    Capture the Screen  ${campName}-Step1
#    ${PO_Number}    Generate random string    5    0123456789
#    ${Name}    Set Global Variable    test_campgn${PO_Number}
    enter the value untill visible  ${define_name}  ${campName}
    click element until visible   ${define_segment}
    wait until page contains element  ${define_segmentSearchField}  10s
    enter the value untill visible  ${define_segmentSearchField}  ${segmentName}
    click element until visible    //*[contains(@class,'dropdown-item')]//*[text()='${segmentName}']/following-sibling::span[contains(text(),'Retention')]
    After Select the Segment Validate Dataset for CMC user
    click element until visible  ${define_regiondropdown}
    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${region}')]
    Run Keyword If  ${status}  click element until visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${region}')]
    ...  ELSE  click element until visible  ${define_regiondropdownarrow}

    click element until visible  ${define_locationdropdown}
    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${location}')]
    Run Keyword If  ${status}  click element until visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${location}')]
    ...  ELSE  click element until visible  ${define_locationDropdownArrow}

    click element until visible  ${define_servicedropdown}
    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'20M+')]
    Run Keyword If  ${status}  click element until visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'20M')]
    ...  ELSE  click element until visible  ${define_serviceDropdownArrow}

    click element until visible  ${define_propensitydropdown}
    ${status}=  Run Keyword And Return Status  element should be visible   //*[contains(@class,'scroll-host')]//*[contains(text(),'High')]
    Run Keyword If  ${status}  click element until visible   //*[contains(@class,'scroll-host')]//*[contains(text(),'All')]
    ...  ELSE  click element until visible  ${define_propensityDropdownArrow}
    ${budget}=  generate random string  3  1234567890
    enter the value untill visible  ${define_budget}   ${budget}
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


step 1 define for all region/locations
    [Arguments]  ${campName}  ${segmentName}
    Navigate to Scheduled Campaign Define page
    @{elements_list}=  Create List  ${define_name}
    ...   ${define_segment}   ${define_budget}
    ...   ${define_conversion_target}   ${define_start_date}
    ...   ${define_end_date}   ${next_btn_}
    wait until page contain elements  @{elements_list}
    Validation for CMC and CMC Pro user
    Capture the Screen  ${campName}-Step1
#    ${PO_Number}    Generate random string    5    0123456789
#    ${Name}    Set Global Variable    test_campgn${PO_Number}
    enter the value untill visible  ${define_name}  ${campName}
    click element until visible   ${define_segment}
    wait until page contains element  ${define_segmentSearchField}  10s
    enter the value untill visible  ${define_segmentSearchField}  ${segmentName}
    click element until visible    //*[contains(@class,'dropdown-item')]//*[text()='${segmentName}']/following-sibling::span[contains(text(),'Upsell')]
    sleep  1
    After Select the Segment Validate Dataset for CMC user
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

Navigate to Scheduled Campaign Define page
    [Documentation]  CCL-63901_01,CCL-63901_17,CCL-68673_16  Verify All Campaigns tab renamed as Schedule Campaign
    click element until visible  ${locators_params['Campaigns']}[Campaigns_tab]
    Verify page title for Scheduled campaigns screen
    click element until visible  ${locators_params['Campaigns']}[new_campaign_btn]
    Capture the Screen   Campaign Dropdown
    click element until visible  ${locators_params['Campaigns']['Scheduled_campaign']}[Select_campaign]

Step 1 define for saved segment
    [Documentation]   CCL-62280  Verify the Define page for Saved segments
    [Arguments]  ${campName}  ${segmentName}  ${segmentType}
    Navigate to Scheduled Campaign Define page
    @{elements_list}=  Create List  ${saveCampaign}  ${define_name}
    ...   ${define_segment}   ${define_budget}   ${next_btn_}
    ...   ${define_conversion_target}   ${define_start_date}   ${define_end_date}
    wait until page contain elements  @{elements_list}
    Validation for CMC and CMC Pro user
    @{filters}=  Create List  ${define_regiondropdown}  ${define_locationdropdown}  ${define_servicedropdown}
    Page Should Not Contain Multiple Element  @{filters}
    Capture the Screen  ${campName}-Step1ScreenSavedSeg
#    ${PO_Number}    Generate random string    5    0123456789
#    ${Name}    Set Global Variable    test_campgn${PO_Number}
    enter the value untill visible  ${define_name}  ${campName}
    click element until visible   ${define_segment}
#    ${response}=   call method    ${CMCconnectionObj}    Segments_Saved
#    log to console    ${response}[1]
    wait until page contains element  ${define_segmentSearchField}  10s
    enter the value untill visible  ${define_segmentSearchField}  ${segmentName}
    click element until visible    //*[contains(@class,'dropdown-item')]//*[text()='${segmentName}']/following-sibling::span[contains(text(),'${segmentType}')]
    After Select the Segment Validate Dataset for CMC user
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

####onlyConstantContact


####onlyMobileNotification
Step 2 Channel with MN
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    run keyword if  '${count}' == '0'   log  Segment size is 0
    ...  ELSE  run keywords   Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mobile Notification
    ...  AND  page should contain element  ${saveCampaign}
    ...  AND  click element until visible   ${next_btn_}
    [Return]   ${count}

Step 3 deploy with MN
    [Arguments]  ${campName}  ${count}
    @{txt}=  Create List  Image  Preview
    wait until page contains multiple text  @{txt}
    Capture the Screen  ${campName}-Step3
    Mobile Notifications form filling  ${count}
    Validation Step 3(1) for scheduled
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsingletxt}  ${deploypopup_ciqmobilenottxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results with MN
    [Arguments]  ${campName}  ${seletedSegment}  ${Mobile_count}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...   ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    Wait Until Page Contain Elements  @{elements}
    run keyword if   '${Mobile_count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify the Mobile Notification Elements in Results
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    run keyword if   '${Mobile_count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mobileNotification}
    log  Mobile notification redeployment - immediate
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mobileNoti}  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
##    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

####onlyMailchimp
Step 2 Channel with Mailchimp
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_mailchimpcheckbox}
    Verify dropdown and select ALL for selected channel  Mailchimp
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    sleep  5

Step 3 deploy with mailchimp
    [Arguments]  ${campName}  ${segment}
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    @{txt}=  Create List  1. ${mailchimp_headertxt}  ${mailchimp_helptxt}
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    click element until visible   ${deploy-btn}
    @{txt1}=  Create List  ${deploypopupheader}  ${deploypopup_actionsingletxt}  ${deploypopup_mailchimptxt}
    wait until page contains multiple text  @{txt1}

    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}


Step 4 results with mailchimp
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
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
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    Wait Until Page Contain Elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    Mailchimp redeployment check
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mailChimp}
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


##onlyFacebook
Step 2 channel with facebook
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_fbcheckbox}
     Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}


Step 3 deploy with facebook
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


Step 4 results with facebook
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}  ${results_facebookdeploymentstatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    Wait Until Page Contain Elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_facebook}
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

###onlyCsv
Step 2 Channel with CSV
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_csvdownloadcheckbox}
    Verify dropdown and select ALL for selected channel  Download CSV
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    sleep  5

Step 3 deploy with CSV
    [Arguments]  ${campName}  ${segment}
    Capture the Screen  ${campName}-Step3
    @{txt}=  Create List  1. ${csv_headertxt}  ${csv_helptxt}
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    click element until visible   ${deploy-btn}
    @{txt1}=  Create List  ${deploypopupheader}  ${deploypopup_actionsingletxt}  ${deploypopup_csvtxt}
    wait until page contains multiple text  @{txt1}

    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}


Step 4 results with CSV
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_csvdownloadbtn}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    Wait Until Page Contain Elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    expand and validate segment revenue widget for csv only
    expand total revenue widget and validate
    click element until visible  ${results_SubscribersTab}
    Change campaigns performance chart to 12months
    @{elements1}=  create list  ${results_monthsdropdown}    ${results_totalsubslb}
    Wait Until Page Contain Elements  @{elements1}
    Verify the months dropdown
    ${totalSubs}=  get text  ${results_totalrev/subscontent}
    expand total subsribers widget and validate
    click element until visible  ${campaigns_close_X}

###onlyHubspot
Step 2 channel with hubspot
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    verify dropdown and select non-mobile message for selected channel  Hubspot
    page should contain element  ${saveCampaign}

    click element until visible   ${next_btn_}
    sleep  5

Step 3 deploy with hubspot
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    @{txt}=  Create list  1. ${hubspot_headertxt}  ${hubspot_helpTxt}
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsingletxt}  ${deployPopup_hubspotTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}


Step 4 results with hubspot
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_hubspot}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_hubspotDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    Hubspot redeployment check
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_hubspot}
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


Deploy1 clicking deploy with empty fields and validating help messages
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${notificationNameRequiredTxt}
    wait until page contains multiple text  @{txt}
    capture the screen  notificationNameRequired

Deploy2 with empty fields for event driven
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${eventrequired_helpmsg}  ${thresholdrequired_helpmsg}
    ...  ${timezonerequired_helpmsg}  ${notificationtimerequired_helpmsg}
    wait until page contains multiple text  @{txt}
    capture the screen  eventsHelpMessages


Step 3 Deploy Mobile Notification
    [Arguments]  ${campName}  ${segment}
    @{txt}=  Create List  Image  Preview
    wait until page contains multiple text  @{txt}
    @{elements}=   Create List  ${mobile_message_notificationName}   ${mobile_message_link}  ${insidemobile_commandicon}
    ...   ${mobile_message_shedule}  ${mobile_message_title}  ${deploy-btn}   ${previous_btn_}
    wait until page contain elements  @{elements}
    Capture the Screen  ${campName}-Step3
    Selected segment should be highlighted in step 3  ${segment}
    Enter the Value Untill Visible  ${mobile_message_notificationName}  Calix_Cloud
    Enter the Value Untill Visible  ${mobile_message_link}  https://cloud-stg.calix.com/
    Execute Javascript    document.getElementById('file-upload').removeAttribute('hidden')
    Choose File   ${mobile_message_browse}   ${CURDIR}${img_file_path}
    click element until visible   ${deploy-btn}
    @{elements}=  Create List  ${deploypopup}  ${deploy_confirmbtn}  ${deploy_cancelbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}
    page should contain  ${deploypopupheader}
    click element until visible  ${deploy_confirmBtn}



Step 3 Deploy CSV
    [Arguments]  ${campName}  ${segment}
    Capture the Screen  ${campName}-Step3
    @{txt}=  Create List  ${csv_headertxt}  ${csv_helptxt}
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    click element until visible  ${deploy-btn}
    sleep  5
    @{elements}=  Create List  ${deploypopup}  ${deploy_confirmbtn}  ${deploy_cancelbtn}
    Wait Until Page Contain Elements  @{elements}
    page should contain  ${deploypopupheader}
    click element until visible  ${deploy_confirmBtn}
    sleep  30


step 3 Deploy mailchimp
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    @{txt}=  Create List  ${mailchimp_title}  ${mailchimp_texthelp}
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    click element until visible  ${deploy-btn}
    @{elements}=  Create List  ${deploypopup}  ${deploy_confirmbtn}  ${deploy_cancelbtn}
    Wait Until Page Contain Elements  @{elements}
    page should contain  ${deploypopupheader}
    click element until visible  ${deploy_confirmBtn}
    sleep  30


Step 4 results
    [Arguments]  ${campName}
    sleep  3
    Capture the Screen  ${campName}-Step4
    @{elements}=  Create List   ${results_status}   ${results_start}   ${results_segment}
    ...   ${results_end}
    ...   ${results_subscriber}
    ...   ${results_channel}
    ...    Notifications Sent
    wait until page contains multiple text    @{elements}
    ${text}=  get text  ${results_tablecontentPath}
    log to console  ${text}




click next in campaigns
    click element until visible  ${next_btn_}


filter drafted campaigns
    click element until visible  ${campaigns_statusdropdown}
    click element until visible  ${campaigns_statusdropdown_draft}
    sleep  10

filter completed campaigns
    click element until visible  ${campaigns_statusdropdown}
    click element until visible  ${campaigns_statusdropdown_complete}
    sleep  10

filter in progress campaigns
    click element until visible  ${campaigns_statusdropdown}
    click element until visible  ${campaigns_statusDropdown-inProgress}
    sleep  10

#1.Mobile Noti and Mailchimp
Step 2 select Mobile Noti and Mailchimp
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    verify dropdown and select ALL for selected channel  Mobile Notification
    click element until enabled  ${campaigns_channel_mailchimpcheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    sleep  5
    [Return]   ${count}

Step 3 validate and click deploy popup for Mobile Noti and Mailchimp
    [Arguments]  ${campName}  ${segment}  ${Mobi_Segmentcount}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  ${mailchimp_headertxt}  ${mailchimp_helptxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling  ${Mobi_Segmentcount}
    Step 3 for event driven  Service Limit Hits   8.24*10Hz   America/Chicago (Central)  ${Mobi_Segmentcount}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_mailchimptxt}
    wait until page contains multiple text  @{txt}
    run keyword if  '${Mobi_Segmentcount}' == '0'   log  Mobile notification not available
    ...  ELSE   run keywords  @{Mobile_txt}=   create list   ${deploypopup_actionsmiltipletxt}   ${deploypopup_ciqmobilenottxt}
    ...  AND  page should contain multiple element   @{Mobile_txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}



Step 4 Results screen verification for Mobile noti and Mailchimp
    [Arguments]  ${campName}  ${seletedSegment}  ${Mobi_Segmentcount}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...   ${results_mailchimp}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}  ${results_mailchimpdeploymentstatus}  ${results_mailchimpdeploymentstatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}   ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    Wait Until Page Contain Elements  @{elements}
    run keyword if   '${Mobi_Segmentcount}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify the Mobile Notification Elements in Results
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    run keyword if   '${Mobi_Segmentcount}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mobileNotification}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mailChimp}
    log  Mobile notification redeployment functions - scheduled
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Validation Step 3(1) for scheduled
    ...  AND  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
    Mailchimp redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

#2.Mailchimp and CSV
Step 2 select Mailchimp and CSV
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_mailchimpcheckbox}
    Verify dropdown and select ALL for selected channel  Mailchimp
    click element until enabled  ${campaigns_channel_csvdownloadcheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    sleep  5

Step 3 validate and click deploy popup for mailchimp and csv
    [Arguments]  ${campName}  ${segment}
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    @{txt}=  Create List  1. ${mailchimp_headertxt}  ${mailchimp_helptxt}  2. ${csv_headertxt}  ${csv_helptxt}
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    click element until visible   ${deploy-btn}
    @{txt1}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}  ${deploypopup_csvtxt}
    wait until page contains multiple text  @{txt1}

    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}



Step 4 Results screen verification for Mailchimp and CSV
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
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}  ${results_mailchimpdeploymentstatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}    ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    Wait Until Page Contain Elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    Mailchimp redeployment check
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mailChimp}
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mailchimp}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

#3.Mobile Noti and CSV
Step 2 select Mobile Noti and CSV
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    run keyword if  '${count}' == '0'   log  Segment size is 0
    ...  ELSE  run keywords   Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mobile Notification
    click element until enabled  ${campaigns_channel_csvdownloadcheckbox}
    Verify dropdown and select ALL for selected channel  Download CSV
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    sleep  5
    [Return]  ${count}

Step 3 validate and click deploy popup for Mobile noti and csv
    [Arguments]  ${campName}  ${segment}  ${Mobile_segmentsize}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  ${csv_headertxt}  ${csv_helptxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling  ${Mobile_segmentsize}
    Step 3 for event driven  Competitor Visit Minutes   7.24*10Hz   America/New_York (East Coast)  ${Mobile_segmentsize}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_csvtxt}
    wait until page contains multiple text  @{txt}
    run keyword if  '${Mobile_segmentsize}' == '0'   log  Mobile notification not available
    ...  ELSE  run keywords  @{popup_ele}=   Create list    ${deploypopup_actionsmiltipletxt}  ${deploypopup_ciqmobilenottxt}
    ...  AND   Page Should Contain Multiple Element   @{popup_ele}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}


Step 4 Results screen verification for Mobile noti and CSV
    [Arguments]  ${campName}  ${seletedSegment}  ${Mobile_count}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...   ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_csvdownloadbtn}  ${results_inProgress}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}   ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    Wait Until Page Contain Elements  @{elements}
    run keyword if   '${Mobile_count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify the Mobile Notification Elements in Results
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    run keyword if   '${Mobile_count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mobileNotification}
    log  Mobile notification redeployment functions - immediate
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    page should contain the element  ${results_segmentWidget_xAxisLabel_mobileNoti}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

#4.Facebook and mailchimp
step 2 select facebook and mailchimp
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    click element until enabled  ${campaigns_channel_fbcheckbox}
    Verify dropdown and select ALL for selected channel  Facebook
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    sleep  5

step 3 validate and click deploy popup for facebook and mailchimp
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    @{txt}=  Create list  1. ${mailchimp_headertxt}  ${mailchimp_helptxt}  2. ${fb_headertxt}  ${fb_helptxt}
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    @{elements}=   Create List  ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}  ${deployPopup_fbTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}



Step 4 Results screen verification for facebook and mailchimp
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_mailchimp}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List   ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_facebookdeploymentstatus}  ${results_mailchimpdeploymentstatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}    ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    Wait Until Page Contain Elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mailChimp}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_facebook}
    Mailchimp redeployment check
    Facebook redeployment check
    Validate segment distribution pendo - resultsScreen
     get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    @{segmentxAxisLabels}=  Create List  ${results_segmentWidget_xAxisLabel_mailchimp}  ${results_segmentWidget_xAxisLabel_facebook}
#    page should contain multiple element  @{segmentxAxisLabels}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition   ${campName}
    click element until visible  ${campaigns_close_X}

#5.MobilenotiFb
Step 2 select Mobile Noti and Facebook
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    Verify dropdown and select ALL for selected channel  Mobile Notification
    click element until enabled  ${campaigns_channel_fbcheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    sleep  5
    [Return]  ${count}

Step 3 validate and click deploy popup for Mobile noti and facebook
    [Arguments]  ${campName}  ${segment}  ${Mobile_segmentsize}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  ${fb_headertxt}  ${fb_helptxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling  ${Mobile_segmentsize}
    Step 3 for event driven  Competitor Visit Minutes   5.24*10Hz   UTC  ${Mobile_segmentsize}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_fbtxt}
    wait until page contains multiple text  @{txt}
    run keyword if  '${Mobile_segmentsize}' == '0'   log  Mobile notification not available
    ...  ELSE  run keywords  @{popup_ele}=   Create list    ${deploypopup_actionsmiltipletxt}  ${deploypopup_ciqmobilenottxt}
    ...  AND   Page Should Contain Multiple Element   @{popup_ele}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}


Step 4 Results screen verification for Mobile noti and FB
    [Arguments]  ${campName}  ${seletedSegment}   ${Mobi_SegmentSize}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...   ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}  ${results_facebookdeploymentstatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}   ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    Wait Until Page Contain Elements  @{elements}
    run keyword if   '${Mobi_SegmentSize}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify the Mobile Notification Elements in Results
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    run keyword if   '${Mobi_SegmentSize}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mobileNotification}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_facebook}
    log  Mobile notification redeployment functions - scheduled
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Validation Step 3(1) for scheduled
    ...  AND  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
    Facebook redeployment check
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
#    page should contain the element  ${results_segmentWidget_xAxisLabel_mobileNoti}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    @{totalRevPendoTxts}=  Create List  ${results_totalrevenue_pendohelptxt}
#    Mouse over a pendo question icon and verify the guide text  campTotalRev  (${exploreData_pendo_questionIcons})[1]  ${totalRevPendoTxts}
    Verify the Result page based on snapshot condition    ${campName}
    click element until visible  ${campaigns_close_X}

#6.Mobilenoti & hubspot
step 2 select Mobile noti and hubspot
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    ${count}=  Select the Mobile Notification Checkbox
    run keyword if   '${count}' == '0'   log  No Mobile Notification
    ...  ELSE  Verify dropdown and select ALL for selected channel  Mobile Notification
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Hubspot
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    [Return]   ${count}


step 3 validate and click deploy popup for mobile noti and hubspot
    [Arguments]  ${campName}  ${segment}  ${Mobi_segmentsize}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  ${hubspot_headertxt}  ${hubspot_helpTxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling   ${Mobi_segmentsize}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deployPopup_hubspotTxt}
    wait until page contains multiple text  @{txt}
    run keyword if  '${Mobi_segmentsize}' == '0'   log  Mobile notification not available
    ...  ELSE   run keywords  @{Mobile_txt}=   create list   ${deploypopup_actionsmiltipletxt}   ${deploypopup_ciqmobilenottxt}
    ...  AND  page should contain multiple element   @{Mobile_txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}


Step 4 Results screen verification for mobile noti and hubspot
    [Arguments]  ${campName}  ${seletedSegment}  ${Mobile_count}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...    ${results_hubspot}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_hubspotDeploymentStatus}
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
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_hubspot}
    log  Mobile notification redeployment functions - eventDriven
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Competitor Visit Minutes   5.24*10Hz   America/New_York (East Coast)
    ...  AND  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
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

#7.fb, csv
step 2 select fb and csv
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_fbcheckbox}
    click element until enabled  ${campaigns_channel_csvdownloadcheckbox}
    Verify dropdown and select ALL for selected channel  Facebook
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}

Step 3 validate and click deploy for fb and csv
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${fb_headertxt}  ${fb_helptxt}
    ...  2. ${csv_headertxt}  ${csv_helptxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}
    ...  ${deployPopup_fbTxt}  ${deploypopup_csvtxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for fb and csv
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...   ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_csvdownloadbtn}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_facebookDeploymentStatus}
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

#8.Hubspot and fb
Step 2 select hubspot and facebook
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_fbcheckbox}
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
     Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    Verify dropdown and select ALL for selected channel  Hubspot
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}

Step 3 validate and click deploy popup for hubspot and facebook
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list    1. ${fb_headertxt}  ${fb_helptxt}
    ...  2. ${hubspot_headertxt}  ${hubspot_helpTxt}   Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}
    ...  ${deployPopup_fbTxt}  ${deployPopup_hubspotTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for hubspot and facebook
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...    ${results_hubspot}  ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_facebookDeploymentStatus}  ${results_hubspotDeploymentStatus}
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

#9.Hb, csv
Step 2 select hubspot and csv
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    Verify dropdown and select ALL for selected channel  Hubspot
    click element until enabled  ${campaigns_channel_csvdownloadcheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
    page should contain element  ${saveCampaign}
    click element until enabled   ${next_btn_}
    sleep  5

Step 3 validate and click deploy popup for hubspot and csv
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list
    ...  1. ${hubspot_headertxt}  ${hubspot_helpTxt}  2. ${csv_headertxt}  ${csv_helptxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    click element until enabled   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}
    ...  ${deploypopup_csvtxt}  ${deployPopup_hubspotTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    wait until page contain elements   @{elements}
    click element until enabled  ${deploy_confirmbtn}


Step 4 results screen verification for hubspot and csv
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_hubspot}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_csvdownloadbtn}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...   ${results_hubspotDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
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

#10.Mc, hb
Step 2 select mailchimp and hubspot
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    Verify dropdown and select ALL for selected channel  Hubspot
    page should contain element  ${saveCampaign}
    click element until enabled   ${next_btn_}
    sleep  5

Step 3 validate and click deploy popup for mailchimp and hubspot
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${mailchimp_headertxt}  ${mailchimp_helptxt}  2. ${hubspot_headertxt}  ${hubspot_helpTxt}
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    click element until enabled   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}
    ...  ${deployPopup_hubspotTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    wait until page contain elements  @{elements}
    click element until enabled  ${deploy_confirmbtn}

Step 4 results screen verification for mailchimp and hubspot
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...    ${results_mailchimp}  ${results_hubspot}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}   ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_hubspotdeploymentstatus}  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...  ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...  ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    Mailchimp redeployment check
    Hubspot redeployment check
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mailchimp}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_hubspot}
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


#12.All Channels
step 2 select all channels
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_channelCheckBox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    ${Segment_count}=  get text  ${channel_count_mobile}
    run keyword if   '${Segment_count}' == '0'   log  No Mobile Notification
    ...  ELSE  Verify dropdown and select ALL for selected channel  Mobile Notification
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    Verify dropdown and select ALL for selected channel  Hubspot
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
    Verify dropdown and select ALL for selected channel  ConstantContact
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    [Return]   ${Segment_count}


step 3 validate and click deploy popup for all channels
    [Arguments]  ${campName}  ${segment}  ${Mobile_count}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  ${mailchimp_headertxt}  ${mailchimp_helptxt}  ${fb_headertxt}  ${fb_helptxt}
    ...  ${hubspot_headertxt}  ${hubspot_helpTxt}  ${csv_headertxt}  ${csv_helptxt}  Image  Preview
    ...  ${consContact_headerTxt}  ${consContact_helpTxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling   ${Mobile_count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}
    ...  ${deployPopup_fbTxt}  ${deploypopup_csvtxt}  ${deployPopup_hubspotTxt}  ${deployPopup_consContactTxt}
    wait until page contains multiple text  @{txt}
    run keyword if  '${Mobile_count}' == '0'   log  Mobile notification not available
    ...  ELSE   page should contain element   ${deploypopup_ciqmobilenottxt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}


Step 4 Results screen verification for all channels
    [Arguments]  ${campName}  ${seletedSegment}  ${Mobile_count}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...    ${results_hubspot}  ${results_mailchimp}  ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_csvdownloadbtn}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
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
    log  Mobile notification redeployment functions - eventDriven
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Competitor Visit Minutes   6.24*10Hz   America/Chicago (Central)
    ...  AND  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
    Mailchimp redeployment check
    Facebook redeployment check
    Hubspot redeployment check
    Constantcontact redeployment check

    Validate segment distribution pendo - resultsScreen
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mobileNotification}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mailChimp}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_facebook}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_hubspot}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_constantContact}
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


-------------3channelsCombinationKeywords
Step 2 select MobileNoti, mailchimp and hubspot
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    run keyword if   '${count}' == '0'   log  No Mobile Notification
    ...  ELSE  Verify dropdown and select ALL for selected channel  Mobile Notification
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    Verify dropdown and select ALL for selected channel  Hubspot
    page should contain element  ${saveCampaign}
    click element until enabled   ${next_btn_}
    sleep  5
    [Return]   ${count}

Step 3 deploy with MobileNoti, mailchimp and hubspot
    [Arguments]  ${campName}  ${segment}  ${Mobile_count}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  ${mailchimp_headertxt}  ${mailchimp_helptxt}  ${hubspot_headertxt}  ${hubspot_helpTxt}
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling   ${Mobile_count}
    Step 3 for event driven  Service Limit Hits   9.24*10Hz   America/Denver (Mountain)   ${Mobile_count}
    click element until enabled   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}  ${deployPopup_hubspotTxt}
    wait until page contains multiple text  @{txt}
    run keyword if  '${Mobile_count}' == '0'   log  Mobile notification not available
    ...  ELSE   page should contain element   ${deploypopup_ciqmobilenottxt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    wait until page contain elements  @{elements}
    click element until enabled  ${deploy_confirmbtn}


Step 4 results with MobileNoti, mailchimp and hubspot
    [Arguments]  ${campName}  ${seletedSegment}  ${Mobile_count}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...    ${results_mailchimp}  ${results_hubspot}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}   ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}  ${results_mailchimpdeploymentstatus}
    ...  ${results_hubspotdeploymentstatus}  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
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


Step 2 select mailchimp, hubspot and csv
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    Verify dropdown and select ALL for selected channel  Hubspot
    click element until enabled  ${campaigns_channel_csvdownloadcheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
    page should contain element  ${saveCampaign}
    click element until enabled   ${next_btn_}
    sleep  5

Step 3 deploy with mailchimp, hubspot and csv
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${mailchimp_headertxt}  ${mailchimp_helptxt}
    ...  2. ${hubspot_headertxt}  ${hubspot_helpTxt}  3. ${csv_headertxt}  ${csv_helptxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    click element until enabled   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}
    ...  ${deploypopup_csvtxt}  ${deployPopup_hubspotTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    wait until page contain elements   @{elements}
    click element until enabled  ${deploy_confirmbtn}


Step 4 results with mailchimp, hubspot and csv
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_hubspot}  ${results_mailchimp}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_csvdownloadbtn}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mailchimpdeploymentstatus}  ${results_hubspotDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...    ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...     ${results_SubscribersTab}
    wait until page contain elements  @{elements}
    verify the dates inverted are present
    Capture the Screen  ${campName}-Step4
    Change campaigns performance chart to 12months
    Verify elements on campaigns performance tab
    Mailchimp redeployment check
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



Step 2 select mobilenoti, mailchimp and facebook
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    run keyword if   '${count}' == '0'   log  No Mobile Notification
    ...  ELSE  Verify dropdown and select ALL for selected channel  Mobile Notification
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    Verify dropdown and select ALL for selected channel  Mailchimp
    click element until enabled  ${campaigns_channel_fbcheckbox}
    Verify dropdown and select ALL for selected channel  Facebook
    page should contain element  ${saveCampaign}
    click element until enabled   ${next_btn_}
    sleep  5
    [Return]  ${count}

Step 3 deploy with mobilenoti, mailchimp and facebook
    [Arguments]  ${campName}  ${segment}  ${Mobile_count}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  ${mailchimp_headertxt}  ${mailchimp_helptxt}  ${fb_headertxt}  ${fb_helptxt}
    ...  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling   ${Mobile_count}
    click element until enabled   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}  ${deploypopup_ciqmobilenottxt}
    ...  ${deployPopup_fbTxt}
    wait until page contains multiple text  @{txt}
    run keyword if  '${Mobile_count}' == '0'   log  Mobile notification not available
    ...  ELSE   page should contain element   ${deploypopup_ciqmobilenottxt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    wait until page contain elements  @{elements}
    click element until enabled  ${deploy_confirmbtn}


Step 4 results with mobilenoti, mailchimp and facebook
    [Arguments]  ${campName}  ${seletedSegment}   ${Mobile_count}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...    ${results_mailchimp}  ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mailchimpdeploymentstatus}  ${results_facebookdeploymentstatus}
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
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mailChimp}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_facebook}
    log  Mobile notification redeployment functions - eventDriven
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Competitor Visit Minutes   7.24*10Hz   America/Denver (Mountain)
    ...  AND  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
    Mailchimp redeployment check
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

##MC, FB & csv


Step 2 select malichimp, facebook and csv
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    click element until enabled  ${campaigns_channel_fbcheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    click element until enabled  ${campaigns_channel_csvdownloadcheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
    page should contain element  ${saveCampaign}
    click element until enabled   ${next_btn_}
    sleep  5

Step 3 deploy with mailchimp, facebook and csv
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(1)
    @{txt}=  Create list  1. ${mailchimp_headertxt}  ${mailchimp_helptxt}  2. ${fb_headertxt}  ${fb_helptxt}
    ...  3. ${csv_headertxt}  ${csv_helptxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    click element until enabled   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}
    ...  ${deployPopup_fbTxt}  ${deploypopup_csvtxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    wait until page contain elements  @{elements}
    click element until enabled  ${deploy_confirmbtn}


Step 4 results with mailchimp, facebook and csv
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...  ${results_mailchimp}  ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_csvdownloadbtn}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mailchimpdeploymentstatus}  ${results_facebookDeploymentStatus}
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
    Mailchimp redeployment check
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

##mn csv and hubspot



Step 2 select MobileNoti, csv and hubspot
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    run keyword if   '${count}' == '0'   log  No Mobile Notification
    ...  ELSE  Verify dropdown and select ALL for selected channel  Mobile Notification
    click element until enabled  ${campaigns_channel_csvdownloadcheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    Verify dropdown and select ALL for selected channel  Hubspot
    page should contain element  ${saveCampaign}
    click element until enabled   ${next_btn_}
    sleep  5
    [Return]  ${count}

Step 3 deploy with MobileNoti, csv and hubspot
    [Arguments]  ${campName}  ${segment}  ${Mobile_count}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  ${hubspot_headertxt}  ${hubspot_helpTxt}  ${csv_headertxt}  ${csv_helpTxt}
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling   ${Mobile_count}
    log  CCL-40895
    Step 3 for event driven  Speed Test Minutes   4.24*10Hz   America/Los_Angeles (West Coast)  ${Mobile_count}
    click element until enabled   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_csvtxt}  ${deploypopup_hubspottxt}
    ...  ${deployPopup_hubspotTxt}
    wait until page contains multiple text  @{txt}
    run keyword if  '${Mobile_count}' == '0'   log  Mobile notification not available
    ...  ELSE   page should contain element   ${deploypopup_ciqmobilenottxt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    wait until page contain elements  @{elements}
    click element until enabled  ${deploy_confirmbtn}


Step 4 results with MobileNoti, csv and hubspot
    [Arguments]  ${campName}  ${seletedSegment}  ${Mobile_count}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...   ${results_mailchimp}  ${results_hubspot}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_csvDownLoadBtn}  ${results_inProgress}   ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}  ${results_hubspotdeploymentstatus}
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
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_hubspot}
    log  Mobile notification redeployment functions - eventDriven
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Competitor Visit Minutes   8.24*10Hz   America/Los_Angeles (West Coast)
    ...  AND  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
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

##HB, FB, and CSV


Step 2 select FB, Hubspot and csv
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_fbcheckbox}
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    click element until enabled  ${campaigns_channel_csvdownloadcheckbox}
     Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    Verify dropdown and select ALL for selected channel  Hubspot
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}

Step 3 validate and click deploy popup for FB, Hubspot and csv
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${fb_headertxt}  ${fb_helptxt}
    ...  2. ${hubspot_headertxt}  ${hubspot_helpTxt}  3. ${csv_headertxt}  ${csv_helptxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}
    ...  ${deployPopup_fbTxt}  ${deploypopup_csvtxt}  ${deployPopup_hubspotTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for FB, Hubspot and csv
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
    ...   ${results_facebookDeploymentStatus}  ${results_hubspotDeploymentStatus}
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

#Mn, Fb and Hb


Step 2 select Mobile Noti, Fb and Hubspot
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    click element until enabled  ${campaigns_channel_fbcheckbox}
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    run keyword if   '${count}' == '0'   log  No Mobile Notification
    ...  ELSE  Verify dropdown and select ALL for selected channel  Mobile Notification
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    Verify dropdown and select ALL for selected channel  Hubspot
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    [Return]   ${count}

Step 3 validate and click deploy popup for Mobile noti, Fb and Hubspot
    [Arguments]  ${campName}  ${segment}  ${Mobile_count}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list   ${fb_headertxt}  ${fb_helptxt}
    ...  ${hubspot_headertxt}  ${hubspot_helpTxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling  ${Mobile_count}
    Step 3 for event driven  Speed Test Minutes   7.24*10Hz   America/New_York (East Coast)  ${Mobile_count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}
    ...  ${deployPopup_fbTxt}    ${deployPopup_hubspotTxt}
    wait until page contains multiple text  @{txt}
    run keyword if  '${Mobile_count}' == '0'   log  Mobile notification not available
    ...  ELSE   page should contain element   ${deploypopup_ciqmobilenottxt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for Mobile noti, Fb and Hubspot
    [Arguments]  ${campName}  ${seletedSegment}  ${Mobile_count}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...    ${results_hubspot}  ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}   ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_facebookDeploymentStatus}  ${results_hubspotDeploymentStatus}
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
    log  Mobile notification redeployment functions - eventDriven
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Speed Test Minutes   4.24*10Hz   UTC
    ...  AND  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
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

#Mn,fb,csv


Step 2 select Mobile Noti, Fb and CSV
   [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    click element until enabled  ${campaigns_channel_fbcheckbox}
    click element until enabled  ${campaigns_channel_csvdownloadcheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    run keyword if   '${count}' == '0'   log  No Mobile Notification
    ...  ELSE  Verify dropdown and select ALL for selected channel  Mobile Notification
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    [Return]  ${count}

Step 3 validate and click deploy popup for Mobile Noti, Fb and CSV
    [Arguments]  ${campName}  ${segment}   ${Mobile_segmentsize}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list   ${fb_headertxt}  ${fb_helptxt}
    ...    ${csv_headertxt}  ${csv_helptxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling  ${Mobile_segmentsize}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}
    ...  ${deployPopup_fbTxt}  ${deploypopup_csvtxt}
    run keyword if  '${Mobile_segmentsize}' == '0'   log  Mobile notification not available
    ...  ELSE   page should contain element   ${deploypopup_ciqmobilenottxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for Mobile Noti, Fb and CSV
    [Arguments]  ${campName}  ${seletedSegment}   ${Mobile_segmentsize}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...   ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_csvdownloadbtn}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_facebookDeploymentStatus}
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
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_facebook}
    log  Mobile notification redeployment functions - eventDriven
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Speed Test Minutes   5.24*10Hz   America/New_York (East Coast)
    ...  AND  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
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

##Mc,Fb,Hb



Step 2 select mailchimp, fb and hubspot
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    click element until enabled  ${campaigns_channel_fbcheckbox}
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    Verify dropdown and select ALL for selected channel  Hubspot
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}

Step 3 validate and click deploy popup for mailchimp, fb and hubspot
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${mailchimp_headertxt}  ${mailchimp_helptxt}  2. ${fb_headertxt}  ${fb_helptxt}
    ...  3. ${hubspot_headertxt}  ${hubspot_helpTxt}
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}
    ...  ${deployPopup_fbTxt}   ${deployPopup_hubspotTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for mailchimp, fb and hubspot
    [Arguments]  ${campName}  ${seletedSegment}
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
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mailChimp}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_facebook}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_hubspot}
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

#Mn,Mc,Fb


Step 2 select mobile noti, mailchimp and facebook
    [Arguments]  ${campName}
    Set Library Search Order  seleniumlibrary
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    click element until enabled  ${campaigns_channel_fbcheckbox}
     Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    Verify dropdown and select ALL for selected channel  Mobile Notification
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    [Return]  ${count}

Step 3 validate and click deploy popup for mobile noti, mailchimp and facebook
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  2. ${mailchimp_headertxt}  ${mailchimp_helptxt}  3. ${fb_headertxt}  ${fb_helptxt}
    ...  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling
    Step 3 for event driven  Competitor Visit Minutes   5.24*10Hz   UTC
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}  ${deploypopup_ciqmobilenottxt}
    ...  ${deployPopup_fbTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for mobile noti, mailchimp and facebook
    [Arguments]  ${campName}  ${seletedSegment}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...   ${results_mailchimp}  ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}    ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mobilenoti}   ${results_mobileNotiSubTitles_schedule}  ${results_mobileNotiSubTitles_segmentMembers}  ${results_mobileNotiSubTitles_notificationsSent}
    ...  ${results_mailchimpdeploymentstatus}  ${results_facebookDeploymentStatus}
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
    log  Mobile notification redeployment functions - eventDriven
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Competitor Visit Minutes   4.24*10Hz   UTC
    ...  AND  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
    Mailchimp redeployment check
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




-------------------4ChannelsCombinationKeywords



##Keys
##Mn,Mc,Hb,Csv
Step 2 select MobileNoti, Mailchimp, Hubspot and CSV
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    click element until enabled  ${campaigns_channel_csvdownloadcheckbox}
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Facebook
    run keyword if   '${count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify dropdown and select ALL for selected channel  Mobile Notification
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    Verify dropdown and select ALL for selected channel  Hubspot
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    [Return]   ${count}

Step 3 validate and click deploy for MobileNoti, Mailhcimp, Hubspot and CSV
    [Arguments]  ${campName}  ${segment}  ${Mobile_count}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  ${mailchimp_headertxt}  ${mailchimp_helptxt}
    ...  ${hubspot_headertxt}  ${hubspot_helpTxt}   ${csv_headertxt}  ${csv_helptxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling  ${Mobile_count}
    Step 3 for event driven  Service Limit Hits   9.24*10Hz   America/Denver (Mountain)  ${Mobile_count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}
    ...  ${deploypopup_csvtxt}  ${deployPopup_hubspotTxt}
    wait until page contains multiple text  @{txt}
    run keyword if  '${Mobile_count}' == '0'   log  Mobile notification not available
    ...  ELSE   page should contain element   ${deploypopup_ciqmobilenottxt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for MobileNoti, Mailhcimp, Hubspot and CSV
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
    ...  ${results_mailchimpdeploymentstatus}  ${results_hubspotDeploymentStatus}
    ...  ${results_segmentsdownloadbtn}  ${results_segmentsexpand}
    ...  ${results_totalrevenuetab}
#    ...  ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}  ${results_totalrevlb}  ${results_maxrevlb}
#    ...   ${results_SubscribersTab}
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
    log  Mobile notification redeployment functions - eventDriven
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Speed Test Minutes   6.24*10Hz   America/Chicago (Central)
    ...  AND  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
    Mailchimp redeployment check
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


##Mc,Fb,Hb,Csv
Step 2 select Mailhcimp, Facebook, Hubspot and CSV
    [Arguments]  ${campName}
     Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    click element until enabled  ${campaigns_channel_fbcheckbox}
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    click element until enabled  ${campaigns_channel_csvdownloadcheckbox}
    Verify dropdown and select ALL for selected channel  Facebook
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    Verify dropdown and select ALL for selected channel  Hubspot
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}

Step 3 validate and click deploy for Mailhcimp, Facebook, Hubspot and CSV
    [Arguments]  ${campName}  ${segment}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  1. ${mailchimp_headertxt}  ${mailchimp_helptxt}  2. ${fb_headertxt}  ${fb_helptxt}
    ...  3. ${hubspot_headertxt}  ${hubspot_helpTxt}  4. ${csv_headertxt}  ${csv_helptxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}
    ...  ${deployPopup_fbTxt}  ${deploypopup_csvtxt}  ${deployPopup_hubspotTxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for Mailhcimp, Facebook, Hubspot and CSV
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
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mailChimp}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_facebook}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_hubspot}
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

##Mn,Fb,Hb,Csv
Step 2 select MobileNoti, Facebook, Hubspot and CSV
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    click element until enabled  ${campaigns_channel_fbcheckbox}
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    click element until enabled  ${campaigns_channel_csvdownloadcheckbox}
    Verify dropdown and select ALL for selected channel  Facebook
    run keyword if   '${count}' == '0'   log  No Mobile Notification
    ...  ELSE   Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mobile Notification
    Verify dropdown and select ALL for selected channel  Hubspot
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    [Return]   ${count}

Step 3 validate and click deploy for MobileNoti, Facebook, Hubspot and CSV
    [Arguments]  ${campName}  ${segment}  ${Mobile_count}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list   2. ${fb_headertxt}  ${fb_helptxt}
    ...  3. ${hubspot_headertxt}  ${hubspot_helpTxt}  4. ${csv_headertxt}  ${csv_helptxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling   ${Mobile_count}
    Step 3 for event driven  Speed Test Minutes   4.24*10Hz   America/Los_Angeles (West Coast)   ${Mobile_count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}
    ...  ${deployPopup_fbTxt}  ${deploypopup_csvtxt}  ${deployPopup_hubspotTxt}
    wait until page contains multiple text  @{txt}
    run keyword if  '${Mobile_count}' == '0'   log  Mobile notification not available
    ...  ELSE   page should contain element   ${deploypopup_ciqmobilenottxt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for MobileNoti, Facebook, Hubspot and CSV
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
    ...  ${results_facebookDeploymentStatus}  ${results_hubspotDeploymentStatus}
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
    log  Mobile notification redeployment functions - eventDriven
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Speed Test Minutes   7.24*10Hz   America/Denver (Mountain)
    ...  AND  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
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


##Mn,Mc,Fb,Csv
Step 2 select MobileNoti, Mailchimp, Facebook and CSV
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    click element until enabled  ${campaigns_channel_fbcheckbox}
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    click element until enabled  ${campaigns_channel_csvdownloadcheckbox}
    Verify dropdown and select ALL for selected channel  Facebook
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    run keyword if  '${count}' == '0'   log  Mobile notification not available
    ...  ELSE   Verify dropdown and select ALL for selected channel  Mobile Notification
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Download CSV
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    [Return]   ${count}

Step 3 validate and click deploy for MobileNoti, Mailchimp, Facebook and CSV
    [Arguments]  ${campName}  ${segment}   ${Mobile_count}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  ${mailchimp_headertxt}  ${mailchimp_helptxt}  ${fb_headertxt}  ${fb_helptxt}
    ...  ${csv_headertxt}  ${csv_helptxt}  Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling   ${Mobile_count}
    Step 3 for event driven  Service Limit Hits   8.24*10Hz   America/Chicago (Central)   ${Mobile_count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}
    ...  ${deployPopup_fbTxt}  ${deploypopup_csvtxt}
    wait until page contains multiple text  @{txt}
    run keyword if  '${Mobile_count}' == '0'   log  Mobile notification not available
    ...  ELSE   page should contain element   ${deploypopup_ciqmobilenottxt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 4 results screen verification for MobileNoti, Mailchimp, Facebook and CSV
    [Arguments]  ${campName}  ${seletedSegment}   ${Mobile_count}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...    ${results_mailchimp}  ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}  ${results_csvdownloadbtn}  ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mailchimpdeploymentstatus}  ${results_facebookDeploymentStatus}
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
    log  Mobile notification redeployment functions - eventDriven
    ${status}  MobileNoti redeployment check
    Run Keyword If  ${status}  Run Keywords
    ...  Re-deploy MobileNotification
    ...  AND  Mobile notification review form filling
    ...  AND  Event driven for redeployment  Service Limit Hits   7.24*10Hz   America/Denver (Mountain)
    ...  AND  Deploy the mobile notification review
    ...  ELSE  log  no deployment error for MobileNotification...
    Mailchimp redeployment check
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


##Mn,Mc,Fb,Hb
Step 2 select MobileNoti, Mailchimp, Facebook and Hubspot
    [Arguments]  ${campName}
    Verify elements on campaigns step 2 screen
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    click element until enabled  ${campaigns_channel_mailchimpCheckbox}
    click element until enabled  ${campaigns_channel_fbcheckbox}
    click element until enabled  ${campaigns_channel_hubspotCheckbox}
    Verify dropdown and select ALL for selected channel  Facebook
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    Verify dropdown and select ALL for selected channel  Hubspot
    run keyword if   '${count}' == '0'   log  No Mobile Notification
    ...  ELSE  Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mobile Notification
    page should contain element  ${saveCampaign}
    click element until visible   ${next_btn_}
    [Return]   ${count}

Step 3 validate and click deploy for MobileNoti, Mailchimp, Facebook and Hubspot
    [Arguments]  ${campName}  ${segment}   ${Mobile_count}
    sleep  5
    Capture the Screen  ${campName}-Step3
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Capture the Screen  ${campName}-Step3(2)
    @{txt}=  Create list  ${mailchimp_headertxt}  ${mailchimp_helptxt}  ${fb_headertxt}  ${fb_helptxt}
    ...  ${hubspot_headertxt}  ${hubspot_helpTxt}   Image  Preview
    wait until page contains multiple text  @{txt}
    Selected segment should be highlighted in step 3  ${segment}
    Mobile Notifications form filling   ${Mobile_count}
    Step 3 for event driven  Competitor Visit Minutes   7.24*10Hz   America/New_York (East Coast)   ${Mobile_count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsmiltipletxt}  ${deploypopup_mailchimptxt}
    ...  ${deployPopup_fbTxt}   ${deployPopup_hubspotTxt}
    wait until page contains multiple text  @{txt}
    run keyword if  '${Mobile_count}' == '0'   log  Mobile notification not available
    ...  ELSE   page should contain element   ${deploypopup_ciqmobilenottxt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}


Step 4 results screen verification for MobileNoti, Mailchimp, Facebook and Hubspot
    [Arguments]  ${campName}  ${seletedSegment}   ${Mobile_count}
    wait until page contains element  //*[@id='result-segment']//*[contains(text(),'${seletedSegment}')]  80s
    @{txt}=  Create List  ${campName}  ${results_segment}  ${results_segmentSize}  ${results_start}
    ...  ${results_end}  ${results_conversion_target}  ${results_budget}
    ...    ${results_hubspot}  ${results_mailchimp}  ${results_facebook}  ${results_segmentdistbychannel}
    ...  ${results_segmentsDistSubTitle}  ${results_campperformance}
    wait until page contains multiple text  @{txt}
    click element until visible  ${campaigns_refresh}
    sleep  4

    @{elements}=  Create List  ${results_inProgress}   ${results_segmentContent}  ${results_segmentSizeContent}  ${results_startContent}
    ...  ${results_endContent}  ${results_conversion_targetContent}  ${results_budgetContent}
    ...  ${results_mailchimpdeploymentstatus}  ${results_facebookDeploymentStatus}  ${results_hubspotDeploymentStatus}
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



----------------------campaignsEventDrivenKeys



##################EventDrivenKeys

Step 3 deploy MN with event driven- Service Limit Hits(UTC)
    [Arguments]  ${campName}  ${count}
    @{txt}=  Create List  Image  Preview
    wait until page contains multiple text  @{txt}
    Capture the Screen  ${campName}-Step3
    Mobile Notifications form filling  ${count}
    Step 3 for event driven  Service Limit Hits   5.24*10Hz   UTC  ${count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsingletxt}  ${deploypopup_ciqmobilenottxt}
    wait until page contains multiple text  @{txt}

    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 3 deploy MN with event driven- Service Limit Hits(America/Chicago)
    [Arguments]  ${campName}  ${count}
    @{txt}=  Create List  Image  Preview
    wait until page contains multiple text  @{txt}
    Capture the Screen  ${campName}-Step3
    Mobile Notifications form filling   ${count}
    Step 3 for event driven  Service Limit Hits   6.24*10Hz   America/Chicago (Central)  ${count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsingletxt}  ${deploypopup_ciqmobilenottxt}
    wait until page contains multiple text  @{txt}

    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 3 deploy MN with event driven- Service Limit Hits(America/New_York)
    [Arguments]  ${campName}  ${count}
    @{txt}=  Create List  Image  Preview
    wait until page contains multiple text  @{txt}
    Capture the Screen  ${campName}-Step3
    Mobile Notifications form filling  ${count}
    Step 3 for event driven  Service Limit Hits   7.24*10Hz   America/New_York (East Coast)  ${count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsingletxt}  ${deploypopup_ciqmobilenottxt}
    wait until page contains multiple text  @{txt}

    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 3 deploy MN with event driven- Service Limit Hits(America/Denver)
    [Arguments]  ${campName}  ${count}
    @{txt}=  Create List  Image  Preview
    wait until page contains multiple text  @{txt}
    Capture the Screen  ${campName}-Step3
    Mobile Notifications form filling  ${count}
    Step 3 for event driven  Service Limit Hits   8.24*10Hz   America/Denver (Mountain)  ${count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsingletxt}  ${deploypopup_ciqmobilenottxt}
    wait until page contains multiple text  @{txt}

    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 3 deploy MN with event driven- Service Limit Hits(America/LA)
    [Arguments]  ${campName}  ${count}
    @{txt}=  Create List  Image  Preview
    wait until page contains multiple text  @{txt}
    Capture the Screen  ${campName}-Step3
    Mobile Notifications form filling  ${count}
    Step 3 for event driven  Service Limit Hits   9.24*10Hz   America/Los_Angeles (West Coast)  ${count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsingletxt}  ${deploypopup_ciqmobilenottxt}
    wait until page contains multiple text  @{txt}

    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

--------------------Competitor Visit Minutes


Step 3 deploy MN with event driven- Competitor Visit Minutes(UTC)
    [Arguments]  ${campName}  ${count}
    @{txt}=  Create List  Image  Preview
    wait until page contains multiple text  @{txt}
    Capture the Screen  ${campName}-Step3
    Mobile Notifications form filling  ${count}
    Step 3 for event driven  Competitor Visit Minutes   5.24*10Hz   UTC  ${count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsingletxt}  ${deploypopup_ciqmobilenottxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 3 deploy MN with event driven- Competitor Visit Minutes(America/Chicago)
    [Arguments]  ${campName}  ${count}
    @{txt}=  Create List  Image  Preview
    wait until page contains multiple text  @{txt}
    Capture the Screen  ${campName}-Step3
    Mobile Notifications form filling  ${count}
    Step 3 for event driven  Competitor Visit Minutes   6.24*10Hz   America/Chicago (Central)  ${count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsingletxt}  ${deploypopup_ciqmobilenottxt}
    wait until page contains multiple text  @{txt}

    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 3 deploy MN with event driven- Competitor Visit Minutes(America/New_York)
    [Arguments]  ${campName}  ${count}
    @{txt}=  Create List  Image  Preview
    wait until page contains multiple text  @{txt}
    Capture the Screen  ${campName}-Step3
    Mobile Notifications form filling  ${count}
    Step 3 for event driven  Competitor Visit Minutes   7.24*10Hz   America/New_York (East Coast)  ${count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsingletxt}  ${deploypopup_ciqmobilenottxt}
    wait until page contains multiple text  @{txt}

    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 3 deploy MN with event driven- Competitor Visit Minutes(America/Denver)
    [Arguments]  ${campName}  ${count}
    @{txt}=  Create List  Image  Preview
    wait until page contains multiple text  @{txt}
    capture the screen  ${campName}-step3
    Mobile Notifications form filling  ${count}
    Step 3 for event driven  Competitor Visit Minutes   8.24*10Hz   America/Denver (Mountain)  ${count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsingletxt}  ${deploypopup_ciqmobilenottxt}
    wait until page contains multiple text  @{txt}

    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 3 deploy MN with event driven- Competitor Visit Minutes(America/LA)
    [Arguments]  ${campName}  ${count}
    @{txt}=  Create List  Image  Preview
    wait until page contains multiple text  @{txt}
    Capture the Screen  ${campName}-Step3
    Mobile Notifications form filling  ${count}
    Step 3 for event driven  Competitor Visit Minutes   9.24*10Hz   America/Los_Angeles (West Coast)  ${count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsingletxt}  ${deploypopup_ciqmobilenottxt}
    wait until page contains multiple text  @{txt}

    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}


--------------Speed Test Minutes
Step 3 deploy MN with event driven- Speed Test Minutes(UTC)
    [Arguments]  ${campName}    ${count}
    @{txt}=  Create List  Image  Preview
    wait until page contains multiple text  @{txt}
    Capture the Screen  ${campName}-Step3
    Mobile Notifications form filling  ${count}
    Step 3 for event driven  Speed Test Minutes   5.24*10Hz   UTC  ${count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsingletxt}  ${deploypopup_ciqmobilenottxt}
    wait until page contains multiple text  @{txt}

    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 3 deploy MN with event driven- Speed Test Minutes(America/Chicago)
    [Arguments]  ${campName}
    @{txt}=  Create List  Image  Preview
    wait until page contains multiple text  @{txt}
    Capture the Screen  ${campName}-Step3
    Mobile Notifications form filling  ${count}
    Step 3 for event driven  Speed Test Minutes   6.24*10Hz   America/Chicago (Central)  ${count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsingletxt}  ${deploypopup_ciqmobilenottxt}
    wait until page contains multiple text  @{txt}

    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 3 deploy MN with event driven- Speed Test Minutes(America/New_York)
    [Arguments]  ${campName}   ${Mobile_count}
    @{txt}=  Create List  Image  Preview
    wait until page contains multiple text  @{txt}
    Capture the Screen  ${campName}-Step3
    Mobile Notifications form filling  ${Mobile_count}
    Step 3 for event driven  Speed Test Minutes   7.24*10Hz   America/New_York (East Coast)  ${Mobile_count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsingletxt}  ${deploypopup_ciqmobilenottxt}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 3 deploy MN with event driven- Speed Test Minutes(America/Denver)
    [Arguments]  ${campName}  ${count}
    @{txt}=  Create List  Image  Preview
    wait until page contains multiple text  @{txt}
    Capture the Screen  ${campName}-Step3
    Mobile Notifications form filling  ${count}
    Step 3 for event driven  Speed Test Minutes   8.24*10Hz   America/Denver (Mountain)  ${count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsingletxt}  ${deploypopup_ciqmobilenottxt}
    wait until page contains multiple text  @{txt}

    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

Step 3 deploy MN with event driven- Speed Test Minutes(America/LA)
    [Arguments]  ${campName}  ${count}
    @{txt}=  Create List  Image  Preview
    wait until page contains multiple text  @{txt}
    Capture the Screen  ${campName}-Step3
    Mobile Notifications form filling  ${count}
    Step 3 for event driven  Speed Test Minutes   9.24*10Hz   America/Los_Angeles (West Coast)  ${count}
    click element until visible   ${deploy-btn}
    @{txt}=  Create List  ${deploypopupheader}  ${deploypopup_actionsingletxt}  ${deploypopup_ciqmobilenottxt}
    wait until page contains multiple text  @{txt}

    @{elements}=  Create List  ${deploypopup}  ${deploy_cancelbtn}  ${deploy_confirmbtn}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${deploy_confirmbtn}

___________

expand segment distribution widget and validate
    [Documentation]   CCL-63905_08 - Verify the Total Audience Distribution chart
    click element until visible  ${results_segmentsexpand}
    @{txt}=  Create List  ${results_segmentdistbychannel}  ${results_segmentsDistSubTitle}
    wait until page contains multiple text  @{txt}
    @{elements}=  Create List  ${results_segmentwidget_fullview_dloadbtn}  ${results_segmentwidget_fullview_closebtn}
    wait until page contain elements  @{elements}
    ${num}=    Generate random string    5    0123456789
    ${Screenshot_Audience}=  set variable   ${num}-Step4
    Capture the Screen  ${Screenshot_Audience}
    capture the screen   segDistFullview
    get the data from bar graph widget without api call  ${results_segmentwidget_fullview_barxpath}  ${results_segmentwidget_fullview_tooltip}
    click element until visible  ${results_segmentwidget_fullview_closebtn}
    sleep  5

expand segment revenue widget and validate
    [Arguments]  ${segRev}
    click element until visible  ${Results_RevTab_SegRev_expandBtn}
    sleep  5
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    page should contain the element  ${results_segmentRevenueHeaderTxt}
    @{elements}=  Create List
    ...  ${Results_RevTab_SegRev_expanded_dLoadBtn}  ${Results_RevTab_SegRev_expanded_closeBtn}
#    ...  ${Results_RevTab_SegRev_expanded_yaxisTitle}  ${Results_RevTab_SegRev_expanded_legend1}  ${Results_RevTab_SegRev_expanded_legend2}
    wait until page contain elements  @{elements}
    capture the screen   segRevFullview
    ${count}=  get text  ${Results_RevTab_SegRev_expanded_subTitle}
    should be equal   ${count}   ${segRev}
    click element until visible  ${Results_RevTab_SegRev_expanded_closeBtn}
    sleep  3

expand and validate segment revenue widget for csv only
    click element until visible  ${results_segmentrevenue_expandbtn}
    sleep  5
    page should contain the element  ${results_segmentRevenueHeaderTxt}
    @{elements}=  Create List    ${results_segmentrevenue_csvonly_fullview_dloadbtn}  ${results_segmentrevenue_csvonly_fullview_closebtn}
#    ...  ${results_segmentrevenue_csvOnly_fullview_lgndbtn}
    wait until page contain elements  @{elements}
#    ${count}=  get text  ${results_segmentrevenue_fullview_subtitle}
    capture the screen   segRevFullview-csv
    click element until visible  ${results_segmentrevenue_csvonly_fullview_closebtn}
    sleep  3

expand total revenue widget and validate
    [Arguments]   ${totlRev}
    click element until visible  ${Results_RevTab_TotlRev_expandBtn}
    sleep  5
    page should contain the element  ${results_totalrevenuetxt}
    @{elements}=  Create List
    ...  ${Results_RevTab_TotlRev_expanded_dLoadBtn}  ${Results_RevTab_TotlRev_expanded_closeBtn}
#    ...  ${Results_RevTab_TotlRev_expanded_legend1}  ${Results_RevTab_TotlRev_expanded_legend2}  ${Results_RevTab_TotlRev_expanded_yaxisTitle}
    wait until page contain elements  @{elements}
    capture the screen   totlRevFullview
    ${count}=  get text  ${Results_RevTab_TotlRev_expanded_subTitle}
    should be equal   ${count}   ${totlRev}
    click element until visible  ${Results_RevTab_TotlRev_expanded_closeBtn}
    sleep  3


expand segment subscribers widget and validate
    [Arguments]   ${segmntSubs}
    click element until visible  ${Results_SubsTab_SegSubs_expandBtn}
    sleep  5
    page should contain the element  ${results_segmentSubsTxt}
    @{elements}=  Create List
    ...  ${Results_SubsTab_SegSubs_expanded_dLoadBtn}  ${Results_SubsTab_SegSubs_expanded_closeBtn}
#    ...  ${Results_SubsTab_SegSubs_expanded_legend1}  ${Results_SubsTab_SegSubs_expanded_yaxisTitle}
    wait until page contain elements  @{elements}
    capture the screen   totalSubsFullview
    ${count}=  get text  ${Results_SubsTab_SegSubs_expanded_subTitle}
    should be equal   ${count}   ${segmntSubs}
    click element until visible  ${Results_SubsTab_SegSubs_expanded_closeBtn}
    sleep  3

expand total subsribers widget and validate
    [Arguments]   ${totalSubs}
    click element until visible  ${Results_SubsTab_TotlSubs_expandBtn}
    sleep  5
    page should contain the element  ${results_totalsubstxt}
    @{elements}=  Create List
    ...  ${Results_SubsTab_TotlSubs_expanded_dLoadBtn}  ${Results_SubsTab_TotlSubs_expanded_closeBtn}
#    ...  ${Results_SubsTab_TotlSubs_expanded_legend1}  ${Results_SubsTab_TotlSubs_expanded_yaxisTitle}
    wait until page contain elements  @{elements}
    capture the screen   totalSubsFullview
    ${count}=  get text  ${Results_SubsTab_TotlSubs_expanded_subTitle}
    should be equal   ${count}   ${totalSubs}
    click element until visible  ${Results_SubsTab_TotlSubs_expanded_closeBtn}
    sleep  3


Compare uploaded image link with image inside mobile
    ${previewImg}=  get webelement  ${mobilenoti_previewimage}
    ${previewImgLink}=  call method  ${previewImg}  get_attribute  src

    ${ImgInsideMobile}=  get webelement  ${mobilenoti_previewimageinmobile}
    ${imgInsideMobileLink}=  call method  ${ImgInsideMobile}  get_attribute  src

    Should be equal as strings  ${previewImgLink}  ${imgInsideMobileLink}


Compare text entered in notification field with text displayed inside mobile notification
    [Arguments]  ${notificationName}
    ${notificationTxtInsideMobile}=  get the text from the element  ${insidemobile_notificationmessage}
    Should Be Equal As Strings  "${notificationTxtInsideMobile}"  "${notificationName}"

Naviagate to New Campaigns Tab
    click element until visible  ${new_campaign_btn}
    click element until visible  ${locators_params['Campaigns']['Scheduled_campaign']}[Select_campaign]

Select the Recommented segments
    sleep  5
    click element until visible   ${define_segment}
    sleep  15
    click element until visible    ${segment_casualUsers}

Click on the Region dropdown and validate the list with API
    click element until visible  ${define_regiondropdown}
    sleep  2
#    ${response}=   call method    ${CMCconnectionObj}    NewCampaign_Filter_Region
#    Fail if list contains duplicates  regionDropdownList  ${define_dropdownList}
#    @{Get_RegionList}=   Get WebElements  //*[contains(@class, 'ng-option ng-star-inserted')]
#    FOR  ${get_RegionList}  IN   @{Get_RegionList}
#    ${RegionList_Text}=   get text    ${get_RegionList}
#    log to console    ${RegionList_Text}
#    ${ConvertAPI}=    convert to string   ${response}[1]
#    should contain any    ${ConvertAPI}    ${RegionList_Text}
#    END
#    click element until enabled  ${define_regionALL}

Click on the Location dropdown and validate the list with API
    click element until visible  ${define_locationDropdown}
    sleep  2
#    ${response}=   call method    ${CMCconnectionObj}    NewCampaign_Filter_Location
#    Fail if list contains duplicates  locationDropdownList  ${define_dropdownList}
#    @{Get_LocationList}=   Get WebElements  //*[contains(@class, 'ng-option ng-star-inserted')]
#    FOR  ${get_LocationList}  IN   @{Get_LocationList}
#    ${LocationList_Text}=   get text    ${get_LocationList}
#    log to console    ${LocationList_Text}
#    ${ConvertAPI}=    convert to string   ${response}[1]
#    should contain any    ${ConvertAPI}    ${LocationList_Text}
#    END
#    click element until visible  ${define_locationAll}


Click on the Service dropdown and validate the list with API
    click element until visible  ${define_serviceDropdown}
    sleep  2
#    ${response}=   call method    ${CMCconnectionObj}    NewCampaign_Filter_Service
#    Fail if list contains duplicates  serviceDropdownList  ${define_dropdownList}
#    @{Get_LocationList}=   Get WebElements  //*[contains(@class, 'ng-option ng-star-inserted')]
#    FOR  ${get_LocationList}  IN   @{Get_LocationList}
#    ${LocationList_Text}=   get text    ${get_LocationList}
#    log to console    ${LocationList_Text}
#    ${ConvertAPI}=    convert to string   ${response}[1]
#    should contain any    ${ConvertAPI}    ${LocationList_Text}
#    END
#    click element until visible  ${define_serviceAll}

Click on the Propensity dropdown and validate the list with API
    click element until visible  ${define_propensityDropdown}
    sleep  2
#    ${response}=   call method    ${CMCconnectionObj}    NewCampaign_Filter_Propensity
#    Fail if list contains duplicates  propensityDropdownList  ${define_dropdownList}
#    @{Get_LocationList}=   Get WebElements  //*[contains(@class, 'ng-option ng-star-inserted')]
#    FOR  ${get_LocationList}  IN   @{Get_LocationList}
#    ${LocationList_Text}=   get text    ${get_LocationList}
#    log to console    ${LocationList_Text}
#    ${ConvertAPI}=    convert to string   ${response}[1]
#    should contain any    ${ConvertAPI}    ${LocationList_Text}
#    END
#    click element until visible  ${define_propensityAll}

Campaign name from the API list
    ${response}=   call method    ${CMCconnectionObj}    Campaign_New
    log to console    ${response}[1]

Saved Segments name from the API list
    ${response}=   call method    ${CMCconnectionObj}    Segments_Saved
    log to console    ${response}[1]

Search Subscriber total count from API
    ${response}=   call method    ${CMCconnectionObj}    SEARCH_SubscriberCount
    log to console    ${response}[1]


Search and delete the created campaign
    [Documentation]  CCL-49628
    [Arguments]  ${campaignName}
    naviagate to campaigns tab
    wait until page contains element  ${campaigns_searchfield}  60s
    enter the value untill visible  ${campaigns_searchfield}  ${campaignName}
    wait until page contains element  //*[text()='${campaignName}']   60s
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_btn]
    ${Delete_header}=  get text   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_header]
    ${Delete_help_txt}=  get text   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_help_txt]
    ${Delete_btn_txt}=  get text   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_cnfrm_btn]
    ${Delete_cancel_txt}=  get text   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_cancel_btn]
    should be equal   ${Delete_header}    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Delete_txt]
    should be equal   ${Delete_help_txt}   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Delete_help_txt]
    should be equal   ${Delete_btn_txt}   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Delete_txt]
    should be equal   ${Delete_cancel_txt}   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Cancel_txt]
    ${num}=   generate random string   3    0123456789
    Capture the Screen   ${Delete_header}${num}
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_cancel_btn]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_btn]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Popup_close_btn]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_btn]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_cnfrm_btn]
    wait until page contains   ${campaigns_deleteSuccessMsg}  60s
    wait until page contains element  ${campaigns_pagination_tableentriesinfo}  60s
    sleep  5s
    clear element text  ${campaigns_searchfield}
    enter the value untill visible  ${campaigns_searchfield}  ${campaignName}
    wait until page contains  ${campaigns_zeroEntries}  60s
    capture the screen  ${campaignName}deleted

Click on a campaign and verify its navigated to campaigns creation screen
    [Arguments]  ${campaignName}
    naviagate to campaigns tab
    wait until page contains element  ${campaigns_searchfield}  60s
    enter the value untill visible  ${campaigns_searchfield}  ${campaignName}
    wait until page contains element  //*[text()='${campaignName}']   60s
    capture the screen  table-${campaignName}
    click element until visible  //*[text()='${campaignName}']
    @{elements}=  create list  //*[text()='${campaignName}']   ${define_tab}  ${channel_tab}
    ...  ${deploy_tab}  ${results_tab}
    wait until page contain elements  @{elements}
    capture the screen  clicked-${campaignName}

Expected data not available in dropdown
    log  Expected data not available in dropdown..


Verify checkboxes should be selected
    [Arguments]  ${checkboxList}
    FOR  ${checkbox}  IN  @{checkboxList}
    checkbox should be selected  ${checkbox}
    END

Verify checkboxes should not be selected
    [Arguments]  ${checkboxList}
    FOR  ${checkbox}  IN  @{checkboxList}
    checkbox should not be selected  ${checkbox}
    END


Verify dropdown and select NON-MOBILE MESSAGE for selected channel
    [Arguments]  ${channel}
    Match the segment size with includes  ${channel}
    ${status}=  Run Keyword And Return Status  element should be visible  //*[text()='${channel}']/following-sibling::td[2]//*[contains(@class,'listdata')]//span
    Run Keyword If  ${status}  Select NON-MOBILE MESSAGE from the channel dropdown  ${channel}
    ...  ELSE  log  No channel dropdown present


Select the Mobile Notification Checkbox
    [Documentation]  CCL-58822  Check and Select the Mobile Notification checkbox
    ${Segment_count}=  get text  ${channel_count_mobile}
    run keyword if   '${Segment_count}' == '0'   run keyword   Mobile Notifcation count
    ...  ELSE   click element until enabled  ${campaigns_channel_mobileMsgCheckBox}
    [Return]    ${Segment_count}

Verify dropdown and select ALL for selected channel
    [Arguments]  ${channel}
    [Documentation]  CCL-58822  Check and Select the Mobile Notification dropdown
    run keyword if   '${channel}' == 'Mobile Notification'   run keyword    Verify the Dropdown for Mobile Notification   ${channel}
    ...  ELSE    Verify dropdown and select ALL for selected channels in Channels page   ${channel}

Verify the Dropdown for Mobile Notification
    [Documentation]    Dropdown Validation
    [Arguments]  ${channel}
    ${Segment_Mobi_count}=  get text  ${channel_count_mobile}
    run keyword if   '${Segment_Mobi_count}' != '0'   run keyword   Verify dropdown and select ALL for selected channels in Channels page  ${channel}
    ...  ELSE    log   Mobile Notification Segment value is 0

Verify dropdown and select ALL for selected channels in Channels page
    [Documentation]    Dropdown Validation and select all in the list
    [Arguments]  ${channel}
    Match the segment size with includes  ${channel}
    ${status}=  Run Keyword And Return Status  element should be visible  //*[text()='${channel}']/following-sibling::td[2]//*[contains(@class,'listdata')]//span
    Run Keyword If  ${status}  Select ALL from the channel dropdown  ${channel}
    ...  ELSE  log  No channel dropdown present

Match the segment size with includes
    [Arguments]  ${channel}
    log  CCL-46093
    ${segmentsize}  get text  //*[text()='${channel}']/following-sibling::td[1]
    ${segSize}  remove string  ${segmentsize}  ,

    ${includessize}  get text  //*[text()='${channel}']/following-sibling::td[2]//*
    ${inclSize}  remove string  ${includessize}  ,  All  (  )  ${SPACE}  Non-MobileMessage
    should be equal as strings  "${segSize}"   "${inclSize}"

Select NON-MOBILE MESSAGE from the channel dropdown
    [Arguments]  ${channel}
    click element  //*[text()='${channel}']/following-sibling::td[2]//*[contains(@class,'listdata')]//span
    click element until visible  ${campaigns_channeldropdown_nonmobmessagebtn}

Select ALL from the channel dropdown
    [Arguments]  ${channel}
    click element  //*[text()='${channel}']/following-sibling::td[2]//*[contains(@class,'listdata')]//span
    click element until visible  ${campaigns_channeldropdown_allbtn}


Verify the months dropdown
    [Documentation]   CCL-63905_12 - Verify the Chart for various month
    @{listMonths}=  Create List  Past 1 month  Past 3 months  Past 6 months  Past 12 months
    FOR  ${month}  IN  @{listMonths}
    click element until visible  ${results_monthsdropdown}
    click element until visible  //*[contains(@class,'scroll-host')]//*[text()='${month}']
    END


Verify the segments size in campaigns step 2
#    @{segmentsList}=  Create List  ${campaigns_channel_segmentSize1_mailchimp}  ${campaigns_channel_segmentSize2_fb}  ${campaigns_channel_segmentSize3_mobileNoti}
#    ...  ${campaigns_channel_segmentSize4_hubspot}  ${campaigns_channel_segmentSize5_csv}
    @{elements}=  get webelements  //tbody//tr//td[3]
    FOR  ${segment}  IN  @{elements}
    ${size}=  get text  ${segment}
    should contain any  ${size}  1  2  3  4  5  6  7  8  9  0
    END


verify the dates inverted are present
    ${current_date}=   Get Current Date   result_format=%Y-%m-%d
    ${2DaysAfterDate}=   Get Current Date   result_format=%Y-%m-%d   increment= +2 days
    @{datesList}=  Create List  ${current_date}  ${2DaysAfterDate}
    wait until page contains multiple text   @{datesList}


Mobile Notifications form filling
    [Documentation]   CCL-58822  Check the Mobile Notification form filling
    [Arguments]   ${mobile_segment_count}
    run keyword if   '${mobile_segment_count}' == '0'  run keyword   Mobile Notificaion Not available
    ...  ELSE  Mobile Notification channel form for Triggered Campaign   ${mobile_segment_count}

Mobile Notificaion Not available
    [Documentation]   CCL-58822  If segment size is 0 mobile notification not available in deploy page
    @{elements}=   Create List  ${mobile_message_notificationName}   ${mobile_message_link}  ${insidemobile_commandicon}
    ...   ${mobile_message_shedule}
    ...   ${mobile_message_title}
    Page Should Not Contain Multiple Element  @{elements}
    capture the screen  Mobile field not available

Mobile Notification channel form
    [Documentation]   Mobile Notification textfield filling
    @{elements}=   Create List  ${mobile_message_notificationName}   ${mobile_message_link}  ${insidemobile_commandicon}
    ...   ${mobile_message_shedule}
    ...   ${mobile_message_title}
    Wait Until Page Contain Elements  @{elements}
    ${num}=  generate random string  4  1234567890
    ${numA}=  generate random string  4  1234567890
    ${notificationName}=  set variable  ${numA}Calix_Cloud${num}
    Enter the Value Untill Visible  ${mobile_message_notificationName}  ${notificationName}
    Compare text entered in notification field with text displayed inside mobile notification  ${notificationName}
    Enter the Value Untill Visible  ${mobile_message_link}  https://cloud-stg.calix.com/
    sleep  1
    Execute Javascript    document.getElementById('file-upload').removeAttribute('hidden')
    Choose File   ${mobile_message_browse}   ${CURDIR}${img_file_path}
    sleep  5
    compare uploaded image link with image inside mobile


Mouse over Total revenue pendo and verify the text - resultsScreen
    click element  (${exploreData_pendo_questionIcons})[1]
    wait until page contains   ${results_totalRevenue_PendoHelpTxt}
    capture the screen  campTotalRev-pendo
    click element until visible  ${pendo_close}

Validate segment distribution pendo - resultsScreen
    ${status}=  Run Keyword And Return Status  element should be visible  (//*[@id='_pendo-badge_mv__rrqoYnaeWCyWIIl0MbZHJpg'])[1]
    Run Keyword If  ${status}   click and validate segment distribution pendo
    ...  ELSE  log  pendo not availble in internal..

click and validate segment distribution pendo
    click element  (${exploreData_pendo_questionIcons})[3]
    wait until page contains   ${results_segments_pendoHelpTxt}
    capture the screen  segmentDist-pendo
    click element until visible  ${pendo_close}

Selected segment should be highlighted in step 3
    [Arguments]  ${segment}
    @{elements}=  get webelements  //*[@class='cus-bottom']/following-sibling::p//b
    FOR  ${element}  IN  @{elements}
    element should contain  ${element}  ${segment}
    END

MobileNoti redeployment check
    ${status}=  Run Keyword And Return Status  element should be visible   (//*[@class='box_cont'])[10]//*[contains(text(),'Deployment Status')]/following-sibling::div//label[contains(text(),'Error')]
    [Return]  ${status}

Re-deploy MobileNotification
    Extract and print error cause for MobileNoti redeployment
    click element until visible  ${results_mobileNoti_redeployBtn}
    Verify elements on mobileNoti redeploy popup
    click element until visible  ${results_redeploy_popupRedeployBtn}

Verify elements on mobileNoti redeploy popup
     @{popup_txt}=  Create List  ${deploypopup_actionsingletxt}  ${results_mobileNoti_redeployPopupTitle}
    ...  ${results_mobileNoti_redeployPopup_Descrption}
    wait until page contains multiple text  @{popup_txt}

    @{elements}=  Create List  ${channel_alertClose}
    ...   ${results_redeploy_popupRedeployBtn}   ${deploy_cancelbtn}
    Wait Until Page Contain Elements  @{elements}
    capture the screen  mobile-noti-RedeployPopup

Mailchimp redeployment check
    ${status}=  Run Keyword And Return Status  element should be visible   //*[@class='title_with_bar']//*[contains(text(),'Mailchimp')]/following-sibling::div//*//*[contains(text(),'Error')]
    Run Keyword If  ${status}  Re-deploy Mailchimp
    ...  ELSE  log  no deployment error for Mailchimp..

Re-deploy Mailchimp
    Extract and print error cause for Mailchimp redeployment
    click element until visible  ${results_Mailchimp_redeployBtn}
    Verify elements on Mailchimp redployment popup
    click element until visible  ${results_redeploy_popupRedeployBtn}
#    @{elements}=  Create List  ${channel_alertClose}
#    ...   ${results_redeploy_popupRedeployBtn}   ${deploy_cancelbtn}
#    Page Should Not Contain Multiple Element  @{elements}
    sleep  8
    Run Keyword And Ignore Error  element should not contain  ${results_facebookDeploymentStatus}  Error


Verify elements on Mailchimp redployment popup
    @{popup_txt}=  Create List  ${deploypopup_actionsingletxt}  ${results_Mailchimp_redeployPopupTitle}
    ...  ${results_Mailchimp_redeployPopup_Descrption}
    wait until page contains multiple text  @{popup_txt}

    @{elements}=  Create List  ${channel_alertClose}
    ...   ${results_redeploy_popupRedeployBtn}   ${deploy_cancelbtn}
    Wait Until Page Contain Elements  @{elements}
    capture the screen  MailchimpRedeployPopup

Facebook redeployment check
    ${status}=  Run Keyword And Return Status  element should be visible   //*[@class='title_with_bar']//*[contains(text(),'Facebook')]/following-sibling::div//*//*[contains(text(),'Error')]
    Run Keyword If  ${status}  Re-deploy facebook
    ...  ELSE  log  no deployment error for facebook..

Re-deploy facebook
    Extract and print error cause for Facebook redeployment
    click element until visible  ${results_facebook_redeployBtn}
    Verify elements on facebook redeployment poupup
    click element until visible  ${results_redeploy_popupRedeployBtn}
#    @{elements}=  Create List  ${channel_alertClose}
#    ...   ${results_redeploy_popupRedeployBtn}   ${deploy_cancelbtn}
#    Page Should Not Contain Multiple Element  @{elements}
    sleep  8
    run keyword and ignore error  element should not contain  ${results_facebookDeploymentStatus}  Error

Verify elements on facebook redeployment poupup
    @{popup_txt}=  Create List  ${deploypopup_actionsingletxt}  ${results_facebook_redeployPopupTitle}
    ...  ${results_facebook_redeployPopup_Descrption}
    wait until page contains multiple text  @{popup_txt}

    @{elements}=  Create List  ${channel_alertClose}
    ...   ${results_redeploy_popupRedeployBtn}   ${deploy_cancelbtn}
    Wait Until Page Contain Elements  @{elements}
    capture the screen  fbRedeployPopup

Hubspot redeployment check
    ${status}=  Run Keyword And Return Status  element should be visible   //*[@class='title_with_bar']//*[contains(text(),'HubSpot')]/following-sibling::div//*//*[contains(text(),'Error')]
    Run Keyword If  ${status}  Re-deploy Hubspot
    ...  ELSE  log  no deployment error for hubspot..

Re-deploy Hubspot
    Extract and print error cause for Hubspot redeployment
    click element until visible  ${results_hubspot_redeployBtn}
    Verify elements on Hubspot redployment popup
    click element until visible  ${results_redeploy_popupRedeployBtn}
#    @{elements}=  Create List  ${channel_alertClose}
#    ...   ${results_redeploy_popupRedeployBtn}   ${deploy_cancelbtn}
#    Page Should Not Contain Multiple Element  @{elements}
    sleep  8
    Run Keyword And Ignore Error  element should not contain  ${results_hubspotDeploymentStatus}  Error


Verify elements on Hubspot redployment popup
    @{popup_txt}=  Create List  ${deploypopup_actionsingletxt}  ${results_hubspot_redeployPopupTitle}
    ...  ${results_hubspot_redeployPopup_Descrption}
    wait until page contains multiple text  @{popup_txt}

    @{elements}=  Create List  ${channel_alertClose}
    ...   ${results_redeploy_popupRedeployBtn}   ${deploy_cancelbtn}
    Wait Until Page Contain Elements  @{elements}
    capture the screen  HubspotRedeployPopup

Constantcontact redeployment check
    ${status}=  Run Keyword And Return Status  element should be visible   //*[@class='title_with_bar']//*[contains(text(),'Constant Contact')]/following-sibling::div//*//*[contains(text(),'Error')]
    Run Keyword If  ${status}  Re-deploy ConstantContact
    ...  ELSE  log  no deployment error for constantContact..

Re-deploy ConstantContact
    Extract and print error cause for ConstantContact redeployment
    click element until visible  ${results_consContact_redeployBtn}
    Verify elements on ConstantContact redployment popup
    click element until visible  ${results_redeploy_popupRedeployBtn}
#    @{elements}=  Create List  ${channel_alertClose}
#    ...   ${results_redeploy_popupRedeployBtn}   ${deploy_cancelbtn}
#    Page Should Not Contain Multiple Element  @{elements}
    sleep  8
    Run Keyword And Ignore Error  element should not contain  ${results_consContactDeploymentStatus}  Error

Verify elements on ConstantContact redployment popup
    @{popup_txt}=  Create List  ${deploypopup_actionsingletxt}  ${results_consContact_redeployPopupTitle}
    ...  ${results_consContact_redeployPopup_Descrption}
    wait until page contains multiple text  @{popup_txt}

    @{elements}=  Create List  ${channel_alertClose}
    ...   ${results_redeploy_popupRedeployBtn}   ${deploy_cancelbtn}
    Wait Until Page Contain Elements  @{elements}
    capture the screen  constantContactRedeployPopup

Mobile notification review form filling
    Verify elements on Mobile notification review popup
    ${num}=  generate random string  4  1234567890
    ${numA}=  generate random string  4  1234567890
    ${notificationName}=  set variable  ${numA}Calix_Cloud${num}
    Enter the Value Untill Visible  ${results_mobileNoti_review_notiMsgField}  ${notificationName}
    Compare text entered in notification field with text displayed inside mobile notification  ${notificationName}
    Enter the Value Untill Visible  ${results_mobileNoti_review_linkField}  https://cloud-stg.calix.com/
    Assign Id To Element  ${results_mobileNoti_review_browse}  id=file-upload
    Execute Javascript    document.getElementById('file-upload').removeAttribute('hidden')
    Choose File   ${results_mobileNoti_review_browse}   ${CURDIR}${img_file_path}
    sleep  2
    compare uploaded image link with image inside mobile

Verify elements on Mobile notification review popup
    @{elements}=   Create List  ${results_mobileNoti_review_Title}
    ...  ${results_mobileNoti_review_notiMsgLabel}  ${results_mobileNoti_review_notiMsgField}
    ...  ${results_mobileNoti_review_linkLabel}  ${results_mobileNoti_review_linkField}
    ...  ${results_mobileNoti_review_imageLabel}  ${results_mobileNoti_review_browse}
    ...  ${mobile_message_shedule}   ${results_mobileNoti_review_scheduleLabel}
    ...  ${results_mobileNoti_review_reDeployBtn}  ${results_mobileNoti_review_reDeployCancel}
    Wait Until Page Contain Elements  @{elements}
    capture the screen  ciqReviewPopup

Deploy the mobile notification review
    click element until visible  ${results_mobileNoti_review_reDeployBtn}
    wait until page does not contain element  ${results_mobileNoti_review_Title}
    sleep  8
    element should not contain  ${results_mobileNotiDeploymentStatus}  Error


Event driven for redeployment
    [Arguments]   ${event}  ${threshold}  ${tymZone}
    click element until visible  ${mobile_message_shedule}
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    click element until visible  ${mobileMesssage_shcedule_eventDriven}
#    Redeploy event driven with empty fields and validate help messages
    click element until visible  ${mobile_message_event}
    click element until visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${event}')]
    capture the screen  ${event}
    enter the value untill visible  ${mobile_message_thresh}  ${threshold}
    click element until visible  ${mobile_message_notification}
    @{timePickerElements}=  Create List  ${mobile_message_notification_hour}  ${mobile_message_notification_mins}  ${mobile_message_notification_amPm}
    Wait Until Page Contain Elements  @{timePickerElements}
    click element until visible  (//span[contains(@class,'up')])[2]
    click element until visible  ${timeZone_clockIcon}
    click element until visible  ${mobile_message_timezone}
    click element until visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${tymZone}')]
    capture the screen  redep-${tymZone}

Redeploy event driven with empty fields and validate help messages
    click element until visible   ${results_mobileNoti_review_reDeployBtn}
    @{txt}=  Create List  ${eventrequired_helpmsg}  ${thresholdrequired_helpmsg}
    ...  ${timezonerequired_helpmsg}  ${notificationtimerequired_helpmsg}
    wait until page contains multiple text  @{txt}
    capture the screen  redep-eventsHelpMessages

Extract and print error cause for MobileNoti redeployment
    ${errorMsg}=  get text  ${results_mobileNoti_redeployErrorElement}
    log  ${errorMsg}

Extract and print error cause for Mailchimp redeployment
    ${errorMsg}=  get text  ${results_mailchimp_deploymentErrorMsgElement}
    log  ${errorMsg}

Extract and print error cause for Facebook redeployment
    ${errorMsg}=  get text  ${results_facebook_deploymentErrorMsgElement}
    log  ${errorMsg}

Extract and print error cause for ConstantContact redeployment
    ${errorMsg}=  get text  ${results_consContact_deploymentErrorMsgElement}
    log  ${errorMsg}

Extract and print error cause for hubspot redeployment
    ${errorMsg}=  get text  ${results_hubspot_deploymentErrorMsgElement}
    log  ${errorMsg}

Verify selected channels present in xaxis labels of Segment distribution
    [Arguments]  ${channelName}
    @{elements}=  get webelements  ${results_segmentDist_xAxisLabels}
    @{channelsList}=  Create List
    FOR  ${element}  IN  @{elements}
    ${channel}=  get text  ${element}
    append to list  ${channelsList}  ${channel}
    END
    list should contain value  ${channelsList}  ${channelName}

Change campaigns performance chart to 12months
    [Documentation]  To verify all data and legend buttons, data from past months is viewed
    click element until visible  ${results_monthsdropdown}
    click element until visible  //*[contains(@class,'scroll-host')]//*[text()='Past 12 months']

Verify elements on campaigns performance tab
    log  CCL-45251
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    @{elements}=  create list   ${Results_RevTab}
    ...   ${results_monthsdropdown}  ${results_campperiod}  ${results_prepostcampperiod}
    ...   ${Results_RevTab_SegRev_Title}    ${Results_RevTab_SegRev_dLoadBtn}
    ...   ${Results_RevTab_SegRev_expandBtn}
#    ...  ${Results_RevTab_SegRev_yaxisTitle}  ${Results_RevTab_SegRev_subTitle}   ${Results_RevTab_SegRev_legend1}  ${Results_RevTab_SegRev_legend2}
    ...   ${Results_RevTab_TotlRev_Title}    ${Results_RevTab_TotlRev_dLoadBtn}
    ...   ${Results_RevTab_TotlRev_expandBtn}
#    ...  ${Results_RevTab_TotlRev_yaxisTitle}   ${Results_RevTab_TotlRev_subTitle}  ${Results_RevTab_TotlRev_legend1}  ${Results_RevTab_TotlRev_legend2}
    ...   ${Results_SubsTab}
    wait until page contain elements  @{elements}
    capture the screen  campPerformance


Campaigns performance tab validation
    Verify elements on campaigns performance tab
    Revenue tab validation under Campaigns performance
    Subscribers tab validation under Campaigns performance

Revenue tab validation under Campaigns performance
    [Documentation]   CCL-68655   Revenue tab validation for Scheduled
    click element until visible   ${Results_RevTab}
    Verify the months dropdown
    @{Snapshot}=  Create List   ${test_data_config['env']['Campaigns']['All_Campaign']}[results_totalaudTxt]   ${test_data_config['env']['Campaigns']['All_Campaign']}[results_segmentAverageHeaderTxt]
    page should not contain multiple text   @{Snapshot}
    Mouse over Total revenue pendo and verify the text - resultsScreen
    ${segRev}=  get text  ${Results_RevTab_SegRev_subTitle}
    expand segment revenue widget and validate   ${segRev}
    ${totlRev}=  get text  ${Results_RevTab_TotlRev_subTitle}
    expand total revenue widget and validate   ${totlRev}

Subscribers tab validation under Campaigns performance
    log  CCL-44676
    click element until visible  ${results_SubscribersTab}
    Change campaigns performance chart to 12months
    @{elements1}=  create list  ${results_monthsdropdown}    ${results_totalsubslb}
    Wait Until Page Contain Elements  @{elements1}
    Verify the months dropdown
    ${segmntSubs}=  get text  ${Results_SubsTab_SegSubs_subTitle}
    expand segment subscribers widget and validate   ${segmntSubs}
    ${totalSubs}=  get text  ${Results_SubsTab_TotlSubs_subTitle}
    expand total subsribers widget and validate   ${totalSubs}

Verfy segment revenue count and legends visible
    ${segRev}=  get text  ${Results_RevTab_SegRev_subTitle}
    log  ${segRev}
    @{segRevLegends}=  create list  ${Results_RevTab_SegRev_legend1}  ${Results_RevTab_SegRev_legend2}
    wait until page contain elements  @{segRevLegends}

Verfy total revenue count and legends visible
    ${totlRev}=  get text  ${Results_RevTab_TotlRev_subTitle}
    log  ${totlRev}
    @{totlRevLegends}=  create list  ${Results_RevTab_TotlRev_legend1}  ${Results_RevTab_TotlRev_legend2}
    wait until page contain elements  @{totlRevLegends}

Verfy segment subscribers count and legends visible
    ${segmntSubs}=  get text  ${Results_SubsTab_SegSubs_subTitle}
    log  ${segmntSubs}
    wait until page contains element  ${Results_SubsTab_SegSubs_legend1}  10s

Verfy total subscribers count and legends visible
    ${totalSubs}=  get text  ${Results_SubsTab_TotlSubs_subTitle}
    log  ${totalSubs}
    wait until page contains element  ${Results_SubsTab_TotlSubs_legend1}  10s

Verify the ECB in Deploy Page
    [Documentation]   Verify the ECB Redirect link should be Present in Campaign-Deploy Page for Mailchip, Facebook, Hubspot and Constant Contact
    ${FB_check_status}=  Run Keyword And Return Status   Element Should Be Visible    ${FB_available_check}
    Run Keyword IF    '${FB_check_status}' == 'True'   Run Keywords    click element until visible  ${FB_ECB_link}
    ...  AND  Verify the ECB Page
    ...  ELSE   log   Facebook not available
    ${MC_check_status}=  Run Keyword And Return Status   Element Should Be Visible    ${MC_available_check}
    Run Keyword IF    '${MC_check_status}' == 'True'   Run Keywords    click element until visible  ${MC_ECB_link}
    ...  AND  Verify the ECB Page
    ...  ELSE   log   Mailchip not available
    ${HS_check_status}=  Run Keyword And Return Status   Element Should Be Visible    ${HS_available_check}
    Run Keyword IF    '${HS_check_status}' == 'True'   Run Keywords    click element until visible  ${HS_ECB_link}
    ...  AND  Verify the ECB Page
    ...  ELSE   log   Hubspot not available
    ${CC_check_status}=  Run Keyword And Return Status   Element Should Be Visible    ${CC_available_check}
    Run Keyword IF    '${CC_check_status}' == 'True'   Run Keywords    click element until visible  ${CC_ECB_link}
    ...  AND  Verify the ECB Page
    ...  ELSE   log   Constant Contact not available

Verify the ECB Page
    [Documentation]   ECB Portal page should be visible after switch the Window
    Switch window   ${ECB_pagetitle}
    ${current_URL}=   get location
    Should be equal   ${current_URL}   ${ECB_redirectURL}
    ${num}=  generate random string  2  1234567890
    capture the screen   ECB redirect login${num}
    @{CC_elements}=   Create List    ${CC_username}    ${CC_password}   ${CC_loginbtn}
    wait until page contain elements  @{CC_elements}
    @{Campaign}=   get window titles
    ${Switch_window}=  get from list   ${Campaign}   0
    Switch window   ${Switch_window}

Logout & Login to the Application and Navigate to CMC
    [Documentation]   Logout and login the Application in middle of the Class due to Session Timeout Exception
    logout the Application
    Launch the Application and navigate to cmc

Mobile Notifcation count
    [Documentation]   CCL-58822  Keyword for mobile notification segment size 0
    log  Mobile App Size is 0
    assign id to element     ${campaigns_channel_mobileMsgCheckBox}    id=mobile_checkbox
    ${check_status}=  Execute Javascript  return $("#mobile_checkbox").is(":checked")
    should not be true   ${check_status}
    ${num}=   generate random string   3    0123456789
    capture the screen  Mobile Notification checkbox-${num}

Verify the Service Limit Hits in Triggered Campaign
    [Documentation]    Service Limit Hits in Treiggered Campaign
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    Service_${PO_Number}
    Verify the Navigation for Triggered Campaign button
    Create the Service Limit Hit   ${campName}
    Pause and Edit the SLH  ${campName}
    Verify the SLH in Active Status  ${campName}
    Delete the Service Limit Hits  ${campName}

Verify the Navigation for Triggered Campaign button
    [Documentation]   CCL-63903_02,CCL-68673_16 - Page should navigate to New Triggered Campaign page
    click element until visible  ${locators_params['Campaigns']['Triggered_campaign']}[Tab]
    Verify page title for Triggered campaigns screen
    ${num}=   generate random string   3    0123456789
    Capture the Screen   Triggered landing page-${num}
    click element until visible  ${locators_params['Campaigns']}[new_campaign_btn]
    Verify the New Campaign button Dropdown
    ${num}=   generate random string   4    0123456789
    Capture the Screen   Campaign Dropdown-${num}
    click element until visible  ${locators_params['Campaigns']['Triggered_campaign']}[Select_campaign]

Verify the New Campaign button Dropdown
    [Documentation]   CCL-63903_01 - Page should Triggered and Schedule Campaign button Popup
    @{List}=  Create List  ${test_data_config['env']['Campaigns']}[Sched_campaign_drop]  ${test_data_config['env']['Campaigns']}[Trigg_campaign_drop]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']}[Campaigns_types]   @{List}

Create the Service Limit Hit
    [Documentation]    Verify the Service Limit Hits for Draft Status
    [Arguments]   ${CampName}
    Step 1 Define Page for Triggered Campaigns   ${CampName}
    ${count}=  Step 2 select Mobile Noti and Mailchimp for SLH   ${CampName}
    Step 3 deploy with MN and mailchimp for Service Limit Hits   ${CampName}  ${count}
    Step 4 results with mailchimp for Service Limit Hits   ${CampName}  ${count}

Step 1 Define Page for Triggered Campaigns
    [Documentation]  Define page Validations
    [Arguments]   ${Campname}
    Verify the Define Page for Service Limit Hits
    Fill in the Define page details   ${Campname}

Verify the Define Page for Service Limit Hits
    [Documentation]    CCL-63903_03,CCL-70864-01 - Define Page for Service Limit Hits elements should be visible
    @{Test_datas}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Campaign_name]    ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_segment]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Trigger_type]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Budget_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Target_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Start_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[End_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Define_Header_path]   @{Test_datas}
    click element until visible     ${locators_params['Campaigns']['Triggered_campaign']}[Trigger_drop]
    @{After_Trigger}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Competitor_type]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Service_type]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Speed_type]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Trigger_names]   @{After_Trigger}
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Service_type]
    @{Trigger_txt}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Instance_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Resend_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Inst_Do_not_path]   @{Trigger_txt}
    capture page screenshot   After select Service
    Validate the Default Threshold values
    @{Trigger_help_txt}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Trigger_help_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Impact_help_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Help_txt]   @{Trigger_help_txt}
    page should not contain element  ${locators_params['Campaigns']['Triggered_campaign']}[Impact_camp_btn]
    ${num}=   generate random string   4    0123456789
    capture the screen    Impact_not_found-${num}

Validate the Default Threshold values
    [Documentation]   CCL-70864-02  Validation for Threshold and Periods value
    Textfield value should be    ${locators_params['Campaigns']['Triggered_campaign']}[Instance_Input_field]     ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Instance_default]
    Textfield value should be    ${locators_params['Campaigns']['Triggered_campaign']}[Resend_Input_field]     ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Resend_default]
    ${num}=   generate random string   4    0123456789
    capture the screen    Default_value-${num}

Fill in the Define page details
    [Documentation]   CCL-63903_04,CCL-70864-06,CCL-70864-10 - All fields should be filled
    [Arguments]   ${Campname}
    Enter the Value Untill Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_name_input]     ${Campname}
    Enter the Value Untill Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Instance_Input_field]     ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Instance_invalid]
    Enter the Value Untill Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Resend_Input_field]     ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Resend_invalid]
    @{Trigger_help_txt}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Instance_warn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Resend_warn]
    page should contain multiple text   @{Trigger_help_txt}
    Capture the Screen    ${Campname}-Warning_InsRe
    Enter the Value Untill Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Instance_Input_field]     ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Instance_valid]
    Enter the Value Untill Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Resend_Input_field]     ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Resend_valid]
    Enter the Value Untill Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Budget_Input_field]     ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Budget_Input]
    Enter the Value Untill Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Target_Input_field]     ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Target_Input]
    Click Element Until Visible     ${locators_params['Campaigns']['Triggered_campaign']}[Start_Input_field]
    ${num}=   generate random string   4    0123456789
    capture the screen    Date Fields-${num}
    ${current_date}=   Get Current Date   result_format=%m-%d-%Y
    Enter the Value Untill Visible  ${locators_params['Campaigns']['Triggered_campaign']}[Start_Input_field]  ${current_date}
    click element until visible      ${locators_params['Campaigns']['Triggered_campaign']}[testData_highLightedDate]
    wait until elements are visible  ${locators_params['Campaigns']['Triggered_campaign']}[Close_btn]
    wait until page does not contain element    ${locators_params['Campaigns']['Triggered_campaign']}[Previous_btn]
    capture the screen    ${Campname}-Define page Triggered
    ${Save_btn_name}=  Get the Text from the Element    ${locators_params['Campaigns']['Triggered_campaign']}[Save_cmp_btn]
    should be equal    ${Save_btn_name}    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Save_cmp_txt]
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Save_cmp_btn]
    wait until page contains    Campaign Defined Successfully!.  30s
    wait until page contains element   ${locators_params['Campaigns']['Triggered_campaign']}[Draft_Status]   60s
    page should not contain element  ${locators_params['Campaigns']['Triggered_campaign']}[Impact_camp_btn]
    ${Draft_name}=  Get the Text from the Element    ${locators_params['Campaigns']['Triggered_campaign']}[Draft_Status]
    should be equal    ${Draft_name}    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Draft_txt]
    ${Next_btn_name}=  Get the Text from the Element    ${locators_params['Campaigns']['Triggered_campaign']}[Next_btn]
    should be equal    ${Next_btn_name}    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Next_txt]
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Next_btn]

Step 2 select Mobile Noti and Mailchimp for SLH
    [Documentation]   CCL-63903_06,CCL-63903_07,CCL-63903_08,CCL-63903_09 - Page should redirect to Channel page
    [Arguments]  ${campName}
    Verify elements on Channel screen for Service Limit Hits   ${campName}
    page should not contain element   ${locators_params['Campaigns']['Triggered_campaign']}[Next_btn]
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    verify dropdown and select ALL for selected channel  Mobile Notification
    click element until enabled  ${locators_params['Campaigns']['Triggered_campaign']}[Mailchimp_checkbox]
    Verify dropdown and select NON-MOBILE MESSAGE for selected channel  Mailchimp
    page should contain element   ${locators_params['Campaigns']['Triggered_campaign']}[Save_cmp_btn]
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Next_btn]
    sleep  5
    [Return]   ${count}

Verify elements on Channel screen for Service Limit Hits
    [Documentation]    CCL-68673_13 Verify the Channel page elements in Draft-SLH
    [Arguments]  ${campName}
    @{elements}=   Create List    ${locators_params['Campaigns']['Triggered_campaign']}[Previous_btn]   ${locators_params['Campaigns']['Triggered_campaign']}[All_checkbox]
    ...  ${locators_params['Campaigns']['Triggered_campaign']}[Mailchimp_checkbox]    ${locators_params['Campaigns']['Triggered_campaign']}[Mobile_checkbox]
    Wait Until Elements Are Visible    @{elements}
    @{Channel_headers}=   create list    ${EMPTY}   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Channel_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Segment_txt]
    ...  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Includes_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Description_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Channel_header]    @{Channel_headers}
    @{Channel_elements}=  create list    ${locators_params['Campaigns']['Triggered_campaign']}[Next_btn]    ${locators_params['Campaigns']['Triggered_campaign']}[Save_cmp_btn]
    Elements Should Not Visible    @{Channel_elements}
    page should contain   ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[Channel_head]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_name_define]   ${campName}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Draft_Status]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Draft_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Previous_btn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Previous_txt]
    @{txt}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_desc]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mailchimp_desc]
    wait until page contains multiple text  @{txt}
    ${num}=   generate random string   2    0123456789
    Capture the Screen    Channel_triggered${num}

Step 3 deploy with MN and mailchimp for Service Limit Hits
    [Documentation]    CCL-63903_10 - Verify the Deploy page
    [Arguments]  ${campName}   ${Mobi_Segmentcount}
    ${num}=   generate random string   4    0123456789
    Capture the Screen  Step3-${num}
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Verify the Deploy page Elements and text   ${campName}
    Mobile Notifications form filling  ${Mobi_Segmentcount}
    Verify the Mailchimp Event Name
    run keyword if  '${Mobi_Segmentcount}' == '0'   Verify the Deploy Popup for Triggered
    ...  ELSE   Verify the Deploy Popup for Triggered with Mobile

Verify the Mailchimp Event Name
    [Documentation]   CCL-65806_01,CCL-65806_02,CCL-65806_03 - Verify the Mailchimp Event Name with Alphabets, Numbers and Special chracter
    Enter the Value Untill Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Event_name]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Event_Invalid_name]
    textfield value should be    ${locators_params['Campaigns']['Triggered_campaign']}[Event_name]    _-
    capture page screenshot   Invalid_event_name
    Enter the Value Untill Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Event_name]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Event_Valid_name]
    capture page screenshot   Valid_event_name

Verify the Deploy page Elements and text
    [Documentation]    Verify the Deploy page elements in Draft-SLH
    [Arguments]  ${campName}
    sleep  10s
    @{Deploy_elements}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[mailchimp_headerTxt]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Event_name_txt]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Event_help_txt]
    page should contain multiple text   @{Deploy_elements}
    element should contain   ${locators_params['Campaigns']['Triggered_campaign']}[Service_seg_path]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[mailchimp_helpTxt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Note_path]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Note_helpTxt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[ECB_path]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[ECB_helpTxt]
    Verify the ECB in Deploy Page
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_name_define]   ${campName}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Draft_Status]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Draft_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Previous_btn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Previous_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Deploy_btn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Deploy_txt]

Verify the Deploy Popup for Triggered
    [Documentation]    Verify the Deploy page Popup
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Deploy_btn]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Popup_deploy_header]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Deploy_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Popup_action]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Deploy_help_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Popup_audience]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Deploy_audience_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Popup_cnfrm_btn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Deploy_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Popup_cncl_btn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Cancel_txt]
    ${num}=   generate random string   2    0123456789
    Capture the Screen   Triggered-popup-${num}
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Popup_cncl_btn]
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Deploy_btn]
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Popup_cnfrm_btn]

Verify the Deploy Popup for Triggered with Mobile
    [Documentation]    CCL-63903_11 - Verify the Deploy page Popup
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Deploy_btn]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Popup_deploy_header]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Deploy_txt]
    @{Deploy_txt}=  create list   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Deploy_mobile_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Deploy_audience_txt]
    page should contain multiple text  @{Deploy_txt}
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Popup_cnfrm_btn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Deploy_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Popup_cncl_btn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Cancel_txt]
    page should contain   ${deploypopup_actionsmiltipletxt}
    ${num}=   generate random string   2    0123456789
    Capture the Screen   Triggered-popup with mobile-${num}
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Popup_mob_cncl_btn]
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Deploy_btn]
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Popup_mob_cnfrm_btn]

Mobile Notification channel form for Triggered Campaign
    [Documentation]   CCL-63904_01,CCL-63904_02,CCL-63904_03 - Mobile Notification textfield filling
    [Arguments]   ${mobile_segment_count}
    @{elements}=   Create List  ${mobile_message_notificationName}   ${mobile_message_link}  ${insidemobile_commandicon}   ${mobile_message_title}
    Wait Until Page Contain Elements  @{elements}
    page should not contain element   ${mobile_message_shedule}
    ${num}=  generate random string  4  1234567890
    ${numA}=  generate random string  4  1234567890
    ${notificationName}=  set variable  ${numA}Calix_Cloud${num}
    Enter the Value Untill Visible  ${mobile_message_notificationName}  ${notificationName}
    Compare text entered in notification field with text displayed inside mobile notification  ${notificationName}
    Enter the Value Untill Visible  ${mobile_message_link}  https://cloud-stg.calix.com/
    sleep  1
    Execute Javascript    document.getElementById('file-upload').removeAttribute('hidden')
    Choose File   ${mobile_message_browse}   ${CURDIR}${img_file_path}
    sleep  5
    compare uploaded image link with image inside mobile
    Step 3 for event driven  America/New_York (East Coast)   ${mobile_segment_count}

Step 3 for event driven
    [Documentation]   CCL-58822  Select the Event driven
    [Arguments]   ${tymZone}   ${Mobile_segmentsize}
    run keyword if   '${Mobile_segmentsize}' == '0'   log  Event driven not available
    ...  ELSE   Check the Event Driven flow  ${tymZone}

Check the Event Driven flow
    [Documentation]   Verify the Event driven flow
    [Arguments]  ${tymZone}
    sleep  5
    @{elements}=   Create List   ${mobile_message_link}
    ...   ${mobile_message_title}  ${deploy-btn}   ${previous_btn_}
    Wait Until Page Contain Elements  @{elements}
    click element until visible  ${mobile_message_notification}
    @{timePickerElements}=  Create List  ${mobile_message_notification_hour}  ${mobile_message_notification_mins}  ${mobile_message_notification_amPm}
    Wait Until Page Contain Elements  @{timePickerElements}
    click element until visible  (//span[contains(@class,'up')])[2]
    click element until visible  ${timeZone_clockIcon}
    click element until visible  ${mobile_message_timezone}
    click element until visible  //*[contains(@class,'scroll-host')]//*[contains(text(),'${tymZone}')]
    capture the screen  ${tymZone}

Step 4 results with mailchimp for Service Limit Hits
    [Documentation]   CCL-63905_01,CCL-63905_02,CCL-66197,CCL-70965_09 - Verify the Results page in Draft-SLH
    [Arguments]  ${campName}   ${count}
    Sleep  10s
    @{Result_elements}=   create list    ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_segment]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_audience_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_date_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_date_end_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_rate_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Budget_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_header]    @{Result_elements}
    @{Result_mail_elements}=   create list    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Last_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Synced_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Last_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_sent_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_mail_header]    @{Result_mail_elements}
    Verify the text and elements in Result page for SLH   ${campName}
    ${current_date}=   Get Current Date   result_format=%Y-%m-%d
    ${Result_Date_txt}=  Get the Text from the Element    ${locators_params['Campaigns']['Triggered_campaign']}[Result_Date]
    should be equal    ${Result_Date_txt}    ${current_date}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_Rate]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Target_result_Input]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_budget]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Budget_result_Input]
    ${num}=    Generate random string    5    0123456789
    ${Screenshot_result}=  set variable   ${num}-Step4
    Capture the Screen  ${Screenshot_result}
    page should not contain element   ${test_data_config['env']['Campaigns']['All_Campaign']}[results_segmentAverageHeaderTxt]
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[refresh_icon]
    Pause the Service Limit Hits in Result page
    Play the Service Limit Hits in Result page
    sleep  10s
    Change campaigns performance chart to 12months
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mailChimp}
    run keyword if  '${count}' == '0'   log   Mobile notification not available
    ...  ELSE   Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mobileNotification}
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    click on pendo ques icon and verify the text   Totalsub-pendo   ${locators_params['Campaigns']['Triggered_campaign']}[Total_sub_pendo]    ${results_totalrevenue_pendohelptxt}
    Verify the Campaign Performance charts
    Verify the Functions for Audience sync details
    click element until visible  ${campaigns_close_X}

Verify the text and elements in Result page for SLH
    [Documentation]    Verify the Results page elements in Draft-SLH
    [Arguments]   ${campName}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_audience]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_dis_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Active_Status]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_txt]
    ${current_date}=   Get Current Date   result_format=%Y-%m-%d
    ${Audience_help_txt}=  format string   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_help_txt]  Date=${current_date}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_audience_help]   ${Audience_help_txt}
    @{Result_XY_elements}=   create list    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_channel_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Segment_mem_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Subscriber_chart_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Subscriber_chart_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_XYaxis_txt]    @{Result_XY_elements}
    @{Subtitles_elements}=   create list    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Daily_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Total_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_subtitle]    @{Subtitles_elements}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_performance]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Performance_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_segment]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Size_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_total]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Total_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_name_define]   ${campName}
    @{Result_channel_txt}=   create list    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_mail_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_notif_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_mailchimp]    @{Result_channel_txt}

Pause the Service Limit Hits in Result page
    [Documentation]    CCL-68307,CCL-63905_04,CCL-63905_05 - Click the Pause button and Verify the Popup
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Pause_btn]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_pause_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Pause_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Popup_pausehelp_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Pause_help_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_pause_btn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Pause_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_cancel_btn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Cancel_txt]
    ${num}=   generate random string   3    0123456789
    ${Popup_pause}=   set variable   Pause_pop_${num}
    Capture the Screen   ${Popup_pause}
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Result_cancel_btn]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Pause_btn]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Popup_close_btn]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Pause_btn]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Result_pause_btn]
    Sleep   10s
    ${num}=   generate random string   3    0123456789
    ${Popup_After_pause}=   set variable   After_paused${num}
    Capture the Screen   ${Popup_After_pause}

Play the Service Limit Hits in Result page
    [Documentation]   CCL-63905_06,CCL-63905_07 - Unpause the Campaign
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Unpause_btn]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_Unpause_header]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Unpause_header_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Unpause_help_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Unpause_help_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_Unpause_cnfrm_btn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Unpause_header_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_Unpause_cancel_btn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Cancel_txt]
    ${num}=   generate random string   4    0123456789
    Capture the Screen   Unpause-${num}
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Result_Unpause_cancel_btn]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Unpause_btn]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Popup_close_btn]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Unpause_btn]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Result_Unpause_cnfrm_btn]

Verify the Campaign Performance charts
    [Documentation]    CCL-63905_10,CCL-63905_11 - Verify the Campaigna Performance charts in Draft-SLH
    Change campaigns performance chart to 12months
    Verify the months dropdown
    ${Audience_count}=  get text   ${locators_params['Campaigns']['Triggered_campaign']}[Audience_count]
    Expand Campaign Audience Size widget and validate   ${Audience_count}
    ${Subscriber_count}=  get text   ${locators_params['Campaigns']['Triggered_campaign']}[Subscriber_count]
    Expand Total Subscribers widget and validate   ${Subscriber_count}

Expand Campaign Audience Size widget and validate
    [Documentation]    Verify the Campaign Audience Size charts
    [Arguments]    ${Audience_count}
    click element until visible  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_dwnld_btn]
    click element until visible  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_exp_btn]
    sleep  5
    ${Result_segment_txt}=  Get the Text from the Element    ${locators_params['Campaigns']['Triggered_campaign']}[Result_after_segment]
    should be equal    ${Result_segment_txt}    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Size_txt]
    @{elements}=  Create List   ${locators_params['Campaigns']['Triggered_campaign']}[Audience_After_dwnld_btn]  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_After_exp_btn]
    wait until page contain elements  @{elements}
    ${Audience_exp_count}=  get text  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_exp_count]
    should be equal   ${Audience_exp_count}   ${Audience_count}
    ${num}=    Generate random string    5    0123456789
    ${Screenshot_Audience_size}=  set variable   ${num}-Audience
    Capture the Screen  ${Screenshot_Audience_size}
    click element until visible  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_After_dwnld_btn]
    click element until visible  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_After_exp_btn]
    sleep  3

Expand Total Subscribers widget and validate
    [Documentation]    Verify the Total Subscribers charts
    [Arguments]   ${Subscriber_count}
    click element until visible  ${locators_params['Campaigns']['Triggered_campaign']}[Subscriber_dwnld_btn]
    click element until visible  ${locators_params['Campaigns']['Triggered_campaign']}[Subscriber_exp_btn]
    sleep  5
    ${Result_total_txt}=  Get the Text from the Element    ${locators_params['Campaigns']['Triggered_campaign']}[Result_after_total]
    should be equal    ${Result_total_txt}    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Total_txt]
    @{elements}=  Create List   ${locators_params['Campaigns']['Triggered_campaign']}[Subscriber_After_exp_btn]  ${locators_params['Campaigns']['Triggered_campaign']}[Subscriber_After_dwnld_btn]
    wait until page contain elements  @{elements}
    ${Subscriber_exp_count}=  get text  ${locators_params['Campaigns']['Triggered_campaign']}[Subscriber_exp_count]
    should be equal   ${Subscriber_exp_count}   ${Subscriber_count}
    ${num}=    Generate random string    5    0123456789
    ${Screenshot_Subscribers}=  set variable   ${num}-Subscribers
    Capture the Screen  ${Screenshot_Subscribers}
    click element until visible  ${locators_params['Campaigns']['Triggered_campaign']}[Subscriber_After_dwnld_btn]
    click element until visible  ${locators_params['Campaigns']['Triggered_campaign']}[Subscriber_After_exp_btn]
    sleep  3

Pause and Edit the SLH
    [Documentation]    Verify the Active Status in SLH
    [Arguments]  ${campName}
    Verify the Pause and Edit button   ${campName}
    Pause the Service Limit Hits
    Search the Campaign and Verify it's Paused  ${campName}
    Edit the Define Page in Paused Status
    Step 4 results with mailchimp for Service Limit Hits in Paused flow

Verify the Pause and Edit button
    [Documentation]    CCL-67360,CCL-63903_12 - Pause and Edit buttons should be Visible
    [Arguments]   ${campName}
    Enter the Value Untill Visible  ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_search]     ${campName}
    @{Active_show_Elements}=   Create list   ${locators_params['Campaigns']['Triggered_campaign']}[Pause_btn_show]
    ...  ${locators_params['Campaigns']['Triggered_campaign']}[Play_btn_hide]    ${locators_params['Campaigns']['Triggered_campaign']}[Edit_btn]
    wait until page contain elements    @{Active_show_Elements}
    @{Active_hide_elements}=  create list   ${locators_params['Campaigns']['Triggered_campaign']}[Play_btn_show]   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_btn]
    page should not contain multiple element   @{Active_hide_elements}
    @{Search_elements}=   create list    ${campName}   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_mail_txt]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_budget_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Active_name_budget]    @{Search_elements}
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Active_Status]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[SLH_triggered]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Service_type]
    Capture the Screen   ${campName}-Search

Pause the Service Limit Hits
    [Documentation]    CCL-63903_13,CCL-63903_14 - Click the Pause button and Verify the Popup
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Pause_btn_show]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Popup_pause_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Pause_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Popup_pausehelp_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Pause_help_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Popup_pause_btn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Pause_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Popup_cancel_btn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Cancel_txt]
    ${num}=   generate random string   3    0123456789
    ${Popup_pause}=   set variable   Pause_pop_${num}
    Capture the Screen   ${Popup_pause}
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Popup_cancel_btn]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Pause_btn_show]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Popup_close_btn]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Pause_btn_show]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Popup_pause_btn]
    Sleep   10s
    @{Paused_elements}=  create list   ${locators_params['Campaigns']['Triggered_campaign']}[Pause_btn_hide]   ${locators_params['Campaigns']['Triggered_campaign']}[Play_btn_show]
    ...  ${locators_params['Campaigns']['Triggered_campaign']}[Delete_btn]   ${locators_params['Campaigns']['Triggered_campaign']}[Edit_btn]
    Page Should Contain Multiple Element   @{Paused_elements}
    ${num}=   generate random string   3    0123456789
    ${Popup_After_pause}=   set variable   After_paused${num}
    Capture the Screen   ${Popup_After_pause}

Search the Campaign and Verify it's Paused
    [Documentation]    CCL-63903_15 - After Paused Status should be Changed to Paused
    [Arguments]   ${campName}
    Enter the Value Untill Visible  ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_search]     ${campName}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Paused]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Paused_txt]
    @{Search_elements}=   create list    ${campName}   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_mail_txt]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_budget_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Active_name_budget]    @{Search_elements}
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[SLH_triggered]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Service_type]
    ${num}=    Generate random string    5    0123456789
    ${Screenshot_Paused}=  set variable   Search${num}
    Capture the Screen  ${Screenshot_Paused}

Edit the Define Page in Paused Status
    [Documentation]    CCL-63903_16,CCL-70864-04 - Click the Edit button and Verify the Navigation
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Edit_btn]
    @{Test_datas}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Campaign_name]    ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_segment]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Trigger_type]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Budget_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Target_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Start_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[End_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Define_Header_path]   @{Test_datas}
    Enter the Value Untill Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Instance_Input_field]     ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Instance_Pause_Input]
    Enter the Value Untill Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Resend_Input_field]     ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Resend_Pause_Input]
    ${num}=   generate random string   2    0123456789
    Capture the Screen   After Paused Instance resend-${num}
    @{Trigger_txt}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Instance_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Resend_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Inst_Do_not_path]   @{Trigger_txt}
    capture page screenshot   After Paused define page
    @{Trigger_help_txt}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Trigger_help_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Impact_help_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Help_txt]   @{Trigger_help_txt}
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Paused]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Paused_txt]
    wait until page does not contain element    ${locators_params['Campaigns']['Triggered_campaign']}[Previous_btn]
    @{Disabled_elements}=   create list   ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Channel_disabled]    ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Deploy_disabled]
    Wait Until Elements Are Visible     @{Disabled_elements}
    page should not contain element  ${locators_params['Campaigns']['Triggered_campaign']}[Impact_camp_btn]
    ${num}=    Generate random string    5    0123456789
    ${Screenshot_Edit}=  set variable   Active_Pause_Edit${num}
    Capture the Screen  ${Screenshot_Edit}
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Next_btn]

Step 4 results with mailchimp for Service Limit Hits in Paused flow
    [Documentation]    CCL-70965_11,CCL-70965_12 - Verify the Edit flow for Paused-results in SLH
    Sleep  10s
    @{Result_elements}=   create list    ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_segment]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_audience_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_date_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_date_end_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_rate_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Budget_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_header]    @{Result_elements}
    @{Result_mail_elements}=   create list    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Last_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Synced_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Last_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_sent_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_mail_header]    @{Result_mail_elements}
    Verify the text and elements in Result page for SLH in Paused   ${campName}
    ${current_date}=   Get Current Date   result_format=%Y-%m-%d
    ${Result_Date_txt}=  Get the Text from the Element    ${locators_params['Campaigns']['Triggered_campaign']}[Result_Date]
    should be equal    ${Result_Date_txt}    ${current_date}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_Rate]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Target_result_Input]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_budget]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Budget_result_Input]
    ${num}=    Generate random string    5    0123456789
    ${Screenshot_result}=  set variable   ${num}-Step4
    Capture the Screen  ${Screenshot_result}
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[refresh_icon]
    Pause the Service Limit Hits in Result page
    Play the Service Limit Hits in Result page
    Change campaigns performance chart to 12months
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mailChimp}
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mobileNotification}
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    Click on pendo ques icon and verify the text   Totalsub-pendo   ${locators_params['Campaigns']['Triggered_campaign']}[Total_sub_pendo]    ${results_totalrevenue_pendohelptxt}
    Verify the Campaign Performance charts
    Verify the Functions for Audience sync details
    click element until visible  ${campaigns_close_X}

Verify the text and elements in Result page for SLH in Paused
    [Documentation]    Verify the Edit flow for Paused-Results charts in SLH
    [Arguments]   ${campName}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_audience]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_dis_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Paused]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Paused_txt]
    ${current_date}=   Get Current Date   result_format=%Y-%m-%d
    ${Audience_help_txt}=  format string   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_help_txt]  Date=${current_date}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_audience_help]   ${Audience_help_txt}
    @{Result_XY_elements}=   create list    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_channel_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Segment_mem_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Subscriber_chart_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Subscriber_chart_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_XYaxis_txt]    @{Result_XY_elements}
    @{Subtitles_elements}=   create list    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Daily_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Total_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_subtitle]    @{Subtitles_elements}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_performance]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Performance_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_segment]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Size_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_total]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Total_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_name_define]   ${campName}
    @{Result_channel_txt}=   create list    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_mail_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_notif_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_mailchimp]    @{Result_channel_txt}

Verify the SLH in Active Status
    [Documentation]   Campaign should be Resumed
    [Arguments]   ${CampName}
    Click the Play button and Verify the Popup  ${CampName}
    Play the Service Limit Hits
    Search the Campaign and Verify it's Resumed  ${CampName}
    Edit the Define page in Active Status
    Verify the Result page in Active Status

Click the Play button and Verify the Popup
    [Documentation]    CCL-63903_18 - Click the Play button and Verify the Popup
    [Arguments]   ${campName}
    Enter the Value Untill Visible  ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_search]     ${campName}
    @{Active_show_Elements}=   Create list   ${locators_params['Campaigns']['Triggered_campaign']}[Play_btn_show]    ${locators_params['Campaigns']['Triggered_campaign']}[Delete_btn]
    ...  ${locators_params['Campaigns']['Triggered_campaign']}[Pause_btn_hide]    ${locators_params['Campaigns']['Triggered_campaign']}[Edit_btn]
    wait until page contain elements    @{Active_show_Elements}
    page should not contain element  ${locators_params['Campaigns']['Triggered_campaign']}[Pause_btn_show]
    @{Search_elements}=   create list    ${campName}   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_mail_txt]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_budget_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Active_name_budget]    @{Search_elements}
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Paused]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Paused_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[SLH_triggered]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Service_type]
    Capture the Screen   ${campName}-Search before active

Play the Service Limit Hits
    [Documentation]   CCL-63903_19 - Unpause the Campaign
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Play_btn_show]
    ${Play_header}=  get text   ${locators_params['Campaigns']['Triggered_campaign']}[SLH_UnPause_header]
    ${Play_help_txt}=  get text   ${locators_params['Campaigns']['Triggered_campaign']}[Unpause_help_txt]
    ${Play_btn_txt}=  get text   ${locators_params['Campaigns']['Triggered_campaign']}[Unpause_cnfrm_btn]
    ${Play_cancel_txt}=  get text   ${locators_params['Campaigns']['Triggered_campaign']}[Unpause_cancel_btn]
    should be equal   ${Play_header}    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Unpause_header_txt]
    should be equal   ${Play_help_txt}   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Unpause_help_txt]
    should be equal   ${Play_btn_txt}   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Unpause_header_txt]
    should be equal   ${Play_cancel_txt}   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Cancel_txt]
    ${num}=   generate random string   4    0123456789
    Capture the Screen   ${Play_header}${num}
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Unpause_cancel_btn]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Play_btn_show]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Popup_close_btn]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Play_btn_show]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Unpause_cnfrm_btn]

Search the Campaign and Verify it's Resumed
    [Documentation]    CCL-67360,CCL-63903_20 - Click the Play button and Verify the Popup
    [Arguments]   ${campName}
    Enter the Value Untill Visible  ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_search]     ${campName}
    @{Active_show_Elements}=   Create list   ${locators_params['Campaigns']['Triggered_campaign']}[Play_btn_hide]
    ...  ${locators_params['Campaigns']['Triggered_campaign']}[Pause_btn_show]    ${locators_params['Campaigns']['Triggered_campaign']}[Edit_btn]
    wait until page contain elements    @{Active_show_Elements}
    @{Active_hide_elements}=  create list   ${locators_params['Campaigns']['Triggered_campaign']}[Play_btn_show]   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_btn]
    page should not contain multiple element   @{Active_hide_elements}
    @{Search_elements}=   create list    ${campName}   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_mail_txt]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_budget_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Active_name_budget]    @{Search_elements}
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Active_Status]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[SLH_triggered]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Service_type]
    Capture the Screen   ${campName}-Search after active

Edit the Define page in Active Status
    [Documentation]    CCL-63903_21,CCL-70864-03 - Click the Edit button for Active and Verify the Navigation
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Edit_btn]
    @{Test_datas}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Campaign_name]    ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_segment]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Trigger_type]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Budget_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Target_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Start_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[End_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Define_Header_path]   @{Test_datas}
    Enter the Value Untill Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Instance_Input_field]     ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Instance_Active_Input]
    Enter the Value Untill Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Resend_Input_field]     ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Resend_Active_Input]
    capture page screenshot   Active_input_03
    @{Trigger_txt}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Instance_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Resend_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Inst_Do_not_path]   @{Trigger_txt}
    capture page screenshot   After Paused define page
    @{Trigger_help_txt}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Trigger_help_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Impact_help_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Help_txt]   @{Trigger_help_txt}
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Active_Status]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_txt]
    wait until page does not contain element    ${locators_params['Campaigns']['Triggered_campaign']}[Previous_btn]
    @{Disabled_elements}=   create list   ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Channel_disabled]    ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Deploy_disabled]
    Wait Until Elements Are Visible     @{Disabled_elements}
    page should not contain element  ${locators_params['Campaigns']['Triggered_campaign']}[Impact_camp_btn]
    ${num}=    Generate random string    5    0123456789
    ${Screenshot_Edit}=  set variable   Active_Edit${num}
    Capture the Screen  ${Screenshot_Edit}
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Next_btn]

Verify the Result page in Active Status
    [Documentation]  CCL-70965_10 - Result page in Active Status
    Sleep  10s
    @{Result_elements}=   create list    ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_segment]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_audience_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_date_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_date_end_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_rate_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Budget_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_header]    @{Result_elements}
    @{Result_mail_elements}=   create list    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Last_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_sent_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_mail_header]    @{Result_mail_elements}
    @{Subtitles_elements}=   create list    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Daily_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Total_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_subtitle]    @{Subtitles_elements}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_performance]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Performance_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_segment]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Size_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_total]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Total_txt]
    ${num}=    Generate random string    5    0123456789
    ${Screenshot_Edit}=  set variable   Active_result${num}
    Capture the Screen  ${Screenshot_Edit}
    Verify the Functions for Audience sync details
    Pause the Service Limit Hits in Result page
    click element until visible  ${campaigns_close_X}

Delete the Service Limit Hits
    [Documentation]    CCL-63903_22,CCL-63903_23,CCL-63903_24 - Campaign Should be Deleted Successfully
    [Arguments]   ${campName}
    Enter the Value Untill Visible  ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_search]     ${campName}
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_btn]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_header]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Delete_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_help_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Delete_help_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_cnfrm_btn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Delete_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_cancel_btn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Cancel_txt]
    ${num}=   generate random string   3    0123456789
    Capture the Screen   ${campName}-${num}
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_cancel_btn]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_btn]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Popup_close_btn]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_btn]
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_cnfrm_btn]
    page should contain   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Delete_cnfrm_msge]
    sleep  5s
    Enter the Value Untill Visible  ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_search]     ${campName}
    ${Table_txt}=  get text from multiple element   ${locators_params['Campaigns']['Triggered_campaign']}[Table_campaign_name]
    should not be equal   ${Table_txt}  ${campName}
    ${num}=   generate random string   2    0123456789
    Capture the Screen  Deleted-${num}

Iframe tabs for CMC normal user
    @{Iframe_list}=  Create List    ${summary_link}   ${map_link}
    wait until page contain elements  @{Iframe_list}

Validation for CMC and CMC Pro user
    [Documentation]   CCL-62280  Pro user validation for Qlik and Thoughtspot
    ${CMC_Pro_check}=   call method    ${CMCconnectionObj}    MarketingCloudProfessionalEntitlement
    run keyword if   '${CMC_Pro_check}' == 'True'   log   Pro user so summary and other tab inside the iframe
    ...   ELSE IF    '${CMC_Pro_check}' == 'False'   Iframe tabs for CMC normal user

After Select the Segment Validate Dataset for CMC user
    [Documentation]   CCL-62280  Pro user validation for Qlik and Thoughtspot
    ${CMC_Pro_check}=   call method    ${CMCconnectionObj}    MarketingCloudProfessionalEntitlement
    run keyword if   '${CMC_Pro_check}' == 'True'   log   Pro user so summary and other tab inside the iframe
    ...   ELSE IF    '${CMC_Pro_check}' == 'False'   page should contain element  ${dataset_link}

After Select the Acquistion Segment Validate Dataset for CMC user
    [Documentation]   CCL-62280  Pro user validation for Qlik and Thoughtspot
    ${CMC_Pro_check}=   call method    ${CMCconnectionObj}    MarketingCloudProfessionalEntitlement
    run keyword if   '${CMC_Pro_check}' == 'True'   log   Pro user so summary and other tab inside the iframe
    ...   ELSE IF    '${CMC_Pro_check}' == 'False'   page should not contain element  ${dataset_link}

After Select the Acquistion Segment Validate Summary for CMC user
    [Documentation]   CCL-62280  Pro user validation for Qlik and Thoughtspot
    ${CMC_Pro_check}=   call method    ${CMCconnectionObj}    MarketingCloudProfessionalEntitlement
    run keyword if   '${CMC_Pro_check}' == 'True'   log   Pro user so summary and other tab inside the iframe
    ...   ELSE IF    '${CMC_Pro_check}' == 'False'   page should contain element  ${summary_link}

Verify the Result page based on snapshot condition
    [Documentation]    CCL-62194,CCL-67864  Verify the chart based on the Snapshot flag
    [Arguments]    ${campName}
    ${Campaign}=   call method   ${CMCconnectionObj}   CampaignList  ${campName}
    log  ${Campaign}
    log  ${Campaign}[2]
    run keyword if  '${Campaign}[2]' == 'null'   Campaigns performance tab validation
    ...  ELSE IF  '${Campaign}[2]' == 'Scheduled'    Campaign Performance for Snapshot true Condition
    ...  ELSE IF  '${Campaign}[2]' == 'Triggered'    Verify the Campaign Performance charts

Campaign Performance for Snapshot true Condition
    [Documentation]   CCL-57831 Verify the Campaign performance for Snapshots
    Verify the months dropdown
    Mouse over Total revenue pendo and verify the text - resultsScreen
    Verify the Basic elements in Campaign Performance
    Expand Average revenue widget and validate
    Expand Total Revenue Audience widget and validate

Verify the Basic elements in Campaign Performance
    [Documentation]   Basic Elements for Revenue charts
    @{elements}=  Create List   ${locators_params['Campaigns']['All_campaign']}[Average_Revenue_dwnld_btn]    ${locators_params['Campaigns']['All_campaign']}[Total_Revenue_dwnld_btn]
    ...   ${locators_params['Campaigns']['All_campaign']}[Average_Revenue_expn_btn]   ${locators_params['Campaigns']['All_campaign']}[Total_Revenue_expn_btn]    ${locators_params['Campaigns']['All_campaign']}[Average_Revenue_period]
    ...   ${locators_params['Campaigns']['All_campaign']}[Total_Revenue_period]   ${locators_params['Campaigns']['All_campaign']}[Average_Revenue_post]   ${locators_params['Campaigns']['All_campaign']}[Total_Revenue_post]
    wait until page contain elements  @{elements}

Expand Average revenue widget and validate
    [Documentation]   Expand Average Revenue and validate the elements, buttons
    click element until visible  ${locators_params['Campaigns']['All_campaign']}[Average_Revenue_expn_btn]
    sleep  5
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    page should contain  ${test_data_config['env']['Campaigns']['All_Campaign']}[results_segmentAverageHeaderTxt]
    @{elements}=  Create List   ${locators_params['Campaigns']['All_campaign']}[AverageRev_expanded_dLoadBtn]  ${locators_params['Campaigns']['All_campaign']}[AverageRev_SegRev_expanded_closeBtn]
    wait until page contain elements  @{elements}
    ${PO_Number}    Generate random string    3    0123456789
    ${Average_screen}    Set Variable    AverageRevFullview${PO_Number}
    capture the screen   ${Average_screen}
    click element until visible  ${locators_params['Campaigns']['All_campaign']}[AverageRev_SegRev_expanded_closeBtn]
    sleep  3

Expand Total Revenue Audience widget and validate
    [Documentation]   Expand Total Revenue Audience and validate the elements, buttons
    Click on pendo ques icon and verify the text  Totalsub-pendo  ${locators_params['Campaigns']['Triggered_campaign']}[Total_sub_pendo]  ${results_totalrevenue_pendohelptxt}
    click element until visible  ${locators_params['Campaigns']['All_campaign']}[Total_Revenue_expn_btn]
    sleep  5
    page should contain  ${test_data_config['env']['Campaigns']['All_Campaign']}[results_totalaudTxt]
    @{elements}=  Create List   ${locators_params['Campaigns']['All_campaign']}[Results_RevTab_TotlRev_expanded_dLoadBtn]  ${locators_params['Campaigns']['All_campaign']}[Results_RevTab_TotlRev_expanded_closeBtn]
    wait until page contain elements  @{elements}
    ${PO_Number}    Generate random string    3    0123456789
    ${Audience_screen}    Set Variable    totlRevFullview${PO_Number}
    capture the screen   ${Audience_screen}
    click element until visible  ${locators_params['Campaigns']['All_campaign']}[Results_RevTab_TotlRev_expanded_closeBtn]
    sleep  3

Verify the Additional Direct Mail for Mailchimp
    [Documentation]   CCL-67008  Direct mail validations for Mailchimp
    [Arguments]   ${Campaign}
    Verify the Direct Mail for Mailchimp
    Verify the Mailchimp after select Direct mail  ${Campaign}

Verify the Direct Mail for Mailchimp
    [Documentation]   CCL-67008  Direct mail validations for Mailchimp
    @{Mail_elements}=   create list   ${locators_params['Campaigns']['Scheduled_campaign']}[Direct_mail_txt]   ${locators_params['Campaigns']['Scheduled_campaign']}[Direct_mail_checkbox]
    wait until page contain elements   @{Mail_elements}
    Get Text and Assert   ${locators_params['Campaigns']['Scheduled_campaign']}[Direct_mail_txt]   ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[Direct_mail_txt]
    ${PO_Number}    Generate random string    4    0123456789
    ${Audience_screen}    Set Variable    Mailchimp text-${PO_Number}
    capture the screen   ${Audience_screen}

Verify the Mailchimp after select Direct mail
    [Documentation]   CCL-67008  Direct mail validations for Mailchimp
    [Arguments]   ${Campaign}
    Click Element Until Visible   ${locators_params['Campaigns']['Scheduled_campaign']}[Direct_mail_checkbox]
    ${Mailchimp_txt}=  format string   ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[Direct_check_txt]   Campaign=${Campaign}
    Get Text and Assert   ${locators_params['Campaigns']['Scheduled_campaign']}[Mailchimp_select_txt]   ${Mailchimp_txt}

Verify the Additional Direct Mail for Hubspot
    [Documentation]   CCL-67008  Direct mail validations for Hubspot
    [Arguments]   ${Campaign}
    Verify the Direct Mail for Hubspot
    Verify the Hubspot after select Direct mail  ${Campaign}

Verify the Direct Mail for Hubspot
    [Documentation]   CCL-67008  Direct mail validations for Hubspot
    @{Mail_elements}=   create list   ${locators_params['Campaigns']['Scheduled_campaign']}[Direct_hub_txt]   ${locators_params['Campaigns']['Scheduled_campaign']}[Direct_hub_checkbox]
    wait until page contain elements   @{Mail_elements}
    Get Text and Assert   ${locators_params['Campaigns']['Scheduled_campaign']}[Direct_hub_txt]   ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[Direct_mail_txt]
    ${PO_Number}    Generate random string    4    0123456789
    ${Audience_screen}    Set Variable    Hubspot text-${PO_Number}
    capture the screen   ${Audience_screen}

Verify the Hubspot after select Direct mail
    [Documentation]   CCL-67008  Direct mail validations for Hubspot
    [Arguments]   ${Campaign}
    Click Element Until Visible   ${locators_params['Campaigns']['Scheduled_campaign']}[Direct_hub_checkbox]
    ${Mailchimp_txt}=  format string   ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[Direct_check_txt]   Campaign=${Campaign}
    Get Text and Assert   ${locators_params['Campaigns']['Scheduled_campaign']}[Hubspot_select_txt]   ${Mailchimp_txt}

Verify the Triggered Campaign page
    [Documentation]   Basic elements should present in UI
    Verify the Triggered Campaigns - List table
    Verify the Status Filter in Triggered Campaigns
    Click the Paginations and Verify the Elements

Verify the Triggered Campaigns - List table
    [Documentation]    Triggered Campaigns elements should be visible in UI
    Verify the Basic Elements in Triggered Campaigns
    Verify the ECB portal in Triggered Campaign

Verify the Basic Elements in Triggered Campaigns
    [Documentation]  CCL-63901_04,CCL-63901_16,CCL-68673_16 - In UI table should contain all column present in Figma
    click element until visible    ${locators_params['Campaigns']['Triggered_campaign']}[Tab]
    Verify page title for Triggered campaigns screen
    sleep  5s
    capture page screenshot   Triggered Table
    @{multi_txt}=  Create List  ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_name]   ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_status]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Trigger_th]
    ...  ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_segment]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_audience_txt]   ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_channel]
    ...  ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_start]   ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_end]   ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_budget]   ${EMPTY}
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']}[Campaign_sub_th]   @{multi_txt}
    @{Pagination}=  Create List   ${locators_params['Campaigns']['Triggered_campaign']}[First_pagination_btn]   ${locators_params['Campaigns']['Triggered_campaign']}[Previous_pagination_btn]
    ...   ${locators_params['Campaigns']['Triggered_campaign']}[Next_pagination_btn]   ${locators_params['Campaigns']['Triggered_campaign']}[Last_pagination_btn]
    ...   ${locators_params['Campaigns']['Triggered_campaign']}[Showing_pagination_btn]   ${locators_params['Campaigns']['Triggered_campaign']}[Entries_pagination_btn]
    wait until page contain elements   @{Pagination}

Verify the ECB portal in Triggered Campaign
    [Documentation]   CCL-63901_06 - ECB portal in Triggered Campaign
    click element until visible    ${Campaigns_ECB}
    sleep  5s
    Switch window   ${ECB_pagetitle}
    ${current_URL}=   get location
    Should be equal   ${current_URL}   ${ECB_redirectURL}
    capture the screen   ECB redirect login-Triggers
    Switch window   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Campaigns_page_title]

Verify the Status Filter in Triggered Campaigns
    [Documentation]   UI should show the filtered Status only
    @{Dropdown_types}=   create list   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[All_txt]       ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Complete_txt]
    ...  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Draft_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Paused_txt]
    ${UI_names}=  Get Dropdown Actual Lists   ${locators_params['Campaigns']['Triggered_campaign']}[Status_dorpdown]  ${locators_params['Campaigns']['Triggered_campaign']}[Status_names]
    should be equal   ${UI_names}   ${Dropdown_types}
    Verify the Complete Status selector in the filter
    Verify the Draft Status selector in the filter
    Verify the Active Status selector in the filter
    Verify the Paused Status selector in the filter

Verify the Campaign search
    [Documentation]  CCL-68925 - Campaign search with filters
    [Arguments]   ${Campaign_name}
    Enter the Value Untill Visible  ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_search]  ${Campaign_name}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_first]   ${Campaign_name}

Verify the Complete Status selector in the filter
    [Documentation]  CCL-68925,CCL-63901_10 - UI should show Completed campaigns only
    ${Status_type}=   format string   ${locators_params['Campaigns']['Triggered_campaign']}[Select_Status]   Status=${test_data_config['env']['Campaigns']['Triggered_campaign']}[Complete_txt]
    click element until visible  ${locators_params['Campaigns']['Triggered_campaign']}[Status_dorpdown]
    click element until visible  ${Status_type}
    @{count}=  get webelements  ${locators_params['Campaigns']['Triggered_campaign']}[List_Status]
    FOR  ${element}  IN  @{count}
    ${text}=  get the text from the element  ${element}
    should be equal as strings  ${text}  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Complete_txt]
    END
    Capture the Screen    Dropdown list for Complete
    ${Campaign_name}=   get text   ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_first]
    run keyword if   '${Campaign_name}' != 'No Data Available'   Verify the Campaign search   ${Campaign_name}
    ...   ELSE  log  No data available
    ${num}=   generate random string   4    0123456789
    Capture the Screen    Campaign_search-${num}
    clear the element text with presskeys  ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_search]

Verify the Draft Status selector in the filter
    [Documentation]  CCL-68925,CCL-63901_07 - UI should show Drafted campaigns only
    ${Status_type}=   format string   ${locators_params['Campaigns']['Triggered_campaign']}[Select_Status]   Status=${test_data_config['env']['Campaigns']['Triggered_campaign']}[Draft_txt]
    click element until visible  ${locators_params['Campaigns']['Triggered_campaign']}[Status_dorpdown]
    click element until visible  ${Status_type}
    @{count}=  get webelements  ${locators_params['Campaigns']['Triggered_campaign']}[List_Status]
    FOR  ${element}  IN  @{count}
    ${text}=  get the text from the element  ${element}
    should be equal as strings  ${text}  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Draft_txt]
    END
    Capture the Screen    Dropdown list for Draft
    ${Campaign_name}=   get text   ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_first]
    run keyword if   '${Campaign_name}' != 'No Data Available'   Verify the Campaign search   ${Campaign_name}
    ...   ELSE  log  No data available
    ${num}=   generate random string   4    0123456789
    Capture the Screen    Campaign_search_draft-${num}
    clear the element text with presskeys  ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_search]

Verify the Active Status selector in the filter
    [Documentation]  CCL-68925,CCL-63901_08 - UI should show Active campaigns only
    ${Status_type}=   format string   ${locators_params['Campaigns']['Triggered_campaign']}[Select_Status]   Status=${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_txt]
    click element until visible  ${locators_params['Campaigns']['Triggered_campaign']}[Status_dorpdown]
    click element until visible  ${Status_type}
    @{count}=  get webelements  ${locators_params['Campaigns']['Triggered_campaign']}[List_Status]
    FOR  ${element}  IN  @{count}
    ${text}=  get the text from the element  ${element}
    should be equal as strings  ${text}  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_txt]
    END
    Capture the Screen    Dropdown list for Active
    ${Campaign_name}=   get text   ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_first]
    run keyword if   '${Campaign_name}' != 'No Data Available'   Verify the Campaign search   ${Campaign_name}
    ...   ELSE  log  No data available
    ${num}=   generate random string   4    0123456789
    Capture the Screen    Campaign_search_active-${num}
    clear the element text with presskeys  ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_search]

Verify the Paused Status selector in the filter
    [Documentation]  CCL-68925,CCL-63901_09 - UI should show Paused campaigns only
    ${Status_type}=   format string   ${locators_params['Campaigns']['Triggered_campaign']}[Select_Status]   Status=${test_data_config['env']['Campaigns']['Triggered_campaign']}[Paused_txt]
    click element until visible  ${locators_params['Campaigns']['Triggered_campaign']}[Status_dorpdown]
    click element until visible  ${Status_type}
    @{count}=  get webelements  ${locators_params['Campaigns']['Triggered_campaign']}[List_Status]
    FOR  ${element}  IN  @{count}
    ${text}=  get the text from the element  ${element}
    should be equal as strings  ${text}  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Paused_txt]
    END
    Capture the Screen    Dropdown list for Paused
    ${Campaign_name}=   get text   ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_first]
    run keyword if   '${Campaign_name}' != 'No Data Available'   Verify the Campaign search   ${Campaign_name}
    ...   ELSE  log  No data available
    ${num}=   generate random string   4    0123456789
    Capture the Screen    Campaign_search_paused-${num}
    clear the element text with presskeys  ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_search]

Click the Paginations and Verify the Elements
   [Documentation]   CCL-63901_14,CCL-63901_15 - Pagination Validations
   Click Element Until Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Last_pagination_btn]
   Verify the Basic Elements in Triggered Campaigns
   capture the screen     Last Page in Triggered Campaign
   Click Element Until Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Previous_pagination_btn]
   Verify the Basic Elements in Triggered Campaigns
   capture the screen     Previous Page in Triggered Campaign
   Click Element Until Visible    ${locators_params['Campaigns']['Triggered_campaign']}[First_pagination_btn]
   Verify the Basic Elements in Triggered Campaigns
   capture the screen     First Page in Triggered Campaign
   Click Element Until Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Next_pagination_btn]
   Verify the Basic Elements in Triggered Campaigns
   capture the screen     Next Page in Triggered Campaign

Verify the Competitor Site Minutes in Triggered Campaign
   [Documentation]   Validate the Competitor Site Minutes
   ${PO_Number}    Generate random string    8    0123456789
   ${campName}    Set Variable    Competitor_${PO_Number}
   Verify the Navigation for Triggered Campaign button
   Create the Competitor Site Minutes  ${campName}
   Pause and Edit the CSM  ${campName}
   Verify the CSM in Active Status  ${campName}
   Delete the Service Limit Hits  ${campName}

Create the Competitor Site Minutes
   [Documentation]   Verify the Competitor Site Minutes for Draft Status
   [Arguments]   ${Campname}
   Step 1 Define page for CSM  ${Campname}
   ${count}=  Step 2 select Mobile Noti and Mailchimp for CSM   ${CampName}
   Step 3 deploy with MN and mailchimp for CSM   ${CampName}  ${count}
   Step 4 results with mailchimp for CSM   ${CampName}

Step 1 Define page for CSM
   [Documentation]   Define page validations
   [Arguments]   ${Campname}
   Verify the Define Page for Competitor Site Minutes
   Fill in the Define page details   ${Campname}

Verify the Define Page for Competitor Site Minutes
   [Documentation]  CCL-63909_01,CCL-65946,CCL-70864-05 - Page should navigate to define page
   @{Test_datas}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Campaign_name]    ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_segment]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Trigger_type]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Budget_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Target_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Start_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[End_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Define_Header_path]   @{Test_datas}
    click element until visible     ${locators_params['Campaigns']['Triggered_campaign']}[Trigger_drop]
    @{After_Trigger}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Competitor_type]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Service_type]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Speed_type]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Trigger_names]   @{After_Trigger}
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Competitor_type]
    @{Trigger_txt}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Instance_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Resend_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Inst_Do_not_path]   @{Trigger_txt}
    capture page screenshot   After select Service
    Validate the Default Threshold values
    page should not contain element  ${locators_params['Campaigns']['Triggered_campaign']}[Impact_camp_btn]
    @{Trigger_help_txt}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Competitor_help_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Impact_Comp_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Help_txt]   @{Trigger_help_txt}

Step 2 select Mobile Noti and Mailchimp for CSM
    [Documentation]   CCL-63903_06,CCL-63903_07,CCL-63903_08,CCL-63903_09 - Page should redirect to Channel page
    [Arguments]  ${campName}
    Verify elements on Channel screen for CSM   ${campName}
    page should not contain element   ${locators_params['Campaigns']['Triggered_campaign']}[Next_btn]
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    verify dropdown and select ALL for selected channel  Mobile Notification
    page should contain element   ${locators_params['Campaigns']['Triggered_campaign']}[Save_cmp_btn]
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Next_btn]
    sleep  5
    [Return]   ${count}

Verify elements on Channel screen for CSM
    [Documentation]    CCL-68673_13 Verify the Channel page elements in Draft-SLH
    [Arguments]  ${campName}
    @{elements}=   Create List    ${locators_params['Campaigns']['Triggered_campaign']}[Previous_btn]   ${locators_params['Campaigns']['Triggered_campaign']}[All_checkbox]    ${locators_params['Campaigns']['Triggered_campaign']}[Mobile_checkbox]
    Wait Until Elements Are Visible    @{elements}
    @{Channel_headers}=   create list    ${EMPTY}   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Channel_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Segment_txt]
    ...  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Includes_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Description_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Channel_header]    @{Channel_headers}
    @{Channel_elements}=  create list    ${locators_params['Campaigns']['Triggered_campaign']}[Next_btn]    ${locators_params['Campaigns']['Triggered_campaign']}[Save_cmp_btn]
    Elements Should Not Visible    @{Channel_elements}
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_comp_define]   ${campName}
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Draft_Status]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Draft_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Previous_btn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Previous_txt]
    page should contain  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_desc]
    page should contain   ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[Channel_head]
    ${num}=   generate random string   2    0123456789
    Capture the Screen    Channel_triggered${num}

Step 3 deploy with MN and mailchimp for CSM
    [Documentation]    CCL-63903_10 - Verify the Deploy page
    [Arguments]  ${campName}   ${Mobi_Segmentcount}
    ${num}=   generate random string   4    0123456789
    Capture the Screen  Step3-${num}
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Verify the Deploy page Elements and text for Mobile only   ${campName}
    Mobile Notifications form filling  ${Mobi_Segmentcount}
    Verify the Deploy Popup for CSM

Step 4 results with mailchimp for CSM
    [Documentation]   CCL-63905_01,CCL-63905_02 - Verify the Results page in Draft-SLH
    [Arguments]  ${campName}
    Sleep  10s
    @{Result_elements}=   create list    ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_segment]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_audience_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_date_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_date_end_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_rate_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Budget_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_header]    @{Result_elements}
    @{Result_mail_elements}=   create list   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Last_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_sent_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_mail_header]    @{Result_mail_elements}
    Verify the text and elements in Result page for CSM   ${campName}
    ${current_date}=   Get Current Date   result_format=%Y-%m-%d
    ${Result_Date_txt}=  Get the Text from the Element    ${locators_params['Campaigns']['Triggered_campaign']}[Result_Date]
    should be equal    ${Result_Date_txt}    ${current_date}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_Rate]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Target_result_Input]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_budget]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Budget_result_Input]
    ${num}=    Generate random string    5    0123456789
    ${Screenshot_result}=  set variable   ${num}-Step4
    Capture the Screen  ${Screenshot_result}
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[refresh_icon]
    Pause the Service Limit Hits in Result page
    Play the Service Limit Hits in Result page
    sleep  10s
    Change campaigns performance chart to 12months
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mobileNotification}
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    click on pendo ques icon and verify the text   Totalsub-pendo   ${locators_params['Campaigns']['Triggered_campaign']}[Total_sub_pendo]    ${results_totalrevenue_pendohelptxt}
    Verify the Campaign Performance charts
    Verify the Functions for Audience sync details
    click element until visible  ${campaigns_close_X}

Verify the text and elements in Result page for CSM
    [Documentation]    Verify the Results page elements in Draft-SLH
    [Arguments]   ${campName}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_audience]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_dis_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Active_Status]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_txt]
    ${current_date}=   Get Current Date   result_format=%Y-%m-%d
    ${Audience_help_txt}=  format string   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_help_txt]  Date=${current_date}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_audience_help]   ${Audience_help_txt}
    @{Result_XY_elements}=   create list    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_channel_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Segment_mem_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Subscriber_chart_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Subscriber_chart_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_XYaxis_txt]    @{Result_XY_elements}
    @{Subtitles_elements}=   create list    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Daily_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Total_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_subtitle]    @{Subtitles_elements}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_performance]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Performance_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_segment]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Size_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_total]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Total_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_comp_define]   ${campName}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_mailchimp]    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_notif_txt]

Verify the Deploy page Elements and text for Mobile only
    [Documentation]    Verify the Deploy page elements in Draft-SLH
    [Arguments]  ${campName}
    sleep  10s
    Verify the ECB in Deploy Page
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_comp_define]   ${campName}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Draft_Status]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Draft_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Previous_btn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Previous_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Deploy_btn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Deploy_txt]

Verify the Deploy Popup for CSM
    [Documentation]    Verify the Deploy page Popup
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Deploy_btn]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Popup_deploy_header]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Deploy_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Popup_action]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Deploy_help_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Popup_audience]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Deploy_mobile_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Popup_cnfrm_btn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Deploy_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Popup_cncl_btn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Cancel_txt]
    ${num}=   generate random string   2    0123456789
    Capture the Screen   Triggered-popup-${num}
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Popup_cncl_btn]
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Deploy_btn]
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Popup_cnfrm_btn]

Pause and Edit the CSM
    [Documentation]    Verify the Active Status in SLH
    [Arguments]  ${campName}
    Verify the Pause and Edit button for CSM   ${campName}
    Pause the Service Limit Hits
    Search the Campaign and Verify the Paused CSM  ${campName}
    Edit the Define Page in Paused Status for CSM
    Step 4 results with mailchimp for CSM in Paused flow   ${campName}

Verify the Pause and Edit button for CSM
    [Documentation]    CCL-67360,CCL-63903_12 - Pause and Edit buttons should be Visible
    [Arguments]   ${campName}
    Enter the Value Untill Visible  ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_search]     ${campName}
    @{Active_show_Elements}=   Create list   ${locators_params['Campaigns']['Triggered_campaign']}[Pause_btn_show]
    ...  ${locators_params['Campaigns']['Triggered_campaign']}[Play_btn_hide]    ${locators_params['Campaigns']['Triggered_campaign']}[Edit_btn]
    wait until page contain elements    @{Active_show_Elements}
    @{Active_hide_elements}=  create list   ${locators_params['Campaigns']['Triggered_campaign']}[Play_btn_show]   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_btn]
    page should not contain multiple element   @{Active_hide_elements}
    @{Search_elements}=   create list    ${campName}   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_txt]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_budget_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Active_name_budget]    @{Search_elements}
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Active_Status]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[CSM_triggered]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Competitor_name]
    Capture the Screen   ${campName}-Search

Search the Campaign and Verify the Paused CSM
    [Documentation]    CCL-63903_15 - After Paused Status should be Changed to Paused
    [Arguments]   ${campName}
    Enter the Value Untill Visible  ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_search]     ${campName}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Paused]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Paused_txt]
    @{Search_elements}=   create list    ${campName}   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_txt]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_budget_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Active_name_budget]    @{Search_elements}
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[CSM_triggered]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Competitor_name]
    ${num}=    Generate random string    5    0123456789
    ${Screenshot_Paused}=  set variable   Search${num}
    Capture the Screen  ${Screenshot_Paused}

Edit the Define Page in Paused Status for CSM
    [Documentation]    CCL-63903_16,CCL-70864-07 - Click the Edit button and Verify the Navigation
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Edit_btn]
    @{Test_datas}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Campaign_name]    ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_segment]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Trigger_type]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Budget_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Target_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Start_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[End_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Define_Header_path]   @{Test_datas}
    Enter the Value Untill Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Instance_Input_field]     ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Instance_Pause_Input]
    Enter the Value Untill Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Resend_Input_field]     ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Resend_Pause_Input]
    ${num}=   generate random string   2    0123456789
    Capture the Screen   After Paused Instance resend-${num}
    @{Trigger_txt}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Instance_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Resend_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Inst_Do_not_path]   @{Trigger_txt}
    capture page screenshot   After Paused define page
    @{Trigger_help_txt}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Competitor_help_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Impact_Comp_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Help_txt]   @{Trigger_help_txt}
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Paused]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Paused_txt]
    wait until page does not contain element    ${locators_params['Campaigns']['Triggered_campaign']}[Previous_btn]
    @{Disabled_elements}=   create list   ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Channel_disabled]    ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Deploy_disabled]
    Wait Until Elements Are Visible     @{Disabled_elements}
    page should not contain element  ${locators_params['Campaigns']['Triggered_campaign']}[Impact_camp_btn]
    ${num}=    Generate random string    5    0123456789
    ${Screenshot_Edit}=  set variable   Active_Pause_Edit${num}
    Capture the Screen  ${Screenshot_Edit}
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Next_btn]

Step 4 results with mailchimp for CSM in Paused flow
    [Documentation]    Verify the Edit flow for Paused-results in SLH
    [Arguments]   ${campName}
    Sleep  10s
    @{Result_elements}=   create list    ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_segment]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_audience_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_date_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_date_end_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_rate_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Budget_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_header]    @{Result_elements}
    @{Result_mail_elements}=   create list    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Last_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_sent_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_mail_header]    @{Result_mail_elements}
    Verify the text and elements in Result page for CSM in Paused   ${campName}
    ${current_date}=   Get Current Date   result_format=%Y-%m-%d
    ${Result_Date_txt}=  Get the Text from the Element    ${locators_params['Campaigns']['Triggered_campaign']}[Result_Date]
    should be equal    ${Result_Date_txt}    ${current_date}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_Rate]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Target_result_Input]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_budget]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Budget_result_Input]
    ${num}=    Generate random string    5    0123456789
    ${Screenshot_result}=  set variable   ${num}-Step4
    Capture the Screen  ${Screenshot_result}
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[refresh_icon]
    Play the Service Limit Hits in Result page
    Pause the Service Limit Hits in Result page
    Change campaigns performance chart to 12months
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mobileNotification}
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    Click on pendo ques icon and verify the text   Totalsub-pendo   ${locators_params['Campaigns']['Triggered_campaign']}[Total_sub_pendo]    ${results_totalrevenue_pendohelptxt}
    Verify the Campaign Performance charts
    Verify the Functions for Audience sync details
    click element until visible  ${campaigns_close_X}

Verify the text and elements in Result page for CSM in Paused
    [Documentation]    Verify the Edit flow for Paused-Results charts in SLH
    [Arguments]   ${campName}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_audience]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_dis_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Paused]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Paused_txt]
    ${current_date}=   Get Current Date   result_format=%Y-%m-%d
    ${Audience_help_txt}=  format string   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_help_txt]  Date=${current_date}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_audience_help]   ${Audience_help_txt}
    @{Result_XY_elements}=   create list    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_channel_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Segment_mem_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Subscriber_chart_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Subscriber_chart_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_XYaxis_txt]    @{Result_XY_elements}
    @{Subtitles_elements}=   create list    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Daily_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Total_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_subtitle]    @{Subtitles_elements}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_performance]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Performance_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_segment]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Size_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_total]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Total_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_comp_define]   ${campName}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_mailchimp]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_notif_txt]

Verify the CSM in Active Status
    [Documentation]   Campaign should be Resumed
    [Arguments]   ${CampName}
    Click the Play button and Verify the Popup for CSM  ${CampName}
    Play the Service Limit Hits
    Search the Campaign and Verify it's Resumed for CSM  ${CampName}
    Edit the Define page in CSM-Active Status
    Verify the Result page in Active Status

Click the Play button and Verify the Popup for CSM
    [Documentation]    CCL-63903_18 - Click the Play button and Verify the Popup
    [Arguments]   ${campName}
    Enter the Value Untill Visible  ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_search]     ${campName}
    @{Active_show_Elements}=   Create list   ${locators_params['Campaigns']['Triggered_campaign']}[Play_btn_show]    ${locators_params['Campaigns']['Triggered_campaign']}[Delete_btn]
    ...  ${locators_params['Campaigns']['Triggered_campaign']}[Pause_btn_hide]    ${locators_params['Campaigns']['Triggered_campaign']}[Edit_btn]
    wait until page contain elements    @{Active_show_Elements}
    page should not contain element  ${locators_params['Campaigns']['Triggered_campaign']}[Pause_btn_show]
    @{Search_elements}=   create list    ${campName}   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_txt]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_budget_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Active_name_budget]    @{Search_elements}
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Paused]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Paused_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[CSM_triggered]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Competitor_name]
    Capture the Screen   ${campName}-Search before active

Search the Campaign and Verify it's Resumed for CSM
    [Documentation]    CCL-67360,CCL-63903_20 - Click the Play button and Verify the Popup
    [Arguments]   ${campName}
    Enter the Value Untill Visible  ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_search]     ${campName}
    @{Active_show_Elements}=   Create list   ${locators_params['Campaigns']['Triggered_campaign']}[Play_btn_hide]
    ...  ${locators_params['Campaigns']['Triggered_campaign']}[Pause_btn_show]    ${locators_params['Campaigns']['Triggered_campaign']}[Edit_btn]
    wait until page contain elements    @{Active_show_Elements}
    @{Active_hide_elements}=  create list   ${locators_params['Campaigns']['Triggered_campaign']}[Play_btn_show]   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_btn]
    page should not contain multiple element   @{Active_hide_elements}
    @{Search_elements}=   create list    ${campName}   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_txt]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_budget_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Active_name_budget]    @{Search_elements}
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Active_Status]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[CSM_triggered]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Competitor_name]
    Capture the Screen   ${campName}-Search after active

Edit the Define page in CSM-Active Status
    [Documentation]    CCL-63903_21,CCL-70864-08 - Click the Edit button for Active and Verify the Navigation
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Edit_btn]
    @{Test_datas}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Campaign_name]    ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_segment]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Trigger_type]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Budget_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Target_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Start_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[End_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Define_Header_path]   @{Test_datas}
    Enter the Value Untill Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Instance_Input_field]     ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Instance_Active_Input]
    Enter the Value Untill Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Resend_Input_field]     ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Resend_Active_Input]
    capture page screenshot   Active_input_03
    @{Trigger_txt}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Instance_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Resend_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Inst_Do_not_path]   @{Trigger_txt}
    capture page screenshot   After Paused define page
    @{Trigger_help_txt}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Competitor_help_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Impact_Comp_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Help_txt]   @{Trigger_help_txt}
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Active_Status]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_txt]
    wait until page does not contain element    ${locators_params['Campaigns']['Triggered_campaign']}[Previous_btn]
    @{Disabled_elements}=   create list   ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Channel_disabled]    ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Deploy_disabled]
    Wait Until Elements Are Visible     @{Disabled_elements}
    page should not contain element  ${locators_params['Campaigns']['Triggered_campaign']}[Impact_camp_btn]
    ${num}=    Generate random string    5    0123456789
    ${Screenshot_Edit}=  set variable   Active_Edit_CSM${num}
    Capture the Screen  ${Screenshot_Edit}
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Next_btn]

Verify the Speed Test Minutes in Triggered Campaign
   [Documentation]   CCL-67921 - Validate the Competitor Site Minutes
   ${PO_Number}    Generate random string    8    0123456789
   ${campName}    Set Variable    Speed_${PO_Number}
   Verify the Navigation for Triggered Campaign button
   Create the Speed Test Minutes  ${campName}
   Pause and Edit the STM  ${campName}
   Verify the STM in Active Status  ${campName}
   Delete the Service Limit Hits  ${campName}

Create the Speed Test Minutes
   [Documentation]   Verify the Competitor Site Minutes for Draft Status
   [Arguments]   ${Campname}
   Step 1 Define page for STM  ${Campname}
   ${count}=  Step 2 select Mobile Noti for STM   ${CampName}
   Step 3 deploy with Mobile Noti for STM   ${CampName}  ${count}
   Step 4 results with Mobile Noti for STM   ${CampName}

Step 1 Define page for STM
   [Documentation]   Define page validations
   [Arguments]   ${Campname}
   Verify the Define Page for Speed Test Minutes
   Fill in the Define page details   ${Campname}

Verify the Define Page for Speed Test Minutes
   [Documentation]  CCL-63909_01,CCL-65946,CCL-70864-09 - Page should navigate to define page
   @{Test_datas}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Campaign_name]    ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_segment]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Trigger_type]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Budget_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Target_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Start_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[End_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Define_Header_path]   @{Test_datas}
    click element until visible     ${locators_params['Campaigns']['Triggered_campaign']}[Trigger_drop]
    @{After_Trigger}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Competitor_type]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Service_type]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Speed_type]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Trigger_names]   @{After_Trigger}
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Speed_type]
    @{Trigger_txt}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Instance_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Resend_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Inst_Do_not_path]   @{Trigger_txt}
    capture page screenshot   After select Service
    Validate the Default Threshold values
    page should not contain element  ${locators_params['Campaigns']['Triggered_campaign']}[Impact_camp_btn]
    @{Trigger_help_txt}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Speed_help_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Impact_Speed_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Help_txt]   @{Trigger_help_txt}

Step 2 select Mobile Noti for STM
    [Documentation]   CCL-63903_06,CCL-63903_07,CCL-63903_08,CCL-63903_09 - Page should redirect to Channel page
    [Arguments]  ${campName}
    Verify elements on Channel screen for STM   ${campName}
    page should not contain element   ${locators_params['Campaigns']['Triggered_campaign']}[Next_btn]
    Capture the Screen  ${campName}-Step2
    Verify the segments size in campaigns step 2
    ${count}=  Select the Mobile Notification Checkbox
    verify dropdown and select ALL for selected channel  Mobile Notification
    page should contain element   ${locators_params['Campaigns']['Triggered_campaign']}[Save_cmp_btn]
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[Next_btn]
    sleep  5
    [Return]   ${count}

Verify elements on Channel screen for STM
    [Documentation]    CCL-68673_13 Verify the Channel page elements in Draft-SLH
    [Arguments]  ${campName}
    @{elements}=   Create List    ${locators_params['Campaigns']['Triggered_campaign']}[Previous_btn]   ${locators_params['Campaigns']['Triggered_campaign']}[All_checkbox]    ${locators_params['Campaigns']['Triggered_campaign']}[Mobile_checkbox]
    Wait Until Elements Are Visible    @{elements}
    @{Channel_headers}=   create list    ${EMPTY}   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Channel_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Segment_txt]
    ...  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Includes_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Description_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Channel_header]    @{Channel_headers}
    @{Channel_elements}=  create list    ${locators_params['Campaigns']['Triggered_campaign']}[Next_btn]    ${locators_params['Campaigns']['Triggered_campaign']}[Save_cmp_btn]
    Elements Should Not Visible    @{Channel_elements}
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_speed_define]   ${campName}
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Draft_Status]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Draft_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Previous_btn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Previous_txt]
    page should contain  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_desc]
    page should contain   ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[Channel_head]
    ${num}=   generate random string   2    0123456789
    Capture the Screen    Channel_triggered${num}

Step 3 deploy with Mobile Noti for STM
    [Documentation]    CCL-63903_10 - Verify the Deploy page
    [Arguments]  ${campName}   ${Mobi_Segmentcount}
    ${num}=   generate random string   4    0123456789
    Capture the Screen  Step3-${num}
    execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Verify the Deploy page Elements and text for STM-Mobile only   ${campName}
    Mobile Notifications form filling  ${Mobi_Segmentcount}
    Verify the Deploy Popup for CSM

Verify the Deploy page Elements and text for STM-Mobile only
    [Documentation]    Verify the Deploy page elements in Draft-SLH
    [Arguments]  ${campName}
    sleep  10s
    Verify the ECB in Deploy Page
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_speed_define]   ${campName}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Draft_Status]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Draft_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Previous_btn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Previous_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Deploy_btn]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Deploy_txt]

Step 4 results with Mobile Noti for STM
    [Documentation]   CCL-63905_01,CCL-63905_02 - Verify the Results page in Draft-SLH
    [Arguments]  ${campName}
    Sleep  10s
    @{Result_elements}=   create list    ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_segment]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_audience_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_date_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_date_end_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_rate_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Budget_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_header]    @{Result_elements}
    @{Result_mail_elements}=   create list   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Last_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_sent_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_mail_header]    @{Result_mail_elements}
    Verify the text and elements in Result page for STM   ${campName}
    ${current_date}=   Get Current Date   result_format=%Y-%m-%d
    ${Result_Date_txt}=  Get the Text from the Element    ${locators_params['Campaigns']['Triggered_campaign']}[Result_Date]
    should be equal    ${Result_Date_txt}    ${current_date}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_Rate]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Target_result_Input]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_budget]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Budget_result_Input]
    ${num}=    Generate random string    5    0123456789
    ${Screenshot_result}=  set variable   ${num}-Step4
    Capture the Screen  ${Screenshot_result}
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[refresh_icon]
    Pause the Service Limit Hits in Result page
    Play the Service Limit Hits in Result page
    sleep  10s
    Change campaigns performance chart to 12months
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mobileNotification}
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    click on pendo ques icon and verify the text   Totalsub-pendo   ${locators_params['Campaigns']['Triggered_campaign']}[Total_sub_pendo]    ${results_totalrevenue_pendohelptxt}
    Verify the Campaign Performance charts
    Verify the Functions for Audience sync details
    click element until visible  ${campaigns_close_X}

Verify the text and elements in Result page for STM
    [Documentation]    Verify the Results page elements in Draft-SLH
    [Arguments]   ${campName}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_audience]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_dis_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Active_Status]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_txt]
    ${current_date}=   Get Current Date   result_format=%Y-%m-%d
    ${Audience_help_txt}=  format string   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_help_txt]  Date=${current_date}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_audience_help]   ${Audience_help_txt}
    @{Result_XY_elements}=   create list    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_channel_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Segment_mem_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Subscriber_chart_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Subscriber_chart_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_XYaxis_txt]    @{Result_XY_elements}
    @{Subtitles_elements}=   create list    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Daily_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Total_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_subtitle]    @{Subtitles_elements}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_performance]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Performance_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_segment]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Size_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_total]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Total_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_speed_define]   ${campName}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_mailchimp]    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_notif_txt]

Pause and Edit the STM
    [Documentation]    Verify the Active Status in SLH
    [Arguments]  ${campName}
    Verify the Pause and Edit button for STM   ${campName}
    Pause the Service Limit Hits
    Search the Campaign and Verify the Paused STM  ${campName}
    Edit the Define Page in Paused Status for STM
    Step 4 results with MN for STM in Paused flow   ${campName}

Verify the Pause and Edit button for STM
    [Documentation]    CCL-67360,CCL-63903_12 - Pause and Edit buttons should be Visible
    [Arguments]   ${campName}
    Enter the Value Untill Visible  ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_search]     ${campName}
    @{Active_show_Elements}=   Create list   ${locators_params['Campaigns']['Triggered_campaign']}[Pause_btn_show]
    ...  ${locators_params['Campaigns']['Triggered_campaign']}[Play_btn_hide]    ${locators_params['Campaigns']['Triggered_campaign']}[Edit_btn]
    wait until page contain elements    @{Active_show_Elements}
    @{Active_hide_elements}=  create list   ${locators_params['Campaigns']['Triggered_campaign']}[Play_btn_show]   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_btn]
    page should not contain multiple element   @{Active_hide_elements}
    @{Search_elements}=   create list    ${campName}   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_txt]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_budget_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Active_name_budget]    @{Search_elements}
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Active_Status]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[STM_triggered]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Speed_name]
    Capture the Screen   ${campName}-Search

Search the Campaign and Verify the Paused STM
    [Documentation]    CCL-63903_15 - After Paused Status should be Changed to Paused
    [Arguments]   ${campName}
    Enter the Value Untill Visible  ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_search]     ${campName}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Paused]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Paused_txt]
    @{Search_elements}=   create list    ${campName}   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_txt]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_budget_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Active_name_budget]    @{Search_elements}
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[STM_triggered]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Speed_name]
    ${num}=    Generate random string    5    0123456789
    ${Screenshot_Paused}=  set variable   Search${num}
    Capture the Screen  ${Screenshot_Paused}

Edit the Define Page in Paused Status for STM
    [Documentation]    CCL-63903_16,CCL-70864-12 - Click the Edit button and Verify the Navigation
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Edit_btn]
    @{Test_datas}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Campaign_name]    ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_segment]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Trigger_type]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Budget_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Target_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Start_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[End_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Define_Header_path]   @{Test_datas}
    Enter the Value Untill Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Instance_Input_field]     ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Instance_Pause_Input]
    Enter the Value Untill Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Resend_Input_field]     ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Resend_Pause_Input]
    ${num}=   generate random string   2    0123456789
    Capture the Screen   After Paused Instance resend-${num}
    @{Trigger_txt}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Instance_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Resend_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Inst_Do_not_path]   @{Trigger_txt}
    capture page screenshot   After Paused define page
    @{Trigger_help_txt}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Speed_help_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Impact_Speed_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Help_txt]   @{Trigger_help_txt}
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Paused]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Paused_txt]
    wait until page does not contain element    ${locators_params['Campaigns']['Triggered_campaign']}[Previous_btn]
    @{Disabled_elements}=   create list   ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Channel_disabled]    ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Deploy_disabled]
    Wait Until Elements Are Visible     @{Disabled_elements}
    page should not contain element  ${locators_params['Campaigns']['Triggered_campaign']}[Impact_camp_btn]
    ${num}=    Generate random string    5    0123456789
    ${Screenshot_Edit}=  set variable   Active_Pause_Edit${num}
    Capture the Screen  ${Screenshot_Edit}
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Next_btn]

Step 4 results with MN for STM in Paused flow
    [Documentation]    Verify the Edit flow for Paused-results in SLH
    [Arguments]   ${campName}
    Sleep  10s
    @{Result_elements}=   create list    ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_segment]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_audience_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_date_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_date_end_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_rate_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Budget_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_header]    @{Result_elements}
    @{Result_mail_elements}=   create list    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Last_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_sent_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_mail_header]    @{Result_mail_elements}
    Verify the text and elements in Result page for TSM in Paused   ${campName}
    ${current_date}=   Get Current Date   result_format=%Y-%m-%d
    ${Result_Date_txt}=  Get the Text from the Element    ${locators_params['Campaigns']['Triggered_campaign']}[Result_Date]
    should be equal    ${Result_Date_txt}    ${current_date}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_Rate]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Target_result_Input]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_budget]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Budget_result_Input]
    ${num}=    Generate random string    5    0123456789
    ${Screenshot_result}=  set variable   ${num}-Step4
    Capture the Screen  ${Screenshot_result}
    click element until visible   ${locators_params['Campaigns']['Triggered_campaign']}[refresh_icon]
    Play the Service Limit Hits in Result page
    Pause the Service Limit Hits in Result page
    Change campaigns performance chart to 12months
    Verify selected channels present in xaxis labels of Segment distribution  ${results_xaxis_mobileNotification}
    Validate segment distribution pendo - resultsScreen
    get the data from bar graph widget without api call  ${results_segmentwidget_barxpath}  ${results_segmentwidget_tooltip}
    expand segment distribution widget and validate
    ${totalRev}=  get text  ${results_totalrev/subscontent}
    Verify the months dropdown
    Click on pendo ques icon and verify the text   Totalsub-pendo   ${locators_params['Campaigns']['Triggered_campaign']}[Total_sub_pendo]    ${results_totalrevenue_pendohelptxt}
    Verify the Campaign Performance charts
    Verify the Functions for Audience sync details
    click element until visible  ${campaigns_close_X}

Verify the text and elements in Result page for TSM in Paused
    [Documentation]    Verify the Edit flow for Paused-Results charts in SLH
    [Arguments]   ${campName}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_audience]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_dis_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Paused]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Paused_txt]
    ${current_date}=   Get Current Date   result_format=%Y-%m-%d
    ${Audience_help_txt}=  format string   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_help_txt]  Date=${current_date}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_audience_help]   ${Audience_help_txt}
    @{Result_XY_elements}=   create list    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_channel_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Segment_mem_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Subscriber_chart_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Subscriber_chart_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_XYaxis_txt]    @{Result_XY_elements}
    @{Subtitles_elements}=   create list    ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Daily_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Total_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[Result_subtitle]    @{Subtitles_elements}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_performance]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Performance_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_segment]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Size_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_total]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_Total_txt]
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_speed_define]   ${campName}
    Get Text and Assert   ${locators_params['Campaigns']['Triggered_campaign']}[Result_page_mailchimp]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_notif_txt]

Verify the STM in Active Status
    [Documentation]   CCL-70965_13 Campaign should be Resumed
    [Arguments]   ${CampName}
    Click the Play button and Verify the Popup for STM  ${CampName}
    Play the Service Limit Hits
    Search the Campaign and Verify it's Resumed for STM  ${CampName}
    Edit the Define page in STM-Active Status
    Verify the Result page in Active Status

Click the Play button and Verify the Popup for STM
    [Documentation]    CCL-63903_18 - Click the Play button and Verify the Popup
    [Arguments]   ${campName}
    Enter the Value Untill Visible  ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_search]     ${campName}
    @{Active_show_Elements}=   Create list   ${locators_params['Campaigns']['Triggered_campaign']}[Play_btn_show]    ${locators_params['Campaigns']['Triggered_campaign']}[Delete_btn]
    ...  ${locators_params['Campaigns']['Triggered_campaign']}[Pause_btn_hide]    ${locators_params['Campaigns']['Triggered_campaign']}[Edit_btn]
    wait until page contain elements    @{Active_show_Elements}
    page should not contain element  ${locators_params['Campaigns']['Triggered_campaign']}[Pause_btn_show]
    @{Search_elements}=   create list    ${campName}   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_txt]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_budget_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Active_name_budget]    @{Search_elements}
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Paused]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Paused_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[STM_triggered]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Speed_name]
    Capture the Screen   ${campName}-Search before active

Search the Campaign and Verify it's Resumed for STM
    [Documentation]    CCL-67360,CCL-63903_20 - Click the Play button and Verify the Popup
    [Arguments]   ${campName}
    Enter the Value Untill Visible  ${locators_params['Campaigns']['Triggered_campaign']}[Campaign_search]     ${campName}
    @{Active_show_Elements}=   Create list   ${locators_params['Campaigns']['Triggered_campaign']}[Play_btn_hide]
    ...  ${locators_params['Campaigns']['Triggered_campaign']}[Pause_btn_show]    ${locators_params['Campaigns']['Triggered_campaign']}[Edit_btn]
    wait until page contain elements    @{Active_show_Elements}
    @{Active_hide_elements}=  create list   ${locators_params['Campaigns']['Triggered_campaign']}[Play_btn_show]   ${locators_params['Campaigns']['Triggered_campaign']}[Delete_btn]
    page should not contain multiple element   @{Active_hide_elements}
    @{Search_elements}=   create list    ${campName}   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_txt]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_budget_txt]
    Get text and Ensure the Headers are Equal    ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Active_name_budget]    @{Search_elements}
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Active_Status]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_txt]
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[STM_triggered]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Speed_name]
    Capture the Screen   ${campName}-Search after active

Edit the Define page in STM-Active Status
    [Documentation]    CCL-63903_21,CCL-70864-11 - Click the Edit button for Active and Verify the Navigation
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Edit_btn]
    @{Test_datas}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Campaign_name]    ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_segment]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Trigger_type]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Budget_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Target_txt]
    ...   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Start_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[End_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Define_Header_path]   @{Test_datas}
    Enter the Value Untill Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Instance_Input_field]     ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Instance_Active_Input]
    Enter the Value Untill Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Resend_Input_field]     ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Resend_Active_Input]
    capture page screenshot   Active_input_03
    @{Trigger_txt}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Instance_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Resend_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Inst_Do_not_path]   @{Trigger_txt}
    capture page screenshot   After Paused define page
    @{Trigger_help_txt}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Speed_help_txt]   ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Impact_Speed_txt]
    Get text and Ensure the Headers are Equal   ${locators_params['Campaigns']['Triggered_campaign']}[Help_txt]   @{Trigger_help_txt}
    Get Text and Assert  ${locators_params['Campaigns']['Triggered_campaign']}[Active_Status]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Active_txt]
    wait until page does not contain element    ${locators_params['Campaigns']['Triggered_campaign']}[Previous_btn]
    @{Disabled_elements}=   create list   ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Channel_disabled]    ${locators_params['Campaigns']['Triggered_campaign']}[SLH_Deploy_disabled]
    Wait Until Elements Are Visible     @{Disabled_elements}
    page should not contain element  ${locators_params['Campaigns']['Triggered_campaign']}[Impact_camp_btn]
    ${num}=    Generate random string    5    0123456789
    ${Screenshot_Edit}=  set variable   Active_Edit_CSM${num}
    Capture the Screen  ${Screenshot_Edit}
    Click Element Until Visible   ${locators_params['Campaigns']['Triggered_campaign']}[Next_btn]

Verify the Functions for Audience sync details
    [Documentation]   Audience sync details validations
    Verify the Audience sync details Tab
    Verify the Options button function
    Verify the Search and Dropdown in Audience Sync Details

Verify the Audience sync details Tab
    [Documentation]  CCL-70965_01,CCL-70965_02 - Page should contain the Audience sync details
    wait until page contains element  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_tab]
    Click Element Until Visible  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_tab]
    @{Table_headers}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Sync_th]  ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_name]
    ...  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Email_th]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_channel_txt]
    Get text and Ensure the Headers are Equal  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_th]  @{Table_headers}
    ${num}=  generate random string  3  1234567890
    Capture the Screen  Audience_table-${num}

Verify the Search and Dropdown in Audience Sync Details
    [Documentation]  CCL-70965_05,CCL-70965_06 - Verify the Mailchimp and Mobile Notification
    ${Audience_data}=  get text  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_data]
    run keyword if  '${Audience_data}' == 'No Data Available'  log  No data available in Table
    ...  ELSE  Verify the Search field in Audience Sync Details
    Verify the Dropdown in Audience Sync Details  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_mail_txt]
    Verify the Dropdown in Audience Sync Details  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_txt]
    ${Audience_pagination}=  get text  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_data]
    run keyword if  '${Audience_pagination}' == 'No Data Available'  log  No data available in Table
    ...  ELSE  Validate the Pagination for Audience Sync Details


Verify the Search field in Audience Sync Details
    [Documentation]  CCL-70965_03,CCL-70965_04 - Search field and Dropdown should be present
    ${Audience_name}=  get text  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_1st_name]
    ${num}  generate random string  3  012345678
    Capture the Screen  Audience-${num}
    Enter the Value Untill Visible  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_search]  ${Audience_name}
    ${Audience_name_after}=  get text  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_1st_name]
    should be equal  ${Audience_name}  ${Audience_name_after}
    ${num}  generate random string  3  012345678
    Capture the Screen  After_Audience-${num}
    Clear the Element Text with Presskeys  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_search]

Verify the Dropdown in Audience Sync Details
    [Documentation]  CCL-70965_04 - Dropdown in Audience Sync Details
    [Arguments]   ${ddValue}
    click element until visible  ${locators_params['Campaigns']['Triggered_campaign']}[[Audience_type]
    @{Dropdown}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Result_mail_txt]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Mobile_txt]
    @{Types_dropdown}=   Create List
    @{elements}=   Get WebElements   ${dropdown_names}
    FOR  ${element}  IN  @{elements}
    ${text}=  get text   ${element}
    Append to list  ${Types_dropdown}  ${text}
    END
    should be Equal  ${Types_dropdown}   ${Dropdown}
    capture the screen   TYPE dropdown
    ${Element}=  format string  ${locators_params['Segments']}[Dropdown_select]   Value=${ddValue}
    click element until visible  ${Element}
    sleep  2
    ${count}=  get element count  ${locator}
    FOR  ${num}  IN RANGE  ${count}
    ${text}=  get the text from the element  ${locator}
    should be equal as strings  ${text}  ${ddValue}
    END
    capture the screen  ${ddValue}

Validate the Pagination for Audience Sync Details
    [Documentation]    CCL-70965_07 - Check the Pagination buttons are Clickable and also check basic elements available
    Click Element Until Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Audience_page_last]
    Verify the basic elements on Audience sync details
    capture the screen     Last Page
    Click Element Until Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Audience_page_previous]
    Verify the basic elements on Audience sync details
    capture the screen     Previous Page
    Click Element Until Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Audience_page_first]
    Verify the basic elements on Audience sync details
    capture the screen     First Page
    Click Element Until Visible    ${locators_params['Campaigns']['Triggered_campaign']}[Audience_page_next]
    Verify the basic elements on Audience sync details
    capture the screen     Next Page

Verify the basic elements on Audience sync details
    [Documentation]  Basic elements on current page
    @{Table_headers}=  create list  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Sync_th]  ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_name]
    ...  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Email_th]  ${test_data_config['env']['Campaigns']['Triggered_campaign']}[Audience_channel_txt]
    Get text and Ensure the Headers are Equal  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_th]  @{Table_headers}
    @{Pagination_elements}=  create list  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_page_last]  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_page_previous]
    ...  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_page_first]  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_page_next]  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_page_info]
    wait until page contains element  @{Pagination_elements}

Verify the Options button function
    [Documentation]  CCL-70965_08 - Options button should be visible
    @{Options}=  create list  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_options_btn]  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_CSV_btn]
    wait until page contain elements  @{Options}
    Click Element Until Visible  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_options_btn]
    Click Element Until Visible  ${locators_params['Campaigns']['Triggered_campaign']}[Audience_CSV_btn]




