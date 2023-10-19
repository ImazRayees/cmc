*** Settings ***
Resource   ../PO/CampaignsCreation_AcquisitionSegments.robot
Resource  ../PO/Campigns_po.robot
Resource  ../PO/ConstantContactKeywords.robot
Resource   ../PO/CommonWrapper.robot


*** Keywords ***

---upslCampaigns
##single
Create new campaign with the Mobile notification
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification only

New campaign with Mobile Notification only
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMN${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND   step 3 deploy with mn  ${campName}  ${count}
    ...  AND   step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    ...  AND   Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with the mailchimp only
     ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mailchimp

New campaign with mailchimp
    log  Campaigns_09
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMC${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment5]  ${globVar_region3}  ${globVar_location3}
    step 2 channel with mailchimp  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment5]
    step 4 results with mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment5]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the facebook only
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with facebook

New campaign with facebook
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnFB${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region4}  ${globVar_location4}
    step 2 channel with facebook  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results with facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the csv only
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with csv

New campaign with CSV
    log  Campaigns_11
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnCSV${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region4}  ${globVar_location4}
    step 2 channel with csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
    step 4 results with csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with the hubspot only
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with hubspot

New campaign with hubspot
    log  Campaigns_11
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnHubspot${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    Step 2 channel with hubspot  ${campName}
    Verify the ECB in Deploy Page
    Step 3 deploy with hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
    Step 4 results with hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with ConstantContact
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnConsCont${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    Step 2 channel with ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 deploy with ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
    Step 4 results with ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

##dual
Create new campaign with MobileNoti & MailChimp
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New Campaign with MobileNoti & MailChimp

New Campaign with MobileNoti & MailChimp
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_cmpaignMnMc${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region3}  ${globVar_location3}
    ${count}=  step 2 select mobile noti and mailchimp  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mobile noti and mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
    step 4 results screen verification for mobile noti and mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}



Create new campaign with Malichimp & Csv
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mailchimp $ CSV

New campaign with Mailchimp $ CSV
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgMcCsv${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    step 2 select mailchimp and csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mailchimp and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
    step 4 results screen verification for mailchimp and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with Mobilenoti and CSv
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mobile noti and csv

New campaign with mobile noti and csv
    log  Campaigns_14
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgMnCsv${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment5]  ${globVar_region3}  ${globVar_location3}
    ${count}=  step 2 select mobile noti and csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mobile noti and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment5]  ${count}
    step 4 results screen verification for mobile noti and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment5]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with mailchimp and facebook
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mailchimp and facebook

new campaign with mailchimp and facebook
    log  Campaigns_15
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMcFb${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region4}  ${globVar_location4}
    step 2 select facebook and mailchimp  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for facebook and mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for facebook and mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with mobileNoti and facebook
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mobilenoti and facebook

New campaign with mobilenoti and facebook
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMnFb${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 select mobile noti and facebook  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mobile noti and facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for mobile noti and fb  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

#7.fb, csv
New campaign with Facebook and csv
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnFbCsv${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region4}  ${globVar_location4}
    step 2 select fb and csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy for fb and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for fb and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

#8.Hubspot and fb
New campaign with Hubspot and fb
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnHbFb${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]  ${globVar_region3}  ${globVar_location3}
    step 2 select hubspot and facebook  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for hubspot and facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for hubspot and facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

#9.Hb, csv
New campaign with hubspot and csv
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnHbCsv${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]  ${globVar_region3}  ${globVar_location3}
    step 2 select hubspot and csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for hubspot and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]
    step 4 results screen verification for hubspot and csv   ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


#10.Mc, hb
New campaign with mailchimp and hubspot
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMcHb${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]  ${globVar_region3}  ${globVar_location3}
    step 2 select mailchimp and hubspot  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mailchimp and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]
    step 4 results screen verification for mailchimp and hubspot   ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


#6.Mobilenoti & hubspot
New campaign with Mobile Noti and Hubspot
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_cmpaignMnHb${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region3}  ${globVar_location3}
    ${count}=  step 2 select Mobile noti and hubspot  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mobile noti and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
    step 4 results screen verification for mobile noti and hubspot   ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

##MobileNotiAndConstantContact
New campaign with MobileNoti and ConstantContact
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_cmpaignMnCc${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]  ${globVar_region2}  ${globVar_location2}
    ${Mobile_count}=  Step 2 select MobileNoti and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]   ${Mobile_count}
    Step 4 results screen verification for MobileNoti and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]  ${Mobile_count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

##MailchimpAndConstantContact
New campaign with Mailchimp and ConstantContact
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_cmpaignMcCc${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region1}  ${globVar_location1}
    Step 2 select Mailchimp and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Mailchimp and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
    Step 4 results screen verification for Mailchimp and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

##FbAndConstantContact
New campaign with Fb and ConstantContact
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_cmpaignFbCc${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region1}  ${globVar_location1}
    Step 2 select Fb and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

##HubspotAndConstantContact
New campaign with Hubspot and ConstantContact
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_cmpaignHbCc${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]  ${globVar_region2}  ${globVar_location2}
    Step 2 select Hubspot and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Hubspot and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]
    Step 4 results screen verification for Hubspot and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

##CsvAndConstantContact
New campaign with CSV and ConstantContact
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_cmpaignCsvCc${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    Step 2 select CSV and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
    Step 4 results screen verification for CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

##triple-3channelCombination
###Mn,Mc,H
Create new campaign with the MobileNoti, mailchimp and hubspot
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with MobileNoti, mailchimp and hubspot

New campaign with MobileNoti, mailchimp and hubspot
    log  Campaigns_11
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    test_campgnMnMcHb${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region3}  ${globVar_location3}
    ${count}=  step 2 select mobilenoti, mailchimp and hubspot  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mobilenoti, mailchimp and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
    step 4 results with mobilenoti, mailchimp and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

##MC, H, CSV
Create new campaign with the mailchimp, hubspot and csv
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mChimp, hubspot and csv

New campaign with mChimp, hubspot and csv
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    test_campgnMcHbCSV${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment5]  ${globVar_region3}  ${globVar_location3}
    step 2 select mailchimp, hubspot and csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mailchimp, hubspot and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment5]
    step 4 results with mailchimp, hubspot and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment5]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


##MN. FB and Mailchimp
Create new campaign with the mobilenoti, mailchimp and facebook
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mobilenoti, mailchimp and facebook

