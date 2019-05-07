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

end
