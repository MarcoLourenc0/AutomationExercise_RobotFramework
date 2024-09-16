*** Settings ***
Resource    ../Resources/main.robot

Test Setup       Access the website automation
Test Teardown    Close section

*** Test Cases ***

TC01 - Verify Subscription in home page
    Given That is on the "Home" screen
    When Typing the email address in the entry and clicking the arrow button
    Then It returns the success message "You have been successfully registered!"