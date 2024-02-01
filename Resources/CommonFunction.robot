*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome

*** Keywords ***
Open-Homepage
    Open Browser    https://www.kompas.com/        ${BROWSER}
    Maximize Browser Window