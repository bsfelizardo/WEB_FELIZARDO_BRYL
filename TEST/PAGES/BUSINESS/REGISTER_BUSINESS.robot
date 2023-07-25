*** Settings ***
Resource          ${EXECDIR}${/}RESOURCES${/}COMMON.robot
Test Setup        Run Keywords
...               Open SUT      ${BASE_URL}     ${BROWSER}  AND
...               Handle Cookie Pop-up
Test Teardown     Close All Browsers
Test Tags         Business  Page  Form
Suite Setup       Set Selenium Timeout      ${SELENIUM_TIMEOUT}
# Suite Setup       Set Selenium Timeout  ${SELENIUM_TIMEOUT}

*** Keywords ***
Register With Missing Information
    [Arguments]     ${comp_name}    ${email}
    Run Keywords
    ...               Open SUT      ${BASE_URL}     ${BROWSER}  AND
    ...               Handle Cookie Pop-up
    # go to maya business
    Click Element   ${COMPONENT_SERVICES_NAVIGATION['BUSINESS']}
    # wait for top navigation to load
    Wait Until Element Is Visible   ${PAGE_BUSINESS_HOME['HEADER']}
    # click sigh-up button
    Click Element   ${COMPONENT_BUSINESS_NAVIGATION['BUTTON_REGISTER']}
    # go to newly opened tab
    Switch Window   NEW
    # wait for registration field to load
    Wait Until Element Is Visible   ${PAGE_BUSINESS_REGISTRATION['FORM']}
    # input data
    IF  not $comp_name==''
        Input Text      ${PAGE_BUSINESS_REGISTRATION['INPUT_NAME']}     ${comp_name}
        Log To Console  ${comp_name}
    END
    IF  not $email==''
        Input Text      ${PAGE_BUSINESS_REGISTRATION['INPUT_EMAIL']}    ${email}
        Log To Console  ${email}
    END
    # click register button
    Click Button    ${PAGE_BUSINESS_REGISTRATION['BUTTON_REGISTER']}
    # assertions
    IF  $comp_name==''
        Element Should Be Visible   ${PAGE_BUSINESS_REGISTRATION['ERR_MSG_NAME']}
    END
    IF  $email==''
        Element Should Be Visible      ${PAGE_BUSINESS_REGISTRATION['ERR_MSG_EMAIL']}
    END
    [Teardown]  Close All Browsers

*** Test Cases ***
Invalid Registrations
    [Tags]      Negative
    [Setup]
    [Template]      Register With Missing Information
    # both missing
    ${EMPTY}    ${EMPTY}
    # company name missing
    ${EMPTY}    test@test.com
    # email missing
    test    ${EMPTY}
    [Teardown]
