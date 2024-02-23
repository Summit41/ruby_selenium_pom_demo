class PageObject
    ObjectRef = Struct.new(:locator_by, :locator_value, :type)

    def initialize(driver)
        @driver = driver
    end

    def check_library(field)
        # Ensure field is in our library
        unless defined?(field)
            puts("Unknown Object: #{field}")
            return false
        end

        true
    end


    def find_element(field)
        # Ensure field is in our library
        if !check_library(field)
            return nil
        end

        # Load Field Data
        field_definition = self.class.const_get(field)
        field_locator_by = field_definition.locator_by
        field_locator_value = field_definition.locator_value

        # Find Field
        field = @driver.find_element(field_locator_by, field_locator_value)

        return field
    end

    def fill_data(field, value)
        # Ensure field is in our library
        if !check_library(field)
            return false
        end

        # Load Field Data
        field_definition = self.class.const_get(field)
        field_locator_by = field_definition.locator_by
        field_locator_value = field_definition.locator_value
        field_type = field_definition.type

        # Find Field
        field = @driver.find_element(field_locator_by, field_locator_value)

        # Fill Field
        if field_type == 'text'
            field.send_keys(value)
        elsif field_type == 'button'
            field.click()
        else
            puts("Unsupported Field Type: #{field_type}")
        end

        return true
    end

end