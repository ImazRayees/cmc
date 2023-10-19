*** Settings ***
Variables  ../utils/InsightScreenAPI.py
Variables  ../utils/CMC-API.py
Library    RequestsLibrary
Library    SeleniumLibrary
Variables  ../utils/ExecutionStartEnd.py
Variables  ../Results/readxml_report_push.py
Variables  ../utils/configReader.py
Variables  ../utils/OptimizeAPI.py

*** Variables ***


*** Keywords ***
ConfigReader dev
        ${response_ConfigReader}=   call method    ${CMCconnectionObj}   ConfigReaderDev
        log to console  running Dev..

ConfigReader devfunc
        ${response_ConfigReader}=   call method    ${API_CMCObj}   DevfuncYamlReader
        log to console  running Devfunc..

ConfigReader Stage
        ${response_ConfigReader}=   call method    ${CMCconnectionObj}   ConfigReaderStage
        log to console  running Stage..

DB Call for Report update
        ${ConfigReader}=   call method    ${objBfrRun}    ConfigRead
        ${Start_time}=   call method    ${objBfrRun}    startTimeInsert_Stage

DB Call for End the Report update
        ${End_time}=   call method    ${objBfrRun}    endTimeUpdate

ConfigReader Prod
        ${response_ConfigReader}=   call method    ${CMCconnectionObj}   ConfigReaderProd
        log to console  running Prod..

Execution start time stage
        ${startTime}=   call method    ${objBfrRun}   startTimeInsert_Stage

Execution start time Dev
        ${startTime}=   call method    ${objBfrRun}   startTimeInsert_Dev

Execution start time Prod
        ${startTime}=   call method    ${objBfrRun}   startTimeInsert_Prod

Execution end time
        ${endTime}=   call method    ${objBfrRun}   endTimeUpdate


APIReponse Login
        ${Url}=   call method    ${ObjconfigReader}   environment
        run keyword if   '${Url}' == 'Dev'    Devfunc Login API
        ...   ELSE IF   '${Url}' == 'Devfunc'    Devfunc Login API
        ...   ELSE IF   '${Url}' == 'Stage'    Stage Login API

Stage Login API
        ${response_Login}=   call method    ${CMCconnectionObj}   loginAPI
        log to console    ${response_Login}
        should contain     '''${response_Login}'''     200

Devfunc Login API
        ${response_Login}=   call method    ${API_CMCObj}   UserLogin_UserCMC
        log to console    ${response_Login}
        should contain     '''${response_Login}'''     200

APIResponse Login_cmcAuto
        ${response_Login}=   call method    ${CMCconnectionObj}   loginAPI_cmcAuto
        log to console    ${response_Login}
        should contain     '''${response_Login}'''     200


APIReponse Acquisition_Revenue_And_Insights_drilldown_single_subscriber_service_limit
        ${response}=   call method    ${CMCconnectionObj}   Acquisition_Revenue_And_Insights_drilldown_single_subscriber_service_limit
        log to console    ${response}
        should contain     '''${response}'''     200

APIReponse Acquisition_Revenue_And_Insights_drilldown_single_subscriber_usage
        ${response}=   call method    ${CMCconnectionObj}   Acquisition_Revenue_And_Insights_drilldown_single_subscriber_usage
        log to console    ${response}
        should contain     '''${response}'''     200

APIReponse Acquisition_Revenue_And_Insights_drilldown_single_subscriber_device_trends
        ${response}=   call method    ${CMCconnectionObj}   Acquisition_Revenue_And_Insights_drilldown_single_subscriber_device_trends
        log to console    ${response}
        should contain     '''${response}'''     200

APIReponse Acquisition_Revenue_And_Insights_drilldown_single_subscriber_usage_by_app_type
        ${response}=   call method    ${CMCconnectionObj}   Acquisition_Revenue_And_Insights_drilldown_single_subscriber_usage_by_app_type
        log to console    ${response}
        should contain     '''${response}'''     200

APIReponse Acquisition_Revenue_And_Insights_drilldown_single_subscriber_top_apps
        ${response}=   call method    ${CMCconnectionObj}   Acquisition_Revenue_And_Insights_drilldown_single_subscriber_top_apps
        log to console    ${response}
        should contain     '''${response}'''     200

APIReponse New_Subscribers_by_Service_Tier_And_Technology_filter
        ${response}=   call method    ${CMCconnectionObj}   New_Subscribers_by_Service_Tier_And_Technology_filter
        should contain     '''${response}'''     200

