*** Settings ***
Documentation   User Login
Library         SeleniumLibrary
Library         util.py


***Variables***
${Server_Url}       http://39.107.96.138:3000/
${Browser}          chrome
${UserName}         user1
${Password}         123456





***Test Cases***
删除帖子
    ${file_name}=   util.Get Current Time
    Log To Console      ----------------${file_name}--------
    user1成功登录
    删除用户话题
    [Teardown]  Capture Page Screenshot     ${file_name}.png     
    Close Browser
 
# 安居客登录iframe 测试
#     Open Browser   https://login.anjuke.com/login/form     chrome
#     Select Frame    id:iframeLoginIfm
#     Input Text      id:phoneIpt     13211122233


***Keywords***
user1成功登录
    Open Browser    ${Server_Url}  ${Browser}
    Maximize Browser Window
    Click Element   css:a[href="/signin"]
    Input Text      id:name     ${UserName}
    Input Password  id:pass     ${Password}
    Click Element   css:[type="submit"]
    Page Should Contain     ${UserName}

删除用户话题
    Click Element   css:span[class="user_name"]>a
    Click Element   css:div.cell a.topic_title
    Click Element   css:i[class="fa fa-lg fa-trash"]
    Handle Alert