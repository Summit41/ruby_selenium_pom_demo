require_relative './generic'

class RegisterPage < PageObject
    FIRST_NAME = ObjectRef.new(:id, 'firstName', 'text')
    LAST_NAME = ObjectRef.new(:id, 'lastName', 'text')
    EMAIL = ObjectRef.new(:id, 'email', 'text')
    PASSWORD = ObjectRef.new(:id, 'password', 'text')
    SUBMIT = ObjectRef.new(:id, 'submit', 'button')
    CANCEL = ObjectRef.new(:id, 'cancel', 'button')

    REGISTRATION_ERROR = ObjectRef.new(:id, 'error', 'panel')
end