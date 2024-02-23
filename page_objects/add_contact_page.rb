require_relative './generic'

class AddContactPage < PageObject
    FIRST_NAME = ObjectRef.new(:id, 'firstName', 'text')
    LAST_NAME = ObjectRef.new(:id, 'lastName', 'text')
    DATE_OF_BIRTH = ObjectRef.new(:id, 'birthdate', 'text') # yyyy-mm-dd format
    EMAIL = ObjectRef.new(:id, 'email', 'text')
    PHONE = ObjectRef.new(:id, 'phone', 'text')
    STREET_ADDRESS_1 = ObjectRef.new(:id, 'street1', 'text')
    STREET_ADDRESS_2 = ObjectRef.new(:id, 'street2', 'text')
    CITY = ObjectRef.new(:id, 'city', 'text')
    STATE_OR_PROVINCE = ObjectRef.new(:id, 'stateProvince', 'text')
    POSTAL_CODE = ObjectRef.new(:id, 'postalCode', 'text')
    COUNTRY = ObjectRef.new(:id, 'country', 'text')

    SUBMIT = ObjectRef.new(:id, 'submit', 'button')
    CANCEL = ObjectRef.new(:id, 'cancel', 'button')

    LOG_OUT = ObjectRef.new(:id, 'logout', 'button')
end