New campaign with mobilenoti, mailchimp and facebook
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    test_campgnMnMcFb${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    step 2 select mobilenoti, mailchimp and facebook  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mobilenoti, mailchimp and facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
    step 4 results with mobilenoti, mailchimp and facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with the malichimp, facebook and csv
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with malichimp, facebook and csv

New campaign with malichimp, facebook and csv
    log  Campaigns_11
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    test_campgnMcFbCsv${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region4}  ${globVar_location4}
    step 2 select malichimp, facebook and csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mailchimp, facebook and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results with mailchimp, facebook and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the mobilenoti, csv and hubspot
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mobilenoti, csv and hubspot

New campaign with mobilenoti, csv and hubspot
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    test_campgnMnCsvHb${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 select mobilenoti, csv and hubspot  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mobilenoti, csv and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    step 4 results with mobilenoti, csv and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


New campaign with Fb, Hubspot and csv
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnFbHbCsv${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    Step 2 select FB, Hubspot and csv  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for FB, Hubspot and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for FB, Hubspot and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Mobile Noti, Fb and Hubspot
     ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMnFbHb${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=  Step 2 select Mobile Noti, Fb and Hubspot  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Mobile noti, Fb and Hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for Mobile noti, Fb and Hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


New campaign with Mobile Noti, Fb and CSV
     ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMnFbCsv${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=  Step 2 select Mobile Noti, Fb and CSV  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Mobile Noti, Fb and CSV  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for Mobile Noti, Fb and CSV  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with mailchimp, fb and hubspot
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMcFbHb${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    Step 2 select mailchimp, fb and hubspot  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for mailchimp, fb and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for mailchimp, fb and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with mobile noti, mailchimp and facebook
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMnMcFb${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region1}  ${globVar_location1}
    ${count}=  Step 2 select mobile noti, mailchimp and facebook  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for mobile noti, mailchimp and facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for mobile noti, mailchimp and facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti, Mailchimp and ConstantContact
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMnMcCc${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region1}  ${globVar_location1}
    ${Mobile_count}=  Step 2 select MobileNoti, Mailchimp and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti, Mailchimp and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${Mobile_count}
    Step 4 results screen verification for MobileNoti, Mailchimp and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${Mobile_count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti, Fb and ConstantContact
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMnFbCc${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region1}  ${globVar_location1}
    ${Mobile_count}=  Step 2 select MobileNoti, Fb and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti, Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${Mobile_count}
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for MobileNoti, Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${Mobile_count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti, Hubspot and ConstantContact
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMnFbCc${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region1}  ${globVar_location1}
    ${Mobile_count}=  Step 2 select MobileNoti, Hubspot and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti, Hubspot and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${Mobile_count}
    Step 4 results screen verification for MobileNoti, Hubspot and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${Mobile_count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Facebook, CSV and ConstantContact
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnFbCsvCc${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region1}  ${globVar_location1}
    Step 2 select Facebook, CSV and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Facebook, CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for Facebook, CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Mailchimp, CSV and ConstantContact
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMcCsvCc${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region1}  ${globVar_location1}
    Step 2 select Mailchimp, CSV and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Mailchimp, CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
    Step 4 results screen verification for Mailchimp, CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

##four-4channels
##Mn,Mc,Hb,Csv
New campaign with mobile noti, mailchimp, hubspot and csv
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgMnMcHbCsv${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region1}  ${globVar_location1}
    ${count}=  step 2 select mobilenoti, mailchimp, hubspot and csv  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy for MobileNoti, Mailhcimp, Hubspot and CSV  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
    Step 4 results screen verification for MobileNoti, Mailhcimp, Hubspot and CSV  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

##Mc,Fb,Hb,Csv
New campaign with mailchimp, facebook, hubspot and csv
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgMcFbHbCsv${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]  ${globVar_region2}  ${globVar_location2}
    step 2 select mailhcimp, facebook, hubspot and csv  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy for Mailhcimp, Facebook, Hubspot and CSV  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]
    Step 4 results screen verification for Mailhcimp, Facebook, Hubspot and CSV  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


##Mn,Fb,Hb,Csv
New campaign with MobileNoti, Facebook, hubspot and csv
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgMnFbHbCsv${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment3]  ${globVar_region3}  ${globVar_location3}
    ${count}=  Step 2 select MobileNoti, Facebook, Hubspot and CSV  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy for MobileNoti, Facebook, Hubspot and CSV  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment3]  ${count}
    Step 4 results screen verification for MobileNoti, Facebook, Hubspot and CSV  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment3]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


##Mn,Mc,Fb,Csv
New campaign with MobileNoti, Mailchimp, Facebook and CSV
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgMnMcFbCsv${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=  Step 2 select MobileNoti, Mailchimp, Facebook and CSV  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy for MobileNoti, Mailchimp, Facebook and CSV  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]   ${count}
    Step 4 results screen verification for MobileNoti, Mailchimp, Facebook and CSV  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


##Mn,Mc,Fb,Hb
New campaign with MobileNoti, Mailchimp, Facebook and Hubspot
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgMnMcFbHb${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=  Step 2 select MobileNoti, Mailchimp, Facebook and Hubspot  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy for MobileNoti, Mailchimp, Facebook and Hubspot  ${campName}
    Step 4 results screen verification for MobileNoti, Mailchimp, Facebook and Hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti,Mailchimp,Fb and ConstantContact
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMnMcFbCc${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region1}  ${globVar_location1}
    ${count}=  Step 2 select MobileNoti,Mailchimp,Fb and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti,Mailchimp,Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for MobileNoti,Mailchimp,Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti,Hubspot,Fb and ConstantContact
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMnHbFbCc${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region1}  ${globVar_location1}
    ${count}=  Step 2 select MobileNoti,Hubspot,Fb and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti,Hubspot,Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for MobileNoti,Hubspot,Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti,Mailchimp,Csv and ConstantContact
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMnMcCsvCc${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region1}  ${globVar_location1}
    ${count}=  Step 2 select MobileNoti,Mailchimp,Csv and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti,Mailchimp,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
    Step 4 results screen verification for MobileNoti,Mailchimp,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Mailchimp,Hubspot,Csv and ConstantContact
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMcHbCsvCc${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region1}  ${globVar_location1}
    Step 2 select Mailchimp,Hubspot,Csv and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Mailchimp,Hubspot,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
    Step 4 results screen verification for Mailchimp,Hubspot,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Fb,Hubspot,Csv and ConstantContact
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnFbHbCsvCc${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region1}  ${globVar_location1}
    Step 2 select Fb,Hubspot,Csv and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Fb,Hubspot,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for Fb,Hubspot,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

##five-5channels
New campaign with MobileNoti,Mailchimp,Fb,Hubspot and CSV
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMnMcFbHbCsv${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region1}  ${globVar_location1}
    Step 2 select MobileNoti,Mailchimp,Fb,Hubspot and CSV  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti,Mailchimp,Fb,Hubspot and CSV  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for MobileNoti,Mailchimp,Fb,Hubspot and CSV  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti,Fb,Hubspot,CSV and ConstantContact
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMnFbHbCsvCc${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region1}  ${globVar_location1}
    ${count}=  Step 2 select MobileNoti,Fb,Hubspot,CSV and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti,Fb,Hubspot,CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for MobileNoti,Fb,Hubspot,CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti,Mailchimp,Hubspot,CSV and ConstantContact
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMnMcHbCsvCc${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region1}  ${globVar_location1}
    ${count}=  Step 2 select MobileNoti,Mailchimp,Hubspot,CSV and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti,Mailchimp,Hubspot,CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]   ${count}
    Step 4 results screen verification for MobileNoti,Mailchimp,Hubspot,CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti,Mailchimp,Fb,Hubspot and ConstantContact
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMnMcFbHbCc${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region1}  ${globVar_location1}
    ${count}=  Step 2 select MobileNoti,Mailchimp,Fb,Hubspot and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti,Mailchimp,Fb,Hubspot and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]   ${count}
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for MobileNoti,Mailchimp,Fb,Hubspot and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Mailchimp,Fb,Hubspot,CSV and ConstantContact
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMcFbHbCsvCc${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region1}  ${globVar_location1}
    Step 2 select Mailchimp,Fb,Hubspot,CSV and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Mailchimp,Fb,Hubspot,CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for Mailchimp,Fb,Hubspot,CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


New campaign with All Channels
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnAll${PO_Number}
    step 1 define for all region/locations  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
    ${count}=  step 2 select all channels  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for all channels  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for all channels  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


---retentionCampaigns
####RetentionSegments
##2channels-retentionsegment
Create new campaign with MobileNoti & Hubspot - Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New Campaign with MobileNoti & Hubspot - Retention Segment

New Campaign with MobileNoti & Hubspot - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_cmpaignMnHb${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${globVar_region3}  ${globVar_location3}
    ${count}=  step 2 select mobile noti and hubspot  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mobile noti and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]
    step 4 results screen verification for mobile noti and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}



Create new campaign with MobileNoti & MailChimp - Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New Campaign with MobileNoti & MailChimp - Retention Segment

New Campaign with MobileNoti & MailChimp - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_cmpaignMnMc${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${globVar_region3}  ${globVar_location3}
    ${count}=  step 2 select mobile noti and mailchimp  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mobile noti and mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${count}
    step 4 results screen verification for mobile noti and mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}



Create new campaign with Malichimp & Csv - Retention Segment
        ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mailchimp $ CSV - Retention Segment

New campaign with Mailchimp $ CSV - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgMcCsv${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]  ${globVar_region4}  ${globVar_location4}
    step 2 select mailchimp and csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mailchimp and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]
    step 4 results screen verification for mailchimp and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with Mobilenoti and CSv - Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mobile noti and csv - Retention Segment

New campaign with mobile noti and csv - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgMnCsv${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${globVar_region3}  ${globVar_location3}
    ${count}=  step 2 select mobile noti and csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mobile noti and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${count}
    step 4 results screen verification for mobile noti and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with mailchimp and facebook - Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mailchimp and facebook - Retention Segment

new campaign with mailchimp and facebook - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMcFb${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]  ${globVar_region4}  ${globVar_location4}
    step 2 select facebook and mailchimp  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for facebook and mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for facebook and mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with mobileNoti and facebook - Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mobilenoti and facebook - Retention Segment

New campaign with mobilenoti and facebook - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMnFb${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 select mobile noti and facebook  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mobile noti and facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${count}
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for mobile noti and fb  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti and ConstantContact - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMnCc${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 select MobileNoti and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for MobileNoti and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${count}
    step 4 results screen verification for MobileNoti and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Mailchimp and ConstantContact - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMcCc${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]  ${globVar_region4}  ${globVar_location4}
    Step 2 select Mailchimp and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Mailchimp and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]
    Step 4 results screen verification for Mailchimp and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Fb and ConstantContact - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_FbCc${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]  ${globVar_region4}  ${globVar_location4}
    step 2 select Fb and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Hubspot and ConstantContact - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_HbCc${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]  ${globVar_region4}  ${globVar_location4}
    Step 2 select Hubspot and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Hubspot and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]
    Step 4 results screen verification for Hubspot and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with CSV and ConstantContact - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_HbCc${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]  ${globVar_region4}  ${globVar_location4}
    Step 2 select CSV and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]
    Step 4 results screen verification for CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with All Channels - Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with All Channels - Retention Segment

New campaign with All Channels - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnAll${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 select all channels  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for all channels  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${count}
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for all channels  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the Mobile notification - Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification only - Retention Segment

New campaign with Mobile Notification only - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMN${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND   step 3 deploy with mn  ${campName}  ${count}
    ...  AND   step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]  ${count}
    ...  AND   Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with the mailchimp only - Retention Segment
     ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mailchimp - Retention Segment

New campaign with mailchimp - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMC${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]  ${globVar_region3}  ${globVar_location3}
    step 2 channel with mailchimp  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]
    step 4 results with mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the facebook only - Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with facebook - Retention Segment

New campaign with facebook - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnFB${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]  ${globVar_region4}  ${globVar_location4}
    step 2 channel with facebook  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results with facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the csv only - Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with csv - Retention Segment

New campaign with CSV - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnCSV${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]  ${globVar_region4}  ${globVar_location4}
    step 2 channel with csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]
    step 4 results with csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with the hubspot only - Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with hubspot - Retention Segment

New campaign with hubspot - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnHubspot${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${globVar_region4}  ${globVar_location4}
    Step 2 channel with hubspot  ${campName}
    Verify the ECB in Deploy Page
    Step 3 deploy with hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]
    Step 4 results with hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with ConstantContact - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnConsCont${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]  ${globVar_region4}  ${globVar_location4}
    Step 2 channel with ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 deploy with ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]
    Step 4 results with ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


##3channels-retentionsegment
Create new campaign with the MobileNoti, mailchimp and hubspot - Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with MobileNoti, mailchimp and hubspot - Retention Segment

New campaign with MobileNoti, mailchimp and hubspot - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMnMcHb${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]  ${globVar_region3}  ${globVar_location3}
    ${count}=   step 2 select mobilenoti, mailchimp and hubspot  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mobilenoti, mailchimp and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]  ${count}
    step 4 results with mobilenoti, mailchimp and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the mailchimp, hubspot and csv - Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mChimp, hubspot and csv - Retention Segment

