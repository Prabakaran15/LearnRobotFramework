*** Settings ***
Library    SeleniumLibrary    
Suite Setup    Log    Test Suite Setup    
Suite Teardown    Log    Test Suite Teardown    
Test Setup    Log    Test Case Setup    
Test Teardown    Log    Test Case Teardown    

Default Tags    Sanity
*** Test Cases ***
MyFirstTest
    [Tags]    Smoke
    Log    Hello World..!    
    
FirstSeleniumTest
    Set Tags    Regression Test
    Open Browser    https://www.google.com/  chrome
    Set Browser Implicit Wait                5
    Maximize Browser Window
    Input Text      name=q                 Step By Step Automation
    Press Keys      name=q   ENTER       
    Sleep    3    
    Close Browser
    Log     First Selenium Test is completed

FacebookLoginTest
    Set Tags    System Test
    Remove Tags    System Test
    Log    Test Name is ${TEST NAME}
    Log    Test Tag is @{TEST TAGS}        
    [Documentation]    This is Login Test for OrangeHRM Tool
    Open Browser    ${URL}     Chrome
    Set Browser Implicit Wait    5
    Maximize Browser Window
    Input Text    name=q    orange hrm demo    
    Press Keys    name=q     ENTER
    Click Link    OrangeHRM Demo.  
    Get Title         
    LoginKW
    Click Element    id=welcome    
    Sleep    2    
    Click Link    Logout        
    Close Browser
    Log    OrangeHRM LogIn and Logout is Success      
    Log    This test case is executed by %{username} on %{os}   
    Log    Test Statis is ${PREV TEST STATUS}    
               
    
*** Variables ***
${URL}     https://www.google.com/
@{CREDENTIALS}     Admin     admin123
&{LOGINDATA}     username=Admin    password=admin123

*** Keywords ***
LoginKW
    Input Text    id=txtUsername    @{CREDENTIALS}[0] 
    Input Password    id=txtPassword    &{LOGINDATA}[password]
    Click Element    id=btnLogin    
