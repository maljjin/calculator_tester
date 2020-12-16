*** Settings ***
Library   SeleniumLibrary   timeout=10.0
Library    BuiltIn
Resource    basic.resource
resource    error_cases.resource
Suite Setup    Open Browser    browser=chrome    url=http://jsbin.com/hudape/1/
#Suite Teardown   Close Browser

*** Variables ***
@{numbers}    0   1   2   3   4   5   6   7   8   9


*** Test Cases ***
Validate App
  [Documentation]   Quick check to make sure the calculator has loaded
  [Tags]    regression    negnumber    error    order
  Wait Until Element is Visible   class:inputs

Validate All Numbers
  [Documentation]   Check if all numbered key are working. Also doubles as a DEL button validation.
  [Tags]    regression
  FOR    ${i}    IN    @{numbers}
      Run Keyword    Number Validation   ${i}
  END

Basic Operations
  [Documentation]   Basic functionality checker for all operators
  [Tags]   regression
  Reload Page
  Addition Checker    1   1
  Reload Page
  Subtraction Checker   6   3
  Reload Page
  Multiplication Checker    3   3
  Reload Page
  Division Checker    4   2
  Reload Page
  Exponent Checker    2   3

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

Error Validation
  [Documentation]   Testing a few extreme and error generating cases to confirm behavior
  [Tags]    error
  Reload Page
  Divide by Zero    6
  Reload Page
  Large Number
  Reload Page
  Double Operator
  Reload Page
  Operator Tail

Order of Operations Validation
  [Documentation]   Testing if the standard order of operation rules are followed
  [Tags]    order
  Reload Page
  Addition and Subtraction    3   6   2
  Reload Page
  Multiplication over Addition    2   4   5
  Reload Page
  Division over Addition    5   4   2
  Reload Page
  Exponentiation over Multiplication    2   3   3
  Reload Page
  Three Operations   2   3   4   2
