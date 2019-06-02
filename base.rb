module Base
    def self.do(driver, config, product, wait)
      puts "*** Baseの登録を開始します ***"

    # LOGIN_PAGE
        driver.navigate.to "https://admin.thebase.in/users/login" #URL指定
        sleep(3)
        driver.find_element(:id => "loginUserMailAddress").send_keys(config.mail)
        driver.find_element(:id => "UserPassword").send_keys(config.pass)
        
        driver.find_element(:class_name, "btn--main").click
        
        driver.navigate.to "https://admin.thebase.in/shop_admin/items/add"

    # REGISTER_PAGE
        driver.find_element(:id => "itemDetail_name").send_keys(product.name)
        driver.find_element(:id => "itemDetail_detail").send_keys(product.detail)
        driver.find_element(:id => "itemDetail_price").send_keys(:backspace)
        driver.find_element(:id => "itemDetail_price").send_keys(product.price)
        driver.find_element(:id => "itemDetail_stock").send_keys(:backspace)
        driver.find_element(:id => "itemDetail_stock").send_keys(product.stock)

        CommonUtils.addImagesWithOneClass(driver, "fileInput_18uZvZi5", product)

    # 以下固定処理
      ## 公開および「一番上にする」を外す
        elements = driver.find_element(:class, 'columnButtons_cy9Vb8bj').find_elements(:class_name => "c-checkbox__label")
        elements[0].click
        elements[1].click
      ## TAGの「NEW」を選択
        driver.find_element(:class, "appInfoBody_1unNvrHG").find_element(:class, "c-defaultBtn").click
        wait.until {driver.find_element(:class, 'labelGreen').displayed?}
        elements = driver.find_elements(:class_name => "imgLarge_3ItnyRo3")[6]
        elements.find_element(:class_name => "labelWhite").click
        driver.find_element(:class, "c-modal__foot").find_element(:class, "c-submitBtn").click
      
      # 登録完了処理

      puts "*** Baseの登録が完了しました ***"
	end
end
