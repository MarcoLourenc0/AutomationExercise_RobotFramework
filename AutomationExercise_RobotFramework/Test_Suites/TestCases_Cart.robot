*** Settings ***
Resource    ../Resources/main.robot

Test Setup       Access the website automation
Test Teardown    Close section


*** Test Cases ***

TC01 - Remove Products From Cart
    Given I have already added products to the cart
    And That is on the "Cart" screen    
    When Click 'X' button corresponding to particular product
    Then Verify that product is removed from the cart

TC02 - Add to cart from Recommended items
    Given That is on the "Home" screen
    When Click on 'Add To Cart' on Recommended product
    Then Verify that product is displayed in cart page