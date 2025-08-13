*** Settings ***
Library     Browser
Resource    ${EXECDIR}${/}resources${/}keywords${/}presta_keywords.robot

*** Test Cases ***

Test For Logging Into Prestahop
    # New Browser    chromium       headless=${false}     args=["--window-size=1920,1080 --viewport-size=1920,1080"]
    # New Page       https://prestashop.dev.ttpsc.cloud/pl/
    # Click          xpath=//span[text()='Zaloguj się']
    # ${element}=    Get Element    xpath=//*[@id="field-email"]
    # Fill Text      ${element}     aleksander.kot@ttpsc.com
    # ${element}=    Get Element    xpath=//*[@id="field-password"]
    # Fill Text      ${element}     zaq1@WSX1
    # Click          xpath=//*[@id="submit-login"]
    Guaranteed to blow your mind     https://prestashop.dev.ttpsc.cloud/pl/
    Go To                            https://prestashop.dev.ttpsc.cloud/pl/3-clothes
    Close Browser