APIReponse Competitor_Visit_and_Speed_Test_Minutes_drilldown
        ${response}=   call method    ${CMCconnectionObj}   Competitor_Visit_and_Speed_Test_Minutes_drilldown
        should contain     '''${response}'''     200
APIReponse Service_Limits_drilldown
        ${response}=   call method    ${CMCconnectionObj}   Service_Limits_drilldown
        should contain     '''${response}'''     200
APIReponse Subscriber_Usage_drilldown
        ${response}=   call method    ${CMCconnectionObj}   Subscriber_Usage_drilldown
        should contain     '''${response}'''     200
APIReponse Subscriber_Revenue_drilldown
        ${response}=   call method    ${CMCconnectionObj}   Subscriber_Revenue_drilldown
        should contain     '''${response}'''     200
APIReponse Blocked_Threats_Insights_drilldown
        ${response}=   call method    ${CMCconnectionObj}   Blocked_Threats_Insights_drilldown
        should contain     '''${response}'''     200
APIReponse Service_Module_Adoption_Rate
        ${response}=   call method    ${CMCconnectionObj}   Service_Module_Adoption_Rate
        should contain     '''${response}'''     200
APIReponse Social_Channel_Heatmap
        ${response}=   call method    ${CMCconnectionObj}   Social_Channel_Heatmap
        should contain     '''${response}'''     200
APIReponse Social_Channel_List_for_Dropdown
        ${response}=   call method    ${CMCconnectionObj}   Social_Channel_List_for_Dropdown
        should contain     '''${response}'''     200
APIReponse Config_for_Widget_hide_show
        ${response}=   call method    ${CMCconnectionObj}   Config_for_Widget_hide_show
        should contain     '''${response}'''     200
APIReponse Location_Region_List
        ${response}=   call method    ${CMCconnectionObj}   Location_Region_List
        should contain     '''${response}'''     200
APIReponse Active_Subscriber_Count
        ${response}=   call method    ${CMCconnectionObj}   Active_Subscriber_Count
        should contain     '''${response}'''     200
APIReponse UPSELL_MAP_VIEW_user_counts
        ${response}=   call method    ${CMCconnectionObj}   UPSELL_MAP_VIEW_user_counts
        should contain     '''${response}'''     200
APIReponse UPSELL_MAP_VIEW_user_report
        ${response}=   call method    ${CMCconnectionObj}   UPSELL_MAP_VIEW_user_report
        should contain     '''${response}'''     200
APIReponse UPSELL_MAP_VIEW_acquisition_wire_center_report
        ${response}=   call method    ${CMCconnectionObj}   UPSELL_MAP_VIEW_acquisition_wire_center_report
        should contain     '''${response}'''     200
APIReponse UPSELL_MAP_VIEW_Form_Creation_Field_Drop_Down_Data
        ${response}=   call method    ${CMCconnectionObj}   UPSELL_MAP_VIEW_Form_Creation_Field_Drop_Down_Data
        should contain     '''${response}'''     200
APIReponse UPSELL_MAP_VIEW_TABLE_VIEW
        ${response}=   call method    ${CMCconnectionObj}   UPSELL_MAP_VIEW_TABLE_VIEW
        should contain     '''${response}'''     200
APIReponse UPSELL_MAP_VIEW_EXPORT
        ${response}=   call method    ${CMCconnectionObj}   UPSELL_MAP_VIEW_EXPORT
        should contain     '''${response}'''     200
APIReponse UPSELL_MAP_VIEW_CREATE_TARGET_SEGMENTATION
        ${response}=   call method    ${CMCconnectionObj}   UPSELL_MAP_VIEW_CREATE_TARGET_SEGMENTATION
        should contain     '''${response}'''     200

APIReponse RETENTION_MAP_VIEW_retention_insights_report
        ${response}=   call method    ${CMCconnectionObj}   RETENTION_MAP_VIEW_retention_insights_report
        should contain     '''${response}'''     200
APIReponse RETENTION_MAP_VIEW_acquisition_wire_center_report
        ${response}=   call method    ${CMCconnectionObj}   RETENTION_MAP_VIEW_acquisition_wire_center_report
        should contain     '''${response}'''     200

APIReponse RETENTION_Form_Creation_Field_Drop_Down_Data
        ${response}=   call method    ${CMCconnectionObj}   RETENTION_Form_Creation_Field_Drop_Down_Data
        should contain     '''${response}'''     200
APIReponse RETENTION_TABLE_VIEW
        ${response}=   call method    ${CMCconnectionObj}   RETENTION_TABLE_VIEW
        should contain     '''${response}'''     200
