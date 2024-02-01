*** Settings ***
Library                        SeleniumLibrary
Resource                       ../Resources/UserData.robot
Resource                       ../Resources/CommonFunction.robot

*** Variables ***
# Test Variables
&{LOGIN}                       username=${USER-EMAIL}    password=${PASSWORD}

# Elements
${LOGIN-PAGE}                  id=sso__icon__login_top
${EMAILLOGIN}                  css:input#email 
${PASSLOGIN}                   css:input#password
${LOGIN-BUTTON}                xpath: //*[contains(., "Login")]
${LOGO}                        //img[@id='anni26-img']
${CLICK-NEWS}                  //*[@id="mostLayout1"]/div[2]/a/div/div[2]/h2
${Ad-page}                     xpath: //*[contains(., "Tutup")]

*** Keywords ***
Close-Ad
    Click Element              ${Ad-page}
Logout-User
    Click Element              id=sso__icon__login_top
    Click Element              id=sso__item
    Click Element              //button[@role='button']
    Click Link                 link:Logout            

*** Test Cases ***
Login and open news
    [Setup]    Open-Homepage
    Wait Until Page Contains Element    ${LOGIN-PAGE}                            10
    Click Element                       ${LOGIN-PAGE}
    Click Link                          link: Login
    Input Text                          ${EMAILLOGIN}    ${LOGIN}[username]
    Input Password                      ${PASSLOGIN}     ${LOGIN}[password]
    Click Element                       ${LOGIN-BUTTON}
    #Run Keyword If                      ${Ad-page}         Close-Ad
    Wait Until Element Is Visible       ${LOGO}                                  10
    Scroll Element Into View            id:mostLayout1
    Click Element                       ${CLICK-NEWS}
    Page Should Contain                 //h1.read__title
    Log To Console                      Test Success!
    [Teardown]    Logout-User