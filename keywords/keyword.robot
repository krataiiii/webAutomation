***Settings***
Library    SeleniumLibrary
Library    BuiltIn
Library    OperatingSystem
Library    String

Resource    ../Resources/Variable.robot


***Keywords***
Go to the page
  Set Environment Variable  webdriver.chrome.driver  ${EXECDIR}/chromedriver.exe
  Open Browser      ${url}     chrome

Close 
    Close Browser

Input Value To Login
    [Arguments]     ${username}     ${password}
    Wait Until Element Is Visible       ${username_input_field} 
    Input Text      ${username_input_field}        ${username}
    Input Text      ${password_input_field}        ${password}

Click Login Button
    Click Button        ${login_button} 

Click Logout Button
    Click Element        ${logout_button}

Set Maximum Characters
    [Arguments]     ${case}
    ${max_char} =	Set Variable If			
    ...	'${case}' == 'Login Successfully'    30
    ...	'${case}' == 'Logout Successfully'    34
    ...	'${case}' == 'Login Unsucessfully'      25
    ...	'${case}' == 'Login With Invalid User'    25
    Set Test Variable     ${max_char}

Set Expected Text
    [Arguments]     ${text}
    ${expected_text} =	Set Variable If			
    ...	'${text}' == 'Login Successfully'    ${login_success_text_expected}
    ...	'${text}' == 'Logout Successfully'    ${logout_success_text_expected}
    ...	'${text}' == 'Login Unsucessfully'    ${login_fail_invalid_password_text_expected}
    ...	'${text}' == 'Login With Invalid User'    ${login_fail_invalid_username_text_expected}
    Set Test Variable     ${expected_text}

Verify Text Value In Label When ${expected}
    Set Maximum Characters      ${expected}
    Set Expected Text       ${expected}
    Wait Until Element Is Visible       ${label_text}
    ${actual}       Get Text        ${label_text}
    log    ${actual}
    ${actual_text} =    Get Substring     ${actual}    0    ${max_char}
    Should Be Equal      ${actual_text}       ${expected_text}

