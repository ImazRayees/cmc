*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary

*** Variables ***
${walkthrough}=     //div/*[text()=' Subscribers by Service Tier & Technology ']/following-sibling::div/ul/li[1]
${walkthroughvideo}=        //div/*[text()=' Subscribers by Service Tier & Technology ']/following-sibling::div/ul/li[2]
${walkthroughinformation}=      //div/*[text()=' Subscribers by Service Tier & Technology ']/following-sibling::div/ul/li[3]/a
${ExportData}=      //div/*[text()=' Subscribers by Service Tier & Technology ']/following-sibling::div/ul/li[4]/a
${Maximizebutton}=      //div/*[text()=' Subscribers by Service Tier & Technology ']/following-sibling::div/ul/li[5]/a
${crossbutton}=      //*[@class='joyride-step__close']
${walkthroughHeader}=       //*[@class='joyride-step__header']/div
${walkthroughBody}=         //*[@class='joyride-step__body']/div
${walkthroughNextButton}=          //button[@class='btn btn-sm next-btn']
${Backtofirstwalkthrough}=      //button[@class='btn btn-sm prev-btn']
${DoneButton}=      //button[@class='btn next-btn']
${closewindow}=     //*[@class='info-video-close-button']
${infoclose}=       //*[@id='info-subscribers-by-service-tier-technology']//*[@class='modal-footer']/button
${infoBodycontent}=        //*[@id='info-subscribers-by-service-tier-technology']//*[@class='modal-body']/p
${infoHeader}=      //*[@id='info-subscribers-by-service-tier-technology']//h4
${InfoBody}=        //*[@id='info-subscribers-by-service-tier-technology']//*[@class='modal-body']/ul/li
*** Keywords ***
checking the walkthrough button
        click element    ${walkthrough}
        ${Header1}=     get text    ${walkthroughHeader}
        ${Body}=       get text    ${walkthroughBody}
        page should contain    ${crossbutton}
        click element    ${walkthroughNextButton}
        sleep    2
        ${Header}=     get text    ${walkthroughHeader}
        ${Body}=       get text    ${walkthroughBody}
        page should contain    ${crossbutton}
        click element    ${Backtofirstwalkthrough}
        sleep     2
        page should contain     ${Header1}
        click element    ${walkthroughNextButton}
        sleep     2
        click element       ${DoneButton}

checking the walkthrough Video Option
        wait until element is enabled    ${walkthroughvideo}
        click element    ${walkthroughvideo}
        sleep    2
        wait until element is enabled    ${closewindow}
        click element    ${closewindow}

checking the informationTab option on walkthrough
        wait until element is enabled    ${walkthroughinformation}
        click element    ${walkthroughinformation}
        sleep    2
        wait until element is enabled    ${infoHeader}
        ${Header}=      get text    ${infoHeader}
        ${InfoBody}=        get text    ${infoBodycontent}
        ${InfoBody}=        get text    //*[@id='info-subscribers-by-service-tier-technology']//*[@class='modal-body']/div
        click element    ${infoclose}

verify the export data button and Maximum button
        wait until element is enabled       ${ExportData}
        page should contain    ${ExportData}
        page should contain    ${Maximizebutton}