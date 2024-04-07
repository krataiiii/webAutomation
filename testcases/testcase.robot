***Settings***
Resource        ../Keywords/Keyword.robot

Test Setup      Go to the page
Test Teardown    Close Browser   

***Test Cases***
[TC-1] - Verify When A User Login Successfully
    [Documentation]    To verify that users can login successfully when input a correct username and password.
    Input Value To Login        ${username}       ${valid_password}
    Click Login Button
    Verify Text Value In Label When Login Successfully
    Click Logout Button
    Verify Text Value In Label When Logout Successfully

[TC-2] - Verify When A User Login Failed With Invalid Password
    [Documentation]    To verify that users can login unsuccessfully when they input a correct username but wrong password.
    Input Value To Login        ${username}       ${invalid_password}
    Click Login Button
    Verify Text Value In Label When Login Unsucessfully

[TC-3] - Verify When A User Login Failed With Username and Password are invalid
    [Documentation]    To verify that users can login unsuccessfully when they input  a username that  did not exist.
    Input Value To Login        ${invalid_username}       ${invalid_password}
    Click Login Button
    Verify Text Value In Label When Login With Invalid User
