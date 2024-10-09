*** Settings ***
Resource    ../main.robot

*** Variables ***
&{Products}
...    Product_Title=//h2[@class='title text-center'][contains(.,'All Products')]
...    Search_Product=//input[contains(@name,'search')]
...    Button_Search=//button[@type='button'][contains(@id,'search')]
...    Title_Searched_Product=//h2[@class='title text-center'][contains(.,'Searched Products')]
...    Detail_Searched_Product=//a[contains(.,'View Product')]
...    Product_OneName=//p[contains(.,'Blue Top')][1]
...    Product_One=//a[@data-product-id='1'][contains(.,'Add to cart')][1]
...    Product_TwoName=//p[contains(.,'Men')][1]
...    Product_Two=//a[@data-product-id='2'][contains(.,'Add to cart')][1]
...    Button_ContinueShopping=//button[@class='btn btn-success close-modal btn-block'][contains(.,'Continue Shopping')]
...    Button_ViewCart=//u[contains(.,'View Cart')]
    

*** Keywords ***

Search for the product "Stylish Dress"
    Input Text       ${Products.Search_Product}    Stylish Dress
    Click Element    ${Products.Button_Search}
    Capture Page Screenshot

returns the searched product
    Execute Javascript    window.scrollTo(0,400)
    Wait Until Page Contains    Searched Products    10
    Capture Page Screenshot

Click "View Product" button
    Set Focus To Element    ${Products.Detail_Searched_Product}
    Click Element           ${Products.Detail_Searched_Product}

returns the data of "Price", "Availability", "Condition", "Brand"
    Wait Until Page Contains    Rs. 1500
    Wait Until Page Contains    Availability
    Wait Until Page Contains    Condition
    Wait Until Page Contains    Brand
    Capture Page Screenshot

Add two products to cart
    Execute Javascript    window.scrollTo(0,400)
    Sleep    3
    Capture Page Screenshot
    ${Product_One}=       Get Text     ${Products.Product_OneName}
    Set Suite Variable    ${Product_One}
    
    ${Product_Two}=       Get Text     ${Products.Product_TwoName}
    
    Set Suite Variable    ${Product_Two}

    Click Element    ${Products.Product_One}
    Sleep    3
    Wait Until Page Contains    Continue Shopping
    Click Button    ${Products.Button_ContinueShopping}

    
    Click Element    ${Products.Product_Two}
    Sleep    3
    Wait Until Page Contains    Continue Shopping
    Click Button    ${Products.Button_ContinueShopping}

Click "View Cart" button
    That is on the "Cart" screen

Verify both products are added to Cart
    Page Should Contain    Blue Top
    Page Should Contain    Men Tshirt
    Capture Page Screenshot    
