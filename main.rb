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
require './validate_utils'
require './error'

config = Config.new()

driver = Selenium::WebDriver.for :chrome #使用するブラウザを選択

wait = Selenium::WebDriver::Wait.new(:timeout => 100) 

csvFile = File.expand_path("./product/product.csv")
nowStr = Time.now.strftime("%Y%m%d%H%M%S")
csv_data = CSV.read(csvFile, headers: true)

# エラーチェックを先に全て行う
errorCount = 0
lineCount = 1

csv_data.each do |data|
    product = Product.new(data)
    validResult = product.validate()
    if validResult.size > 0 then
        puts "*** " + lineCount.to_s + "品目でエラーが発生" + " ***"
        puts validResult.map {|item| item.message }.join("¥n")
        errorCount = errorCount + 1
    end
end

if errorCount > 0 then
    puts "*** [処理終了]エラーが存在したため、登録を行いません ***"
    exit
end

# エラーばなければ登録開始
puts "登録を開始します"
csv_data.each do |data|
    product = Product.new(data)
    # Base.do(driver, config, product, wait)
    # Creema.do(driver, config, product, wait)
    # Minne.do(driver, config, product, wait)
    # Iichi.do(driver, config, product, wait) 
end

#     File.rename(csvFile, csvFile + "_" + nowStr)

driver.quit #ブラウザを閉じて終了

