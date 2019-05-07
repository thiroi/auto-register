
class Test
    def self.do(driver, config, product)
        driver.navigate.to "https://encodable.com/uploaddemo/"
        element = driver.find_element(:css, 'input[type=file]')
        
        element.send_keys(File.expand_path('./images/test.jpg'))
        driver.find_element(:css, 'input[type=button]').click

        sleep(20)
    end
end