New campaign with mChimp, hubspot and csv - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMcHbCSV${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]  ${globVar_region3}  ${globVar_location3}
    step 2 select mailchimp, hubspot and csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mailchimp, hubspot and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]
    step 4 results with mailchimp, hubspot and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}



Create new campaign with the mobilenoti, mailchimp and facebook - Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mobilenoti, mailchimp and facebook - Retention Segment

New campaign with mobilenoti, mailchimp and facebook - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMnMcFb${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${globVar_region4}  ${globVar_location4}
    step 2 select mobilenoti, mailchimp and facebook  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mobilenoti, mailchimp and facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]
    step 4 results with mobilenoti, mailchimp and facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the malichimp, facebook and csv - Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with malichimp, facebook and csv - Retention Segment

New campaign with malichimp, facebook and csv - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMcFbCsv${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]  ${globVar_region4}  ${globVar_location4}
    step 2 select malichimp, facebook and csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mailchimp, facebook and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results with mailchimp, facebook and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the mobilenoti, csv and hubspot - Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mobilenoti, csv and hubspot - Retention Segment

New campaign with mobilenoti, csv and hubspot - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMnCsvHb${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 select mobilenoti, csv and hubspot  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mobilenoti, csv and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]  ${count}
    step 4 results with mobilenoti, csv and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti, Mailchimp and ConstantContact - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMnMcCc${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]  ${globVar_region1}  ${globVar_location1}
    ${count}=  Step 2 select MobileNoti, Mailchimp and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti, Mailchimp and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]  ${count}
    Step 4 results screen verification for MobileNoti, Mailchimp and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti, Fb and ConstantContact - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMnFbCc${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]  ${globVar_region1}  ${globVar_location1}
    ${count}=  Step 2 select MobileNoti, Fb and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti, Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]  ${count}
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for MobileNoti, Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti, Hubspot and ConstantContact - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMnFbCc${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${globVar_region1}  ${globVar_location1}
    ${count}=   Step 2 select MobileNoti, Hubspot and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti, Hubspot and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${count}
    Step 4 results screen verification for MobileNoti, Hubspot and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Facebook, CSV and ConstantContact - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnFbCsvCc${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]  ${globVar_region1}  ${globVar_location1}
    Step 2 select Facebook, CSV and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Facebook, CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for Facebook, CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Mailchimp, CSV and ConstantContact - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMcCsvCc${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]  ${globVar_region1}  ${globVar_location1}
    Step 2 select Mailchimp, CSV and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Mailchimp, CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]
    Step 4 results screen verification for Mailchimp, CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


###4channels-retentionSegment
##RtnSeg-Mn,Mc,Hb,Csv
New campaign with mobile noti, mailchimp, hubspot and csv - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgMnMcHbCsv${PO_Number}
    Step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]  ${globVar_region1}  ${globVar_location1}
    ${count}=  step 2 select mobilenoti, mailchimp, hubspot and csv  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy for MobileNoti, Mailhcimp, Hubspot and CSV  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]  ${count}
    Step 4 results screen verification for MobileNoti, Mailhcimp, Hubspot and CSV  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

##RtnSeg-Mc,Fb,Hb,Csv
New campaign with mailchimp, facebook, hubspot and csv - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgMcFbHbCsv${PO_Number}
    Step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]  ${globVar_region2}  ${globVar_location2}
    step 2 select mailhcimp, facebook, hubspot and csv  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy for Mailhcimp, Facebook, Hubspot and CSV  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]
    Step 4 results screen verification for Mailhcimp, Facebook, Hubspot and CSV  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


##RtnSeg-Mn,Fb,Hb,Csv
New campaign with MobileNoti, Facebook, hubspot and csv - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgMnFbHbCsv${PO_Number}
    Step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${globVar_region3}  ${globVar_location3}
    ${count}=   Step 2 select MobileNoti, Facebook, Hubspot and CSV  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy for MobileNoti, Facebook, Hubspot and CSV  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]   ${count}
    Step 4 results screen verification for MobileNoti, Facebook, Hubspot and CSV  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


##RtnSeg-Mn,Mc,Fb,Csv
New campaign with MobileNoti, Mailchimp, Facebook and CSV - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgMnMcFbCsv${PO_Number}
    Step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]  ${globVar_region4}  ${globVar_location4}
    ${count}=    Step 2 select MobileNoti, Mailchimp, Facebook and CSV  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy for MobileNoti, Mailchimp, Facebook and CSV  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]   ${count}
    Step 4 results screen verification for MobileNoti, Mailchimp, Facebook and CSV  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]   ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


##RtnSeg-Mn,Mc,Fb,Hb
New campaign with MobileNoti, Mailchimp, Facebook and Hubspot - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgMnMcFbHb${PO_Number}
    Step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]  ${globVar_region4}  ${globVar_location4}
    ${count}=  Step 2 select MobileNoti, Mailchimp, Facebook and Hubspot  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy for MobileNoti, Mailchimp, Facebook and Hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]   ${count}
    Step 4 results screen verification for MobileNoti, Mailchimp, Facebook and Hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]   ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti,Mailchimp,Fb and ConstantContact - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMnMcFbCc${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]  ${globVar_region1}  ${globVar_location1}
    ${count}=   Step 2 select MobileNoti,Mailchimp,Fb and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti,Mailchimp,Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]  ${count}
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for MobileNoti,Mailchimp,Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti,Hubspot,Fb and ConstantContact - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMnHbFbCc${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]  ${globVar_region1}  ${globVar_location1}
    ${count}=   Step 2 select MobileNoti,Hubspot,Fb and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti,Hubspot,Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]  ${count}
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for MobileNoti,Hubspot,Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti,Mailchimp,Csv and ConstantContact - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMnMcCsvCc${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${globVar_region1}  ${globVar_location1}
    ${count}=  Step 2 select MobileNoti,Mailchimp,Csv and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti,Mailchimp,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]   ${count}
    Step 4 results screen verification for MobileNoti,Mailchimp,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Mailchimp,Hubspot,Csv and ConstantContact - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMcHbCsvCc${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]  ${globVar_region1}  ${globVar_location1}
    Step 2 select Mailchimp,Hubspot,Csv and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Mailchimp,Hubspot,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]
    Step 4 results screen verification for Mailchimp,Hubspot,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Fb,Hubspot,Csv and ConstantContact - Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnFbHbCsvCc${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]  ${globVar_region1}  ${globVar_location1}
    Step 2 select Fb,Hubspot,Csv and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Fb,Hubspot,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for Fb,Hubspot,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

---draftedCampaigns
Create and complete drafted campaign - MobileNotification
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    draft_cmpaignMn${PO_Number}
    Create a drafted campaign and verify it's created   ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region3}  ${globVar_location3}
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND  step 3 deploy with mn  ${campName}  ${count}
    ...  AND  step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    ...  AND  Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}


Create and complete drafted campaign - Facebook
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    draft_cmpaignFb${PO_Number}
    Create a drafted campaign and verify it's created   ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region3}  ${globVar_location3}
    step 2 channel with facebook  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results with facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

Create and complete drafted campaign - Mailchimp
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    draft_cmpaignMc${PO_Number}
    Create a drafted campaign and verify it's created   ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]  ${globVar_region3}  ${globVar_location3}
    step 2 channel with mailchimp  ${campName}
    Verify the ECB in Deploy Page
    Step 3 deploy with mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]
    step 4 results with mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

