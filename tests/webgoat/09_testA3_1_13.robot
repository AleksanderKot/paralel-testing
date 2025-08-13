*** Settings ***
Library        Browser
Library        OperatingSystem
Resource       ${EXECDIR}${/}resources${/}keywords${/}webgoat_keywords.robot

*** Test Cases ***
Test SQL Injection 13
    [Documentation]            Test case for SQL Injection task 13 in WebGoat.
    Open and Log In to Webgoat
    Click                      text="(A3) Injection"
    Click                      text="SQL Injection (intro)"
    Click                      xpath=//*[@id="restart-lesson-button"]
    Click                      text="13"

    ${input_login}=            Get Element        xpath=${WEBGOAT_SLCTRS_13}1]/td[2]/input
    Fill Text                  ${input_login}     '; drop table access_log --
    Click                      xpath=${WEBGOAT_SLCTRS_13}2]/td/button

    Wait For Elements State    (${WEBGOAT_FEEDBACK})[9]    visible    timeout=5s
    ${feedback}=               Get Text           (${WEBGOAT_FEEDBACK})[9]
    Should Contain             ${feedback}        success
    Close Browser
