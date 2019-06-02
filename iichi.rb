module Iichi
    def self.do(driver, config, product, wait)
        puts "*** Iichiの登録を開始します ***"

    # LOGIN_PAGE
        driver.navigate.to "https://www.iichi.com/signin" #URL指定
        sleep(3)
        driver.find_element(:id => "signin_email").send_keys(config.mail)
        driver.find_element(:id => "signin_password").send_keys(config.pass)
        
        driver.find_element(:class, "button-submit").click
        
        driver.navigate.to "https://www.iichi.com/your/item/create"

    # # REGISTER_PAGE
        driver.find_element(:id => "item_ja_title").send_keys(product.name)
        driver.find_element(:id, "item_pictures_0_filename_input").send_keys(File.expand_path(product.image))
        driver.find_element(:id => "item_ja_description").send_keys(product.detail)
        if product.image2 != nil then
            driver.find_element(:id, "item_pictures_1_filename_input").send_keys(File.expand_path(product.image2))
        end
        if product.image3 != nil then
            driver.find_element(:id, "item_pictures_2_filename_input").send_keys(File.expand_path(product.image3))
        end
        if product.image4 != nil then
            driver.find_element(:id, "item_pictures_3_filename_input").send_keys(File.expand_path(product.image4))
        end
        if product.image5 != nil then
            driver.find_element(:id, "item_pictures_4_filename_input").send_keys(File.expand_path(product.image5))
        end

        # 時間ではなく、アップロードしたかどうかで判断すべき
        sleep(3)

        driver.find_element(:id => "item_price").send_keys(:backspace)
        driver.find_element(:id => "item_price").send_keys(product.price)
        driver.find_element(:id => "item_stock").send_keys(:backspace)
        driver.find_element(:id => "item_stock").send_keys(product.stock)

        # 発送
        CommonUtils.selectTextWithId(driver, "item_shipping_plans_0_shipping_plan_id", "定形外郵便-50g未満")
        CommonUtils.selectTextWithId(driver, "item_ja_craft_period", "7")
        driver.find_element(:id => "item_ja_about_craft_period").send_keys("発送は通常数日以内（土日祝日を除く）に対応させて頂いております。お届け日時等にご指定がある場合は、購入時に備考欄へご記入ください。")
        
        # 追加処理ボタン
        sleep(3)
        driver.find_element(:id => "button-form-toggle").click
        wait.until {driver.find_element(:id, 'item_material_material_id').displayed?}
        # 素材
        CommonUtils.selectTextWithId(driver, "item_material_material_id", product.iichi_material)
        
        # 色
        driver.execute_script("document.getElementById('" + ColorConverter.toIichiId(product.color) + "').click()")

        # 検索キーワード
        driver.find_element(:id, "item_tags_tag").send_keys(product.tag1)
        driver.find_element(:id, "item_tags_tag").send_keys(:enter)
        driver.find_element(:id, "item_tags_tag").send_keys(product.tag2)
        driver.find_element(:id, "item_tags_tag").send_keys(:enter)
        driver.find_element(:id, "item_tags_tag").send_keys(product.tag3)
        driver.find_element(:id, "item_tags_tag").send_keys(:enter)
        driver.find_element(:id, "item_tags_tag").send_keys(product.tag4)
        driver.find_element(:id, "item_tags_tag").send_keys(:enter)
        driver.find_element(:id, "item_tags_tag").send_keys(product.tag5)
        driver.find_element(:id, "item_tags_tag").send_keys(:enter)

        driver.find_element(:id => "item_ja_remark").send_keys("1つ1つ手作りをしているため、同じ作品でも微妙にホログラムやパーツの位置、グラデーションなどが異なります。\n一つ一つ、オンリーワンのピアスをお楽しみください\n\n同じデザインの別カラーや、こういったデザインが欲しいと言ったご希望にも可能な限り応えたいと思っていますので、お気軽にメッセージをお送りください◎")

        # 登録完了
        driver.find_element(:name, "submit-button").click

        # 時間ベースじゃなくすべき
        sleep(10)

        puts "*** Iichiでの登録が完了しました ***"
	end
end
