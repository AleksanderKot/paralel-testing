*** Settings ***
Library        Browser
Library        OperatingSystem
Resource       ${EXECDIR}${/}resources${/}keywords${/}webgoat_keywords.robot

*** Test Cases ***
Test SQL Injection 3
    [Documentation]            Test case for SQL Injection task 3 in WebGoat.
    Open and Log In to Webgoat
    Click                      text="(A3) Injection"
    Click                      text="SQL Injection (intro)"
    Click                      text="3"
    
    ${element}=                Get Element       xpath=${WEBGOAT_SLCTRS_3}1]/td[2]/input
    Fill Text                  ${element}        UPDATE employees SET department = 'Sales' WHERE userid = '89762'
    Click                      xpath=${WEBGOAT_SLCTRS_3}2]/td/button
    
    Wait For Elements State    (${WEBGOAT_FEEDBACK})[2]    visible    timeout=5s
    ${feedback}=               Get Text          (${WEBGOAT_FEEDBACK})[2]
    Should Contain             ${feedback}       Congratulations
    Close Browser