Create and complete drafted campaign - CsvDownload
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    draft_cmpaignCsv${PO_Number}
    Create a drafted campaign and verify it's created   ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment3]  ${globVar_region3}  ${globVar_location3}
    step 2 channel with csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment3]
    step 4 results with csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment3]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

Create and complete drafted campaign - Hubspot
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    draft_Hb${PO_Number}
    Create a drafted campaign and verify it's created   ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region3}  ${globVar_location3}
    step 2 channel with hubspot  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
    step 4 results with hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

Create and complete drafted campaign - ConstantContact
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    draft_Cc${PO_Number}
    Create a drafted campaign and verify it's created   ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region3}  ${globVar_location3}
    step 2 channel with constantcontact  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with constantcontact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
    step 4 results with constantcontact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

Create and complete drafted campaign with facebook and mailchimp
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    draft_cmpaignFbMc${PO_Number}
    Create a drafted campaign and verify it's created   ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment5]  ${globVar_region3}  ${globVar_location3}
    step 2 select facebook and mailchimp  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for facebook and mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment5]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for facebook and mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment5]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

Create and complete drafted campaign with mobile noti and facebook
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    draft_cmpaignMnFb${PO_Number}
    Create a drafted campaign and verify it's created   ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region3}  ${globVar_location3}
    ${count}=  step 2 select mobile noti and facebook  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mobile noti and facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for mobile noti and fb  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

Create and complete drafted campaign with mobile noti and csv
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    draft_cmpaignMnCsv${PO_Number}
    Create a drafted campaign and verify it's created   ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]  ${globVar_region3}  ${globVar_location3}
    ${count}=  step 2 select mobile noti and csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mobile noti and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]  ${count}
    step 4 results screen verification for mobile noti and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

Create and complete drafted campaign with mailchimp and csv
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    draft_cmpaignMcCsv${PO_Number}
    Create a drafted campaign and verify it's created   ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region3}  ${globVar_location3}
    step 2 select mailchimp and csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mailchimp and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
    step 4 results screen verification for mailchimp and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

Create and complete drafted campaign with mobile noti and mailchimp
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    draft_cmpaignMnMc${PO_Number}
    Create a drafted campaign and verify it's created   ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment5]  ${globVar_region3}  ${globVar_location3}
    ${count}=  step 2 select mobile noti and mailchimp  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mobile noti and mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment5]  ${count}
    step 4 results screen verification for mobile noti and mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment5]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

Create and complete drafted campaign with mobile noti and hubspot
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    draft_cmpaignMnHb${PO_Number}
    Create a drafted campaign and verify it's created   ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region3}  ${globVar_location3}
    ${count}=  step 2 select Mobile noti and hubspot  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mobile noti and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
    step 4 results screen verification for mobile noti and hubspot   ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

Create and complete drafted campaign with mobilenoti, mailchimp and hubspot
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    draft_cmpaignMnMcHb${PO_Number}
    Create a drafted campaign and verify it's created   ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]  ${globVar_region3}  ${globVar_location3}
    ${count}=  step 2 select mobilenoti, mailchimp and hubspot  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mobilenoti, mailchimp and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]  ${count}
    step 4 results with mobilenoti, mailchimp and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

Create and complete drafted campaign with mailchimp, hubspot and csv
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    draft_cmpaignMcHbCsv${PO_Number}
    Create a drafted campaign and verify it's created   ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment3]  ${globVar_region3}  ${globVar_location3}
    step 2 select mailchimp, hubspot and csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mailchimp, hubspot and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment3]
    step 4 results with mailchimp, hubspot and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment3]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

Create and complete drafted campaign with mobilenoti, mailchimp and facebook
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    draft_cmpaignMnMcFb${PO_Number}
    Create a drafted campaign and verify it's created   ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region3}  ${globVar_location3}
    ${count}=  step 2 select mobilenoti, mailchimp and facebook  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mobilenoti, mailchimp and facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
    step 4 results with mobilenoti, mailchimp and facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

Create and complete drafted campaign with mailchimp, facebook and csv
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    draft_cmpaignMnFbCsv${PO_Number}
    Create a drafted campaign and verify it's created   ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]  ${globVar_region3}  ${globVar_location3}
    step 2 select malichimp, facebook and csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mailchimp, facebook and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results with mailchimp, facebook and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

Create and complete drafted campaign with mobilenoti, csv and hubspot
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    draft_cmpaignMnCsvHb${PO_Number}
    Create a drafted campaign and verify it's created   ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region3}  ${globVar_location3}
    ${count}=  step 2 select mobilenoti, csv and hubspot  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mobilenoti, csv and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    step 4 results with mobilenoti, csv and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

Create and complete drafted campaign with all channels
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    draft_cmpaignAll${PO_Number}
    Create a drafted campaign and verify it's created   ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]  ${globVar_region3}  ${globVar_location3}
    ${count}=  step 2 select all channels  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for all channels  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]  ${count}
    step 4 results screen verification for all channels   ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment2]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}



--savedSegments
####savedRETENTIONSEGMENT
Create new campaign with MobileNoti & Hubspot - Saved Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New Campaign with MobileNoti & Hubspot - Saved Retention Segment

New Campaign with MobileNoti & Hubspot - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSegMnHb${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    ${count}=  step 2 select mobile noti and hubspot  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mobile noti and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
    step 4 results screen verification for mobile noti and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}



Create new campaign with MobileNoti & MailChimp - Saved Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New Campaign with MobileNoti & MailChimp - Saved Retention Segment

New Campaign with MobileNoti & MailChimp - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSegMnMc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    ${count}=  step 2 select mobile noti and mailchimp  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mobile noti and mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
    step 4 results screen verification for mobile noti and mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}



Create new campaign with Malichimp & Csv - Saved Retention Segment
        ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mailchimp $ CSV - Saved Retention Segment

