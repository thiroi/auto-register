require 'selenium-webdriver'
require './enquete'
require 'yaml'
require './config'
require './product'
require './base'
require './creema'
require './minne'
require './iichi'
require './color_converter'
require './common_utils'
require 'csv'
require 'fileutils'
require 'date'

Config.initialize

driver = Selenium::WebDriver.for :chrome #使用するブラウザを選択

Enquete.hello

Enquete.say("test dayo")


wait = Selenium::WebDriver::Wait.new(:timeout => 100) 

csvFile = File.expand_path("./product/product.csv")
nowStr = Time.now.strftime("%Y%m%d%H%M%S")
csv_data = CSV.read(csvFile, headers: true)
csv_data.each do |data|
    Product.initialize(data)
    # Base.do(driver, Config, Product, wait)
    # Creema.do(driver, Config, Product, wait)
    # Minne.do(driver, Config, Product, wait)
    # Iichi.do(driver, Config, Product, wait) 
end

File.rename(csvFile, csvFile + "_" + nowStr)
sleep(100)

driver.quit #ブラウザを閉じて終了

