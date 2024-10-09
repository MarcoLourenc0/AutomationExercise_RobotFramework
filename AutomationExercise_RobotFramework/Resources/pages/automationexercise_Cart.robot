*** Settings ***
Resource    ../main.robot
Library    XML

*** Variables ***

&{Cart}
...    Cart_Title=//li[@class='active'][contains(.,'Shopping Cart')]
...    Product_Delete=//a[contains(@data-product-id,'1')]
...    RecommendedItems_Title=//h2[@class='title text-center'][contains(.,'recommended items')]
...    RecommendedItems_BlueTop=//p[contains(.,'Blue Top')][3]
...    RecommendedItems_AddToCart=(//a[@data-product-id='1'][contains(.,'Add to cart')])[3]
...    Recommended_ProductImage=//img[@src='get_product_picture/1']


*** Keywords ***

I have already added products to the cart
    That is on the "Products" screen
    Add two products to cart
    Capture Page Screenshot

Click 'X' button corresponding to particular product
    Click Element    ${Cart.Product_Delete}
    Sleep    3

Verify that product is removed from the cart
    Page Should Not Contain    Blue Top
    Capture Page Screenshot

Click on 'Add To Cart' on Recommended product
    Execute Javascript           window.scrollTo(0,7500)
    Set Focus To Element         ${Cart.RecommendedItems_Title}
    Sleep    6
    Page Should Contain Image    ${Cart.Recommended_ProductImage}
    Mouse Down On Image          ${Cart.Recommended_ProductImage}
    Capture Page Screenshot
    
    Click Element                ${Cart.RecommendedItems_AddToCart}
    Sleep    3
    Wait Until Page Contains     Continue Shopping
    Capture Page Screenshot

Verify that product is displayed in cart page
    Click Element                 ${Products.Button_ViewCart}
    Wait Until Page Contains      Blue Top
    Capture Page Screenshot












