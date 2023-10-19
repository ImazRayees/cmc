from utils.propertyreader import commonvariables
sortDate = 'last-2m'
import utils.propertyreader

sortDate = 'last-28d'
Clientid= utils.propertyreader.commonvariables.__init__().logincampID
orgId= ""
cloudLogin = ["{\"msg\":\"method\",\"method\":\"cloudLogin\",\"params\":[{\"username\":\"implementation@allophone.net\",\"password\":\"Impl7583\",\"clientLocalTime\":1591687526276,\"offsetTimeZone\":-330,\"loginType\":\"local\",\"logoutUrl\":\"/login\"}],\"id\":\"cloudLogin\"}"]
Logintoken = ["{\"msg\":\"method\",\"method\":\"login\",\"params\":[{\"user\":{\"username\":\"implementation@allophone.net\"},\"password\":{\"digest\":\"079410271b788f174a5350131209351b0bf8f40518e9c74afbab24c7a8adb410\",\"algorithm\":\"sha-256\"}}],\"id\":\"login\"}"]
user_preferences = ["{\"msg\":\"method\",\"method\":\"getUserPreferences\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":\"all\",\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":\"all\"}],\"id\":\"getUserPreferences\"}"]
# Insights Screen

Region_Data = ["{\"id\":\"cloudRegions\",\"msg\":\"method\",\"method\":\"cloudRegions\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
Location_data = ["{\"id\":\"cloudRegionsLocations\",\"msg\":\"method\",\"method\":\"cloudRegionsLocations\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]

Subscribers_by_Service_Tier_Technology = ["{\"id\":\"marketingTargetSegmentationTechnologyCountByServiceTier\",\"msg\":\"method\",\"method\":\"marketingTargetSegmentationTechnologyCountByServiceTier\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\"7583\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
Subscribers_Data_Usage = ["{\"id\":\"insightsTotalBandwidthConsumed\",\"msg\":\"method\",\"method\":\"insightsTotalBandwidthConsumed\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]

HeatMap_application_list = ["{\"id\":\"marketingInsightsApplicationList\",\"msg\":\"method\",\"method\":\"marketingInsightsApplicationList\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]
HeatMap_ChartData = ["{\"id\":\"marketingInsightsApplicationHeatmap\",\"msg\":\"method\",\"method\":\"marketingInsightsApplicationHeatmap\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]

Get_count_streaming_Gaming_WFH = ["{\"id\":\"marketingTargetSegmentationUserSummary\",\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserSummary\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]

Streaming_Subscribers = ["{\"id\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"type\":\"streaming\"}]}"]

Gaming_Subscribers = ["{\"id\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"type\":\"gaming\"}]}"]

WFH_Subscribers = ["{\"id\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserCountsByServiceTier\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"type\":\"wfh\"}]}"]

Churn_Rate_Insights = ["{\"id\":\"insightsChurnInsights\",\"msg\":\"method\",\"method\":\"insightsChurnInsights\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]

Retention_Table = ["{\"id\":\"marketingTargetSegementationRetentionInsights\",\"msg\":\"method\",\"method\":\"marketingTargetSegementationRetentionInsights\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]

Churn_Risk_Table = ["{\"id\":\"marketingChurnCandidatesInsights\",\"msg\":\"method\",\"method\":\"marketingChurnCandidatesInsights\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]

Top_Applications_Table = ["{\"id\":\"marketingInsightsTopApplications\",\"msg\":\"method\",\"method\":\"marketingInsightsTopApplications\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]

Top_Gaming_Applications_Table = ["{\"id\":\"marketingInsightsTopGamingApplications\",\"msg\":\"method\",\"method\":\"marketingInsightsTopGamingApplications\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]

CommandIQ_Insights_Table = ["{\"id\":\"marketingSmartHomeInsights\",\"msg\":\"method\",\"method\":\"marketingSmartHomeInsights\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\""+sortDate+"\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]

Usage_by_Application_Type_Chart = ["{\"id\":\"insightsAppGroupUsage\",\"msg\":\"method\",\"method\":\"insightsAppGroupUsage\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]

Acquisition_Rate_Insights_Chart = ["{\"id\":\"marketingAcquisitionRateInsights\",\"msg\":\"method\",\"method\":\"marketingAcquisitionRateInsights\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]

Acquisition_Revenue_And_Insights_Chart = ["{\"id\":\"marketingAcquisitionRevenueInsights\",\"msg\":\"method\",\"method\":\"marketingAcquisitionRevenueInsights\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]

New_Subscribers_by_Service_Tier_Technology_Chart = ["{\"id\":\"marketingTargetSegmentationNewTechnologyCountByServiceTier\",\"msg\":\"method\",\"method\":\"marketingTargetSegmentationNewTechnologyCountByServiceTier\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]

Subscriber_Activity_Trends_Chart = ["{\"id\":\"marketingInsightsSubscriberTrendsByApplicationGroup\",\"msg\":\"method\",\"method\":\"marketingInsightsSubscriberTrendsByApplicationGroup\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]

Data_Usage_Trends_Chart = ["{\"id\":\"marketingInsightsTotalStreamingUsageTrend\",\"msg\":\"method\",\"method\":\"marketingInsightsTotalStreamingUsageTrend\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]

Devices_per_Household_Chart = ["{\"id\":\"marketingInsightsDeviceInghts\",\"msg\":\"method\",\"method\":\"marketingInsightsDeviceInghts\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]

Household_Device_Trends_Chart = ["{\"id\":\"marketingInsightsSubscriberDistribution\",\"msg\":\"method\",\"method\":\"marketingInsightsSubscriberDistribution\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]

Service_Module_Adoption_Rate_Chart = ["{\"id\":\"marketingInsightsServiceAdoptionTrend\",\"msg\":\"method\",\"method\":\"marketingInsightsServiceAdoptionTrend\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]

WiFi_Device_Category_Trends_Chart = ["{\"id\":\"marketingInsightsDeviceCategoryTrend\",\"msg\":\"method\",\"method\":\"marketingInsightsDeviceCategoryTrend\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\"}]}"]

Subscribers_Service_Tier_Technology_FullScreen_Table = ["{\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserListByServiceTierAndTechDetail\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\",\"tier\":\"300M+\",\"tech\":\"Fiber\",\"page\":1,\"size\":10}],\"id\":\"marketingTargetSegmentationUserListByServiceTierAndTechDetail\"}"]

Subscribers_Data_Usage_FullScreen_Table = ["{\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserListByUsageDetail\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\",\"category\":\"150-300\",\"page\":1,\"size\":10}],\"id\":\"marketingTargetSegmentationUserListByUsageDetail\"}"]

Streaming_Subscribers_FullScreen_Table = ["{\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserListByServiceTierAndGroupDetail\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\",\"tier\":\"300M+\",\"reverse\":true,\"group\":\"streaming\",\"page\":1,\"size\":10}],\"id\":\"marketingTargetSegmentationUserListByServiceTierAndGroupDetail\"}"]

Gaming_Subscribers_FullScreen_Table = ["{\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserListByServiceTierAndGroupDetail\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\",\"tier\":\"50M+\",\"reverse\":true,\"group\":\"gaming\",\"page\":1,\"size\":10}],\"id\":\"marketingTargetSegmentationUserListByServiceTierAndGroupDetail\"}"]

WFH_Subscribers_FullScreen_Table = ["{\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserListByServiceTierAndGroupDetail\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\",\"tier\":\"50M+\",\"reverse\":false,\"group\":\"wfh\",\"page\":1,\"size\":10}],\"id\":\"marketingTargetSegmentationUserListByServiceTierAndGroupDetail\"}"]

Churn_Rate_Insights_FullScreen_Table = ["{\"msg\":\"method\",\"method\":\"marketingTargetSegmentationChurnInsightDetail\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\",\"start\":\"2020-03-01\",\"end\":\"2020-03-31\",\"tier\":\"300M+\",\"page\":1,\"size\":10}],\"id\":\"marketingTargetSegmentationChurnInsightDetail\"}"]

Churn_Rate_Insights_FullScreen_view_Table_row_inner_Charts_data = ["{\"msg\":\"method\",\"method\":\"marketingTargetSegmentationChurnInsightHistory\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\",\"churnDate\":\"2019-12\",\"endpointId\":\"12532586\"}],\"id\":\"marketingTargetSegmentationChurnInsightHistory\"}"]

Acquisition_Rate_Insights_FS_view_Bar_Table = ["{\"msg\":\"method\",\"method\":\"marketingAcquisitionRateInsightsDetail\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\",\"start\":\"2020-02-01\",\"end\":\"2020-02-29\",\"tier\":\"300M+\",\"page\":1,\"size\":10}],\"id\":\"marketingAcquisitionRateInsightsDetail\"}"]

Acquisition_Rate_Insights_FS_view_Bar_Table_click_1 = ["{\"msg\":\"method\",\"method\":\"marketingAcquisitionRateInsightsDetailLimits\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\",\"endpointId\":\"300138010\",\"startDate\":\"2020-02\"}],\"id\":\"marketingAcquisitionRateInsightsDetailLimits\"}"]

Acquisition_Rate_Insights_FS_view_Bar_Table_click_2 = ["{\"msg\":\"method\",\"method\":\"marketingAcquisitionRateInsightsDetailUsage\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\",\"endpointId\":\"300138010\",\"startDate\":\"2020-02\"}],\"id\":\"marketingAcquisitionRateInsightsDetailUsage\"}"]

Acquisition_Rate_Insights_FS_view_Bar_Table_click_2 = ["{\"msg\":\"method\",\"method\":\"marketingAcquisitionRateInsightsDetailDeviceTrends\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\",\"endpointId\":\"300138010\",\"startDate\":\"2020-02\"}],\"id\":\"marketingAcquisitionRateInsightsDetailDeviceTrends\"}"]

Acquisition_Rate_Insights_FS_view_Bar_Table_click_2 = ["{\"msg\":\"method\",\"method\":\"marketingAcquisitionRateInsightsDetailUsageByApplication\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\",\"endpointId\":\"300138010\",\"startDate\":\"2020-02\"}],\"id\":\"marketingAcquisitionRateInsightsDetailUsageByApplication\"}"]

Acquisition_Rate_Insights_FS_view_Bar_Table_click_2 = ["{\"msg\":\"method\",\"method\":\"marketingAcquisitionRateInsightsDetailTopApplications\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\",\"endpointId\":\"300138010\",\"startDate\":\"2020-02\"}],\"id\":\"marketingAcquisitionRateInsightsDetailTopApplications\"}"]

Acquisition_Revenue_And_Insights_FS_view_Bar_Table = ["{\"msg\":\"method\",\"method\":\"marketingAcquisitionRateInsightsDetail\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\",\"start\":\"2020-05-01\",\"end\":\"2020-05-31\",\"page\":1,\"size\":10}],\"id\":\"marketingAcquisitionRateInsightsDetail\"}"]

New_Subscribers_by_Service_Tier_Technology_Table = ["{\"msg\":\"method\",\"method\":\"marketingTargetSegmentationNewUserListByServiceTierAndTechDetail\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\",\"tier\":\"300M+\",\"tech\":\"Fiber\",\"page\":1,\"size\":10}],\"id\":\"marketingTargetSegmentationNewUserListByServiceTierAndTechDetail\"}"]

Usage_by_Application_Type_Table = ["{\"msg\":\"method\",\"method\":\"marketingInsightsAppInfoByGroupDetail\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\",\"group\":\"Web, Cloud, Storage Hosting\",\"page\":1,\"size\":10}],\"id\":\"marketingInsightsAppInfoByGroupDetail\"}"]

Top_Applications_FS_Table = "{\"id\":\"marketingTargetSegmentationUserCountByAppDetail\",\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserCountByAppDetail\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"app\":\"Amazon\",\"group\":null,\"page\":1,\"size\":100}]}"

Top_Gaming_Applications_FS_Table = "{\"id\":\"marketingTargetSegmentationUserCountByAppDetail\",\"msg\":\"method\",\"method\":\"marketingTargetSegmentationUserCountByAppDetail\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"app\":\"gaming (Twitch TV)\",\"group\":\"gaming\",\"page\":1,\"size\":100}]}"

Devices_per_Household_FS_Table = ["{\"msg\":\"method\",\"method\":\"marketingTargetSegmentationDeviceInsightDetail\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\",\"category\":\"10-14\",\"page\":1,\"size\":10}],\"id\":\"marketingTargetSegmentationDeviceInsightDetail\"}"]


# Upsell Screen

Upsell_page_onload = ["{\"msg\":\"method\",\"method\":\"getUserPreferences\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":\"all\",\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":\"all\",\"timezone\":\"05.30\"}],\"id\":\"getUserPreferences\"}"]

Upsell_page_onload_Region = ["{\"msg\":\"method\",\"method\":\"cloudRegionsLocations\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":\"all\",\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":\"all\",\"timezone\":\"05.30\"}],\"id\":\"cloudRegionsLocations\"}"]


Upsell_page_onload_Location = ["{\"msg\":\"method\",\"method\":\"cloudRegions\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":\"all\",\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":\"all\",\"timezone\":\"05.30\"}],\"id\":\"cloudRegions\"}"]

Target_Segmentation = ["{\"msg\":\"method\",\"method\":\"getMarketingTargetSegmentations\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"timezone\":\"05.30\"}],\"id\":\"getMarketingTargetSegmentations\"}"]

Map_Data_for_All_Subscribers = ["{\"msg\":\"method\",\"method\":\"marketingTargetSegmentationTargetUserReport\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":\"all\",\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":\"all\",\"timezone\":\"05.30\",\"data\":{\"name\":\"All Subscribers\",\"desc\":\"Default filter\"}}],\"id\":\"marketingTargetSegmentationTargetUserReport\"}"]

Map_Data_Left_menu_selection_CHANGE = ["{\"msg\":\"method\",\"method\":\"marketingTargetSegmentationTargetUserReport\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":\"all\",\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":\"all\",\"timezone\":\"05.30\",\"data\":{\"name\":\"CommandIQ test\",\"desc\":\"\",\"location\":[\"LINCOLN\"],\"numOfDevices\":\"\",\"configuredProfiles\":\"\",\"hasCalixSmartHomeApp\":\"true\"}}],\"id\":\"marketingTargetSegmentationTargetUserReport\"}"]

Target_Segmentation_User_count = ["{\"msg\":\"method\",\"method\":\"marketingUpsellSegmentationUserCount\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"_id\":\"Ni2ys37cZhM3NZrWB\",\"region\":\"LINCOLN\",\"location\":null,\"period\":\"last-28d\",\"name\":\"CommandIQ test\",\"desc\":\"\",\"filter\":{\"name\":\"CommandIQ test\",\"desc\":\"\",\"location\":[\"LINCOLN\"],\"numOfDevices\":\"\",\"hasCalixSmartHomeApp\":true,\"configuredProfiles\":\"\"}}],\"id\":\"marketingUpsellSegmentationUserCount\"}"]

Target_Segmentation_User_Report = ["{\"msg\":\"method\",\"method\":\"marketingTargetSegmentationTargetUserReport\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":\"All\",\"location\":null,\"period\":\"last-28d\",\"name\":\"CommandIQ test\",\"desc\":\"\",\"data\":{\"name\":\"CommandIQ test\",\"desc\":\"\",\"location\":[\"LINCOLN\"],\"numOfDevices\":\"\",\"hasCalixSmartHomeApp\":true,\"configuredProfiles\":\"\",\"polygon\":null,\"attainableRate\":false}}],\"id\":\"marketingTargetSegmentationTargetUserReport\"}"]

Target_Segmentation_Create_Newform_values_sending = ["{\"msg\":\"method\",\"method\":\"createMarketingTargetSegmentation\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":\"All\",\"location\":null,\"period\":\"last-28d\",\"name\":\"new upsell\",\"desc\":\"new upsell\",\"filter\":{\"name\":\"new upsell\",\"desc\":\"new upsell\",\"region\":\"All\",\"technologyType\":[\"Fiber\"],\"serviceTier\":[\"300M+\"],\"userType\":[\"Gaming\"],\"customerType\":[\"Residential\"],\"optOut\":\"N\",\"excessBandwidthGreaterThan\":\"2\",\"excessBandwidthUnknown\":true,\"attainableBitrateGreaterThan\":\"3\",\"attainableBitrateUnknown\":true,\"dataUsageGreaterThan\":\"4\",\"numOfDevices\":1,\"wifiScore\":5,\"hasWap\":true,\"hasCalixSmartHomeApp\":true,\"configuredProfiles\":\"2\",\"hasExosService\":\"all\"},\"countTimestamp\":\"2020-06-09\"}],\"id\":\"createMarketingTargetSegmentation\"}"]

Target_Segmentation_Map_Data_created_segment = ["{\"msg\":\"method\",\"method\":\"marketingTargetSegmentationTargetUserReport\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":\"All\",\"location\":null,\"period\":\"last-28d\",\"name\":\"new upsell\",\"desc\":\"new upsell\",\"data\":{\"name\":\"new upsell\",\"desc\":\"new upsell\",\"technologyType\":[\"Fiber\"],\"serviceTier\":[\"300M+\"],\"userType\":[\"Gaming\"],\"customerType\":[\"Residential\"],\"optOut\":\"N\",\"excessBandwidthGreaterThan\":\"2\",\"excessBandwidthUnknown\":true,\"attainableBitrateGreaterThan\":\"3\",\"attainableBitrateUnknown\":true,\"dataUsageGreaterThan\":\"4\",\"numOfDevices\":1,\"wifiScore\":5,\"hasWap\":true,\"hasCalixSmartHomeApp\":true,\"configuredProfiles\":\"2\",\"hasExosService\":\"all\",\"polygon\":null,\"attainableRate\":false}}],\"id\":\"marketingTargetSegmentationTargetUserReport\"}"]

Target_Segmentation_Updated_Leftmenu_list = ["{\"msg\":\"method\",\"method\":\"getMarketingTargetSegmentations\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":null,\"location\":null,\"period\":\"last-28d\"}],\"id\":\"getMarketingTargetSegmentations\"}"]

Target_Segmentation_Create_count = ["{\"msg\":\"method\",\"method\":\"getMarketingTargetSegmentationCounts\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":\"All\",\"location\":null,\"period\":\"last-28d\"}],\"id\":\"getMarketingTargetSegmentationCounts\"}"]

Target_Segmentation_Create_count_Map = ["{\"msg\":\"method\",\"method\":\"updateSelectedTargetSegCount\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":\"All\",\"location\":null,\"period\":\"last-28d\",\"count\":0}],\"id\":\"updateSelectedTargetSegCount\"}"]

Target_Segmentation_Save = ["{\"msg\":\"method\",\"method\":\"updateMarketingTargetSegmentation\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"_id\":\"Ni2ys37cZhM3NZrWB\",\"region\":\"LINCOLN\",\"location\":null,\"period\":\"last-28d\",\"name\":\"CommandIQ test\",\"desc\":\"CommandIQ test 1\",\"filter\":{\"name\":\"CommandIQ test\",\"desc\":\"CommandIQ test 1\",\"location\":[\"LINCOLN\"],\"numOfDevices\":\"\",\"hasCalixSmartHomeApp\":true,\"configuredProfiles\":\"\"}}],\"id\":\"updateMarketingTargetSegmentation\"}"]

Target_Segmentation_Delete_Request = ["{\"msg\":\"method\",\"method\":\"deleteMarketingTargetSegmentation\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"_id\":\"EhK8xx6rDRw63Hhgx\"}],\"id\":\"deleteMarketingTargetSegmentation\"}"]

Target_Segmentation_Delete_Update = ["{\"msg\":\"method\",\"method\":\"getMarketingTargetSegmentations\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"timezone\":\"05.30\",\"data\":[]}],\"id\":\"getMarketingTargetSegmentations\"}"]

Target_Segmentation_Delete_Update_count = ["{\"msg\":\"method\",\"method\":\"getMarketingTargetSegmentationCounts\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":\"all\",\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":\"all\",\"timezone\":\"05.30\",\"data\":[]}],\"id\":\"getMarketingTargetSegmentationCounts\"}"]

Target_Segmentation_Delete_map_data = ["{\"msg\":\"method\",\"method\":\"marketingTargetSegmentationTargetUserReport\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":\"all\",\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":\"all\",\"timezone\":\"05.30\",\"data\":{\"name\":\"CommandIQ test\",\"desc\":\"CommandIQ test 1\",\"location\":[\"LINCOLN\"],\"numOfDevices\":\"\",\"hasCalixSmartHomeApp\":true,\"configuredProfiles\":\"\"}}],\"id\":\"marketingTargetSegmentationTargetUserReport\"}"]

# Retention page

Retention_page_onload = ["{\"msg\":\"method\",\"method\":\"getUserPreferences\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":\"all\",\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":\"all\",\"timezone\":\"05.30\"}],\"id\":\"getUserPreferences\"}"]

Retention_region = ["{\"msg\":\"method\",\"method\":\"cloudRegionsLocations\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":\"all\",\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":\"all\",\"timezone\":\"05.30\"}],\"id\":\"cloudRegionsLocations\"}"]

Retention_location = ["{\"msg\":\"method\",\"method\":\"cloudRegions\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":\"all\",\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":\"all\",\"timezone\":\"05.30\"}],\"id\":\"cloudRegions\"}"]

Retention_Left_menu_list = ["{\"msg\":\"method\",\"method\":\"getMarketingRetentionSegmentations\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":\"all\",\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":\"all\",\"timezone\":\"05.30\",\"data\":[]}],\"id\":\"getMarketingRetentionSegmentations\"}"]

Retention_Map_Data = ["{\"msg\":\"method\",\"method\":\"marketingRetentionSegmentationUserReport\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":\"all\",\"timezone\":\"05.30\",\"data\":{\"name\":\"All Subscribers\",\"desc\":\"Default filter\"},\"polygon\":null,\"attainableRate\":false}],\"id\":\"marketingRetentionSegmentationUserReport\"}"]

Retention_Change_selection_item = ["{\"msg\":\"method\",\"method\":\"setUserPreferences\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":\"all\",\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":\"all\",\"timezone\":\"05.30\",\"targetSegmentationId\":\"KaaBgNithTuYKFo9d\"}],\"id\":\"setUserPreferences\"}"]

Retention_Change_selection_item_Map = ["{\"msg\":\"method\",\"method\":\"marketingRetentionSegmentationUserReport\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":\"all\",\"timezone\":\"05.30\",\"data\":{\"name\":\"test exos protection\",\"desc\":\"\",\"configuredProfiles\":\"\",\"hasExosService\":\"protectiq\"},\"polygon\":null,\"attainableRate\":false}],\"id\":\"marketingRetentionSegmentationUserReport\"}"]

Retention_Save_request = ["{\"msg\":\"method\",\"method\":\"createMarketingRetentionSegmentation\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":\"All\",\"location\":null,\"period\":\"last-28d\",\"name\":\"New Retention\",\"desc\":\"\",\"filter\":{\"name\":\"New Retention\",\"desc\":\"\",\"region\":\"FORT MORGAN\",\"technologyType\":[],\"serviceTier\":[\"50M+\"],\"userType\":[],\"customerType\":[],\"downstreamServiceLimit\":\"1\",\"upstreamServiceLimit\":\"1\",\"numOfDevices\":\"\",\"configuredProfiles\":\"\"},\"countTimestamp\":\"2020-06-09\"}],\"id\":\"createMarketingRetentionSegmentation\"}"]

Retention_Created_MAp = ["{\"msg\":\"method\",\"method\":\"marketingRetentionSegmentationUserReport\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":\"FORT MORGAN\",\"location\":null,\"period\":\"last-28d\",\"name\":\"New Retention\",\"desc\":\"\",\"data\":{\"name\":\"New Retention\",\"desc\":\"\",\"technologyType\":[],\"serviceTier\":[\"50M+\"],\"userType\":[],\"customerType\":[],\"downstreamServiceLimit\":\"1\",\"upstreamServiceLimit\":\"1\",\"numOfDevices\":\"\",\"configuredProfiles\":\"\",\"polygon\":null,\"attainableRate\":false}}],\"id\":\"marketingRetentionSegmentationUserReport\"}"]

Retention_Created_Updated_list = ["{\"msg\":\"method\",\"method\":\"getMarketingRetentionSegmentations\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":\"All\",\"location\":null,\"period\":\"last-28d\"}],\"id\":\"getMarketingRetentionSegmentations\"}"]

Retention_Created_Updated_Map_list = ["{\"msg\":\"method\",\"method\":\"updateSelectedRetentionSegCount\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":\"All\",\"location\":null,\"period\":\"last-28d\",\"count\":0}],\"id\":\"updateSelectedRetentionSegCount\"}"]

Retention_Preview_count = ["{\"msg\":\"method\",\"method\":\"marketingRetentionSegmentationUserCount\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"_id\":\"KaaBgNithTuYKFo9d\",\"region\":\"All\",\"location\":null,\"period\":\"last-28d\",\"name\":\"test exos protection\",\"desc\":\"\",\"filter\":{\"name\":\"test exos protection\",\"desc\":\"\",\"numOfDevices\":\"\",\"configuredProfiles\":\"\",\"hasExosService\":\"protectiq\"}}],\"id\":\"marketingRetentionSegmentationUserCount\"}"]

Retention_Preview_MapData = ["{\"msg\":\"method\",\"method\":\"marketingRetentionSegmentationUserReport\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":\"All\",\"location\":null,\"period\":\"last-28d\",\"name\":\"test exos protection\",\"desc\":\"\",\"data\":{\"name\":\"test exos protection\",\"desc\":\"\",\"numOfDevices\":\"\",\"configuredProfiles\":\"\",\"hasExosService\":\"protectiq\",\"polygon\":null,\"attainableRate\":false}}],\"id\":\"marketingRetentionSegmentationUserReport\"}"]

Retention_Preview_Update_count = ["{\"msg\":\"method\",\"method\":\"updateSelectedRetentionSegCount\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":\"All\",\"location\":null,\"period\":\"last-28d\",\"count\":0,\"segmentId\":\"KaaBgNithTuYKFo9d\"}],\"id\":\"updateSelectedRetentionSegCount\"}"]

Retention_Save_Update = ["{\"msg\":\"method\",\"method\":\"updateMarketingRetentionSegmentation\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"_id\":\"KaaBgNithTuYKFo9d\",\"region\":\"All\",\"location\":null,\"period\":\"last-28d\",\"name\":\"test exos protection\",\"desc\":\"test exos protection\",\"filter\":{\"name\":\"test exos protection\",\"desc\":\"test exos protection\",\"numOfDevices\":\"\",\"configuredProfiles\":\"\"}}],\"id\":\"updateMarketingRetentionSegmentation\"}"]

Retention_Save_Update_MapData = ["{\"msg\":\"method\",\"method\":\"marketingRetentionSegmentationUserReport\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":\"All\",\"location\":null,\"period\":\"last-28d\",\"name\":\"test exos protection\",\"desc\":\"test exos protection\",\"data\":{\"name\":\"test exos protection\",\"desc\":\"test exos protection\",\"numOfDevices\":\"\",\"configuredProfiles\":\"\",\"polygon\":null,\"attainableRate\":false}}],\"id\":\"marketingRetentionSegmentationUserReport\"}"]

Retention_Save_Update_count = ["{\"msg\":\"method\",\"method\":\"updateSelectedRetentionSegCount\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":\"All\",\"location\":null,\"period\":\"last-28d\",\"count\":54065,\"segmentId\":\"KaaBgNithTuYKFo9d\"}],\"id\":\"updateSelectedRetentionSegCount\"}"]

Retention_Save_Update_list = ["{\"msg\":\"method\",\"method\":\"getMarketingRetentionSegmentations\",\"params\":[{\"clientId\":\""+Clientid+"\",\"orgId\":\""+orgId+"\",\"region\":\"All\",\"location\":null,\"period\":\"last-28d\"}],\"id\":\"getMarketingRetentionSegmentations\"}"]

Retention_delete_Request = ["{\"msg\":\"method\",\"method\":\"deleteMarketingRetentionSegmentation\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"_id\":\"zLAkZGoA2pqN2tM2Q\"}],\"id\":\"deleteMarketingRetentionSegmentation\"}"]

Retention_delete_Menu_list = ["{\"msg\":\"method\",\"method\":\"getMarketingRetentionSegmentations\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":\"all\",\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":\"all\",\"timezone\":\"05.30\",\"data\":[]}],\"id\":\"getMarketingRetentionSegmentations\"}"]

Retention_delete_Menu_list_count = ["{\"msg\":\"method\",\"method\":\"getMarketingRetentionSegmentationCounts\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":\"all\",\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":\"all\",\"timezone\":\"05.30\",\"data\":[]}],\"id\":\"getMarketingRetentionSegmentationCounts\"}"]

Retention_delete_Menu_Map = ["{\"msg\":\"method\",\"method\":\"marketingRetentionSegmentationUserReport\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":\"all\",\"timezone\":\"05.30\",\"data\":{\"name\":\"New Retention\",\"desc\":\"\",\"region\":\"FORT MORGAN\",\"technologyType\":[],\"serviceTier\":[\"50M+\"],\"userType\":[],\"customerType\":[],\"downstreamServiceLimit\":\"1\",\"upstreamServiceLimit\":\"1\",\"numOfDevices\":\"\",\"configuredProfiles\":\"\"},\"polygon\":null,\"attainableRate\":false}],\"id\":\"marketingRetentionSegmentationUserReport\"}"]

#Acqiisition

Acquisitiondata = ["{\"msg\":\"method\",\"method\":\"marketingAcquisitionSegmentationExistingUserReport\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":\"all\",\"timezone\":\"05.30\",\"data\":{\"name\":\"All Subscribers\",\"desc\":\"\"},\"polygon\":null,\"attainableRate\":false}],\"id\":\"marketingAcquisitionSegmentationExistingUserReport\"}"]

#Mobile Notification

Mobile_Notifications =  ["{\"msg\":\"method\",\"method\":\"getSegments\",\"params\":[{\"endpoint\":\"all-segments?orgId="+orgId+"\",\"data\":{}}],\"id\":\"getSegments\"}"]

Mobile_Notifications_Schedule_tab =["{\"msg\":\"method\",\"method\":\"callPromotionApi\",\"params\":[{\"endpoint\":\"promotion/list?orgId="+orgId+"\",\"methodType\":\"GET\"}],\"id\":\"callPromotionApi\"}"]

Mobile_Notifications_Event_tab = ["{\"msg\":\"method\",\"method\":\"callPromotionApi\",\"params\":[{\"endpoint\":\"campaign-event/dashboard/"+orgId+"\",\"methodType\":\"GET\"},\"event\"],\"id\":\"callPromotionApi\"}"]

History_Schedule_button = ["{\"msg\":\"method\",\"method\":\"callPromotionApi\",\"params\":[{\"endpoint\":\"promotion/history?orgId="+orgId+"&from=0&size=10\",\"methodType\":\"GET\"}],\"id\":\"callPromotionApi\"}"]

History_event_button = ["{\"msg\":\"method\",\"method\":\"callPromotionApi\",\"params\":[{\"endpoint\":\"campaign-event/history/"+orgId+"\",\"methodType\":\"GET\"},\"event\"],\"id\":\"callPromotionApi\"}"]


# Search Screen

Search = ["{\"id\":\"marketingSubscribersearchAPI\",\"msg\":\"method\",\"method\":\"marketingSubscribersearchAPI\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"term\":\"use\"}]}"]

Search_User_Data = ["{\"id\":\"support.rpc.get-subscriber\",\"msg\":\"method\",\"method\":\"support.rpc.get-subscriber\",\"params\":[\""+orgId+"\",\"5b75aa36-703b-48d3-a281-5ce72d79aec8\"]}"]

Subscriber_usage = ["{\"id\":\"marketingSubscriberTblLenseData\",\"msg\":\"method\",\"method\":\"marketingSubscriberTblLenseData\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"endpointId\":91427427}]}"]

Usage_By_Application = ["{\"id\":\"marketingAcquisitionRateInsightsDetailUsageByApplication\",\"msg\":\"method\",\"method\":\"marketingAcquisitionRateInsightsDetailUsageByApplication\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"endpointId\":104258755}]}"]

Top_Search_app = ["{\"id\":\"marketingAcquisitionRateInsightsDetailTopApplications\",\"msg\":\"method\",\"method\":\"marketingAcquisitionRateInsightsDetailTopApplications\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"endpointId\":104258755}]}"]

Device_and_WiFI_Sscore_Trend = ["{\"id\":\"marketingSubscriberDeviceCategories\",\"msg\":\"method\",\"method\":\"marketingSubscriberDeviceCategories\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"endpointId\":104258755}]}"]

Competitor_vist_and_Speed_test_mintues = ["{\"id\":\"marketingSubscriberIotDevices\",\"msg\":\"method\",\"method\":\"marketingSubscriberIotDevices\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"endpointId\":104258755}]}"]

Search_User = ["{\"id\":\"marketingSubscribersearchAPI\",\"msg\":\"method\",\"method\":\"marketingSubscribersearchAPI\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"term\":\"Kevin  Rus\"}]}"]



# searched mahendra

searchfilter=["{\"id\":\"marketingSubscribersearchAPI\",\"msg\":\"method\",\"method\":\"marketingSubscribersearchAPI\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"term\":\"mahendra\"}]}"]
searchTableData=["{\"id\":\"marketingSubscriberTblLenseData\",\"msg\":\"method\",\"method\":\"marketingSubscriberTblLenseData\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"endpointId\":91427427}]}"]
searchusagebyapplication=["{\"id\":\"marketingAcquisitionRateInsightsDetailUsageByApplication\",\"msg\":\"method\",\"method\":\"marketingAcquisitionRateInsightsDetailUsageByApplication\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"endpointId\":91427427}]}"]
searchtopapplication=["{\"id\":\"marketingAcquisitionRateInsightsDetailTopApplications\",\"msg\":\"method\",\"method\":\"marketingAcquisitionRateInsightsDetailTopApplications\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"endpointId\":91427427}]}"]
searchIotdevices=["{\"id\":\"marketingSubscriberIotDevices\",\"msg\":\"method\",\"method\":\"marketingSubscriberIotDevices\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"endpointId\":91427427}]}"]
searchDevicecategory=["{\"id\":\"marketingSubscriberDeviceCategories\",\"msg\":\"method\",\"method\":\"marketingSubscriberDeviceCategories\",\"params\":[{\"clientId\":\""+Clientid+"\",\"location\":null,\"orgId\":\""+orgId+"\",\"period\":\"last-28d\",\"region\":null,\"startdate\":\"2020-03-15\",\"enddate\":\"2020-04-11\",\"socialChannelName\":\"YouTube\",\"timezone\":\"05.30\",\"endpointId\":91427427}]}"]