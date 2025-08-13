*** Settings ***
Library        Browser
Library        OperatingSystem
Resource       ${EXECDIR}${/}resources${/}keywords${/}webgoat_keywords.robot

*** Test Cases ***
Test SQL Injection 5
    [Documentation]            Test case for SQL Injection task 5 in WebGoat.
    Open and Log In to Webgoat
    Click                      text="(A3) Injection"
    Click                      text="SQL Injection (intro)"
    Click                      text="5"

    ${element}=                Get Element       xpath=${WEBGOAT_SLCTRS_5}1]/td[2]/input
    Fill Text                  ${element}        GRANT ALL ON grant_rights TO unauthorized_user
    Click                      xpath=${WEBGOAT_SLCTRS_5}2]/td/button
    
    Wait For Elements State    (${WEBGOAT_FEEDBACK})[4]    visible    timeout=5s
    ${feedback}=               Get Text          (${WEBGOAT_FEEDBACK})[4]
    Should Contain             ${feedback}       Congratulations
    Close Browser