New campaign with Mailchimp $ CSV - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSegMcCsv${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    step 2 select mailchimp and csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mailchimp and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    step 4 results screen verification for mailchimp and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with Mobilenoti and CSv - Saved Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mobile noti and csv - Saved Retention Segment

New campaign with mobile noti and csv - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSegMnCsv${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    ${count}=  step 2 select mobile noti and csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mobile noti and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
    step 4 results screen verification for mobile noti and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with mailchimp and facebook - Saved Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mailchimp and facebook - Saved Retention Segment

new campaign with mailchimp and facebook - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSegMcFb${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    step 2 select facebook and mailchimp  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for facebook and mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for facebook and mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with mobileNoti and facebook - Saved Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mobilenoti and facebook - Saved Retention Segment

New campaign with mobilenoti and facebook - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSegMnFb${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    ${count}=  step 2 select mobile noti and facebook  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mobile noti and facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]   ${count}
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for mobile noti and fb  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with All Channels - Saved Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with All Channels - Saved Retention Segment

New campaign with All Channels - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSegAll${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    step 2 select all channels  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for all channels  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for all channels  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the Mobile notification - Saved Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification only - Saved Retention Segment

New campaign with Mobile Notification only - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSegMN${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND   step 3 deploy with mn  ${campName}  ${count}
    ...  AND   step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
    ...  AND   Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with the mailchimp only - Saved Retention Segment
     ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mailchimp - Saved Retention Segment

New campaign with mailchimp - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSegMC${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    step 2 channel with mailchimp  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    step 4 results with mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the facebook only - Saved Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with facebook - Saved Retention Segment

New campaign with facebook - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSegFB${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    step 2 channel with facebook  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results with facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the csv only - Saved Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with csv - Saved Retention Segment

New campaign with CSV - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSegCSV${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    step 2 channel with csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    step 4 results with csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with the hubspot only - Saved Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with hubspot - Saved Retention Segment

New campaign with hubspot - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSegHubspot${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    Step 2 channel with hubspot  ${campName}
    Verify the ECB in Deploy Page
    Step 3 deploy with hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Step 4 results with hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the MobileNoti, mailchimp and hubspot - Saved Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with MobileNoti, mailchimp and hubspot - Saved Retention Segment

New campaign with MobileNoti, mailchimp and hubspot - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSegMnMcHb${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    ${count}=  step 2 select mobilenoti, mailchimp and hubspot  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mobilenoti, mailchimp and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
    step 4 results with mobilenoti, mailchimp and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}




Create new campaign with the mailchimp, hubspot and csv - Saved Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mChimp, hubspot and csv - Saved Retention Segment

New campaign with mChimp, hubspot and csv - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSegMcHbCSV${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    step 2 select mailchimp, hubspot and csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mailchimp, hubspot and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    step 4 results with mailchimp, hubspot and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with the mobilenoti, mailchimp and facebook - Saved Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mobilenoti, mailchimp and facebook - Saved Retention Segment

New campaign with mobilenoti, mailchimp and facebook - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSegMnMcFb${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    step 2 select mobilenoti, mailchimp and facebook  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mobilenoti, mailchimp and facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    step 4 results with mobilenoti, mailchimp and facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}



Create new campaign with the malichimp, facebook and csv - Saved Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with malichimp, facebook and csv - Saved Retention Segment

New campaign with malichimp, facebook and csv - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSegMcFbCsv${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    step 2 select malichimp, facebook and csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mailchimp, facebook and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results with mailchimp, facebook and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the mobilenoti, csv and hubspot - Saved Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mobilenoti, csv and hubspot - Saved Retention Segment

New campaign with mobilenoti, csv and hubspot - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}   Set Variable    retn_savedSegMnCsvHb${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    ${count}=  step 2 select mobilenoti, csv and hubspot  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mobilenoti, csv and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
    step 4 results with mobilenoti, csv and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

##single
New campaign with ConstantContact - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSeg_ConsCont${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    Step 2 channel with ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 deploy with ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Step 4 results with ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

##2channels
New campaign with MobileNoti and ConstantContact - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSeg_MnCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    ${count}=  Step 2 select MobileNoti and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
    Step 4 results screen verification for MobileNoti and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

##MailchimpAndConstantContact
New campaign with Mailchimp and ConstantContact - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSeg_McCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    Step 2 select Mailchimp and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Mailchimp and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Step 4 results screen verification for Mailchimp and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

##FbAndConstantContact
New campaign with Fb and ConstantContact - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSeg_FbCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    Step 2 select Fb and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

##HubspotAndConstantContact
New campaign with Hubspot and ConstantContact - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSeg_HbCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    Step 2 select Hubspot and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Hubspot and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Step 4 results screen verification for Hubspot and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

##CsvAndConstantContact
New campaign with CSV and ConstantContact - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSeg_CsvCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    Step 2 select CSV and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Step 4 results screen verification for CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

##3channels
New campaign with MobileNoti, Mailchimp and ConstantContact - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSeg_MnMcCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    ${count}=  Step 2 select MobileNoti, Mailchimp and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti, Mailchimp and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
    Step 4 results screen verification for MobileNoti, Mailchimp and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti, Fb and ConstantContact - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSeg_MnFbCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    ${count}=  Step 2 select MobileNoti, Fb and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti, Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for MobileNoti, Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti, Hubspot and ConstantContact - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSeg_MnFbCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    ${count}=  Step 2 select MobileNoti, Hubspot and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti, Hubspot and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
    Step 4 results screen verification for MobileNoti, Hubspot and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Facebook, CSV and ConstantContact - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSeg_FbCsvCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    Step 2 select Facebook, CSV and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Facebook, CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for Facebook, CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Mailchimp, CSV and ConstantContact - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSeg_McCsvCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    Step 2 select Mailchimp, CSV and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Mailchimp, CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Step 4 results screen verification for Mailchimp, CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

###4chanels
New campaign with MobileNoti,Mailchimp,Fb and ConstantContact - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSeg_MnMcFbCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    ${count}=  Step 2 select MobileNoti,Mailchimp,Fb and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti,Mailchimp,Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for MobileNoti,Mailchimp,Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti,Hubspot,Fb and ConstantContact - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSeg_MnHbFbCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    ${count}=  Step 2 select MobileNoti,Hubspot,Fb and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti,Hubspot,Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for MobileNoti,Hubspot,Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti,Mailchimp,Csv and ConstantContact - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSeg_MnMcCsvCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    ${count}=  Step 2 select MobileNoti,Mailchimp,Csv and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti,Mailchimp,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
    Step 4 results screen verification for MobileNoti,Mailchimp,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Mailchimp,Hubspot,Csv and ConstantContact - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSeg_McHbCsvCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    Step 2 select Mailchimp,Hubspot,Csv and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Mailchimp,Hubspot,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Step 4 results screen verification for Mailchimp,Hubspot,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Fb,Hubspot,Csv and ConstantContact - Saved Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_savedSeg_FbHbCsvCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]  Retention
    Step 2 select Fb,Hubspot,Csv and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Fb,Hubspot,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for Fb,Hubspot,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_retention_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


##savedUPSELLsegment
Create new campaign with MobileNoti & Hubspot - Saved Upsell Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New Campaign with MobileNoti & Hubspot - Saved Upsell Segment

New Campaign with MobileNoti & Hubspot - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_savedSegMnHb${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    ${count}=  step 2 select mobile noti and hubspot  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mobile noti and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
    step 4 results screen verification for mobile noti and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}



Create new campaign with MobileNoti & MailChimp - Saved Upsell Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New Campaign with MobileNoti & MailChimp - Saved Upsell Segment

New Campaign with MobileNoti & MailChimp - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_savedSegMnMc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    ${count}=  step 2 select mobile noti and mailchimp  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mobile noti and mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
    step 4 results screen verification for mobile noti and mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}



Create new campaign with Malichimp & Csv - Saved Upsell Segment
        ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mailchimp $ CSV - Saved Upsell Segment

New campaign with Mailchimp $ CSV - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_savedSegMcCsv${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    step 2 select mailchimp and csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mailchimp and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    step 4 results screen verification for mailchimp and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with Mobilenoti and CSv - Saved Upsell Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mobile noti and csv - Saved Upsell Segment

New campaign with mobile noti and csv - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_savedSegMnCsv${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    ${count}=  step 2 select mobile noti and csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mobile noti and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
    step 4 results screen verification for mobile noti and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with mailchimp and facebook - Saved Upsell Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mailchimp and facebook - Saved Upsell Segment

new campaign with mailchimp and facebook - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_savedSegMcFb${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    step 2 select facebook and mailchimp  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for facebook and mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for facebook and mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with mobileNoti and facebook - Saved Upsell Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mobilenoti and facebook - Saved Upsell Segment

New campaign with mobilenoti and facebook - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_savedSegMnFb${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    ${count}=  step 2 select mobile noti and facebook  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for mobile noti and facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for mobile noti and fb  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with All Channels - Saved Upsell Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with All Channels - Saved Upsell Segment

New campaign with All Channels - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_savedSegAll${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    ${count}=  step 2 select all channels  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for all channels  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for all channels  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the Mobile notification - Saved Upsell Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification only - Saved Upsell Segment

New campaign with Mobile Notification only - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_savedSegMN${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND   step 3 deploy with mn  ${campName}  ${count}
    ...  AND   step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
    ...  AND   Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with the mailchimp only - Saved Upsell Segment
     ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mailchimp - Saved Upsell Segment

New campaign with mailchimp - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_savedSegMC${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    step 2 channel with mailchimp  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    step 4 results with mailchimp  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the facebook only - Saved Upsell Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with facebook - Saved Upsell Segment

New campaign with facebook - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_savedSegFB${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    step 2 channel with facebook  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results with facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the csv only - Saved Upsell Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with csv - Saved Upsell Segment

New campaign with CSV - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_savedSegCSV${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    step 2 channel with csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    step 4 results with csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with the hubspot only - Saved Upsell Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with hubspot - Saved Upsell Segment

New campaign with hubspot - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_savedSegHubspot${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    Step 2 channel with hubspot  ${campName}
    Verify the ECB in Deploy Page
    Step 3 deploy with hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Step 4 results with hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the MobileNoti, mailchimp and hubspot - Saved Upsell Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with MobileNoti, mailchimp and hubspot - Saved Upsell Segment

New campaign with MobileNoti, mailchimp and hubspot - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_savedSegMnMcHb${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    ${count}=  step 2 select mobilenoti, mailchimp and hubspot  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mobilenoti, mailchimp and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
    step 4 results with mobilenoti, mailchimp and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}



Create new campaign with the mailchimp, hubspot and csv - Saved Upsell Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mChimp, hubspot and csv - Saved Upsell Segment

New campaign with mChimp, hubspot and csv - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_savedSegMcHbCSV${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    step 2 select mailchimp, hubspot and csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mailchimp, hubspot and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    step 4 results with mailchimp, hubspot and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}



Create new campaign with the mobilenoti, mailchimp and facebook - Saved Upsell Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mobilenoti, mailchimp and facebook - Saved Upsell Segment

New campaign with mobilenoti, mailchimp and facebook - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_savedSegMnMcFb${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    step 2 select mobilenoti, mailchimp and facebook  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mobilenoti, mailchimp and facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    step 4 results with mobilenoti, mailchimp and facebook  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}



Create new campaign with the malichimp, facebook and csv - Saved Upsell Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with malichimp, facebook and csv - Saved Upsell Segment

New campaign with malichimp, facebook and csv - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_savedSegMcFbCsv${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    step 2 select malichimp, facebook and csv  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mailchimp, facebook and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results with mailchimp, facebook and csv  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the mobilenoti, csv and hubspot - Saved Upsell Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with mobilenoti, csv and hubspot - Saved Upsell Segment

New campaign with mobilenoti, csv and hubspot - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_savedSegMnCsvHb${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    ${count}=  step 2 select mobilenoti, csv and hubspot  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mobilenoti, csv and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
    step 4 results with mobilenoti, csv and hubspot  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

##single
New campaign with ConstantContact - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_saved_ConsCont${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    Step 2 channel with ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 deploy with ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Step 4 results with ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

##2channels
New campaign with MobileNoti and ConstantContact - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_saved_MnCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    ${count}=  Step 2 select MobileNoti and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
    Step 4 results screen verification for MobileNoti and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

##MailchimpAndConstantContact
New campaign with Mailchimp and ConstantContact - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_saved_McCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    Step 2 select Mailchimp and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Mailchimp and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Step 4 results screen verification for Mailchimp and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

##FbAndConstantContact
New campaign with Fb and ConstantContact - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_saved_FbCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    Step 2 select Fb and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

##HubspotAndConstantContact
New campaign with Hubspot and ConstantContact - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_saved_HbCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    Step 2 select Hubspot and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Hubspot and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Step 4 results screen verification for Hubspot and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

##CsvAndConstantContact
New campaign with CSV and ConstantContact - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_saved_CsvCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    Step 2 select CSV and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Step 4 results screen verification for CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    search and delete the created campaign  ${campName}

##3channels
New campaign with MobileNoti, Mailchimp and ConstantContact - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_saved_MnMcCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    ${count}=  Step 2 select MobileNoti, Mailchimp and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti, Mailchimp and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
    Step 4 results screen verification for MobileNoti, Mailchimp and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti, Fb and ConstantContact - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_saved_MnFbCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    ${count}=  Step 2 select MobileNoti, Fb and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti, Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for MobileNoti, Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti, Hubspot and ConstantContact - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_saved_MnFbCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    ${count}=  Step 2 select MobileNoti, Hubspot and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti, Hubspot and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
    Step 4 results screen verification for MobileNoti, Hubspot and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Facebook, CSV and ConstantContact - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_saved_FbCsvCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    Step 2 select Facebook, CSV and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Facebook, CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for Facebook, CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Mailchimp, CSV and ConstantContact - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_saved_McCsvCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    Step 2 select Mailchimp, CSV and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Mailchimp, CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Step 4 results screen verification for Mailchimp, CSV and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

###4chanels
New campaign with MobileNoti,Mailchimp,Fb and ConstantContact - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_saved_MnMcFbCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    ${count}=  Step 2 select MobileNoti,Mailchimp,Fb and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti,Mailchimp,Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for MobileNoti,Mailchimp,Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti,Hubspot,Fb and ConstantContact - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_saved_MnHbFbCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    ${count}=  Step 2 select MobileNoti,Hubspot,Fb and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti,Hubspot,Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for MobileNoti,Hubspot,Fb and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with MobileNoti,Mailchimp,Csv and ConstantContact - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_saved_MnMcCsvCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    ${count}=  Step 2 select MobileNoti,Mailchimp,Csv and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for MobileNoti,Mailchimp,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
    Step 4 results screen verification for MobileNoti,Mailchimp,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  ${count}
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Mailchimp,Hubspot,Csv and ConstantContact - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_saved_McHbCsvCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    Step 2 select Mailchimp,Hubspot,Csv and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Mailchimp,Hubspot,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Step 4 results screen verification for Mailchimp,Hubspot,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Fb,Hubspot,Csv and ConstantContact - Saved Upsell Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_saved_FbHbCsvCc${PO_Number}
    Step 1 define for saved segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]  Upsell
    Step 2 select Fb,Hubspot,Csv and ConstantContact  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Fb,Hubspot,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for Fb,Hubspot,Csv and ConstantContact  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_upsell_savedSeg1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

--acquisitionSegments
##singleChannels
New campaign with the mailchimp only - acquisition segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    acqSegment_campgnMc${PO_Number}
    step 1 define with acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]  ${globVar_zipcode1}  ${globVar_zipcode2}  ${globVar_zipplusfour1}  ${globVar_zipplusfour2}
    step 2 channel with mailchimp - acquisition segment  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mailchimp - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
    step 4 results with mailchimp - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with the hubspot only - acquisition segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    acqSegment_campgnHb${PO_Number}
    step 1 define with acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]  ${globVar_zipcode1}  ${globVar_zipcode2}  ${globVar_zipplusfour1}  ${globVar_zipplusfour2}
    step 2 channel with hubspot - acquisition segment  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with hubspot - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
    step 4 results with hubspot - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with the facebook only - acquisition segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    acqSegment_campgnFb${PO_Number}
    step 1 define with acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]  ${globVar_zipcode2}  ${globVar_zipcode3}  ${globVar_zipplusfour1}  ${globVar_zipplusfour2}
    step 2 channel with facebook - acquisition segment  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with facebook - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results with facebook - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with ConstantContact only - Acquisition Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    acqSegment_Cc${PO_Number}
    step 1 define with acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]  ${globVar_zipcode2}  ${globVar_zipcode3}  ${globVar_zipplusfour1}  ${globVar_zipplusfour2}
    Step 2 with ConstantContact - Acquisition Segment  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with constantcontact - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
    step 4 results with constantcontact - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

###2Combinations
New campaign with mailchimp and facebook - acquisition segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    acqSegment_campgnMcFb${PO_Number}
    step 1 define with acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]  ${globVar_zipcode3}  ${globVar_zipcode4}  ${globVar_zipplusfour1}  ${globVar_zipplusfour2}
    step 2 select facebook and mailchimp - acquisition segment  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for facebook and mailchimp - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for facebook and mailchimp - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with hubspot and facebook - acquisition segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    acqSegment_campgnFbHb${PO_Number}
    step 1 define with acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]  ${globVar_zipcode1}  ${globVar_zipcode2}  ${globVar_zipplusfour1}  ${globVar_zipplusfour2}
    step 2 select hubspot and facebook - acquisition segment  ${campName}
    Verify the ECB in Deploy Page
    step 3 vaidate and click deploy for hubspot and facebook - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for hubspot and facebook - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with mailchimp and hubspot - acquisition segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    acqSegment_campgnMcHb${PO_Number}
    step 1 define with acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment3]  ${globVar_zipcode1}  ${globVar_zipcode2}  ${globVar_zipplusfour1}  ${globVar_zipplusfour2}
    step 2 select hubspoit and mailchimp - acquisition segment  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy for hubspot and mailchimp - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment3]
    step 4 results screen verification for hubspot and mailchimp - acquisitin segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment3]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Fb and ConstantContact - Acquisition Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    acqSegment_campgnFbCc${PO_Number}
    step 1 define with acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]  ${globVar_zipcode1}  ${globVar_zipcode2}  ${globVar_zipplusfour1}  ${globVar_zipplusfour2}
    Step 2 select Fb and ConstantContact - Acquisition Segment  ${campName}
    Verify the ECB in Deploy Page
    Step 3 validate and click deploy popup for Fb and ConstantContact - Acquisition Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    Step 4 results screen verification for Fb and ConstantContact - Acquisition Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Mailchimp and ConstantContact - Acquisition Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    acqSegment_campgnMcCc${PO_Number}
    step 1 define with acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment3]  ${globVar_zipcode1}  ${globVar_zipcode2}  ${globVar_zipplusfour1}  ${globVar_zipplusfour2}
    step 2 select Mailchimp and ConstantContact - Acquisition Segment  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for Mailchimp and ConstantContact - Acquisition Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment3]
    step 4 results screen verification for Mailchimp and ConstantContact - Acquisition Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment3]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Hubspot and ConstantContact - Acquisition Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    acqSegment_campgnHbCc${PO_Number}
    step 1 define with acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment3]  ${globVar_zipcode1}  ${globVar_zipcode2}  ${globVar_zipplusfour1}  ${globVar_zipplusfour2}
    step 2 select Hubspot and ConstantContact - Acquisition Segment  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for Hubspot and ConstantContact - Acquisition Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment3]
    step 4 results screen verification for Hubspot and ConstantContact - Acquisition Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment3]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

###3channels-acquisitionSegment
New campaign with Mailchimp, Fb, and ConstantContact - Acquisition Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    acqSegment_McFbCc${PO_Number}
    step 1 define with acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment3]  ${globVar_zipcode1}  ${globVar_zipcode2}  ${globVar_zipplusfour1}  ${globVar_zipplusfour2}
    step 2 select Mailchimp, Fb, and ConstantContact - Acquisition Segment  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for Mailchimp, Fb, and ConstantContact - Acquisition Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment3]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for Mailchimp, Fb, and ConstantContact - Acquisition Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment3]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Hubspot,Fb, and ConstantContact - Acquisition Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    acqSegment_HbFbCc${PO_Number}
    step 1 define with acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment2]  ${globVar_zipcode1}  ${globVar_zipcode2}  ${globVar_zipplusfour1}  ${globVar_zipplusfour2}
    step 2 select Hubspot,Fb, and ConstantContact - Acquisition Segment  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for Hubspot,Fb, and ConstantContact - Acquisition Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment2]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for Hubspot,Fb, and ConstantContact - Acquisition Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment2]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with Mailchimp, Hubspot, and, ConstantContact - Acquisition Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    acqSegment_campgnMcHbCc${PO_Number}
    step 1 define with acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment3]  ${globVar_zipcode1}  ${globVar_zipcode2}  ${globVar_zipplusfour1}  ${globVar_zipplusfour2}
    step 2 select Mailchimp, Hubspot, and, ConstantContact - Acquisition Segment  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for Mailchimp, Hubspot, and, ConstantContact - Acquisition Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment3]
    step 4 results screen verification for Mailchimp, Hubspot, and, ConstantContact - Acquisition Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment3]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

