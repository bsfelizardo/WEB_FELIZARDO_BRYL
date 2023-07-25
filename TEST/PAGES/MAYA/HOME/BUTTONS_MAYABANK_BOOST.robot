*** Settings ***
Resource          ${EXECDIR}${/}RESOURCES${/}COMMON.robot
Test Setup        Run Keywords
...               Open SUT      ${BASE_URL}     ${BROWSER}  AND
...               Handle Cookie Pop-up
Test Teardown     Close Browser
Test Tags         Home  Page  Button

*** Test Cases ***
Boost Your Interest Now Button
    # click button
    Click Link    ${PAGE_MAYA_HOME['BUTTON_BOOST_INTEREST']}

    # assert correct link after redirection
    Wait Until Element Is Visible    ${PAGE_MAYABANK_BOOST['LOGO_MAYABANK']}
    Element Should Be Visible    ${PAGE_MAYABANK_BOOST['BANNER_MAIN']}
    Element Should Be Visible    ${PAGE_MAYABANK_BOOST['BANNER_MECHANICS']}
