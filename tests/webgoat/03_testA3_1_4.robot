*** Settings ***
Library        Browser
Library        OperatingSystem
Resource       ${EXECDIR}${/}resources${/}keywords${/}webgoat_keywords.robot

*** Test Cases ***
Test SQL Injection 4
    [Documentation]            Test case for SQL Injection task 4 in WebGoat.
    Open and Log In to Webgoat
    Click                      text="(A3) Injection"
    Click                      text="SQL Injection (intro)"
    Click                      text="4"
    
    ${element}=                Get Element       xpath=${WEBGOAT_SLCTRS_4}1]/td[2]/input
    Fill Text                  ${element}        ALTER TABLE employees DROP COLUMN phone;
    Click                      xpath=${WEBGOAT_SLCTRS_4}2]/td/button
    ${element}=                Get Element       xpath=${WEBGOAT_SLCTRS_4}1]/td[2]/input
    Fill Text                  ${element}        ALTER TABLE employees ADD phone varchar(20)
    Click                      xpath=${WEBGOAT_SLCTRS_4}2]/td/button

    Wait For Elements State    (${WEBGOAT_FEEDBACK})[3]    visible    timeout=5s
    ${feedback}=               Get Text          (${WEBGOAT_FEEDBACK})[3]
    Should Contain             ${feedback}       Congratulations
    Close Browser
