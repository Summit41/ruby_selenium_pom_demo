require_relative './generic'

class HomePage < PageObject
    ADD_CONTACT = ObjectRef.new(:id, 'add-contact', 'button')
    CONTACT_TABLE = ObjectRef.new(:class, 'contactTable', 'table')

    LOGOUT = ObjectRef.new(:id, 'logout', 'button')
end