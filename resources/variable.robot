***Variables***
${url}       http://the-internet.herokuapp.com/login

#locator_login_page
${username_input_field}     //input[@id="username"]
${password_input_field}     //input[@id="password"]
${login_button}     //button[@type="submit"]
${label_text}       //div[@id="flash"]
${logout_button}        //a[@class="button secondary radius"]

#data_test
${username}     tomsmith
${valid_password}     SuperSecretPassword!
${invalid_password}     Password!
${invalid_username}     tomholland

#expected_result
${login_success_text_expected}       You logged into a secure area!
${logout_success_text_expected}      You logged out of the secure area!
${login_fail_invalid_password_text_expected}       Your password is invalid!
${login_fail_invalid_username_text_expected}       Your username  is invalid!
