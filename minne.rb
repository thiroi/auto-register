module Minne
    def self.do(driver, config, product, wait)
        puts "*** Minneの登録を開始します ***"

    # LOGIN_PAGE
        driver.navigate.to "https://minne.com/signin" #URL指定
        sleep(3)
        driver.find_element(:id => "user_email").send_keys(config.mail)
        driver.find_element(:id => "user_password").send_keys(config.pass)
        
        driver.find_element(:class_name, "signinAction").click
        
        driver.navigate.to "https://minne.com/account/products/new"

    # REGISTER_PAGE
        
        # キャッシュが残ってる場合に削除
        size = driver.find_elements(:class, "productImageFormItem__delete").size

        while size > 0
            driver.find_element(:class, "productImageFormItem__delete").click
            wait.until {driver.find_elements(:class, "productImageFormItem__delete").size < size}
            size = driver.find_elements(:class, "productImageFormItem__delete").size
        end

        CommonUtils.addImagesWithOneId(driver, "js-photo-upload-button", product)

        # 名前
        driver.find_element(:id => "product_product_name").send_keys(product.name)

        # カテゴリ
        CommonUtils.selectTextWithId(driver, "product_category_id", product.minne_category)
        
        # 詳細
        driver.find_element(:id, "product_description").send_keys(product.detail)

        # ハッシュタグ
        driver.find_element(:id, "product_tag_list_input").find_element(:class, "taggle_input").send_keys(product.tag1)
        driver.find_element(:id, "product_tag_list_input").find_element(:class, "taggle_input").send_keys(:enter)
        driver.find_element(:id, "product_tag_list_input").find_element(:class, "taggle_input").send_keys(product.tag2)
        driver.find_element(:id, "product_tag_list_input").find_element(:class, "taggle_input").send_keys(:enter)
        driver.find_element(:id, "product_tag_list_input").find_element(:class, "taggle_input").send_keys(product.tag3)
        driver.find_element(:id, "product_tag_list_input").find_element(:class, "taggle_input").send_keys(:enter)
        driver.find_element(:id, "product_tag_list_input").find_element(:class, "taggle_input").send_keys(product.tag4)
        driver.find_element(:id, "product_tag_list_input").find_element(:class, "taggle_input").send_keys(:enter)
        driver.find_element(:id, "product_tag_list_input").find_element(:class, "taggle_input").send_keys(product.tag5)
        driver.find_element(:id, "product_tag_list_input").find_element(:class, "taggle_input").send_keys(:enter)

        # 公開設定
        driver.find_element(:class, "bootstrap-switch-id-product_disp_flg").click

        # 販売設定
        driver.find_element(:class, "bootstrap-switch-id-product_sale_flg").click
        
        # 価格
        wait.until {driver.find_element(:id, 'product_price').displayed?}
        driver.find_element(:id => "product_price").send_keys(product.price)

        # 在庫
        driver.find_element(:id => "product_stock_num").send_keys(product.stock)
        driver.find_element(:id => "product_unit").send_keys("個")

        # サイズ
        driver.find_element(:id => "product_size").send_keys(product.size)

        # 注意点
        driver.find_element(:id => "product_notes").send_keys("1つ1つ手作りをしているため、同じ作品でも微妙にホログラムやパーツの位置、グラデーションなどが異なります。\n一つ一つ、オンリーワンのピアスをお楽しみください\n同じデザインの別カラーや、こういったデザインが欲しいと言ったご希望にも可能な限り応えたいと思っていますので、お気軽にメッセージをお送りください◎")

        # 配送日
        driver.find_element(:id => "product_shipping_days").send_keys(7)

        # オプション
        CommonUtils.selectTextWithId(driver, "product_product_customs_attributes_0_custom_id", "イヤリングオプション")
        
        # 配送設定
        CommonUtils.selectTextWithId(driver, "product_shippings_attributes_0_shipped_by", "定形（外）郵便")
        driver.find_element(:id => "product_shippings_attributes_0_shipped_to").send_keys("全国一律")
        driver.find_element(:id => "product_shippings_attributes_0_cost").send_keys(120)
        driver.find_element(:id => "product_shippings_attributes_0_additional_cost").send_keys(0)
        
        # 登録完了処理
        driver.find_element(:class, "p-section__action").find_element(:class, "c-button--primary").click

        puts "*** Minneの登録が完了しました ***"
	end
end