APIReponse RETENTION_EXPORT
        ${response}=   call method    ${CMCconnectionObj}   RETENTION_EXPORT
        should contain     '''${response}'''     200
APIReponse RETENTION_CREATE_TARGET_SEGMENTATION
        ${response}=   call method    ${CMCconnectionObj}   RETENTION_CREATE_TARGET_SEGMENTATION
        should contain     '''${response}'''     200
APIReponse ACQUISITION_MAP_VIEW_acquisition_existing_report
        ${response}=   call method    ${CMCconnectionObj}   ACQUISITION_MAP_VIEW_acquisition_existing_report
        should contain     '''${response}'''     200

APIReponse ACQUISITION_MAP_VIEW_acquisition_prospect_report
        ${response}=   call method    ${CMCconnectionObj}   ACQUISITION_MAP_VIEW_acquisition_prospect_report
        should contain     '''${response}'''     200

APIReponse ACQUISITION_MAP_VIEW_acquisition_wire_center_report
        ${response}=   call method    ${CMCconnectionObj}   ACQUISITION_MAP_VIEW_acquisition_wire_center_report
        should contain     '''${response}'''     200

APIReponse ACQUISITION_Form_Creation_Field_Drop_Down_Data
        ${response}=   call method    ${CMCconnectionObj}   ACQUISITION_Form_Creation_Field_Drop_Down_Data
        should contain     '''${response}'''     200

APIReponse ACQUISITION_TABLE_VIEW
        ${response}=   call method    ${CMCconnectionObj}   ACQUISITION_TABLE_VIEW
        should contain     '''${response}'''     200

APIReponse ACQUISITION_CREATE_TARGET_SEGMENTATION
        ${response}=   call method    ${CMCconnectionObj}   ACQUISITION_CREATE_TARGET_SEGMENTATION
        should contain     '''${response}'''     200

APIReponse MOBILE_NOTIFICATIONS_CREATE_NEW_NOTIFICATION
        ${response}=   call method    ${CMCconnectionObj}   MOBILE_NOTIFICATIONS_CREATE_NEW_NOTIFICATION


APIReponse MOBILE_NOTIFICATIONS_SCHEDULED_LIST
        ${response}=   call method    ${CMCconnectionObj}   MOBILE_NOTIFICATIONS_SCHEDULED_LIST
        should contain     '''${response}'''     200

APIReponse MOBILE_NOTIFICATIONS_DELETE_SCHEDULED_LIST
        ${response}=   call method    ${CMCconnectionObj}   MOBILE_NOTIFICATIONS_DELETE_SCHEDULED_LIST

APIReponse MOBILE_NOTIFICATIONS_Segment_API
        ${response}=   call method    ${CMCconnectionObj}   MOBILE_NOTIFICATIONS_Segment_API
        should contain     '''${response}'''     200

APIReponse MOBILE_NOTIFICATIONS_Campaign_Event_history_view_by_orgid
        ${response}=   call method    ${CMCconnectionObj}   MOBILE_NOTIFICATIONS_Campaign_Event_history_view_by_orgid
        should contain     '''${response}'''     200

APIReponse MOBILE_NOTIFICATIONS_Campaign_Event_history_view_by_campaign_id
        ${response}=   call method    ${CMCconnectionObj}   MOBILE_NOTIFICATIONS_Campaign_Event_history_view_by_campaign_id
        should contain     '''${response}'''     200

APIReponse MOBILE_NOTIFICATIONS_EDIT_DELETE_EVENT_LIST
        ${response}=   call method    ${CMCconnectionObj}   MOBILE_NOTIFICATIONS_EDIT_DELETE_EVENT_LIST


APIReponse MOBILE_NOTIFICATIONS_HISTORY_LIST
        ${response}=   call method    ${CMCconnectionObj}   MOBILE_NOTIFICATIONS_HISTORY_LIST
        should contain     '''${response}'''     200
APIReponse MOBILE_NOTIFICATIONS_EVENT_LIST
        ${response}=   call method    ${CMCconnectionObj}   MOBILE_NOTIFICATIONS_EVENT_LIST
        should contain     '''${response}'''     200
APIReponse SEARCH_WIDGET
        ${response}=   call method    ${CMCconnectionObj}   SEARCH_WIDGET
        should contain     '''${response}'''     200
APIReponse SEARCH_SEARCH_USER
        ${response}=   call method    ${CMCconnectionObj}   SEARCH_SEARCH_USER
        should contain     '''${response}'''     200
APIReponse SEARCH_Top_Applications
        ${response}=   call method    ${CMCconnectionObj}   SEARCH_Top_Applications
        should contain     '''${response}'''     200
