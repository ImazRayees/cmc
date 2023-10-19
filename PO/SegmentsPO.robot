*** Settings ***
Library    SeleniumLibrary
Resource   ../PO/CommonWrapper.robot
Resource   ../PO/PageTitleKeywords.robot
Resource   ../PO/Campigns_po.robot

*** Variables ***
${segments}=  id=segmentsMarketingSection
${segmentsHeader}=  //*[@class='subs-title']//*[text()='Segments']
${segments_newBtn}=  //button[contains(.,'New')]

${segments_recommendedTab}=  //*[contains(text(),'Recommended')]
${recommended_thName}=  (//th[contains(text(),'Name')])[1]
${recommended_thType}=  (//th[contains(text(),'Type')])[1]
${recommended_thCampInProg}=  (//th[contains(text(),'Campaigns')])[1]
${recommended_thCreated}=  (//th[contains(text(),'Created')])[1]
${recommended_tableInfo}=  (//*[@class='dataTables_info'])[1]
${recommended_tRow}=  (//tbody)[1]//tr
${recommended_tCol}=  (//tbody)[1]//tr[1]//td
${recommended_dropdownFirstElement}=  (//*[contains(@class,'dropdown-item')])[1]
${recommended_pagination_First}=  (//*[text()='First'])[1]
${recommended_pagination_First_disabled}=  (//*[@class='paginate_button first disabled'])[1]
${recommended_pagination_Previous}=  (//*[text()='Previous'])[1]
${recommended_pagination_Previous_disabled}=  (//*[@class='paginate_button previous disabled'])[1]
${recommended_pagination_1}=  (//*[text()='1'])[1]
${recommended_pagination_1_string}=  1
${recommended_pagination_2}=  (//*[text()='2'])[1]
${recommended_pagination_2_string}=  2
${recommended_pagination_next}=  (//*[text()='Next'])[1]
${recommended_pagination_last}=   (//*[text()='Last'])[1]
${recommended_pagination_current}=  (//*[@class='paginate_button current'])[1]

${segments_savedTab}=  id=seg-saved-tab
${saved_thName}=  (//th[contains(text(),'Name')])[2]
${saved_thType}=  (//th[contains(text(),'Type')])[2]
${saved_thCampInProg}=  (//th[contains(text(),'Campaigns')])[2]
${saved_thSubscribers}=  (//th[contains(text(),'Count')])[2]
${saved_tableInfo}=  (//*[@class='dataTables_info'])[2]
${saved_tRow}=  (//tbody)[3]//tr
${saved_tCol}=  (//tbody)[3]//tr[1]//td
${saved_pagination_First}=  (//*[text()='First'])[2]
${saved_pagination_First_disabled}=  (//*[@class='paginate_button first disabled'])[2]
${saved_pagination_Previous}=  (//*[text()='Previous'])[2]
${saved_pagination_Previous_disabled}=  (//*[@class='paginate_button previous disabled'])[2]
${saved_pagination_1}=  (//*[text()='1'])[2]
${saved_pagination_1_string}=  1
${saved_pagination_2}=  (//*[text()='2'])[2]
${saved_pagination_2_string}=  2
${saved_pagination_next}=  (//*[text()='Next'])[2]
${saved_pagination_last}=   (//*[text()='Last'])[2]
${saved_pagination_current}=  (//*[@class='paginate_button current'])[2]
${saved_firstDotDeleteBtn}=  (//button[contains(.,'Delete')])[1]
${saved_deletePopupTitle}=  //*[contains(text(),'Are you sure want to delete?')]
${saved_deletePopupYes}=  //button[contains(.,'Yes')]
${saved_deletePopupNo}=  //button[contains(.,'No')]
${saved_segmentDeleteSuccess}=  //*[contains(text(),'Segment Deleted Successfully')]
${exploreDataTitle}=  (//*[contains(text(),'Explore Data')])[2]
${basicTab}=  id=basicData-list-tab
${advancedTab}=  id=advancedData-list-tab
${Upsell_segment}=   ((//*[@class='table-row-group'])[2]/tr/td[contains(text(),'Upsell')])[1]
${Retention_segment}=   ((//*[@class='table-row-group'])[2]/tr/td[contains(text(),'Retention')])[1]
${Acquisition_segment}=   ((//*[@class='table-row-group'])[2]/tr/td[contains(text(),'Acquisition')])[1]
${Upsell_segbtn}=   ((//*[@class='table-row-group'])[2]/tr/td[contains(text(),'Upsell')])[1]/parent::tr/td[1]
${Retention_segbtn}=   ((//*[@class='table-row-group'])[2]/tr/td[contains(text(),'Retention')])[1]/parent::tr/td[1]
${Acquisition_segbtn}=   ((//*[@class='table-row-group'])[2]/tr/td[contains(text(),'Acquisition')])[1]/parent::tr/td[1]
${Recommended_seg_1st_row}=  (//tbody[@class='table-row-group'])[1]//tr[1]/td[1]
${Saved_seg_1st_row}=   (//tbody[@class='table-row-group'])[2]//tr[1]/td[1]
*** Keywords ***
Navigate to segments and verify elements on the Saved screen
    [Documentation]   Navigate and Verify the Recommended Segments elements are available
    click element until visible  ${segments_savedtab}
    Verify elements on segments screen
    Verify the Search and types in Saved Segments
    get table data without api call  ${recommended_trow}  ${recommended_tcol}

Verify elements on segments screen
    [Documentation]   CCL-68673_16,CCL-68753_01 Verify the Elements present in Segments Screen
    @{elements}=  Create List  ${segmentsheader}   ${segments_recommendedtab}  ${segments_savedtab}
    ...  ${recommended_thname}  ${recommended_thtype}  ${recommended_thcampinprog}  ${recommended_thcampinprog}
    ...  ${recommended_thcreated}  ${recommended_tableinfo}  ${recommended_pagination_first_disabled}
    ...  ${recommended_pagination_previous_disabled}  ${recommended_pagination_next}  ${recommended_pagination_last}
    wait until page contain elements  @{elements}
    sleep  5
    @{Headers}=  create list  ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_name]  ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_type]
    ...  ${test_data_config['env']['Campaigns']['Segments_list']}[Campaign_th]  ${test_data_config['env']['Campaigns']['Segments_list']}[Count_th]
    ...  ${test_data_config['env']['Campaigns']['Segments_list']}[Created_th]  ${test_data_config['env']['Campaigns']['Segments_list']}[Modify_th]   ${EMPTY}
    Get text and Ensure the Headers are Equal  ${locators_params['Segments']}[Saved_th]   @{Headers}
    capture the screen  segmentsScreen
    verify page title for segments screen

click on a data from campaigns in progress and verify its navigating to campaigns results
    [Documentation]   Click the In Progress Campaigns and Page should Navigate to Campaigns Results Page
    ${Recommended_text}=  get text   ${Recommended_seg_1st_row}
    run keyword if   "${Recommended_text}" != "No Data Available"    Navigation for Segments to Campaigns
    ...  ELSE   log   No Data Available in Recommended Segments

Navigation for Segments to Campaigns
    [Documentation]   CCL-68753_08,09,10  Mouse Over a Campaigns list and click one campaigns it's should navigate to Campaigns Page
    mouse over  //*[@id='sorting']/tbody/tr[1]/td[3]
    ${campName}=  get text  ${recommended_dropdownFirstElement}
    click element until visible  ${recommended_dropdownFirstElement}
    wait until page contains   ${campName}  60s
    sleep  5
    capture the screen  clickNavigation-segRecommended
    close the results and verify navigated to All campaigns screen

close the results and verify navigated to All campaigns screen
    [Documentation]   Close the Campaign and Navigate to Segments tab
    click element until visible  ${campaigns_close_X}
    wait until page contains element  ${campaigns_searchfield}  60s
    capture the screen  allCampFromSegment
    Verify the Recommended Segments

Navigate to Saved tab under segments and verify elements on the screen
    [Documentation]   Verify the Basic Elements are present in Saved Segments
    click element until visible  ${segments}
    click element until visible  ${segments_savedtab}
    @{elements}=  Create List  ${saved_thname}  ${saved_thtype}  ${saved_thcampinprog}  ${saved_thsubscribers}
    ...  ${saved_tableinfo}  ${saved_pagination_first}  ${saved_pagination_previous}
    ...  ${saved_pagination_next}  ${saved_pagination_last}
    wait until page contain elements  @{elements}
    get table data without api call  ${saved_trow}  ${saved_tcol}
    capture the screen    segmentsSaved

Delete a segment and verify its deleted
    [Documentation]   Delete a segments in saved segments and Verify the Saved segments are deleted successfully
    ${Saved_text}=  get text   ${Saved_seg_1st_row}
    run keyword if   "${Saved_text}" != "No Data Available"    Verify the Segment are able Delete
    ...  ELSE   log   No Data Available in Saved Segments

Verify the Segment are able Delete
    [Documentation]   CCL-71564_01,CCL-71564_02 -Verify the Segment list
    sleep    5
    wait until element visible    ${locators_params['Segments']}[Saved_pagination]
    ${getthecount}    get text    ${locators_params['Segments']}[Saved_last_page_no]
    FOR   ${robot}    IN RANGE   1    ${getthecount}
        ${result}=  Run Keyword And Return Status    element should be visible    ${locators_params['Segments']}[Saved_delete_check]
        Run Keyword If   "${result}" == "True"  run keywords   Delete the Saved segments if Campaign not present
        ...    AND  Exit For Loop
        ...    ELSE   run keywords  page should not contain element   ${locators_params['Segments']}[Saved_delete_btn]
        ...    AND  click element until visible    ${locators_params['Segments']}[Saved_next_btn]
        Sleep  4s
        Log    ${robot}
    END

Delete the Saved segments if Campaign not present
    [Documentation]  CCL-71564_02 - Verify the Delete button for a segment if not contains a campaign
    click element until visible  ${locators_params['Segments']}[Saved_delete_btn]
    @{elements}=  Create List  ${saved_deletepopuptitle}  ${saved_deletepopupyes}  ${saved_deletepopupno}
    wait until page contain elements   @{elements}
    capture the screen  segmentDeletePopup
    click element until visible  ${saved_deletepopupyes}
    capture the screen  After deleted

Navigate to Saved Segments
    [Documentation]   Page should Navigated to Saved Segments tab
    click element until visible  ${segments}
    click element until visible  ${segments_savedtab}
    sleep  10s

verify the navigation for Retention
   [Documentation]  CCL-50953   Retention should naviagted to Advanced Tab
   click element until visible  ${segments_savedtab}
   ${Status}=  Run Keyword and Return Status    element should be visible    ${Retention_segment}
   Run Keyword If  ${status}  Run Keyword    validate the Retention Navigation
   ...    ELSE   log   Retention not available

validate the Retention Navigation
   [Documentation]   Page should Navigated to Advanced tab
   click element until visible    ${Retention_segbtn}
   element should be visible   ${advanced_navigation}
   Capture Page Screenshot   RetentionNavigationinsegment

verify the navigation for Upsell
   [Documentation]   Check Upsell is Available, If Available then run Navigation testcases
   ${Status}=  Run Keyword and Return Status    element should be visible    ${Upsell_segment}
   Run Keyword If  ${status}  Run Keyword    validate the Upsell Navigation
   ...    ELSE   log   Upsell not available

validate the Upsell Navigation
   [Documentation]   Page should Navigate to Advanced tab
   click element until visible    ${Upsell_segbtn}
   element should be visible   ${advanced_navigation}
   Capture Page Screenshot   UpsellNavigationinsegment

verify the navigation for Acquistion
   [Documentation]   Check Acquistion is Available, If Available then run Navigation testcases
   ${Status}=  Run Keyword and Return Status    element should be visible    ${Acquisition_segment}
   Run Keyword If  ${status}  Run Keyword    validate the Acquisition Navigation
   ...    ELSE   log   Acquisition not available

validate the Acquisition Navigation
   [Documentation]   Page should Navigated to Prospects tab
   click element until visible    ${Acquisition_segbtn}
   element should be visible   ${prospects_navigation}
   Capture Page Screenshot   AcquisitionNavigationinsegment

Check the Acquistion are Presents in Recommended Segments
   [Documentation]   Acquistion didn't came regularly in Recommended Segments, Hence Verify the Availablility
   [Arguments]   ${Acquistion_keywords}
   ${Recommended_segments_list}=   call method    ${CMCconnectionObj}   Segments_Recommended
   ${Recommended_segments_list_2}=   convert to list    ${Recommended_segments_list}[2]
   log    ${Recommended_segments_list_2}
   ${Acq_status}=   run keyword and return status     list should contain value   ${Recommended_segments_list_2}   Acquisition
   run keyword if   "${Acq_status}" == "True"   Run Keyword    ${Acquistion_keywords}
   ...  ELSE  log  No Acquistion Segment available in Recommended Segments

Check the Retention are Presents in Recommended Segments
   [Documentation]   Retention didn't came regularly in Recommended Segments, Hence Verify the Availablility
   [Arguments]   ${Retention_keywords}
   ${Recommended_segments_list}=   call method    ${CMCconnectionObj}   Segments_Recommended
   ${Recommended_segments_list_2}=   convert to list  ${Recommended_segments_list}[2]
   log    ${Recommended_segments_list_2}
   ${Retention_status}=   run keyword and return status     list should contain value    ${Recommended_segments_list_2}   Retention
   run keyword if   "${Retention_status}" == "True"   Run Keyword    ${Retention_keywords}
   ...  ELSE  log  No Retention Segment available in Recommended Segments

Verify the Recommended Segments
   [Documentation]   CCL-68753_01  Verify the elements in Recommended Segments
   click element until visible  ${segments}
   @{Recommended_elements}=  create list  ${locators_params['Segments']}[Recommended_th]
   ...  ${locators_params['Segments']}[Recommended_search]  ${locators_params['Segments']}[Type_dropdown]
   wait until page contain elements  @{Recommended_elements}
   @{Headers}=  create list  ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_name]  ${test_data_config['env']['Campaigns']['Scheduled_Campaign']}[campaigns_th_type]
   ...  ${test_data_config['env']['Campaigns']['Segments_list']}[Campaign_th]  ${test_data_config['env']['Campaigns']['Segments_list']}[Count_th]
   ...  ${test_data_config['env']['Campaigns']['Segments_list']}[Created_th]  ${test_data_config['env']['Campaigns']['Segments_list']}[Modify_th]
   Get text and Ensure the Headers are Equal  ${locators_params['Segments']}[Recommended_th]   @{Headers}
   capture page screenshot   Rcommended_segments_screen

Verify the Search and types in Saved Segments
   [Documentation]  CCL-68753_03 - Verify the Search and types dropdown
   Verify the Search in Segment  ${locators_params['Segments']}[Saved_search]   ${locators_params['Segments']}[Saved_1st_name]
   Validate the types in Segments page   ${locators_params['Segments']}[Saved_type]

Verify the Search and types in Recommended Segments
   [Documentation]  CCL-68753_03 - Verify the Search and types dropdown
   Verify the Search in Segment  ${locators_params['Segments']}[Recommended_search]   ${locators_params['Segments']}[Recommended_1st_name]
   Validate the types in Segments page   ${locators_params['Segments']}[Recommended_type]

Verify the Search in Segment
   [Documentation]  Verify the Segments table
   [Arguments]   ${Search_locator}  ${Name_locator}
   ${Segment_Data}=  get text  //*[contains(@id,'DataTables')]/tbody/tr/td[text()='No Data Available']
   run keyword if  "${Segment_Data}" == "No Data Available"  log  Data not available
   ...  ELSE  Search the Segment  ${Search_locator}  ${Name_locator}

Search the Segment
   [Documentation]  68753_03 - Segment should be visible in UI
   [Arguments]  ${Search_field}  ${Locators}
   ${Segment_name}=  get text  ${Locators}
   ${num}  generate random string  3  012345678
   Capture the Screen  Segments-${num}
   Enter the Value Untill Visible  ${Search_field}  ${Segment_name}
   ${Segment_name_after}=  get text  ${Locators}
   should be equal  ${Segment_name}  ${Segment_name_after}
   ${num}  generate random string  3  012345678
   Capture the Screen  After_Segments-${num}
   Clear the Element Text with Presskeys  ${Search_field}

Validate the types in Segments page
   [Documentation]  CCL-68753_04,CCL-68753_05,CCL-68753_06,CCL-68753_07 - Validate the type of segments
   [Arguments]   ${Locator}
   Validation of TYPE dropdown in Segment screen  ${Locator}  ${test_data_config['env']['Campaigns']['Segments_list']}[Acquisition_type]
   Validation of TYPE dropdown in Segment screen  ${Locator}  ${test_data_config['env']['Campaigns']['Segments_list']}[Retention_type]
   Validation of TYPE dropdown in Segment screen  ${Locator}  ${test_data_config['env']['Campaigns']['Segments_list']}[Upload_type]
   Validation of TYPE dropdown in Segment screen  ${Locator}  ${test_data_config['env']['Campaigns']['Segments_list']}[Upsell_type]
   click element until visible  ${locators_params['Segments']}[Type_dropdown]
   ${Element}=  format string  ${locators_params['Segments']}[Dropdown_select]   Value=${test_data_config['env']['Campaigns']['Segments_list']}[All_type]
   click element until visible  ${Element}

Validation of TYPE dropdown in Segment screen
    [Documentation]    Validate the TYPE dropdown in Segment screen
    [Arguments]  ${locator}  ${ddValue}
    click element until visible  ${locators_params['Segments']}[Type_dropdown]
    @{Dropdown}=  create list  ${test_data_config['env']['Campaigns']['Segments_list']}[All_type]  ${test_data_config['env']['Campaigns']['Segments_list']}[Acquisition_type]
    ...  ${test_data_config['env']['Campaigns']['Segments_list']}[Retention_type]  ${test_data_config['env']['Campaigns']['Segments_list']}[Upload_type]  ${test_data_config['env']['Campaigns']['Segments_list']}[Upsell_type]
    ${Types_dropdown}=   Create List
    @{elements}=   Get WebElements   ${dropdown_names}
    FOR  ${element}  IN  @{elements}
    ${text}=  get text   ${element}
    Append to list  ${Types_dropdown}  ${text}
    END
    log   ${Types_dropdown}
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
