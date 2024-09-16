*** Settings ***
Resource    ../Resources/main.robot

Test Setup       Access the website automation
Test Teardown    Close section

*** Test Cases ***

TC01 - Search for a specific product
    Given That is on the "Products" screen
    When Search for the product "Stylish Dress"
    Then returns the searched product

TC02 - View details of a product
    Given That is on the "Products" screen
    When Search for the product "Stylish Dress"
    And Click "View Product" button
    Then returns the data of "Price", "Availability", "Condition", "Brand"

TC03 - Add Products in Cart
    Given That is on the "Products" screen
    When Add two products to cart
    And Click "View Cart" button
    Then Verify both products are added to Cart
