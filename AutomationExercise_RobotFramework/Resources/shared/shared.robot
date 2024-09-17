*** Settings ***
Resource    ../main.robot

*** Variables ***
&{Home_Menus}
...    Home_Menu=//a[contains(.,'Home')]
...    Products_Menu=//a[contains(.,'Products')]
...    Cart_Menu=//a[contains(.,'Cart')]
...    Signup_Login_Menu=//a[contains(.,'Signup / Login')]


*** Keywords ***

That is on the "${Manu}" screen
    IF    "${Manu}" =="Home"
        Click Element                    ${Home_Menus.Home_Menu}
        Execute Javascript               window.scrollTo(0,300)
        Page Should Contain              Features Items
        Capture Page Screenshot
    
    ELSE IF  "${Manu}" =="Products"
        Click Element                    ${Home_Menus.Products_Menu}
        Wait Until Element Is Visible    ${Products.Product_Title}    10
        Capture Page Screenshot

    ELSE IF  "${Manu}" =="Cart"
        Click Element                    ${Home_Menus.Cart_Menu}
        Wait Until Element Is Visible    ${Cart.Cart_Title}    10
        Capture Page Screenshot

    ELSE IF  "${Manu}" =="Signup"        
        Click Link                       ${Home_Menus.Signup_Login_Menu}
        Wait Until Element Is Visible    ${Login.Login_Title}    10
        Capture Page Screenshot
    END        