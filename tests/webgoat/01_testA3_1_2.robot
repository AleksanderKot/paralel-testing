*** Settings ***
Library        Browser
Library        OperatingSystem
Resource       ${EXECDIR}${/}resources${/}keywords${/}webgoat_keywords.robot

*** Test Cases ***
Test SQL Injection 2
    [Documentation]            Test case for SQL Injection task 2 in WebGoat.
    Open and Log In to Webgoat
    Click                      text="(A3) Injection"
    Click                      text="SQL Injection (intro)"
    Click                      text="2"
    
    ${element}=                Get Element       xpath=${WEBGOAT_SLCTRS_2}1]/td[2]/input
    Fill Text                  ${element}        SELECT department FROM employees WHERE userid = '96134'
    Click                      xpath=${WEBGOAT_SLCTRS_2}2]/td/button
    
    Wait For Elements State    (${WEBGOAT_FEEDBACK})[1]    visible    timeout=5s
    ${feedback}=               Get Text          (${WEBGOAT_FEEDBACK})[1]
    Should Contain             ${feedback}       You have succeeded!
    Close Browser
