*** Settings ***
Library                     Browser
Library                     OperatingSystem
Variables        ${EXECDIR}${/}resources${/}ENVs${/}logvariables.py

*** Keywords ***
Suite_Setup
    [Documentation]    Setup whole suite
    Import Variables    ${EXECDIR}${/}Resources${/}variables.py

Log Message
    [Documentation]    Log a message to the console
    [Arguments]        ${message}
    Log                message=ABC:${message}     console=true
    Browser.New Browser
    Sleep      3

Guaranteed to blow your mind
    [Documentation]    This keyword is guaranteed to blow your mind
    [Arguments]    ${URL}
    New Browser    chromium       headless=true     args=["--window-size=1920,1080 --viewport-size=1920,1080"]
    New Page       ${URL}
    Click          xpath=//span[text()='Zaloguj się']
    ${element}=    Get Element    xpath=//*[@id="field-email"]
    Fill Text      ${element}     ${PRESTA_LOGIN}
    ${element}=    Get Element    xpath=//*[@id="field-password"]
    Fill Text      ${element}     ${PRESTA_PASSWORD}
    Click          xpath=//*[@id="submit-login"]