APIReponse SEARCH_USER_INFORMATION_LIST_prioritySearch
        ${response}=   call method    ${CMCconnectionObj}   SEARCH_USER_INFORMATION_LIST_prioritySearch
        should contain     '''${response}'''     200
APIReponse SEARCH_Subscriber_usage
        ${response}=   call method    ${CMCconnectionObj}   SEARCH_Subscriber_usage
        should contain     '''${response}'''     200
APIReponse SEARCH_Usage_By_Application
        ${response}=   call method    ${CMCconnectionObj}   SEARCH_Usage_By_Application
        should contain     '''${response}'''     200
APIReponse SEARCH_Competitor_vist_and_Speed_test_mintues
        ${response}=   call method    ${CMCconnectionObj}   SEARCH_Competitor_vist_and_Speed_test_mintues
        should contain     '''${response}'''     200
APIReponse SEARCH_Service_Limits
        ${response}=   call method    ${CMCconnectionObj}   SEARCH_Service_Limits
        should contain     '''${response}'''     200

#--------------------------------------------
APIReponse Subscribers_by_Service_Tier_And_Technology_export1
        ${response}=   call method    ${CMCconnectionObj}   Subscribers_by_Service_Tier_And_Technology_export1
        should contain     '''${response}'''     200

APIReponse Subscribers_by_Service_Tier_And_Technology_export2
        ${response}=   call method    ${CMCconnectionObj}   Subscribers_by_Service_Tier_And_Technology_export2
        should contain     '''${response}'''     200

APIReponse Subscriber_Data_Usage_export1
        ${response}=   call method    ${CMCconnectionObj}   Subscriber_Data_Usage_export1
        should contain     '''${response}'''     200

APIReponse Subscriber_Data_Usage_export2
        ${response}=   call method    ${CMCconnectionObj}   Subscriber_Data_Usage_export2
        should contain     '''${response}'''     200

APIReponse Social_Channel_Heatmap_export1
        ${response}=   call method    ${CMCconnectionObj}   Social_Channel_Heatmap_export1
        should contain     '''${response}'''     200

APIReponse Streaming_Subscribers_export1
        ${response}=   call method    ${CMCconnectionObj}   Streaming_Subscribers_export1
        should contain     '''${response}'''     200

APIReponse Streaming_Subscribers_export2
        ${response}=   call method    ${CMCconnectionObj}    Streaming_Subscribers_export2
        should contain     '''${response}'''     200

APIReponse Gaming_Subscribers_export1
        ${response}=   call method    ${CMCconnectionObj}    Gaming_Subscribers_export1
        should contain     '''${response}'''     200

APIReponse Gaming_Subscribers_export2
        ${response}=   call method    ${CMCconnectionObj}    Gaming_Subscribers_export2
        should contain     '''${response}'''     200

APIReponse Work_from_Home_Subscribersexport1
        ${response}=   call method    ${CMCconnectionObj}    Work_from_Home_Subscribersexport1
        should contain     '''${response}'''     200

APIReponse Work_from_Home_Subscribersexport2
        ${response}=   call method    ${CMCconnectionObj}    Work_from_Home_Subscribersexport2
        should contain     '''${response}'''     200

APIReponse Churn_Rate_And_Insights_export1
        ${response}=   call method    ${CMCconnectionObj}    Churn_Rate_And_Insights_export1
        should contain     '''${response}'''     200

APIReponse Churn_Rate_And_Insights_export_churn_user_report_overall
        ${response}=   call method    ${CMCconnectionObj}    Churn_Rate_And_Insights_export_churn_user_report_overall
        should contain     '''${response}'''     200

APIReponse Churn_Rate_And_Insights_export_churn_user_history
        ${response}=   call method    ${CMCconnectionObj}    Churn_Rate_And_Insights_export_churn_user_history
        should contain     '''${response}'''     200

APIReponse Retention_export1
        ${response}=   call method    ${CMCconnectionObj}    Retention_export1
        should contain     '''${response}'''     200

APIReponse Churn_Risk_export1
        ${response}=   call method    ${CMCconnectionObj}    Churn_Risk_export1
        should contain     '''${response}'''     200

APIReponse Acquisition_Rate_And_Insights_export1
        ${response}=   call method    ${CMCconnectionObj}    Acquisition_Rate_And_Insights_export1
        should contain     '''${response}'''     200

APIReponse Acquisition_Rate_And_Insights_export2
        ${response}=   call method    ${CMCconnectionObj}    Acquisition_Rate_And_Insights_export2
        should contain     '''${response}'''     200

