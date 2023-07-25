*** Settings ***
Resource          ${EXECDIR}${/}RESOURCES${/}COMMON.robot
Test Setup        Run Keywords
...               Open SUT      ${BASE_URL}     ${BROWSER}  AND
...               Handle Cookie Pop-up
Test Teardown     Close Browser
Test Tags         Home  Search  Component   Primary-navigation

*** Test Cases ***
Search From Primary Navigation
    # click search
    Click Element                    ${COMPONENT_PRIMARY_NAVIGATION['ICON_SEARCH']}
    # wait for search input field and enter
    Wait Until Element Is Visible    ${COMPONENT_PRIMARY_NAVIGATION['INPUT_SEARCH']}
    Input Text                       ${COMPONENT_PRIMARY_NAVIGATION['INPUT_SEARCH']}    ${INPUT_HOME['SEARCH']}
    Click Element                    ${COMPONENT_PRIMARY_NAVIGATION['BUTTON_SEARCH']}
    # wait for results page to load
    Wait Until Element Is Visible    ${PAGE_MAYA_SEARCH_RESULTS['TEXT_RESULT_HEADER']}
    # assertions
    Element Should Be Visible        ${PAGE_MAYA_SEARCH_RESULTS['TEXT_RESULT_LIST']}
    Element Should Be Visible        ${PAGE_MAYA_SEARCH_RESULTS['TEXT_RESULT_SAMPLE']}