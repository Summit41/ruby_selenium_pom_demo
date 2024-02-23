require_relative './generic'

class ContactDetailsPage < PageObject
    FIRST_NAME = ObjectRef.new(:id, 'firstName', 'panel')
    LAST_NAME = ObjectRef.new(:id, 'lastName', 'panel')
    DATE_OF_BIRTH = ObjectRef.new(:id, 'birthdate', 'panel') # yyyy-mm-dd format
    EMAIL = ObjectRef.new(:id, 'email', 'panel')
    PHONE = ObjectRef.new(:id, 'phone', 'panel')
    STREET_ADDRESS_1 = ObjectRef.new(:id, 'street1', 'panel')
    STREET_ADDRESS_2 = ObjectRef.new(:id, 'street2', 'panel')
    CITY = ObjectRef.new(:id, 'city', 'panel')
    STATE_OR_PROVINCE = ObjectRef.new(:id, 'stateProvince', 'panel')
    POSTAL_CODE = ObjectRef.new(:id, 'postalCode', 'panel')
    COUNTRY = ObjectRef.new(:id, 'country', 'panel')

    EDIT_CONTACT = ObjectRef.new(:id, 'edit-contact', 'button')
    DELETE_CONTACT = ObjectRef.new(:id, 'delete', 'button')
    RETURN_HOME = ObjectRef.new(:id, 'return', 'button')

    LOG_OUT = ObjectRef.new(:id, 'logout', 'button')

    def delete_contact
        self.fill_data(:DELETE_CONTACT, true)

        alert = @driver.switch_to.alert
        alert.accept
    end
end