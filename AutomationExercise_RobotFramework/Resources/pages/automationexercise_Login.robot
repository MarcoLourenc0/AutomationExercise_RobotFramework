*** Settings ***
Resource    ../main.robot

*** Variables ***
&{Login}
...    Login_Title=//h2[contains(.,'Login to your account')]
...    Login_Email=//input[contains(@data-qa,'login-email')]
...    Login_Password=//input[contains(@data-qa,'login-password')]
...    Button_Login=//button[@type='submit'][contains(.,'Login')]
...    NewUser_Name=//input[contains(@data-qa,'signup-name')]
...    NewUser_Email=//input[contains(@data-qa,'signup-email')]
...    Button_Signup=//button[@type='submit'][contains(.,'Signup')]
...    Delete_Menu=//a[contains(.,'Delete Account')]

&{Register}
...    Register_Title=//b[contains(.,'Enter Account Information')]
...    Option_Title=//input[@value='Mr']
...    Fild_Name=//input[@data-qa='name']
...    Fild_Email=//input[@data-qa='email']
...    Fild_Password=//input[@data-qa='password']
...    Option_Day=//option[@value='1'][contains(.,'1')]
...    Option_Month=//option[@value='12'][contains(.,'December')]
...    Option_Year=//option[@value='2000'][contains(.,'2000')]
...    Fild_FirstName=//input[@data-qa='first_name']
...    Fild_LastName=//input[@data-qa='last_name']
...    Fild_Company=//input[@data-qa='company']
...    Fild_Address=//input[@data-qa='address']
...    Option_Country=//option[@value='United States'][contains(.,'United States')]
...    Fild_State=//input[@data-qa='state']
...    Fild_City=//input[@data-qa='city']
...    Fild_Zipcode=//input[@data-qa='zipcode']
...    Fild_MobileNumber=//input[@data-qa='mobile_number']
...    Button_CreateAccount=//button[@type='submit'][contains(.,'Create Account')]
...    Button_Continue=//a[contains(@data-qa,'continue-button')]



*** Keywords ***

Click "Signup" button
    Input Text       ${Login.NewUser_Name}     QA Marco
    Input Text       ${Login.NewUser_Email}    Tester_Marco@gmail.com
    Capture Page Screenshot
    Click Button     ${Login.Button_Signup}

Filling out all the fields
    Wait Until Element Is Visible    ${Register.Register_Title}
    Click Element                    ${Register.Option_Title}
    Input Password                   ${Register.Fild_Password}        QA00799
    Click Element                    ${Register.Option_Day}    
    Click Element                    ${Register.Option_Month}    
    Click Element                    ${Register.Option_Year}
    Capture Page Screenshot
    Input Text                       ${Register.Fild_FirstName}       Marco 
    Input Text                       ${Register.Fild_LastName}        Lourenco
    Input Text                       ${Register.Fild_Company}         TECHPRIME
    Input Text                       ${Register.Fild_Address}         Washington Avenue 
    Click Element                    ${Register.Option_Country}        
    Input Text                       ${Register.Fild_State}           Nevada
    Input Text                       ${Register.Fild_City}            Las Vegas
    Capture Page Screenshot
    Input Text                       ${Register.Fild_Zipcode}         89108  
    Input Text                       ${Register.Fild_MobileNumber}    5541988541277
    Set Focus To Element             ${Register.Button_CreateAccount}
    Click Button                     ${Register.Button_CreateAccount} 

Make sure "ACCOUNT CREATED!" is visible
    Wait Until Page Contains    Account Created!    
    Capture Page Screenshot

Verify that "${Logged_In}" is visible
    IF  "${Logged_In}" =="Logged in as new user"
        Click Link                   ${Register.Button_Continue}
        Wait Until Page Contains     Logged in as QA Marco
        Capture Page Screenshot
        Click Element                ${Login.Delete_Menu}
        Wait Until Page Contains     Account Deleted!
        Capture Page Screenshot
        Click Link                   ${Register.Button_Continue}    

    ELSE IF  "${Logged_In}" =="Logged in as already registered user"
        Wait Until Page Contains     Logged in as QA Marco 01
        Capture Page Screenshot
    END

Enter the "${Email_Account}"
    IF  "${Email_Account}" =="correct email address and password"
        Input Text       ${Login.Login_Email}       Tester_Marco01@gmail.com
        Input Text       ${Login.Login_Password}    QA00788    
        Capture Page Screenshot
    
    ELSE IF    "${Email_Account}" =="incorrect email address and password"        
        Input Text       ${Login.Login_Email}       Tester_M4rco9@gmail.com
        Input Text       ${Login.Login_Password}    QA00M852    
        Capture Page Screenshot
    END    

Click on the "login" button
    Click Element               ${Login.Button_Login}

Verify error "Your email or password is incorrect!" is visible
    Wait Until Page Contains    Your email or password is incorrect!
    Capture Page Screenshot

