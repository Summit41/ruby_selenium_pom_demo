require_relative './generic'

class HomePage < PageObject
    ADD_CONTACT = ObjectRef.new(:id, 'add-contact', 'button')
    CONTACT_TABLE = ObjectRef.new(:class, 'contactTable', 'table')

    LOG_OUT = ObjectRef.new(:id, 'logout', 'button')

    def find_contact(contact_email)
        contact_table = self.find_element(:CONTACT_TABLE)

        contact_email_cell = contact_table.find_element(:xpath, ".//td[text()='#{contact_email}']")
        return contact_email_cell
    end
end