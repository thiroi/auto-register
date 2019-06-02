module CommonUtils

    def self.selectTextWithId(driver, id_name, text)
        element = Selenium::WebDriver::Support::Select.new(driver.find_element(:id, id_name))
        element.select_by(:text, text) 
    end
    
    def self.selectTextWithClass(driver, class_name, text)
        element = Selenium::WebDriver::Support::Select.new(driver.find_element(:class, class_name))
        element.select_by(:text, text) 
    end
    
    def self.selectTextWithName(driver, name, text)
        element = Selenium::WebDriver::Support::Select.new(driver.find_element(:name, name))
        element.select_by(:text, text) 
    end

    def self.addImagesWithOneId(driver, id, product)
        driver.find_element(:id, id).send_keys(File.expand_path(product.image))
        sleep(2)
        if product.image2 != nil then
            driver.find_element(:id, id).send_keys(File.expand_path(product.image2))
        end
        sleep(2)
        if product.image3 != nil then
            driver.find_element(:id, id).send_keys(File.expand_path(product.image3))
        end
        sleep(2)
        if product.image4 != nil then
            driver.find_element(:id, id).send_keys(File.expand_path(product.image4))
        end
        sleep(2)
        if product.image5 != nil then
            driver.find_element(:id, id).send_keys(File.expand_path(product.image5))
        end
    end

    def self.addImagesWithOneClass(driver, className, product)
        driver.find_element(:class_name, className).send_keys(File.expand_path(product.image))
        sleep(2)
        if product.image2 != nil then
            driver.find_element(:class_name, className).send_keys(File.expand_path(product.image2))
        end
        sleep(2)
        if product.image3 != nil then
            driver.find_element(:class_name, className).send_keys(File.expand_path(product.image3))
        end
        sleep(2)
        if product.image4 != nil then
            driver.find_element(:class_name, className).send_keys(File.expand_path(product.image4))
        end
        sleep(2)
        if product.image5 != nil then
            driver.find_element(:class_name, className).send_keys(File.expand_path(product.image5))
        end
    end
end
