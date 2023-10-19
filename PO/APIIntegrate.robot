*** Settings ***
Variables  ../utils/InsightScreenAPI.py
Variables  ../utils/Demo.py

*** Variables ***
${Connection_response}=   connected
${Search_Region_Data}=    cloudRegions


*** Keywords ***
WebSocket Connection
       ${response_connection}=    call method    ${connectionObj}   WebsocketConnection
       should contain   ${response_connection}    ${Connection_response}

Search region data
       ${response_searchRegion}=    call method    ${connectionObj}   Search_Region_Data
       should contain   ${response_searchRegion}    ${Search_Region_Data}

Search region location data
       ${response_searchRegionLocation}=    call method    ${connectionObj}   Search_Region_LocationData



*** Test Cases ***
Verify the Websocket Connection
     WebSocket Connection

Verify Search region data
      Search region data

Verfy Search region location data
      Search region location data