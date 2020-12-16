*** Settings ***
Library   SeleniumLibrary
Library   BuiltIn
Library   String


*** Keywords ***
Divide by Zero
  [Documentation]   Dividing by zero should return infinity
  [Arguments]   ${num1}
  Click Button    ${num1}
  Click Button    DIV
  Click Button    0
  Click Button    EQ
  Element Should Contain    //html/body/div/div[2]    Infinity

Large Number
  [Documentation]   Testing the upper limit. Extremely large numbers should be marked as infinity
  Click Button    1
  Click Button    0
  Click Button    0
  Click Button    MULT
  Click Button    MULT
  Click Button    1
  Click Button    0
  Click Button    0
  Click Button    0
  Click Button    EQ
  Element Should Contain    //html/body/div/div[2]    Infinity

Double Operator
  [Documentation]   With the exception of the multiplication, using the same operator twice should return an error
  Click Button    3
  Click Button    PLUS
  Click Button    PLUS
  Click Button    2
  Click Button    EQ
  Element Should Contain    //html/body/div/div[2]    ERR

Operator Tail
  [Documentation]   Pressing EQUAL when the last input is an operator should return an error.
  Click Button    3
  Click Button    PLUS
  Click Button    EQ
  Element Should Contain    //html/body/div/div[2]    ERR
