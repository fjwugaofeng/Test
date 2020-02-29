*** Settings ***
Suite Teardown    Close Browser
Library           Selenium2Library

*** Test Cases ***
case1
    Open Browser    http://172.16.32.242:8088/cobweb/    gc
    Maximize Browser Window
    Input Text    id=loginAccount    wuft
    Input Password    id=loginPassword    spider@300188
    Click Button    //*[@id="mainBgId"]/div/div[2]/form/div[6]/div[2]/button
    Click Element    id=homeQuit
    sleep    2
    Alert Should Be Present    确定要离开?离开之后将无法打开其他模块了    action=DISMISS
    #Handle Alert    action=DISMISS
    #Confirm Action
    sleep    2
    ${attvalue}    Get Element Attribute    id=homeQuit    class
    log    ${attvalue}
    #@{handles}    Get Window Handles
    #log    @{handles}=
    Click Element    id=oneSearch
    Select Window    NEW
    ${title}    Get Title
    Alert Should Not Be Present
    @{handles}    Get Window Handles
    Select Window    @{handles}[0]
    ${firstTitle}    Get Title
    sleep    2
    Select Window    @{handles}[1]
    ${secondTitle}    Get Title
    sleep    2
    Capture Page Screenshot
    Input Text    name=keyWord    Hello World!
    Clear Element Text    name=keyWord
    sleep    2
    Current Frame Should Contain    搜索
    Get Cookies

case2
    Open Browser    http://172.16.32.242:8088/cobweb/    gc
    Maximize Browser Window
    Input Text    id=loginAccount    wuft
    Input Password    id=loginPassword    spider@300188
    Click Button    //*[@id="mainBgId"]/div/div[2]/form/div[6]/div[2]/button
    Click Element    id=oneSearch
    Select Window    NEW
    Current Frame Should Contain    搜索
    ${cookies}    Get Cookies
    ${username}    Get Cookie Value    userName
    @{links}    Get All Links
    ${locator}    Get Location
    @{locators}    Get Locations
    ${implicitwait}    Get Selenium Implicit Wait
    ${seleniumspeed}    Get Selenium Speed
    ${timeout}    Get Selenium Timeout
    ${text}    Get Text    id=handsetNum
