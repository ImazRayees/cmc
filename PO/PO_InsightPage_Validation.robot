*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../PO/InsightsPageObject.robot
Variables  ../utils/InsightScreenAPI.py

*** Variables ***


*** Keywords ***

After Logged in to the CMC Application Check Insight Page Loaded properly
    Log to console  "Test"
Select the Region as All Region
    log to console    "Test"
Select the location As All Location
    log to console    "Test"
Select the Show Data for the Past as 28 days
    log to console    "Test"
After given the all the Data Click Apply button to load Corresponding data
    log to console    "Test"