APIReponse Acquisition_Revenue_And_Insights_export1
        ${response}=   call method    ${CMCconnectionObj}    Acquisition_Revenue_And_Insights_export1
        should contain     '''${response}'''     200

APIReponse Acquisition_Revenue_And_Insights_export2
        ${response}=   call method    ${CMCconnectionObj}    Acquisition_Revenue_And_Insights_export2
        should contain     '''${response}'''     200

APIReponse New_Subscribers_by_Service_Tier_And_Technology_export1
        ${response}=   call method    ${CMCconnectionObj}    New_Subscribers_by_Service_Tier_And_Technology_export1
        should contain     '''${response}'''     200

APIReponse New_Subscribers_by_Service_Tier_And_Technology_export2
        ${response}=   call method    ${CMCconnectionObj}    New_Subscribers_by_Service_Tier_And_Technology_export2
        should contain     '''${response}'''     200

APIReponse Usage_by_Application_Type_export1
        ${response}=   call method    ${CMCconnectionObj}    Usage_by_Application_Type_export1
        should contain     '''${response}'''     200

APIReponse Top_Applications_export1
        ${response}=   call method    ${CMCconnectionObj}    Top_Applications_export1
        should contain     '''${response}'''     200

APIReponse Top_Applications_export2
        ${response}=   call method    ${CMCconnectionObj}    Top_Applications_export2
        should contain     '''${response}'''     200

APIReponse Top_Gaming_Applications_export1
        ${response}=   call method    ${CMCconnectionObj}    Top_Gaming_Applications_export1
        should contain     '''${response}'''     200

APIReponse Top_Gaming_Applications_export2
        ${response}=   call method    ${CMCconnectionObj}    Top_Gaming_Applications_export2
        should contain     '''${response}'''     200

APIReponse Subscriber_Activity_Trends_export1
        ${response}=   call method    ${CMCconnectionObj}    Subscriber_Activity_Trends_export1
        should contain     '''${response}'''     200

APIReponse Data_Usage_Trends_export1
        ${response}=   call method    ${CMCconnectionObj}    Data_Usage_Trends_export1
        should contain     '''${response}'''     200

APIReponse CommandIQ_Insights_export1
        ${response}=   call method    ${CMCconnectionObj}    CommandIQ_Insights_export1
        should contain     '''${response}'''     200

APIReponse Devices_per_Household_export1_connected_device_number_distribution
        ${response}=   call method    ${CMCconnectionObj}    Devices_per_Household_export1_connected_device_number_distribution
        should contain     '''${response}'''     200

APIReponse Devices_per_Household_export1_user_list_by_connected_device_number
        ${response}=   call method    ${CMCconnectionObj}    Devices_per_Household_export1_user_list_by_connected_device_number
        should contain     '''${response}'''     200

APIReponse Service_Module_Adoption_Rate_export1
        ${response}=   call method    ${CMCconnectionObj}    Service_Module_Adoption_Rate_export1
        should contain     '''${response}'''     200

APIReponse Wi_Fi_Device_Category_Trends_export1
        ${response}=   call method    ${CMCconnectionObj}    Wi_Fi_Device_Category_Trends_export1
        should contain     '''${response}'''     200

APIReponse Blocked_Threats_Insights_export1
        ${response}=   call method    ${CMCconnectionObj}    Blocked_Threats_Insights_export1
        should contain     '''${response}'''     200

APIReponse Upsell_export_Export_in_Table_View_Subscribers_Table_View
        ${response}=   call method    ${CMCconnectionObj}    Upsell_export_Export_in_Table_View_Subscribers_Table_View
        should contain     '''${response}'''     200

APIReponse Upsell_export_Export_in_Table_View_Locations_Table_View
        ${response}=   call method    ${CMCconnectionObj}    Upsell_export_Export_in_Table_View_Locations_Table_View
        should contain     '''${response}'''     200

APIReponse Upsell_Export_Map_View_Subscribers
        ${response}=   call method    ${CMCconnectionObj}    Upsell_Export_Map_View_Subscribers
        should contain     '''${response}'''     200

APIReponse Upsell_Export_in_Table_Map_Locations
        ${response}=   call method    ${CMCconnectionObj}    Upsell_Export_in_Table_Map_Locations
        should contain     '''${response}'''     200

APIReponse Retention_Export_in_Table_View_Subscribers_Table_View
        ${response}=   call method    ${CMCconnectionObj}    Retention_Export_in_Table_View_Subscribers_Table_View
        should contain     '''${response}'''     200

