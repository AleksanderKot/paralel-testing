*** Settings ***
Library        Browser
Library        OperatingSystem
Resource       ${EXECDIR}${/}resources${/}keywords${/}webgoat_keywords.robot

*** Test Cases ***
Test SQL Injection 9
    [Documentation]            Test case for SQL Injection task 9 in WebGoat.
    Open and Log In to Webgoat
    Click                      text="(A3) Injection"
    Click                      text="SQL Injection (intro)"
    Click                      text="9"

    Select Options By          xpath=${WEBGOAT_SLCTRS_9}2]/select       value         '
    Select Options By          xpath=${WEBGOAT_SLCTRS_9}3]/select       value         or
    Select Options By          xpath=${WEBGOAT_SLCTRS_9}4]/select       value         '1' = '1
    Click                      xpath=${WEBGOAT_SLCTRS_9}6]/input
    
    Wait For Elements State    (${WEBGOAT_FEEDBACK})[5]    visible    timeout=5s
    ${feedback}=               Get Text          (${WEBGOAT_FEEDBACK})[5]
    Should Contain             ${feedback}       succeed
    Close Browser