New campaign with All Channels - acquisition segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    acqSegment_campgnAll${PO_Number}
    step 1 define for all zipcodes  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment2]
    step 2 select all channels - acquisition segment  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for all channels - acquisitin segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment2]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for all channels - acquisitin segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment2]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

##DraftSingle
Draft and complete campaign with the mailchimp only - acquisition segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    acqSegment_draftMc${PO_Number}
    Create a drafted campaign for acquisition segment and verify it's created  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]  ${globVar_zipcode1}  ${globVar_zipcode2}  ${globVar_zipplusfour1}  ${globVar_zipplusfour2}
    step 2 channel with mailchimp - acquisition segment  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with mailchimp - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
    step 4 results with mailchimp - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Draft and complete campaign with the hubspot only - acquisition segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    acqSegment_draftHb${PO_Number}
    Create a drafted campaign for acquisition segment and verify it's created  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]  ${globVar_zipcode1}  ${globVar_zipcode2}  ${globVar_zipplusfour1}  ${globVar_zipplusfour2}
    step 2 channel with hubspot - acquisition segment  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with hubspot - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
    step 4 results with hubspot - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Draft and complete campaign with the facebook only - acquisition segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    acqSegment_draftFb${PO_Number}
    Create a drafted campaign for acquisition segment and verify it's created  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]  ${globVar_zipcode2}  ${globVar_zipcode3}  ${globVar_zipplusfour1}  ${globVar_zipplusfour2}
    step 2 channel with facebook - acquisition segment  ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with facebook - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results with facebook - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Draft and complete campaign with the ConstantContact only - acquisition segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    acqSegment_draftFb${PO_Number}
    Create a drafted campaign for acquisition segment and verify it's created  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]  ${globVar_zipcode2}  ${globVar_zipcode3}  ${globVar_zipplusfour1}  ${globVar_zipplusfour2}
    step 2 with constantcontact - acquisition segment   ${campName}
    Verify the ECB in Deploy Page
    step 3 deploy with constantcontact - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
    step 4 results with constantcontact - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

