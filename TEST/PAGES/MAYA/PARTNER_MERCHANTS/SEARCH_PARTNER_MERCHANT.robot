*** Settings ***
Resource          ${EXECDIR}${/}RESOURCES${/}COMMON.robot
Test Setup        Run Keywords
...               Open SUT      ${BASE_URL}     ${BROWSER}  AND
...               Handle Cookie Pop-up
Test Teardown     Close Browser
Test Tags         Partner-Merchant  Page  Search
# Suite Setup       Set Selenium Timeout  ${SELENIUM_TIMEOUT}

*** Test Cases ***
Search Partner Merchants
    # click partner merchants on 2nd-ary navigation bar
    Click Element   ${COMPONENT_MAYA_NAVIGATION['PM']}
    # wait for partner merchants page to load
    Wait Until Element Is Visible   ${PAGE_MAYA_PM['CONTENT_LIST_PM']}
    # click travel on the sidebar
    Click Element   ${PAGE_MAYA_PM['BUTTON_PM_CATEGORY']}
    # wait for travel partner merchants page to load (diff page)
    Wait Until Element Is Visible   ${PAGE_MAYA_PM['CONTENT_LIST_PM']}
    # search for "klook"
    Input Text  ${PAGE_MAYA_PM['INPUT_SEARCH_PM']}  ${INPUT_PM['SEARCH']}
    # assertions
    Element Should Be Visible   ${PAGE_MAYA_PM['SPECIFIC_SEARCH_RESULT']}
    ${res_cnt}   Get Element Count   ${PAGE_MAYA_PM['LIST_SEARCH_RESULT']}
    Should Be Equal As Integers     ${res_cnt}   1