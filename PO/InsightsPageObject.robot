*** Settings ***
#Variables  ../utils/InsightScreenAPI.py
#Variables  ../utils/ExecutionStartEnd.py
#Library    RequestsLibrary
Library    SeleniumLibrary
##
#*** Variables ***
#
##API variables -  Subscribers by Service Tier And Technology
##${Connection_response}=   connected
#${Search_Region_Data}=    cloudRegions
#${response_connection}
#${response_connection}
#${response_searchRegion}
#${response_searchRegionLocation}
#${response_Subscribers_by_Service_Tier}
#${response_Subscribers_by_Service_Tier_And_Technology_Chart_category}
#${response_Subscribers_by_Service_Tier_And_Technology_Chart_series}
#${response_Subscribers_by_Service_Tier_And_Technology_Chart_total}
#${response_Subscribers_by_Service_Tier_And_Technology_table}
#
##API Variable  -   Subscribers Data Usage Chart
#${response_Subscribers_Data_Usage_Chart}
#${dataUsage_chart}
#${response_Subscribers_Data_Usage_Table}
#${dataUsage_table}
#
##API Variable  -   Social Channel Heatmap Applications List
#${response_Social_Channel_Heatmap_Applications_List}
#${heatmapApplication_lit}
#
##API Variable  -   Streaming Subscribers Chart Data categories
#${response_Streaming_Subscribers_Chart_Data_categories}
#${streaming_dataCategories}
#${response_Streaming_Subscribers_Chart_Data_series}
#${streaming_dataSeries}
#${response_Streaming_Subscribers_Chart_Data_total}
#${streaming_dataTotal}
#${response_Streaming_Subscribers_Table_Data}
#${streaming_tableData}
#
#
##API Variable  -  Gaming Subscribers Chart Data
#${response_Gaming_Subscribers_Chart_Data_categories}
#${gaming_subcribersDataCategories}
#${response_Gaming_Subscribers_Chart_Data_series}
#${gaming_subcribersDataSeries}
#${response_Gaming_Subscribers_Chart_Data_total}
#${gaming_subcribersDataTotal}
#${response_Gaming_Subscribers_Table_Data}
#${gaming_subcribersDataTable}
#
#
##API Variable  - Work from Home WFH Subscribers Chart Data
#${response_Work_from_Home_WFH_Subscribers_Chart_Data_categories}
#${workFromHome_categories}
#${response_Work_from_Home_WFH_Subscribers_Chart_Data_series}
#${workFromHome_series}
#${response_Work_from_Home_WFH_Subscribers_Chart_Data_totals}
#${workFromHome_totals}
#
#
##API Variable - Churn Rate & Insights Chart Data
#${response_Churn_Rate_AND_Insights_Chart_Data_categories}
#${response_Churn_Rate_AND_Insights_Chart_Data_series}
#${response_Churn_Rate_AND_Insights_Chart_Data_total}
#${response_Churn_Rate_AND_Insights_Chart_Table_Data}
#
##API Variable - Retention Table Data
#${response_Retention_Table_Data}
#
##API Variable - Churn Risk Table Data
#${response_Churn_Risk_Table_Data}
#
##API Variable - Top Applications Table Data
#${response_Top_Applications_Table_Data}
#
##API Variable - Top Gaming Applications Table Data
#${response_Top_Gaming_Applications_Table_Data}
#
##API Variable - CommandIQ Insights Table Data
#${response_CommandIQ_Insights_Table_Data}
#
#
## WebElement Variables
#${recByChart}=    css=.raphael-group-1556-plot-group > rect:nth-child(4)
#${Table_RowCount}=    xpath=//*[@id="append-table-list"]/tr
#${Table_ColumnCount}=   xpath=//*[@id="append-table-list"]/tr[1]/td
#
#${retention_tableRow}=    xpath=//*[@id="Retention"]/tbody/tr
#${retention_tableCol}=    xpath=//*[@id="Retention"]/tbody/tr[1]/td
#
#${charunRisk_tableRow}=    xpath=//*[@id="Churn-Risk"]/tbody/tr
#${charunRisk_tableCol}=    xpath=//*[@id="Churn-Risk"]/tbody/tr[1]/td
#
#${topApplication_tableRow}=    xpath=//*[@id="Top-Applications"]/tbody/tr
#${topApplication_tableCol}=    xpath=//*[@id="Top-Applications"]/tbody/tr[1]/td
#
#${topGamingApplication_tableRow}=    //*[@id="Top-Gaming-Applications"]/tbody/tr
#${topGamingApplication_tableCol}=    //*[@id="Top-Gaming-Applications"]/tbody/tr[1]/td
#
#${CommandIQInsights_tableRow}=    //*[@id="CommandIQ-Insights"]/tbody/tr
#${CommandIQInsights_tableCol}=    //*[@id="CommandIQ-Insights"]/tbody/tr[1]/td
#
#
## last-2m
## last-28d
#
#*** Keywords ***
##Execution start time stage
##        ${startTime}=   call method    ${objBfrRun}   startTimeInsert_Stage
##
##Execution start time Dev
##        ${startTime}=   call method    ${objBfrRun}   startTimeInsert_Dev
##
##Execution start time Prod
##        ${startTime}=   call method    ${objBfrRun}   startTimeInsert_Prod
#
##Execution end time
##        ${endTime}=   call method    ${objBfrRun}   endTimeUpdate
##
##ConfigReader dev
##        ${response_ConfigReader}=   call method    ${connectionObj}   ConfigReaderDev
##        log to console  running Dev..
#
##ConfigReader Stage
##        ${response_ConfigReader}=   call method    ${connectionObj}   ConfigReader
##        log to console  running Stage..
##
##ConfigReader Prod
##        ${response_ConfigReader}=   call method    ${connectionObj}   ConfigReaderProd
##        log to console  running Prod..
#
#WebSocket Connection
#        ${response_connection}=   call method    ${connectionObj}   WebsocketConnection
#        log to console    ${response_connection}
#        ${response_connectionLogin}=   call method    ${connectionObj}   login
#        log to console    ${response_connectionLogin}
##       data move to global  ${response_connection}
#
##data move to global
##[Arguments]    ${value}
##       log to console   ${value}
#
#APIResponse Search region data
#       log to console    ${response_connection}
#       ${response_searchRegion}=    call method    ${connectionObj}   Search_Region_Data
#       log to console    ${response_connection}
#       should contain   ${response_searchRegion}    ${Search_Region_Data}
#APIResponse ping_msg
#       ${response_ping_msg}=    call method    ${connectionObj}    ping_msg
#       log to console    ${response_ping_msg}
#
#APIResponse pong_msg
#       ${response_pong_msg}=    call method    ${connectionObj}    pong_msg
#       log to console    ${response_pong_msg}
#
#
#APIResponse Search region location data
#       ${response_searchRegionLocation}=    call method    ${connectionObj}   Search_Region_LocationData
#
#WebSocket Connection Close
#       ${Close_Connection}=    call method    ${connectionObj}    websocket_close
#
#
#
##    ------****  Subscribers by Service Tier And Technology Chart  *****-----------
#APIResponse Subscribers by Service Tier And Technology Chart
#       ${response_Subscribers_by_Service_Tier}=    call method    ${connectionObj}  Subscribers_by_Service_Tier_And_Technology_Chart
#
#APIResponse Subscribers by Service Tier And Technology Chart category
#        ${response_Subscribers_by_Service_Tier_And_Technology_Chart_category}=   call method    ${connectionObj}   Subscribers_by_Service_Tier_And_Technology_Chart_category
#        ${category_list}    get length    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_category}
#         log to console    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_category}
#              log to console    ${response_connection}
##         FOR    ${a}  IN RANGE  0  ${category_list}
##         log to console    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_category}
##         END
#
#APIResponse Subscribers by Service Tier And Technology Chart series
#        ${response_Subscribers_by_Service_Tier_And_Technology_Chart_series}=   call method    ${connectionObj}   Subscribers_by_Service_Tier_And_Technology_Chart_series
#        ${series_list}    get length    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_series}
#         log to console  ${series_list}
#         log to console    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_series}
#
#APIResponse Subscribers by Service Tier And Technology Chart total
#        ${response_Subscribers_by_Service_Tier_And_Technology_Chart_total}=   call method    ${connectionObj}   Subscribers_by_Service_Tier_And_Technology_Chart_total
#        ${category_total}    get length    ${response_Subscribers_by_Service_Tier_And_Technology_Chart_total}
##        log to console  ${response_Subscribers_by_Service_Tier_And_Technology_Chart_total}[0]
#
#APIResponse Subscribers by Service Tier And Technology Table
#        ${response_Subscribers_by_Service_Tier_And_Technology_table}=   call method    ${connectionObj}   Subscribers_by_Service_Tier_And_Technology_Table
#        ${category_table}    get length    ${response_Subscribers_by_Service_Tier_And_Technology_table}
#        log to console    ${category_table}
#        log to console    ${response_Subscribers_by_Service_Tier_And_Technology_table}
#
#
#Subscribers by Service Tier And Technology Table validation
#        ${response_Subscribers_by_Service_Tier_And_Technology_table}=   call method    ${connectionObj}   Subscribers_by_Service_Tier_And_Technology_Table
#        set selenium timeout    15 seconds
#        sleep    25
#        wait until page contains element    ${table_rowcount}
#        ${rows}=    get element count    ${table_rowcount}
#        ${columns}=    get element count    ${table_columncount}
#        FOR    ${a}  IN RANGE  1  ${columns}
#        ${data_table}  get text   xpath=//*[@id="append-table-list"]/tr[1]/td[${a}]
#        ${ConvertAPI}=    convert to string    ${response_Subscribers_by_Service_Tier_And_Technology_table}[0]
#        should contain  ${ConvertAPI}    ${data_table}
#        END
#
#
#
#
##    ------****  Subscribers Data Usage Chart  *****-----------
#APIResponse Subscribers Data Usage Chart
#        ${response_Subscribers_Data_Usage_Chart}=    call method     ${connectionObj}    Subscribers_Data_Usage_Chart_Gigabytes
#        log to console    ${response_Subscribers_Data_Usage_Chart}
#
#APIResponse Subscribers Data Usage Table
#        ${response_Subscribers_Data_Usage_Table}=    call method     ${connectionObj}    Subscribers_Data_Usage_Table
#         log to console    ${response_Subscribers_Data_Usage_Table}
#
#Subscribers Data Usage Chart Validation
#        set selenium implicit wait    30 seconds
#        WebSocket Connection
#        ${response_Subscribers_Data_Usage_Table}=    call method     ${connectionObj}    Subscribers_Data_Usage_Table
#        ${rows}=    get element count    ${table_rowcount}
#        ${columns}=    get element count    ${table_columncount}
#        FOR    ${a}  IN RANGE  1  ${columns}
#        ${data_table}  get text   xpath=//*[@id="append-table-list"]/tr[1]/td[${a}]
#        ${ConvertAPI}=    convert to string    ${response_Subscribers_Data_Usage_Table}[0]
#        should contain  ${ConvertAPI}    ${data_table}
#        END
#
#
#
##    ------****  Social Channel Heatmap Applications List  *****-----------
#APIResponse Social Channel Heatmap Applications List
#        ${response_Social_Channel_Heatmap_Applications_List}=    call method    ${connectionObj}    Social_Channel_Heatmap_Applications_List
##        ${heatmapApplication_lit}
#
#APIResponse Social Channel Heatmap Chart Data
#        ${response_Social_Channel_Heatmap_Chart_Data}=    call method     ${connectionObj}    Social_Channel_Heatmap_Chart_Data
##        ${heatmap_chartData}
#
#Social Channel Heatmap Applications List Validation
#         WebSocket Connection
#         ${response_Social_Channel_Heatmap_Chart_Data}=    call method     ${connectionObj}    Social_Channel_Heatmap_Chart_Data
#        ${rows}=    get element count    ${table_rowcount}
#        ${columns}=    get element count    ${table_columncount}
#        FOR    ${a}  IN RANGE  1  ${columns}
#        ${data_table}  get text   xpath=//*[@id="append-table-list"]/tr[1]/td[${a}]
#        ${ConvertAPI}=    convert to string    ${response_Social_Channel_Heatmap_Chart_Data}[0]
#        should contain  ${ConvertAPI}    ${data_table}
#        END
#
#
#
#
##    ------****  Streaming Subscribers Chart Data categories  *****-----------
#APIResponse Streaming Subscribers Chart Data categories
#        ${response_Streaming_Subscribers_Chart_Data_categories}=    call method    ${connectionObj}    Streaming_Subscribers_Chart_Data_categories
##        ${streaming_dataCategories}
#
#APIResponse Streaming Subscribers Chart Data series
#        ${response_Streaming_Subscribers_Chart_Data_series}=    call method    ${connectionObj}    Streaming_Subscribers_Chart_Data_series
##        ${streaming_dataSeries}
#
#APIResponse Streaming Subscribers Chart Data total
#        ${response_Streaming_Subscribers_Chart_Data_totalStreaming}=    call method    ${connectionObj}    Streaming_Subscribers_Chart_Data_totalStreaming
#        ${response_Streaming_Subscribers_Chart_Data_totalNonStreaming}=    call method    ${connectionObj}    Streaming_Subscribers_Chart_Data_total_Nonstreaming
##        ${streaming_dataTotal}
#
#APIResponse Streaming Subscribers Table Data
#        ${response_Streaming_Subscribers_Table_Data}=    call method    ${connectionObj}    Streaming_Subscribers_Table_Data
##        ${streaming_tableData}
#
#Streaming Subscribers Chart Data categories Validation
#         WebSocket Connection
#         ${response_Streaming_Subscribers_Table_Data}=    call method    ${connectionObj}    Streaming_Subscribers_Table_Data
#        ${rows}=    get element count    ${table_rowcount}
#        ${columns}=    get element count    ${table_columncount}
#        FOR    ${a}  IN RANGE  1  ${columns}
#        ${data_table}  get text   xpath=//*[@id="append-table-list"]/tr[1]/td[${a}]
#        ${ConvertAPI}=    convert to string    ${response_Streaming_Subscribers_Table_Data}[0]
#        should contain  ${ConvertAPI}    ${data_table}
#        END
#
##    ------****  Gaming_Subscribers_Chart_Data  *****-----------
#APIResponse Gaming Subscribers Chart Data categories
#        ${response_Gaming_Subscribers_Chart_Data_categories}=    call method    ${connectionObj}     Gaming_Subscribers_Chart_Data_categories
##        ${gaming_subcribersDataCategories}
#
#APIResponse Gaming Subscribers Chart Data series
#        ${response_Gaming_Subscribers_Chart_Data_series}=    call method    ${connectionObj}    Gaming_Subscribers_Chart_Data_series
##        ${gaming_subcribersDataSeries}
#
#APIResponse Gaming Subscribers Chart Data total
#        ${response_Gaming_Subscribers_Chart_Data_total}=    call method    ${connectionObj}    Gaming_Subscribers_Chart_Data_total
##        ${gaming_subcribersDataTotal}
#
#APIResponse Gaming Subscribers Table Data
#        ${response_Gaming_Subscribers_Table_Data}=    call method    ${connectionObj}    Gaming_Subscribers_Table_Data
##        ${gaming_subcribersDataTable}
#
#Gaming_Subscribers_Chart_Data Validation
#         WebSocket Connection
#         ${response_Gaming_Subscribers_Table_Data}=    call method    ${connectionObj}    Gaming_Subscribers_Table_Data
#        ${rows}=    get element count    ${table_rowcount}
#        ${columns}=    get element count    ${table_columncount}
#        FOR    ${a}  IN RANGE  1  ${columns}
#        ${data_table}  get text   xpath=//*[@id="append-table-list"]/tr[1]/td[${a}]
#        ${ConvertAPI}=    convert to string    ${response_Gaming_Subscribers_Table_Data}[0]
#        should contain  ${ConvertAPI}    ${data_table}
#        END
#
#
##    ------****  Work_from_Home_WFH_Subscribers_Chart_Data  *****-----------
#APIResponse Work from Home WFH Subscribers Chart Data categories
#        ${response_Work_from_Home_WFH_Subscribers_Chart_Data_categories}=    call method    ${connectionObj}    Work_from_Home_WFH_Subscribers_Chart_Data_categories
##        ${workFromHome_categories}
#
#APIResponse Work from Home WFH Subscribers Chart Data series
#        ${response_Work_from_Home_WFH_Subscribers_Chart_Data_series}=    call method    ${connectionObj}    Work_from_Home_WFH_Subscribers_Chart_Data_series
#        log to console    ${response_Work_from_Home_WFH_Subscribers_Chart_Data_series}[0]
#        log to console    ${response_Work_from_Home_WFH_Subscribers_Chart_Data_series}[1]
#
#APIResponse Work from Home WFH Subscribers Chart Data totals
#        ${response_Work_from_Home_WFH_Subscribers_Chart_Data_totals}=    call method    ${connectionObj}    Work_from_Home_WFH_Subscribers_Chart_Data_totals
##        ${workFromHome_totals}
#
#
#
#
##    ------****  Churn Rate & Insights Chart Data  *****-----------
#APIResponse Churn Rate AND Insights Chart Data categories
#        ${response_Churn_Rate_AND_Insights_Chart_Data_categories}=       call method    ${connectionObj}    Churn_Rate_AND_Insights_Chart_Data_categories
#
#APIResponse Churn Rate AND Insights Chart Data series
#        ${response_Churn_Rate_AND_Insights_Chart_Data_series}=       call method    ${connectionObj}    Churn_Rate_AND_Insights_Chart_Data_series
#
#APIResponse Churn Rate AND Insights Chart Data total
#        ${response_Churn_Rate_AND_Insights_Chart_Data_total}=       call method    ${connectionObj}    Churn_Rate_AND_Insights_Chart_Data_total
#
#APIResponse Churn Rate AND Insights Chart Table Data
#        ${response_Churn_Rate_AND_Insights_Chart_Table_Data}=       call method    ${connectionObj}    Churn_Rate_AND_Insights_Table_Data
#
#Churn Rate & Insights Chart Data Validation
#         WebSocket Connection
#         ${response_Churn_Rate_AND_Insights_Chart_Table_Data}=       call method    ${connectionObj}    Churn_Rate_AND_Insights_Table_Data
#        ${rows}=    get element count    ${table_rowcount}
#        ${columns}=    get element count    ${table_columncount}
#        FOR    ${a}  IN RANGE  1  ${columns}
#        ${data_table}  get text   xpath=//*[@id="append-table-list"]/tr[1]/td[${a}]
#        ${ConvertAPI}=    convert to string    ${response_Churn_Rate_AND_Insights_Chart_Table_Data}[0]
#        should contain  ${ConvertAPI}    ${data_table}
#        END
#
##    ------****  Retention Table Data  *****-----------
#APIResponse Retention Table Data
#        ${response_Retention_Table_Data}=       call method    ${connectionObj}    Retention_Table_Data
#         log to console   ${response_Retention_Table_Data}
##        FOR    ${row}  IN RANGE  0  7
##        Retention nested loop   ${row}
##        END
##
##Retention nested loop
##    [Arguments]    ${row}
##         ${response_Retention_Table_Data}=       call method    ${connectionObj}    Retention_Table_Data
##         FOR    ${col}  IN RANGE  0  3
##         log to console    ${response_Retention_Table_Data}[${row}][${col}]
##         END
##        log to console   ${response_Retention_Table_Data}[1]
##        log to console   ${response_Retention_Table_Data}[2]
#Retention Table Data Validation
#         WebSocket Connection
#         ${response_Retention_Table_Data}=       call method    ${connectionObj}    Retention_Table_Data
#        ${rows}=    get element count    ${retention_tableRow}
#        ${columns}=    get element count    ${retention_tableCol}
#        FOR    ${a}  IN RANGE  1  3
#        ${data_table}  get text    xpath=//*[@id="Retention"]/tbody/tr[1]/td[${a}]
#        ${ConvertAPI}=    convert to string   ${response_Retention_Table_Data}[${a}]
#        should contain  ${ConvertAPI}    ${data_table}
#        END
#
#
##    ------****  Churn Risk Table Data  *****-----------
#APIResponse Churn Risk Table Data
#        ${response_Churn_Risk_Table_Data}=       call method    ${connectionObj}   Churn_Risk_Table_Data
#        log to console    ${response_Churn_Risk_Table_Data}
#
#Churn Risk Table Data Validation
#         WebSocket Connection
#         ${response_Churn_Risk_Table_Data}=       call method    ${connectionObj}   Churn_Risk_Table_Data
#        ${rows}=    get element count    ${charunRisk_tableRow}
#        ${columns}=    get element count   ${charunRisk_tableCol}
#        FOR    ${a}  IN RANGE  1  ${columns}
#        ${data_table}  get text  xpath=//*[@id="Churn-Risk"]/tbody/tr[1]/td[${a}]
#        ${ConvertAPI}=    convert to string   ${response_Churn_Risk_Table_Data}[0]
#        should contain  ${ConvertAPI}    ${data_table}
#        END
#
#
##    ------****  Top Applications Table Data  *****-----------
#APIResponse Top Applications Table Data
#        ${response_Top_Applications_Table_Data}=       call method    ${connectionObj}   Top_Applications_Table_Data
##        log to console    ${response_Top_Applications_Table_Data}[0]
##        log to console    ${response_Top_Applications_Table_Data}[1]
##        log to console    ${response_Top_Applications_Table_Data}[2]
#
#Top Applications Table Data Validation
#         WebSocket Connection
#         ${response_Top_Applications_Table_Data}=       call method    ${connectionObj}   Top_Applications_Table_Data
#        ${rows}=    get element count    ${topApplication_tableRow}
#        ${columns}=    get element count  ${topApplication_tableCol}
#        FOR    ${a}  IN RANGE  1  ${columns}
#        ${data_table}  get text   xpath=//*[@id="Top-Applications"]/tbody/tr[1]/td[${a}]
#        ${ConvertAPI}=    convert to string   ${response_Top_Applications_Table_Data}[0]
#        should contain  ${ConvertAPI}    ${data_table}
#        END
#
#
##    ------****  Top Gaming Applications Table Data  *****-----------
#APIResponse Top Gaming Applications Table Data
#        ${response_Top_Gaming_Applications_Table_Data}=       call method    ${connectionObj}    Top_Gaming_Applications_Table_Data
#
#Top Gaming Applications Table Data Validation
#         WebSocket Connection
#        ${response_Top_Gaming_Applications_Table_Data}=       call method    ${connectionObj}    Top_Gaming_Applications_Table_Data
#        ${rows}=    get element count    ${topGamingApplication_tableRow}
#        ${columns}=    get element count    ${topGamingApplication_tableCol}
#        FOR    ${a}  IN RANGE  1  ${columns}
#        ${data_table}  get text   xpath=//*[@id="Top-Gaming-Applications"]/tbody/tr[1]/td[${a}]
#        ${ConvertAPI}=    convert to string   ${response_Top_Gaming_Applications_Table_Data}[0]
#        should contain  ${ConvertAPI}    ${data_table}
#        END
#
#
##    ------****  CommandIQ Insights Table Data  *****-----------
#APIResponse CommandIQ Insights Table Data
#        ${response_CommandIQ_Insights_Table_Data}=       call method    ${connectionObj}   CommandIQ_Insights_Table_Data
#        log to console    ${response_CommandIQ_Insights_Table_Data}[0]
#CommandIQ Insights Table Data Validation
#         WebSocket Connection
#        ${response_CommandIQ_Insights_Table_Data}=       call method    ${connectionObj}   CommandIQ_Insights_Table_Data
#        ${rows}=    get element count    ${CommandIQInsights_tableRow}
#        ${columns}=    get element count    ${CommandIQInsights_tableCol}
#        FOR    ${a}  IN RANGE  1  ${columns}
#        ${data_table}  get text   xpath=//*[@id="CommandIQ-Insights"]/tbody/tr[1]/td[${a}]
#        ${ConvertAPI}=    convert to string   ${response_CommandIQ_Insights_Table_Data}[0]
#        should contain  ${ConvertAPI}    ${data_table}
#        END
#
##    ------****  Usage by Application Type Chart Data  *****-----------
#APIResponse Usage by Application Type Chart Data
#        ${response_Usage_by_Application_Type_Chart_Data}=       call method    ${connectionObj}   Usage_by_Application_Type_Chart_Data
#         log to console    ${response_Usage_by_Application_Type_Chart_Data}
##    ------****  Acquisition Rate AND Insights Chart Data  *****-----------
#APIResponse Acquisition Rate AND Insights Chart Data
#        ${response_Acquisition_Rate_AND_Insights_Chart_Data}=       call method    ${connectionObj}   Acquisition_Rate_AND_Insights_Chart_Data
#
##    ------****  Acquisition Revenue And Insights Chart Data  *****-----------
#APIResponse Acquisition Revenue And Insights Chart Data
#        ${response_Acquisition_Revenue_And_Insights_Chart_Data}=       call method    ${connectionObj}   Acquisition_Revenue_And_Insights_Chart_Data
#
##    ------****  New Subscribers by Service Tier AND Technology  *****-----------
#APIResponse New_Subscribers_by_Service_Tier_AND_Technology
#        ${response_New_Subscribers_by_Service_Tier_AND_Technology}=       call method    ${connectionObj}   New_Subscribers_by_Service_Tier_AND_Technology
#
##    ------****  Devices per Household Chart   *****-----------
#APIResponse Devices_per_Household_Chart_subscribers
#        ${response_Devices_per_Household_Chart_subscribers}=       call method    ${connectionObj}   Devices_per_Household_Chart_subcribers
#
#APIResponse Devices_per_Household_Chart_devices
#        ${response_Devices_per_Household_Chart_devices}=       call method    ${connectionObj}   Devices_per_Household_Chart_devices
#
#
##    ------**** Data Usage Trends Charts   *****-----------
#APIResponse Data_Usage_Trends_Charts
#        ${response_Data_Usage_Trends_Charts}=       call method    ${connectionObj}   Data_Usage_Trends_Charts
#
#APIResponse Data_Usage_Trends_Charts_categories
#        ${response_Data_Usage_Trends_Charts_categories}=       call method    ${connectionObj}   Data_Usage_Trends_Charts_categories
#
#APIResponse Data_Usage_Trends_Charts_total
#        ${response_Data_Usage_Trends_Charts_total}=       call method    ${connectionObj}   Data_Usage_Trends_Charts_total
#
#APIResponse Data_Usage_Trends_Charts_streaming
#        ${response_Data_Usage_Trends_Charts_streaming}=       call method    ${connectionObj}   Data_Usage_Trends_Charts_streaming
#
#
##    ------**** Household Device Trends Charts  *****-----------
#APIResponse Household_Device_Trends_Charts
#        ${response_Household_Device_Trends_Charts}=       call method    ${connectionObj}   Household_Device_Trends_Charts
#
#APIResponse Household_Device_Trends_Charts_wifiscore
#        ${response_Household_Device_Trends_Charts_wifiscore}=       call method    ${connectionObj}   Household_Device_Trends_Charts_wifiscore
#
#APIResponse Household_Device_Trends_Charts_AverageDeviceCount
#        ${response_Household_Device_Trends_Charts_AverageDeviceCount}=       call method    ${connectionObj}   Household_Device_Trends_Charts_AverageDeviceCount
#
#
#
##    ------**** Service Module Adoption Rate  *****-----------
#APIResponse Service_Module_Adoption_Rate
#        ${response_Service_Module_Adoption_Rate}=       call method    ${connectionObj}   Service_Module_Adoption_Rate
#
##    ------**** WiFi Device Category Trends Charts  *****-----------
#APIResponse WiFi_Device_Category_Trends_Charts
#        ${response_WiFi_Device_Category_Trends_Charts}=       call method    ${connectionObj}   WiFi_Device_Category_Trends_Charts
#
#APIResponse WiFi_Device_Category_Trends_Charts_Computer
#        ${response_WiFi_Device_Category_Trends_Charts_Computer}=       call method    ${connectionObj}   WiFi_Device_Category_Trends_Charts_Computer
#
#APIResponse WiFi_Device_Category_Trends_Charts_phone
#        ${response_WiFi_Device_Category_Trends_Charts_phone}=       call method    ${connectionObj}   WiFi_Device_Category_Trends_Charts_phone
#
#
#
#
#
#
#
##*** Test Cases ***
##Verify the Websocket Connection
##     WebSocket Connection
##
##Verify Search region data
##      APIResponse Search region data
##
##Verfy Search region location data
##      APIResponse Search region location data
##
##Verify Subscribers by Service Tier And Technology Chart
##      APIResponse Subscribers by Service Tier And Technology Chart
##
##Verify Subscribers by Service Tier And Technology Chart category
##      APIResponse Subscribers by Service Tier And Technology Chart category
##
##Verify Subscribers by Service Tier And Technology Chart series
##      APIResponse Subscribers by Service Tier And Technology Chart series
##
##Verify Subscribers by Service Tier And Technology Chart total
##      APIResponse Subscribers by Service Tier And Technology Chart total
##
##Verify Subscribers by Service Tier And Technology Table
##      APIResponse Subscribers by Service Tier And Technology Table
#
