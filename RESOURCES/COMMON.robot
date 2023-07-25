*** Settings ***
# import libraries all libraries that will be used
Library    SeleniumLibrary

# import all resources
Variables    ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}PAGES${/}page_maya_home.py
Variables    ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}PAGES${/}page_maya_searchResult.py
Variables    ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}PAGES${/}page_mayaBank_boost.py
Variables    ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}COMPONENTS${/}component_primary_navigation.py

# # import all keywords
# Resource    ${EXECDIR}${/}RESOURCES${/}KEYWORDS${/}KEYWORDS_PAGENAME.robot

# # import input files
Variables    ${EXECDIR}${/}INPUT${/}HOME${/}input_home.py

# import config files
Resource    ${EXECDIR}${/}CONFIG${/}URLS.robot
Variables    ${EXECDIR}${/}CONFIG${/}selectors.py

*** Keywords ***
# Open SUT and wait for content to load
Open SUT
    [Arguments]    ${url}    ${browser}
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Wait Until Element is Visible    ${PAGE_MAYA_HOME['BANNER_MAIN']}

# If cookie pop-up is visible, remove
Handle Cookie Pop-up
    ${ret_val}    Run Keyword And Return Status    Element Should Be Visible    ${MISC_SELECTORS['COOKIE_BUTTON']}
    Log To Console      ${ret_val}
    IF     ${ret_val}==True
        Click Element    ${MISC_SELECTORS['COOKIE_BUTTON']}
    END