APIReponse Retention_Export_in_Table_View_Locations_Table_View
        ${response}=   call method    ${CMCconnectionObj}    Retention_Export_in_Table_View_Locations_Table_View
        should contain     '''${response}'''     200

APIReponse Retention_Export_Map_View_Subscribers
        ${response}=   call method    ${CMCconnectionObj}    Retention_Export_Map_View_Subscribers
        should contain     '''${response}'''     200

APIReponse Retention_Export_in_Table_Map_Locations
        ${response}=   call method    ${CMCconnectionObj}    Retention_Export_in_Table_Map_Locations
        should contain     '''${response}'''     200

APIReponse Acquisition_Export_in_Table_View_Existing_Subscribers_Table_View
        ${response}=   call method    ${CMCconnectionObj}    Acquisition_Export_in_Table_View_Existing_Subscribers_Table_View
        should contain     '''${response}'''     200

APIReponse Acquisition_Export_in_Table_View_Prospect_Subscribers_Table_View
        ${response}=   call method    ${CMCconnectionObj}    Acquisition_Export_in_Table_View_Prospect_Subscribers_Table_View
        should contain     '''${response}'''     200

APIReponse Acquisition_Export_in_Table_View_Locations_Table_View
        ${response}=   call method    ${CMCconnectionObj}    Acquisition_Export_in_Table_View_Locations_Table_View
        should contain     '''${response}'''     200

APIReponse Acquisition_Export_in_Map_View_Existing_subscribers
        ${response}=   call method    ${CMCconnectionObj}    Acquisition_Export_in_Map_View_Existing_subscribers
        should contain     '''${response}'''     200

APIReponse Acquisition_Export_in_Table_Map_Prospect_Subscribers
        ${response}=   call method    ${CMCconnectionObj}    Acquisition_Export_in_Table_Map_Prospect_Subscribers
        should contain     '''${response}'''     200

APIReponse Acquisition_Export_in_Table_Map_Locations
        ${response}=   call method    ${CMCconnectionObj}    Acquisition_Export_in_Table_Map_Locations
        should contain     '''${response}'''     200

APIReponse Campaign_New
        ${response}=   call method    ${CMCconnectionObj}    Campaign_New
        should contain     '''${response}'''     200

APIReponse Campaign_Marketing
        ${response}=   call method    ${CMCconnectionObj}    Campaign_Marketing
        should contain     '''${response}'''     200

APIReponse Segments_Recommended
        ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
        should contain     '''${response}'''     200

APIReponse Segments_Saved
        ${response}=   call method    ${CMCconnectionObj}    Segments_Saved
        should contain     '''${response}'''     200

APIReponse Campaign_Subscriber_Search
        ${response}=   call method    ${CMCconnectionObj}    Campaign_Subscriber_Search
        should contain     '''${response}'''     200

APIReponse Campaign_MarketingChannels_Mailchimp
        ${response}=   call method    ${CMCconnectionObj}    Campaign_MarketingChannels_Mailchimp
        should contain     '''${response}'''     200

APIReponse Campaign_MobileNotification_History
        ${response}=   call method    ${CMCconnectionObj}    Campaign_MobileNotification_History
        should contain     '''${response}'''     200

APIReponse Marketing_Channels_Facebook
        ${response}=   call method    ${CMCconnectionObj}    Marketing_Channels_Facebook
        should contain     '''${response}'''     200

APIReponse Marketing_Channel
        ${response}=   call method    ${CMCconnectionObj}    Marketing_Channel
        should contain     '''${response}'''     200

APIReponse Marketing_Channels_Hubspot
        ${response}=   call method    ${CMCconnectionObj}    Marketing_Channels_Hubspot
        should contain     '''${response}'''     200

APIReponse Campaign_Hubspot_Marketing_Channel_Results
        ${response}=   call method    ${CMCconnectionObj}    Campaign_Hubspot_Marketing_Channel_Results
        should contain     '''${response}'''     200

APIReponse NewCampaign_Filter_Region
        ${response}=   call method    ${CMCconnectionObj}    NewCampaign_Filter_Region
        should contain     '''${response}'''     200

APIReponse NewCampaign_Filter_Location
        ${response}=   call method    ${CMCconnectionObj}    NewCampaign_Filter_Location
        should contain     '''${response}'''     200

APIReponse NewCampaign_Filter_Service
        ${response}=   call method    ${CMCconnectionObj}    NewCampaign_Filter_Service
        should contain     '''${response}'''     200

APIReponse NewCampaign_Filter_Propensity
        ${response}=   call method    ${CMCconnectionObj}    NewCampaign_Filter_Propensity
        should contain     '''${response}'''     200

