*** Settings ***
#Resource    ../main.robot

*** Variables ***
&{geral}
...    URL=https://automationexercise.com/
...    Browser=chrome
...    options=add_experimental_option('excludeSwitches',['enable-logging'])
