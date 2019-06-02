module Creema
    def self.do(driver, config, product, wait)
        puts "*** Creemaの登録を開始します ***"

    # LOGIN_PAGE
        driver.navigate.to "https://www.creema.jp/user/login" #URL指定
        sleep(3)
        driver.find_element(:id => "login-email").send_keys(config.mail)
        driver.find_element(:id => "login-password").send_keys(config.pass)
        
        driver.find_element(:class, "js-user-login-button").click

        wait.until {driver.find_element(:class, 'p-my-two-box').displayed?}
        
        driver.navigate.to "https://www.creema.jp/my/item/create"

    # REGISTER_PAGE
        driver.find_element(:id => "form-item-title").send_keys(product.name)

        # 画像
        CommonUtils.addImagesWithOneClass(driver, "js-file-upload", product)

        # カテゴリ
        CommonUtils.selectTextWithId(driver, "form-item-level1-category-id", product.creema_category1)
        wait.until {driver.find_element(:id, 'form-item-level2-category-id').enabled?}
        CommonUtils.selectTextWithId(driver, "form-item-level2-category-id", product.creema_category2)
        wait.until {driver.find_element(:id, 'form-item-level3-category-id').enabled?}
        CommonUtils.selectTextWithId(driver, "form-item-level3-category-id", product.creema_category3)

        driver.find_element(:id => "form-item-description").send_keys(product.detail)
        driver.find_element(:id => "form-item-price").send_keys(product.price)

        CommonUtils.selectTextWithName(driver, "item[stock]", product.stock.to_s)
        CommonUtils.selectTextWithId(driver, "form-item-material-id", product.creema_material)
        
        driver.find_element(:id => ColorConverter.toCreemaId(product.color)).click

        driver.find_element(:class, "js-item-next").click
        
        # driver.find_element(:id => "itemDetail_stock").send_keys(product.stock)
    

    # 以下固定処理
        # オプション
        CommonUtils.selectTextWithClass(driver, "js-option-select", "ピアス金具の変更")

        # ラッピング
        driver.find_element(:id, "form-item-use-wrapping-pay").click
        wait.until {driver.find_element(:name, 'item[wrapping_cost]').enabled?}
        driver.find_element(:name, 'item[wrapping_cost]').send_keys(300)

        # 送料・配送方法
        CommonUtils.selectTextWithName(driver, "item[shipping_methods][]", "定形外郵便-50g以内（規格内）")
        
        # 郵送
        CommonUtils.selectTextWithName(driver, "item[craft_period]", "7日以内")
        driver.find_element(:id, 'form-item-craft-period-note').send_keys("発送は通常数日以内（土日祝日を除く）に対応させて頂いております。\nお届け日時等にご指定がある場合は、購入時に備考欄へご記入ください。")
        
        # 次へ
        driver.find_element(:class, "js-item-confirm").click

        # 保存 要修正
        # wait.until {driver.find_element(:class, 'js-item-form-draft').displayed?}
        # driver.find_element(:class, "js-item-form-draft").click

        # 登録完了処理

        puts "*** Creemaの登録が完了しました ***"
	end
end