###Draft2Combinations
Draft and complete campaign with mailchimp and facebook - acquisition segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    acqSegment_draftMcFb${PO_Number}
    Create a drafted campaign for acquisition segment and verify it's created  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]  ${globVar_zipcode3}  ${globVar_zipcode4}  ${globVar_zipplusfour1}  ${globVar_zipplusfour2}
    step 2 select facebook and mailchimp - acquisition segment  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for facebook and mailchimp - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for facebook and mailchimp - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Draft and complete campaign with hubspot and facebook - acquisition segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    acqSegment_draftFbHb${PO_Number}
    Create a drafted campaign for acquisition segment and verify it's created  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]  ${globVar_zipcode1}  ${globVar_zipcode2}  ${globVar_zipplusfour1}  ${globVar_zipplusfour2}
    step 2 select hubspot and facebook - acquisition segment  ${campName}
    Verify the ECB in Deploy Page
    step 3 vaidate and click deploy for hubspot and facebook - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for hubspot and facebook - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment1]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Draft and complete campaign with mailchimp and hubspot - acquisition segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    acqSegment_draftMcHb${PO_Number}
    Create a drafted campaign for acquisition segment and verify it's created  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment3]  ${globVar_zipcode1}  ${globVar_zipcode2}  ${globVar_zipplusfour1}  ${globVar_zipplusfour2}
    step 2 select hubspoit and mailchimp - acquisition segment  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy for hubspot and mailchimp - acquisition segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment3]
    step 4 results screen verification for hubspot and mailchimp - acquisitin segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment3]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

###3All
Draft and complete campaign with All Channels - acquisition segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    acqSegment_draftAll${PO_Number}
    Create a drafted campaign for acquisition segment and verify it's created  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment2]  ${globVar_zipcode1}  ${globVar_zipcode2}  ${globVar_zipplusfour1}  ${globVar_zipplusfour2}
    step 2 select all channels - acquisition segment  ${campName}
    Verify the ECB in Deploy Page
    step 3 validate and click deploy popup for all channels - acquisitin segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment2]
#    sleep  10
#    ${status}=  Run Keyword And Return Status  element should be visible  //*[contains(text(),'Error! Facebook')]
#    Run Keyword Unless  ${status}
    step 4 results screen verification for all channels - acquisitin segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Acquistn_segment2]
    Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


___eventDrivenCampaigns
Create new campaign with the Mobile notification event driven- competitor visit minutes(america/chicago)
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- competitor visit minutes(america/chicago)