APIReponse SEARCH_SubscriberCount
        ${response}=   call method    ${CMCconnectionObj}    SEARCH_SubscriberCount
        should contain     '''${response}'''     200

#Home

validate data in homescreen
    [Tags]  Testing
    APIReponse StageYamlReader
    APIReponse UserLogin_UserCMC
    APIReponse Social_Channel_Heatmap_charts

#Explore Data

APIReponse StageYamlReader
        ${response}=   call method    ${API_CMCObj}    StageYamlReader

APIReponse UserLogin_UserCMC
        ${response}=   call method    ${API_CMCObj}    UserLogin_UserCMC
        should contain     '''${response}'''     200

APIReponse Subscribers_Data_Usage
        ${response}=   call method    ${API_CMCObj}   Subscribers_Data_Usage
        log to console    ${response}[0]
        should contain     '''${response}[0]'''     200

APIReponse Subscribers_Data_Usage_drilldown
        ${response}=   call method    ${API_CMCObj}   Subscribers_Data_Usage_drilldown
        log to console    ${response}
        should contain     '''${response}'''     200

APIReponse Streaming_Subscribers
        ${response}=   call method    ${API_CMCObj}   Streaming_Subscribers
        log to console    ${response}
        should contain     '''${response}'''     200

APIReponse Streaming_Subscribers_drilldown
        ${response}=   call method    ${API_CMCObj}   Streaming_Subscribers_drilldown
        log to console    ${response}
        should contain     '''${response}'''     200

APIReponse Gaming_Subscribers
        ${response}=   call method    ${API_CMCObj}   Gaming_Subscribers
        log to console    ${response}
        should contain     '''${response}'''     200

APIReponse Gaming_Subscribers_drilldown
        ${response}=   call method    ${API_CMCObj}   Gaming_Subscribers_drilldown
        log to console    ${response}
        should contain     '''${response}'''     200

APIReponse Work_from_Home_WFH_Subscribers
        ${response}=   call method    ${API_CMCObj}   Work_from_Home_WFH_Subscribers
        log to console    ${response}
        should contain     '''${response}'''     200

APIReponse Work_from_Home_WFH_Subscribers_drilldown
        ${response}=   call method    ${API_CMCObj}   Work_from_Home_WFH_Subscribers_drilldown
        log to console    ${response}
        should contain     '''${response}'''     200

APIReponse Subscriber_Activity_Trends
        ${response}=   call method    ${API_CMCObj}   Subscriber_Activity_Trends
        should contain     '''${response}'''     200

APIReponse Data_Usage_Trends
        ${response}=   call method    ${API_CMCObj}   Data_Usage_Trends
        should contain     '''${response}'''     200

APIReponse Devices_per_Household
        ${response}=   call method    ${API_CMCObj}   Devices_per_Household
        should contain     '''${response}'''     200

APIReponse Devices_per_Household_drilldown
        ${response}=   call method    ${API_CMCObj}   Devices_per_Household_drilldown
        should contain     '''${response}'''     200

APIReponse Subscribers_by_Service_Tier_And_Technology
        ${response}=   call method    ${API_CMCObj}   Subscribers_by_Service_Tier_And_Technology
        log to console    ${response}[0]
        should contain     '''${response}[0]'''     200

APIReponse Subscribers_by_Service_Tier_And_Technology_drilldown
        ${response}=   call method    ${API_CMCObj}   Subscribers_by_Service_Tier_And_Technology_drilldown
        log to console    ${response}
        should contain     '''${response}'''     200

APIReponse Household_Device_Trends
        ${response}=   call method    ${API_CMCObj}   Household_Device_Trends
        should contain     '''${response}'''     200

APIReponse Wi_Fi_Device_Category_Trends
        ${response}=   call method    ${API_CMCObj}   Wi_Fi_Device_Category_Trends
        should contain     '''${response}'''     200

APIReponse Blocked_Threats_Insights
        ${response}=   call method    ${API_CMCObj}   Blocked_Threats_Insights
        should contain     '''${response}'''     200

APIReponse CommandIQ_Insights
        ${response}=   call method    ${API_CMCObj}   CommandIQ_Insights
        should contain     '''${response}'''     200

APIReponse Usage_by_Application_Type
        ${response}=   call method    ${API_CMCObj}   Usage_by_Application_Type
        should contain     '''${response}'''     200

APIReponse Usage_by_Application_Type_drilldown
        ${response}=   call method    ${API_CMCObj}   Usage_by_Application_Type_drilldown
        should contain     '''${response}'''     200

APIReponse Top_Applications
        ${response}=   call method    ${API_CMCObj}   Top_Applications
        should contain     '''${response}'''     200

