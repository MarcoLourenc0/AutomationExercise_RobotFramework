*** Settings ***
Resource    ../main.robot

*** Variables ***
&{Home}
...    Home_Title=//h2[@class='title text-center'][contains(.,'Features Items')]
...    Subscription=//input[@type='email'][contains(@id,'susbscribe_email')]
...    Button_Subscription=//button[contains(@id,'subscribe')]
  

*** Keywords ***

Typing the email address in the entry and clicking the arrow button
    Set Focus To Element    ${Home.Subscription}
    Input Text              ${Home.Subscription}    Tester@gmail.com
    Click Button            ${Home.Button_Subscription}
    Capture Page Screenshot

It returns the success message "You have been successfully registered!"
    Wait Until Page Contains    You have been successfully subscribed!   
    Capture Page Screenshot


