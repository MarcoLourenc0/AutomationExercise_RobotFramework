*** Settings ***
Resource    ../main.robot
   

*** Keywords ***
Acessar o site automation
    Open Browser    ${geral.URL}    ${geral.Browser}    options=add_experimental_option('excludeSwitches', ['enable-logging'])
    Maximize Browser Window

Fechar navegador
    Capture Page Screenshot
    Close Browser