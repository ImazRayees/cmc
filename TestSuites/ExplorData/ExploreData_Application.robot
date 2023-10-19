*** Settings ***
Suite Setup  Run Keywords
...     Explore data api calls  AND
...     Launch the Application and navigate to cmc  AND
...     click on explore data  AND
...     Navigate to 2 Prior Months
Suite Teardown  Close the browsers
Resource     ../../TestSuites/Base.robot

*** Test Cases ***
navigate to applications and validate
    [Tags]  Explore_Regression  Explore_Sanity
     navigate to applications under basic tab
     verify elements on applications screen

validation of titles for widget icons in applications screen
    [Tags]  Explore_Regression
    [Template]  validating widget icons data with mouse over in applications tab
    Usage by app type download icon  ${applications_usagebyappltype_downloadbtn}  ${string_exportdata}
    Usage by app type expand icon  ${applications_usagebyappltype_expanddbtn}  ${string_maximize}
    Top Application download icon  ${applications_topappl_downloadbtn}  ${string_exportdata}
    Top Application expand icon  ${applications_topappl_expandbtn}  ${string_maximize}
    Top Gaming application download icon  ${applications_topgamingapps_downloadbtn}  ${string_exportdata}
    Top Gaming application expand icon  ${applications_topgamingapps_expandbtn}  ${string_maximize}
    Social Channel Heatmp download icon  ${applications_socialchannelheatmap_downloadbtn}  ${string_exportdata}
    Social Channel Heatmp expand icon  ${applications_socialchannelheatmap_expandbtn}  ${string_maximize}

Download button function - Applications Tab
    [Tags]  Explore_Regression
    Click download and verify the chart should still be visible - Usage by apps
    Click download and verify the chart should still be visible - Top Applications
    Click download and verify the chart should still be visible - Top Gaming Apps
    Click download and verify the chart should still be visible - Social Channel Heatmap

verify by clicking icons for all the widgets in applications screen
    [Tags]  Explore_Regression
    [Template]  validate clicking widget icons in applications screen
    Usage by app type icons  ${applications_usagebyappltype_downloadbtn}  ${applications_topappl_expandbtn}  ${applications_usagebyappltypelabeltxt}  ${applications_fullview_downloadbtn}
    Top applications icons  ${applications_topappl_downloadbtn}  ${applications_topappl_expandbtn}  ${applications_topappllabeltxt}  ${applications_fullview_downloadbtn}
    Top gaming apps icons  ${applications_topgamingapps_downloadbtn}  ${applications_topgamingapps_expandbtn}  ${applications_topgamingappslabeltxt}  ${applications_fullview_downloadbtn}
    Social channel heatmap  ${applications_socialchannelheatmap_downloadbtn}  ${applications_socialchannelheatmap_expandbtn}  ${applications_socialchannelheatmaplabeltxt}   ${applications_fullview_downloadbtn}

validation of download button function by clicking any bar in applications screen
    [Tags]  Explore_Regression
     validate download button fuction by clicking any bar from usage by application widget in applications screen

minimizing the application widget
    [Tags]  Explore_Regression
     minimize the full view widget screen

validation of tooltiop data from Usage by application widget pie chart
    [Tags]  Explore_Regression
     validating tooltip data for Usage by application pie in applications screen

maximizin the Usage by applications widget and validating pie chart in fullscreen
    [Tags]  Explore_Regression
     expand Usage by application widget and validate data
     validating tooltip data in fullview for UBA pie in applications screen

minimize the widget
    [Tags]  Explore_Regression
     minimize the full view widget screen

validating SCH dropdown
     [Tags]  Explore_Regression
     [Template]  validating dropdown under SCH widget
     Select Facebook  Facebook
     Select YouTube   YouTube