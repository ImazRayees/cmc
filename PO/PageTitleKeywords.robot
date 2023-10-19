*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

Verify page title for HomeScreen
    Title Should Be  Home- Engagement- Calix Cloud

Verify page title for ExploreData screen
    Title Should Be  Subscribers-Basic-Explore Data-Engagement-Calix Cloud

Verify page title for Segments screen
    Title Should Be  Recommended-Saved-Segments-Engagement-Calix Cloud

Verify page title for Scheduled campaigns screen
    Title Should Be  Scheduled Campaigns-Engagement-Calix Cloud

Verify page title for Triggered campaigns screen
    Title Should Be  Triggered Campaigns-Engagement-Calix Cloud

Verify page title for Campaigns-MarketingChannel screen
    Title Should Be  Engagement Channels-Campaigns-Engagement-Calix Cloud

Verify page title for CampaignsCreation screen
    Title Should Be  New Scheduled Campaign-Engagement-Calix Cloud


