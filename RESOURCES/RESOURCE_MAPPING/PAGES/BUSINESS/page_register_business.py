PAGE_BUSINESS_REGISTRATION = {
    "FORM": "css:form[action]",
    "INPUT_NAME": "css:input#registeredName",
    "INPUT_EMAIL": "css:input#email",
    "BUTTON_REGISTER": "css:button[type='submit']",
    "ERR_MSG_NAME": "//input[@id='registeredName']/parent::*/following-sibling::span[contains(text(), 'This field is required')]",
    "ERR_MSG_EMAIL": "//input[@id='email']/parent::*/following-sibling::span[contains(text(), 'valid email')]",
}