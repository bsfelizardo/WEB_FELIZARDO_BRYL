*** Settings ***
# import libraries all libraries that will be used
Library    SeleniumLibrary

# import all resources
Variables    ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}PAGES${/}MAYA${/}page_home.py
Variables    ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}PAGES${/}MAYA${/}page_search_results.py
Variables    ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}PAGES${/}MAYA${/}page_partner_merchants.py
Variables    ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}PAGES${/}BANK${/}page_boost.py
Variables    ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}PAGES${/}BUSINESS${/}page_home.py
Variables    ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}PAGES${/}BUSINESS${/}page_register_business.py
Variables    ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}COMPONENTS${/}component_services_navigation.py
Variables    ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}COMPONENTS${/}component_maya_navigation.py
Variables    ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}COMPONENTS${/}component_maya_business_navigation.py

# # import all keywords
# Resource    ${EXECDIR}${/}RESOURCES${/}KEYWORDS${/}KEYWORDS_PAGENAME.robot

# # import input files
Variables    ${EXECDIR}${/}INPUT${/}HOME${/}input_home.py
Variables    ${EXECDIR}${/}INPUT${/}PARTNER_MERCHANTS${/}input_pm.py

# import config files
Resource    ${EXECDIR}${/}CONFIG${/}URLS.robot
Variables    ${EXECDIR}${/}CONFIG${/}selectors.py

*** Variables ***
${SELENIUM_TIMEOUT}    2m

*** Keywords ***
# Open SUT and wait for content to load
Open SUT
    [Arguments]    ${url}    ${browser}
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Wait Until Element is Visible    ${PAGE_MAYA_HOME['BANNER_MAIN']}

# If cookie pop-up is visible, remove
Handle Cookie Pop-up
    ${ret_val}    Run Keyword And Return Status    Wait Until Element Is Visible    ${MISC_SELECTORS['COOKIE_BUTTON']}
    IF     ${ret_val}==True
        Click Element    ${MISC_SELECTORS['COOKIE_BUTTON']}
    END