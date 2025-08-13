*** Settings ***
Library        Browser
Library        OperatingSystem
Resource       ${EXECDIR}${/}resources${/}keywords${/}webgoat_keywords.robot

*** Test Cases ***
Test SQL Injection 11
    [Documentation]            Test case for SQL Injection task 11 in WebGoat.
    Open and Log In to Webgoat
    Click                      text="(A3) Injection"
    Click                      text="SQL Injection (intro)"
    Click                      text="11"

    ${input_login}=            Get Element        xpath=${WEBGOAT_SLCTRS_11}1]/td[2]/input
    Fill Text                  ${input_login}     Smith
    ${input_userid}=           Get Element        xpath=${WEBGOAT_SLCTRS_11}2]/td[2]/input
    Fill Text                  ${input_userid}    1' OR '1'='1
    Click                      xpath=${WEBGOAT_SLCTRS_11}3]/td/button

    Wait For Elements State    (${WEBGOAT_FEEDBACK})[7]    visible    timeout=5s
    ${feedback}=               Get Text           (${WEBGOAT_FEEDBACK})[7]
    Should Contain             ${feedback}        succeed
    Close Browser
