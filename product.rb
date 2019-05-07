class Product

    def self.initialize(data)
        puts "商品情報の更新を始めます"
        puts data

        @name = data["名前"]
        @detail = data["詳細"]
        @baseprice = 1900
        @price = 2000
        @stock = 5
        @image = "./images/test.jpg"
        @image2 = "./images/test2.jpg"
        @image3 = "./images/test3.jpg"
        @image4 = "./images/test4.jpg"
        @image5 = "./images/test5.jpg"
        @creema_category1 = "アクセサリー・ジュエリー"
        @creema_category2 = "ピアス"
        @creema_category3 = "ピアス（その他）"
        @minne_category = "ピアス"
        @creema_material = "樹脂・レジン"
        @iichi_material = "プラスチック・樹脂"
        @color = "ゴールド"
        @tag1 = "レジン"
        @tag2 = "真鍮"
        @tag3 = "パレット"
        @tag4 = "メルヘン"
        @tag5 = "パステル"
        @size = "1.5cm"
    end

    def self.name
        @name
    end
  
    def self.detail
        @detail
    end

    def self.price
        @price
    end

    def self.stock
        @stock
    end

    def self.image
        @image
    end
    
    def self.image2
        @image2
    end

    def self.image3
        @image3
    end

    def self.image4
        @image4
    end

    def self.image5
        @image5
    end

    def self.creema_category1
        @creema_category1
    end

    def self.creema_category2
        @creema_category2
    end

    def self.creema_category3
        @creema_category3
    end


    def self.minne_category
        @minne_category
    end

    def self.creema_material
        @creema_material
    end

    def self.iichi_material
        @iichi_material
    end

    def self.color
        @color
    end

    def self.tag1
        @tag1
    end

    def self.tag2
        @tag2
    end

    def self.tag3
        @tag3
    end

    def self.tag4
        @tag4
    end

    def self.tag5
        @tag5
    end

    def self.size
        @size
    end
  end