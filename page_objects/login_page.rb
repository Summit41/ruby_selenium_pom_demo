require_relative './generic'

class LoginPage < PageObject
    EMAIL = ObjectRef.new(:id, 'email', 'text')
    PASSWORD = ObjectRef.new(:id, 'password', 'text')
    LOGIN = ObjectRef.new(:id, 'submit', 'button')
    REGISTER = ObjectRef.new(:id, 'signup', 'button')
    LOGIN_ERROR = ObjectRef.new(:id, 'error', 'panel')

    def login
        _email = "test20240223131159@email.com"
        _password = "20240223131159"

        self.fill_data(:EMAIL, _email)
        self.fill_data(:PASSWORD, _password)
        self.fill_data(:LOGIN, true)
    end
end