New campaign with Mobile Notification event driven- competitor visit minutes(america/chicago)
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMNcvm${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND  step 3 deploy mn with event driven- competitor visit minutes(america/chicago)  ${campName}  ${count}
    ...  AND  step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    ...  AND  Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the Mobile notification event driven- competitor visit minutes(america/denver)
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- competitor visit minutes(america/denver)

New campaign with Mobile Notification event driven- competitor visit minutes(america/denver)
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMNcvm${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND  step 3 deploy mn with event driven- competitor visit minutes(america/denver)  ${campName}  ${count}
    ...  AND  step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    ...  AND  Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with the Mobile notification event driven- competitor visit minutes(america/la)
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- competitor visit minutes(america/la)

New campaign with Mobile Notification event driven- competitor visit minutes(america/la)
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMNcvm${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND  step 3 deploy mn with event driven- competitor visit minutes(america/la)  ${campName}  ${count}
    ...  AND  step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    ...  AND  Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the Mobile notification event driven- competitor visit minutes(america/new_york)
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- competitor visit minutes(america/new_york)

New campaign with Mobile Notification event driven- competitor visit minutes(america/new_york)
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMNcvm${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND  step 3 deploy mn with event driven- competitor visit minutes(america/new_york)  ${campName}  ${count}
    ...  AND  step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    ...  AND  Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the Mobile notification event driven- competitor visit minutes(utc)
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- competitor visit minutes(utc)

New campaign with Mobile Notification event driven- competitor visit minutes(utc)
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMNcvm${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND  step 3 deploy mn with event driven- competitor visit minutes(utc)  ${campName}  ${count}
    ...  AND  step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    ...  AND  Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

##########speedTestMinutesDiv
Create new campaign with the Mobile notification event driven- speed test minutes(america/chicago)
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- speed test minutes(america/chicago)

New campaign with Mobile Notification event driven- speed test minutes(america/chicago)
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMNstm${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND  step 3 deploy mn with event driven- speed test minutes(america/chicago)  ${campName}  ${count}
    ...  AND  step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    ...  AND  Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the Mobile notification event driven- speed test minutes(america/denver)
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- speed test minutes(america/denver)

New campaign with Mobile Notification event driven- speed test minutes(america/denver)
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMNstm${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND  step 3 deploy mn with event driven- speed test minutes(america/denver)  ${campName}  ${count}
    ...  AND  step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    ...  AND  Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with the Mobile notification event driven- speed test minutes(america/la)
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- speed test minutes(america/la)

New campaign with Mobile Notification event driven- speed test minutes(america/la)
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMNstm${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND  step 3 deploy mn with event driven- speed test minutes(america/la)  ${campName}  ${count}
    ...  AND  step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    ...  AND  Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the Mobile notification event driven- speed test minutes(america/new_york)
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- speed test minutes(america/new_york)

New campaign with Mobile Notification event driven- speed test minutes(america/new_york)
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMNstm${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND  step 3 deploy mn with event driven- speed test minutes(america/new_york)  ${campName}  ${count}
    ...  AND  step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    ...  AND  Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the Mobile notification event driven- speed test minutes(utc)
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- speed test minutes(utc)

New campaign with Mobile Notification event driven- speed test minutes(utc)
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMNstm${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND  step 3 deploy mn with event driven- speed test minutes(utc)  ${campName}    ${count}
    ...  AND  step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]   ${count}
    ...  AND  Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

#####ServiceLimitHitsDiv
Create new campaign with the Mobile notification event driven- Service Limit Hits(america/chicago)
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- Service Limit Hits(america/chicago)

New campaign with Mobile Notification event driven- Service Limit Hits(america/chicago)
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMNslh${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND  step 3 deploy mn with event driven- Service Limit Hits(america/chicago)  ${campName}  ${count}
    ...  AND  step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]   ${count}
    ...  AND  Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the Mobile notification event driven- Service Limit Hits(america/denver)
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- Service Limit Hits(america/denver)

New campaign with Mobile Notification event driven- Service Limit Hits(america/denver)
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMNslh${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND  step 3 deploy mn with event driven- Service Limit Hits(america/denver)  ${campName}  ${count}
    ...  AND  step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    ...  AND  Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with the Mobile notification event driven- Service Limit Hits(america/la)
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- Service Limit Hits(america/la)

New campaign with Mobile Notification event driven- Service Limit Hits(america/la)
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMNslh${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND  step 3 deploy mn with event driven- Service Limit Hits(america/la)  ${campName}  ${count}
    ...  AND  step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    ...  AND  Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the Mobile notification event driven- Service Limit Hits(america/new_york)
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- Service Limit Hits(america/new_york)

New campaign with Mobile Notification event driven- Service Limit Hits(america/new_york)
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMNslh${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND  step 3 deploy mn with event driven- Service Limit Hits(america/new_york)  ${campName}  ${count}
    ...  AND  step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    ...  AND  Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the Mobile notification event driven- Service Limit Hits(utc)
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- Service Limit Hits(utc)

New campaign with Mobile Notification event driven- Service Limit Hits(utc)
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    upsl_campgnMNslh${PO_Number}
    step 1 define  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND  step 3 deploy mn with event driven- Service Limit Hits(utc)  ${campName}  ${count}
    ...  AND  step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_segment4]  ${count}
    ...  AND  Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}



####eventDrivenKeys-RetentionSegment
Create new campaign with the Mobile notification event driven- competitor visit minutes(america/chicago)- Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- competitor visit minutes(america/chicago)- Retention Segment

New campaign with Mobile Notification event driven- competitor visit minutes(america/chicago)- Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMNcvm${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if  '${count}' == '0'   log  Segment size is 0
    ...  ELSE  run keywords   Verify the ECB in Deploy Page
    ...  AND  step 3 deploy mn with event driven- competitor visit minutes(america/chicago)  ${campName}  ${count}
    ...  AND  step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${count}
    ...  AND  Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the Mobile notification event driven- competitor visit minutes(america/denver)- Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- competitor visit minutes(america/denver)- Retention Segment

New campaign with Mobile Notification event driven- competitor visit minutes(america/denver)- Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMNcvm${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if  '${count}' == '0'   log  Segment size is 0
    ...  ELSE  run keywords   Verify the ECB in Deploy Page
    ...  AND   step 3 deploy mn with event driven- competitor visit minutes(america/denver)  ${campName}   ${count}
    ...  AND   step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]  ${count}
    ...  AND   Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with the Mobile notification event driven- competitor visit minutes(america/la)- Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- competitor visit minutes(america/la)- Retention Segment

New campaign with Mobile Notification event driven- competitor visit minutes(america/la)- Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMNcvm${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]  ${globVar_region4}  ${globVar_location4}
    ${count}=   step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND   step 3 deploy mn with event driven- competitor visit minutes(america/la)  ${campName}  ${count}
    ...  AND   step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]  ${count}
    ...  AND   Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the Mobile notification event driven- competitor visit minutes(america/new_york)- Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- competitor visit minutes(america/new_york)- Retention Segment

New campaign with Mobile Notification event driven- competitor visit minutes(america/new_york)- Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMNcvm${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND  step 3 deploy mn with event driven- competitor visit minutes(america/new_york)  ${campName}   ${count}
    ...  AND  step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]  ${count}
    ...  AND  Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the Mobile notification event driven- competitor visit minutes(utc)- Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- competitor visit minutes(utc)- Retention Segment

New campaign with Mobile Notification event driven- competitor visit minutes(utc)- Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMNcvm${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]  ${globVar_region4}  ${globVar_location4}
    ${count}=   step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND  step 3 deploy mn with event driven- competitor visit minutes(utc)  ${campName}  ${count}
    ...  AND  step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]  ${count}
    ...  AND  Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

##########speedTestMinutesDiv
Create new campaign with the Mobile notification event driven- speed test minutes(america/chicago)- Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- speed test minutes(america/chicago)- Retention Segment

New campaign with Mobile Notification event driven- speed test minutes(america/chicago)- Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMNstm${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${globVar_region4}  ${globVar_location4}
    ${count}=   step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND   step 3 deploy mn with event driven- speed test minutes(america/chicago)  ${campName}  ${count}
    ...  AND   step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${count}
    ...  AND   Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the Mobile notification event driven- speed test minutes(america/denver)- Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- speed test minutes(america/denver)- Retention Segment

New campaign with Mobile Notification event driven- speed test minutes(america/denver)- Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMNstm${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]  ${globVar_region4}  ${globVar_location4}
    ${count}=   step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND   step 3 deploy mn with event driven- speed test minutes(america/denver)  ${campName}  ${count}
    ...  AND   step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]  ${count}
    ...  AND   Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with the Mobile notification event driven- speed test minutes(america/la)- Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- speed test minutes(america/la)- Retention Segment

New campaign with Mobile Notification event driven- speed test minutes(america/la)- Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMNstm${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND   step 3 deploy mn with event driven- speed test minutes(america/la)  ${campName}  ${count}
    ...  AND   step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]  ${count}
    ...  AND   Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the Mobile notification event driven- speed test minutes(america/new_york)- Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- speed test minutes(america/new_york)- Retention Segment

New campaign with Mobile Notification event driven- speed test minutes(america/new_york)- Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMNstm${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=   step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND   step 3 deploy mn with event driven- speed test minutes(america/new_york)  ${campName}  ${count}
    ...  AND   step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]  ${count}
    ...  AND   Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the Mobile notification event driven- speed test minutes(utc)- Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- speed test minutes(utc)- Retention Segment

New campaign with Mobile Notification event driven- speed test minutes(utc)- Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMNstm${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]  ${globVar_region4}  ${globVar_location4}
    ${count}=   step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND   step 3 deploy mn with event driven- speed test minutes(utc)  ${campName}  ${count}
    ...  AND   step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]  ${count}
    ...  AND   Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

#####ServiceLimitHitsDiv
Create new campaign with the Mobile notification event driven- Service Limit Hits(america/chicago)- Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- Service Limit Hits(america/chicago)- Retention Segment

New campaign with Mobile Notification event driven- Service Limit Hits(america/chicago)- Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMNslh${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${globVar_region4}  ${globVar_location4}
    ${count}=   step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND   step 3 deploy mn with event driven- Service Limit Hits(america/chicago)  ${campName}  ${count}
    ...  AND   step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment1]  ${count}
    ...  AND   Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the Mobile notification event driven- Service Limit Hits(america/denver)- Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- Service Limit Hits(america/denver)- Retention Segment

New campaign with Mobile Notification event driven- Service Limit Hits(america/denver)- Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}   Set Variable    retn_campgnMNslh${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]  ${globVar_region4}  ${globVar_location4}
    ${count}=  step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND   step 3 deploy mn with event driven- Service Limit Hits(america/denver)  ${campName}   ${count}
    ...  AND   step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment2]   ${count}
    ...  AND   Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}

Create new campaign with the Mobile notification event driven- Service Limit Hits(america/la)- Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- Service Limit Hits(america/la)- Retention Segment

New campaign with Mobile Notification event driven- Service Limit Hits(america/la)- Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMNslh${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]  ${globVar_region4}  ${globVar_location4}
    ${count}=   step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND   step 3 deploy mn with event driven- Service Limit Hits(america/la)  ${campName}  ${count}
    ...  AND   step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment3]  ${count}
    ...  AND   Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the Mobile notification event driven- Service Limit Hits(america/new_york)- Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- Service Limit Hits(america/new_york)- Retention Segment

New campaign with Mobile Notification event driven- Service Limit Hits(america/new_york)- Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMNslh${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]  ${globVar_region4}  ${globVar_location4}
    ${count}=   step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND   step 3 deploy mn with event driven- Service Limit Hits(america/new_york)  ${campName}  ${count}
    ...  AND   step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment4]  ${count}
    ...  AND   Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}


Create new campaign with the Mobile notification event driven- Service Limit Hits(utc)- Retention Segment
    ${response}=   call method    ${CMCconnectionObj}    Segments_Recommended
    Run Keyword If    ${response}[0] == '204'    No Segements found
    ...    ELSE     New campaign with Mobile Notification event driven- Service Limit Hits(utc)- Retention Segment

New campaign with Mobile Notification event driven- Service Limit Hits(utc)- Retention Segment
    ${PO_Number}    Generate random string    8    0123456789
    ${campName}    Set Variable    retn_campgnMNslh${PO_Number}
    step 1 define - Retention Segment  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]  ${globVar_region4}  ${globVar_location4}
    ${count}=   step 2 channel with mn  ${campName}
    run keyword if   '${count}' == '0'   log  Segment Size is 0, So Mobile Notification not available
    ...  ELSE  run keywords  Verify the ECB in Deploy Page
    ...  AND   step 3 deploy mn with event driven- Service Limit Hits(utc)  ${campName}  ${count}
    ...  AND   step 4 results with mn  ${campName}  ${test_data_config['env']['Campaigns']['Segments_list']}[globVar_Retentn_segment5]  ${count}
    ...  AND   Click on a campaign and verify its navigated to campaigns creation screen  ${campName}
    Search and delete the created campaign  ${campName}