APIReponse Top_Applications_drilldown
        ${response}=   call method    ${API_CMCObj}   Top_Applications_drilldown
        should contain     '''${response}'''     200

APIReponse Top_Gaming_Applications
        ${response}=   call method    ${API_CMCObj}   Top_Gaming_Applications
        should contain     '''${response}'''     200

APIReponse Top_Gaming_Applications_drilldown
        ${response}=   call method    ${API_CMCObj}   Top_Gaming_Applications_drilldown
        should contain     '''${response}'''     200

APIReponse Social_Channel_Heatmap_charts
        ${response}=   call method    ${API_CMCObj}    Social_Channel_Heatmap_charts
        should contain     '''${response}'''     200

APIReponse churn_rate_And_insights
        ${response}=   call method    ${API_CMCObj}   churn_rate_And_insights
        log to console    ${response}
        should contain     '''${response}'''     200

APIReponse churn_rate_And_insights_drilldown
        ${response}=   call method    ${API_CMCObj}   churn_rate_And_insights_drilldown
        log to console    ${response}
        should contain     '''${response}'''     200

APIReponse Churn_Risk
        ${response}=   call method    ${API_CMCObj}   Churn_Risk
        log to console    ${response}
        should contain     '''${response}'''     200

APIReponse Retention
        ${response}=   call method    ${API_CMCObj}   Retention
        log to console    ${response}
        should contain     '''${response}'''     200

APIReponse New_Subscribers_by_Service_Tier_And_Technology
        ${response}=   call method    ${API_CMCObj}   New_Subscribers_by_Service_Tier_And_Technology
        log to console    ${response}
        should contain     '''${response}'''     200

APIReponse New_Subscribers_by_Service_Tier_And_Technology_drilldown
        ${response}=   call method    ${API_CMCObj}   New_Subscribers_by_Service_Tier_And_Technology_drilldown
        should contain     '''${response}'''     200

APIReponse Acquisition_Revenue_And_Insights
        ${response}=   call method    ${API_CMCObj}   Acquisition_Revenue_And_Insights
        log to console    ${response}
        should contain     '''${response}'''     200

APIReponse Acquisition_Revenue_And_Insights_drilldown
        ${response}=   call method    ${API_CMCObj}   Acquisition_Revenue_And_Insights_drilldown
        log to console    ${response}
        should contain     '''${response}'''     200

APIReponse Acquisition_rate_And_Insights
        ${response}=   call method    ${API_CMCObj}   Acquisition_rate_And_Insights
        log to console    ${response}
        should contain     '''${response}'''     200

APIReponse Acquisition_rate_And_Insights_drilldown
        ${response}=   call method    ${API_CMCObj}   Acquisition_rate_And_Insights_drilldown
        log to console    ${response}
        should contain     '''${response}'''     200

APIReponse Device_CommandIQ_Status
        ${response}=   call method    ${API_CMCObj}    Device_CommandIQ_Status
        should contain     '''${response}'''     200

APIReponse Device_Revenue_Edge_Suite_Status_ExperienceIQ
        ${response}=   call method    ${API_CMCObj}    Device_Revenue_Edge_Suite_Status_ExperienceIQ
        should contain     '''${response}'''     200

APIReponse Device_Revenue_Edge_Suite_Status_ProtectIQ
        ${response}=   call method    ${API_CMCObj}    Device_Revenue_Edge_Suite_Status_ProtectIQ
        should contain     '''${response}'''     200

APIReponse Device_Revenue_Edge_Suite_Status_Arlo
        ${response}=   call method    ${API_CMCObj}    Device_Revenue_Edge_Suite_Status_Arlo
        should contain     '''${response}'''     200

APIReponse Device_Trends
        ${response}=   call method    ${API_CMCObj}      Device_Trends
        should contain     '''${response}'''     200

APIReponse Services_Smart_Home_Insights
        ${response}=   call method    ${API_CMCObj}    Services_Smart_Home_Insights
        should contain     '''${response}'''     200

APIReponse Services_Wifi_Device_Category_Trends
        ${response}=   call method    ${API_CMCObj}    Services_Wifi_Device_Category_Trends
        should contain     '''${response}'''     200

APIReponse Services_Edge_Suites_Tresnds
        ${response}=   call method    ${API_CMCObj}    Services_Edge_Suites_Tresnds
        should contain     '''${response}'''     200

APIReponse Services_Household_Device_Trends
        ${response}=   call method    ${API_CMCObj}    Services_Household_Device_Trends
        should contain     '''${response}'''     200