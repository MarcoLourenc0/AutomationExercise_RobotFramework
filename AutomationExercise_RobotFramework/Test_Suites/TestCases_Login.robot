*** Settings ***
Resource    ../Resources/main.robot

Test Setup       Access the website automation
Test Teardown    Close section

*** Test Cases ***

TC01 - Register User
    Given That is on the "Signup" screen
    And Click "Signup" button
    When Filling out all the fields
    Then Make sure "ACCOUNT CREATED!" is visible
    And Verify that "Logged in as new user" is visible

TC02 - Login User with correct email and password
    Given That is on the "Signup" screen
    When Enter the "correct email address and password"
    And Click on the "login" button
    Then Verify that "Logged in as already registered user" is visible

TC03 - Login User with incorrect email and password
    Given That is on the "Signup" screen
    When Enter the "incorrect email address and password"
    And Click on the "login" button
    Then Verify error "Your email or password is incorrect!" is visible