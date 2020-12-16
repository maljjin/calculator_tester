*** Settings ***
Library   SeleniumLibrary   timeout=10.0
Library    BuiltIn
Resource    basic.resource
Suite Setup    Open Browser    browser=chrome    url=http://jsbin.com/hudape/1/
#Suite Teardown   Close Browser

*** Variables ***
@{numbers}    0   1   2   3   4   5   6   7   8   9


*** Test Cases ***
Validate App
  [Documentation]   Quick check to make sure the calculator has loaded
  Wait Until Element is Visible   class:inputs

Validate All Numbers
  [Documentation]   Check if all numbered key are working
  [Tags]    regression
  FOR    ${i}    IN    @{numbers}
      Run Keyword    Number Validation   ${i}
  END

Basic Operations
  [Documentation]   Basic functionality checker
  [Tags]   regression
  Reload Page
  Addition Checker    1   1
  Reload Page
  Subtraction Checker   6   3
  Reload Page
  Multiplication Checker    3   3
  Reload Page
  Division Checker    4   2

Negative Numbers Operations
  [Documentation]   Additional checks with negative numbers
  [Tags]    negnumber
  Reload Page
  Addition Double Negative Checker   -2    -2
  Reload Page
  Subtraction Double Negative Checker   -4    -3
  Reload Page
  Multiplication Double Negative Checker    -3    -3
  Reload Page
  Division Double Negative Checker    -9    -3
