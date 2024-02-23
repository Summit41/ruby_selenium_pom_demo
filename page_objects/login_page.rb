require_relative './generic'

class LoginPage < PageObject
    USERNAME = ObjectRef.new(:id, 'email', 'text')
    PASSWORD = ObjectRef.new(:id, 'password', 'text')
    LOGIN = ObjectRef.new(:id, 'submit', 'button')
    REGISTER = ObjectRef.new(:id, 'signup', 'button')
    LOGIN_ERROR = ObjectRef.new(:id, 'error', 'panel')

end