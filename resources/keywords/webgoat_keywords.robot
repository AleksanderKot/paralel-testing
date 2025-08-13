*** Settings ***
Library          Browser
LIbrary          OperatingSystem
Resource         ${EXECDIR}${/}resources${/}POM${/}webgoat_items.robot
Variables        ${EXECDIR}${/}resources${/}ENVs${/}logvariables.py

*** Keywords ***
Try Login
    New Browser        chromium    headless=true    args=["--disable-blink-features=AutomationControlled"]
    New Page           ${WEBGOAT_URL}/login
    Fill Text          xpath=${WEBGOAT_LOGIN_TA}     ${WEBGOAT_LOGIN}
    Fill Text          xpath=${WEBGOAT_PASSWORD_TA}  ${WEBGOAT_PASSWORD}
    Click              xpath=//*[@id="main-content"]/form/button
    ${ok}=             Run Keyword And Return Status
    ...                Wait For Elements State    xpath=//*[@id="menu-container"]    visible    5s
    Close Browser
    RETURN             ${ok}

Ensure User Registered
    ${exists}=         Try Login
    IF     not ${exists}
           Register New User
    END
    ${ok}=             Try Login
    Should Be True     ${ok}    User should be able to log in after registration

Open and Log In to Webgoat
    [Documentation]    Opens the WebGoat application in a browser.
    New Browser        chromium       headless=true     args=["--disable-blink-features=AutomationControlled"]
    ${url} =           Set Variable    ${WEBGOAT_URL}/login
    Log                Opening page: ${url}       console=true      html=false
    New Page           url=${url}
    ${element} =       Get Element    xpath=${WEBGOAT_LOGIN_TA}
    Fill Text          ${element}     ${WEBGOAT_LOGIN}
    ${element} =       Get Element    xpath=${WEBGOAT_PASSWORD_TA}
    Fill Text          ${element}     ${WEBGOAT_PASSWORD}
    Click              xpath=//*[@id="main-content"]/form/button

Register New User
    [Documentation]    Test case for registering new user
    New Browser        chromium       headless=true   args=["--disable-blink-features=AutomationControlled"]
    New Page           ${WEBGOAT_URL}/login
    Click              xpath=//*[@id="main-content"]/form/div[3]/a
    ${element} =       Get Element    xpath=//*[@id="username"]
    Fill Text          ${element}     ${WEBGOAT_LOGIN}
    ${element} =       Get Element    xpath=//*[@id="password"]
    Fill Text          ${element}     ${WEBGOAT_PASSWORD}
    ${element} =       Get Element    xpath=//*[@id="matchingPassword"]
    Fill Text          ${element}     ${WEBGOAT_PASSWORD}
    Click              xpath=//*[@id="main-content"]/fieldset/form/div[5]/div/div/label/input
    Click              xpath=//*[@id="main-content"]/fieldset/form/div[6]/div/button
    Close Browser