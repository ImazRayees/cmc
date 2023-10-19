*** Settings ***
Library   SeleniumLibrary
Resource  ../PO/CommonWrapper.robot


*** Variables ***

${homeBtn}=   id=homeMarketingSection
${searchField}=  id=search-input
${cmc_searchBtn}=   id=search-btn
${noSubcriberFoundToastMsg}=   No Data Available
${specialChar}=  %^$
${resultsCount}=  id=filterCountId
${testData_testTxt}=   test
${testData_jacobK}=   JACOB KREIG
${searchDropdownMenu}=  //*[@class='search-dropdown1 dropdown-menu']//*[@class='ng-scrollbar']
${searchDropdownResultHeader_Subscriber}=  Subscribers
${searchDropdownResult_name}=  JACOB KREIG
${searchDropdownResult_subAccountNum}=   1236350427
${searchDropdownResult_address}=  525 VALLEY VIEW DR, SCOTTSBLUFF, NE, USA
${searchDropdownResult_jacobK-MarketinginsightsheaderTxt}=  Engagement Insights
${searchDropdownResult_jacobK-nameTitle}=  JACOB KREIG
${searchDropdownResult_jacobK_contentFlex}=   //*[@class='st-content flex']

${searchDropdownResult_test_resultsCount}=  //*[@class='title flex']
${searchDropdownResult_test_subscribersTab}=   //a[contains(.,'Subscribers')]
${searchDropdownResult_test_subscribersCount}=   //a[contains(.,'Subscribers')]//span
${subscribersTab_thName}=  (//th[contains(text(),'Name')])[1]
${subscribersTab_thPhone}=  (//th[contains(text(),'Phone')])[1]
${subscribersTab_thAddress}=  (//th[contains(text(),'Address')])[1]
${searchDropdownResult_test_campaignsTab}=    (//a[contains(.,'Campaigns')])[2]
${searchDropdownResult_test_campaignsCount}=  (//a[contains(.,'Campaigns')])[2]//span
${campaignsTab_thName}=  (//th[contains(text(),'Name')])[2]
${campaignsTab_thStatus}=  //th[contains(text(),'Status')]
${searchDropdownResult_test_tableRow}=  //tbody//tr
${searchDropdownResult_test_tableCol}=  //tbody//tr[1]//td


*** Keywords ***

Validate the valid and invalid combinations in searchbox
    [Arguments]     ${search_input}    ${text_value}
    enter the value untill visible    ${searchfield}    ${search_input}
    sleep    5
    Capture the Screen    Searchfilter${search_input}
    click element until enabled     ${cmc_searchbtn}
    page should contain  ${text_value}
    clear element text  ${searchfield}



search subscriber by different data and validate search result
    [Arguments]  ${testName}  ${searchData}
    enter the value untill visible  ${searchfield}  ${searchData}
    sleep  10
    @{multiTxt}=  Create List  ${searchdropdownresultheader_subscriber}  ${searchdropdownresult_name}  ${searchdropdownresult_subaccountnum}  ${searchdropdownresult_address}
    page should contain multiple text  @{multiTxt}
    clear element text  ${searchfield}


enter 'Test' in search field and validate table data under subscribers Tab and campaigns tab
    enter the value untill visible  ${searchfield}  ${testdata_testtxt}
    click element until visible  ${cmc_searchbtn}
    @{subscirberTabElements}=  Create List  ${searchDropdownResult_test_subscribersTab}
    ...  ${subscribersTab_thName}  ${subscribersTab_thPhone}  ${subscribersTab_thAddress}
    ...  ${searchDropdownResult_test_campaignsTab}
    wait until page contain elements  @{subscirberTabElements}
    capture the screen  subscribersTabScreen
    click element until visible  ${searchdropdownresult_test_campaignstab}
    @{campaignsTabElements}=  Create List  ${campaignsTab_thName}  ${campaignsTab_thStatus}
    wait until page contain elements  @{campaignsTabElements}
    capture the screen  campaignsTabScreen

Match the subscribers count and campaigns count to the results count
    sleep  5
    ${resultsTotalCount}=  get text  ${searchdropdownresult_test_resultscount}
    ${resultsTotalCount_withoutComa}=  remove string  ${resultsTotalCount}  ,

    ${subscribersCount}=  get text  ${searchdropdownresult_test_subscriberscount}
    ${subscribersCount_withoutComa}=  remove string  ${subscribersCount}  ,

    ${campaignsCount}=  get text  ${searchdropdownresult_test_campaignscount}
    ${campaignsCount_withoutComa}=  remove string  ${campaignsCount}  ,

    ${actualTotal}=  Evaluate  ${subscribersCount_withoutComa} + ${campaignsCount_withoutComa}
    should contain  ${resultsTotalCount_withoutComa}  ${actualTotal} Results
    capture the screen  dataMatched


click on search with empty field and validate navigation to all subscribers results
    To Reload Page
    click element until visible  ${cmc_searchbtn}
    wait until page contains element  ${searchdropdownresult_test_subscriberstab}  10s
    capture the screen  subscriberstabnavigated

enter special characters on search and verify toast message
    enter the value untill visible  ${searchfield}  ${specialchar}
    wait until page contains  ${nosubcriberfoundtoastmsg}  10s
    capture the screen  noDataToast



navigate back to homescreen
    click element until enabled  ${homebtn}
    sleep  4



