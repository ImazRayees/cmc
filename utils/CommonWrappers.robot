*** Settings ***
Library    SeleniumLibrary
Resource    ../utils/GlobVariables.robot

*** Variables ***


*** Keywords ***
Element visible validation
      [Arguments]    ${Elemement}
      element should be visible  ${Elemement}

Scrolling validation
     execute javascript    window.scrollTo(0,2500)
     #end fo the page
     execute javascript    window.scrollTo(0,document.body.scrollHight)
     #starting point
     execute javascript    window.scrollTo(0,document.body.scrollHight)