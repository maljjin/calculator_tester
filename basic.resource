*** Settings ***
Library   SeleniumLibrary
Library   BuiltIn
Library   String


*** Keywords ***
Number Validation
  [Documentation]   Generic function to click on a number and validate the output
  [Arguments]   ${num}
  Click Button    ${num}
  ${result}     Execute Javascript    return expression.value
  Should Be Equal   ${result}   ${num}
  Click Button    DEL

Addition Checker
  [Documentation]   Function to validate the addition of two single digit numbers
  [Arguments]   ${num1}   ${num2}
  Click Button    ${num1}
  Click Button    PLUS
  Click Button    ${num2}
  Click Button    EQ
  ${target} =   Evaluate    str(${num1} + ${num2})
  Element Should Contain    //html/body/div/div[2]    ${target}

Addition Double Negative Checker
  [Documentation]   Function to validate the addition of two single digit negative numbers
  [Arguments]   ${num1}   ${num2}
  Click Button    MINUS
  ${num1_button} =    Get Substring   ${num1}    1
  Click Button    ${num1_button}
  Click Button    PLUS
  Click Button    MINUS
  ${num2_button} =    Get Substring   ${num2}   1
  Click Button    ${num2_button}
  Click Button    EQ
  ${target} =   Evaluate    str(${num1} + ${num2})
  Element Should Contain    //html/body/div/div[2]    ${target}

Subtraction Checker
  [Documentation]   Function to validate the subtraction of two single digit numbers
  [Arguments]   ${num1}   ${num2}
  Click Button    ${num1}
  Click Button    MINUS
  Click Button    ${num2}
  Click Button    EQ
  ${target} =   Evaluate    str(${num1} - ${num2})
  Element Should Contain    //html/body/div/div[2]    ${target}

Subtraction Double Negative Checker
  [Documentation]   Function to validate the subtraction of two single digit negative numbers. \nApp can't handle two consecutive MINUS sign, therefore we need to add the opposite of the second negative number
  [Arguments]   ${num1}   ${num2}
  Click Button    MINUS
  ${num1_button} =    Get Substring   ${num1}    1
  Click Button    ${num1_button}
  Click Button    PLUS
  ${num2_button} =    Get Substring   ${num2}   1
  Click Button    ${num2_button}
  Click Button    EQ
  ${target} =   Evaluate    str(${num1} - ${num2})
  Element Should Contain    //html/body/div/div[2]    ${target}

Multiplication Checker
  [Documentation]   Function to validate the multiplication of two single digit numbers
  [Arguments]   ${num1}   ${num2}
  Click Button    ${num1}
  Click Button    MULT
  Click Button    ${num2}
  Click Button    EQ
  ${target} =   Evaluate    str(${num1} * ${num2})
  Element Should Contain    //html/body/div/div[2]    ${target}

Multiplication Double Negative Checker
  [Documentation]   Function to validate the multiplication of two single digit negative numbers
  [Arguments]   ${num1}   ${num2}
  Click Button    MINUS
  ${num1_button} =    Get Substring   ${num1}    1
  Click Button    ${num1_button}
  Click Button    MULT
  Click Button    MINUS
  ${num2_button} =    Get Substring   ${num2}    1
  Click Button    ${num2_button}
  Click Button    EQ
  ${target} =   Evaluate    str(${num1} * ${num2})
  Element Should Contain    //html/body/div/div[2]    ${target}

Exponent Checker
  [Documentation]   Function to validate the exponentiation
  [Arguments]   ${num1}   ${num2}
  Click Button    ${num1}
  Click Button    MULT
  Click Button    MULT
  Click Button    ${num2}
  Click Button    EQ
  ${target} =   Evaluate    str(${num1} ** ${num2})
  Element Should Contain    //html/body/div/div[2]    ${target}

Division Checker
  [Documentation]   Function to validate the division of two single digit numbers
  [Arguments]   ${num1}   ${num2}
  Click Button    ${num1}
  Click Button    DIV
  Click Button    ${num2}
  Click Button    EQ
  ${target} =   Evaluate    str(int(${num1} / ${num2}))
  Element Should Contain    //html/body/div/div[2]    ${target}

Division Double Negative Checker
  [Documentation]   Function to validate the division of two single digit negative numbers
  [Arguments]   ${num1}   ${num2}
  Click Button    MINUS
  ${num1_button} =    Get Substring   ${num1}    1
  Click Button    ${num1_button}
  Click Button    DIV
  Click Button    MINUS
  ${num2_button} =    Get Substring   ${num2}    1
  Click Button    ${num2_button}
  Click Button    EQ
  ${target} =   Evaluate    str(${num1} // ${num2})
  Element Should Contain    //html/body/div/div[2]    ${target}

Generic Operator
  [Documentation]   General formula to compose complex operations
  [Arguments]   ${num}    ${action}
  Click Button    ${num}
  Click Button    ${action}

Multiplication over Addition
  [Documentation]   Multiplication should have priority over addition
  [Arguments]   ${num1}   ${num2}   ${num3}
  Click Button    ${num1}
  Click Button    PLUS
  Click Button    ${num2}
  Click Button    MULT
  Click Button    ${num3}
  Click Button    EQ
  ${target} =   Evaluate    str(${num1} + ${num2} * ${num3})
  Element Should Contain    //html/body/div/div[2]    ${target}

Division over Addition
  [Documentation]   Division should have priority over addition
  [Arguments]   ${num1}   ${num2}   ${num3}
  Click Button    ${num1}
  Click Button    PLUS
  Click Button    ${num2}
  Click Button    DIV
  Click Button    ${num3}
  Click Button    EQ
  ${target} =   Evaluate    str(${num1} + ${num2} // ${num3})
  Element Should Contain    //html/body/div/div[2]    ${target}

Exponentiation over Multiplication
  [Documentation]   Exponentiation should have priority over multiplication
  [Arguments]   ${num1}   ${num2}   ${num3}
  Click Button    ${num1}
  Click Button    MULT
  Click Button    ${num2}
  Click Button    MULT
  Click Button    MULT
  Click Button    ${num3}
  Click Button    EQ
  ${target} =   Evaluate    str(${num1} * ${num2} ** ${num3})
  Element Should Contain    //html/body/div/div[2]    ${target}

Addition and Subtraction
  [Documentation]   Addition and subtraction have the same order and should be done sequentially
  [Arguments]   ${num1}   ${num2}   ${num3}
  Click Button    ${num1}
  Click Button    PLUS
  Click Button    ${num2}
  Click Button    MINUS
  Click Button    ${num3}
  Click Button    EQ
  ${target} =   Evaluate    str(${num1} + ${num2} - ${num3})
  Element Should Contain    //html/body/div/div[2]    ${target}

Three Operations 
  [Documentation]   Validation of the sequence of trois operations (addition, multiplication, subtraction)
  [Arguments]   ${num1}   ${num2}   ${num3}   ${num4}
  Click Button    ${num1}
  Click Button    PLUS
  Click Button    ${num2}
  Click Button    MULT
  Click Button    ${num3}
  Click Button    MINUS
  Click Button    ${num4}
  Click Button    EQ
  ${target} =   Evaluate    str(${num1} + ${num2} * ${num3} - ${num4})
  Element Should Contain    //html/body/div/div[2]    ${target}
