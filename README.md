# Calculator Tester

# Description
This project is a Robot Framework testing suite to validate the functionalities of the basic calculator hosted at https://output.jsbin.com/hudape/1/ . 

# Prerequisites
The following software and utilities should be installed locally to use this suite : 
- Python 3.8+
- Robot Framework (For more information on the Robot Framework, please visit the official website : https://robotframework.org/ )
- SeleniumLibrary for Robot (https://robotframework.org/SeleniumLibrary/ )
- Chrome browser and the appropriate chromedriver

# Usage
Robot suites can be used from your command line utility. The general command is very simple : robot calculator_tester.robot . Many optional parameters can be used as described in the Robot documentation. For example, you can run a subset of tests by using the tag system (e.g.: robot --include regression calculator_tester.robot ; it will run only the tests tagged as regression). The framework also comes with the Rebot utility allowing you to customize your logs. 

# Limitations
- The calculator app doesn't have a button to clear the data from the input field. This testing suite uses heavily the Reload Page keyword from Selenium as a workaround.
