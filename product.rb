class Product

    @@CREEMA_CATEGORIES = ["ピアス（フープ）", "ピアス（フック・チェーン）", "ピアス（スタッド・一粒）", "ピアス（その他）"]
    @@CREEMA_CATEGORIES.freeze

    @@CREEMA_MATERIALS = ["シルバー","粘土、陶土 （土類）","ゴールド","フェルト、羊毛","リネン、麻、綿麻","樹脂・レジン","ビーズ、スワロ","プラスティック","皮、革、レザー","紙、段ボール","木材","その他金属","ひも、ヘンプ","リボン、ボタン","花・木の実・枝葉・果実","コットン","レース、糸","布","その他","アクリル絵具、油絵具","水彩絵具、墨","クレパス、色鉛筆、ペン　","インクジェット・ほか画材","パール・コットンパール","天然石","毛糸","ガラス・ステンドグラス","真鍮","帆布・キャンバス"]
    @@CREEMA_MATERIALS.freeze
    
    @@IICHI_MATERIALS = ["石・天然石・パール","金属","粘土・磁器土","ガラス","木・竹・漆","糸・布・ウール","皮革・レザー","ビーズ・アクセサリーパーツ","プラスチック・樹脂","花・植物","紙","絵具・画材"]
    @@IICHI_MATERIALS.freeze

    @@COLORS = ["赤","ピンク","オレンジ","黄色","緑","青","パープル","ベージュ","茶","白","グレー","黒","透明","シルバー","ゴールド"]
    @@COLORS.freeze

    def initialize(data)
        @name = data["商品名称"]
        @detail = data["詳細"]
        @baseprice = data["BASE金額"]
        @price = data["金額"]
        @stock = data["在庫数"]
        @image = data["画像1"]
        @image2 = data["画像2"]
        @image3 = data["画像3"]
        @image4 = data["画像4"]
        @image5 = data["画像5"]
        @creema_category1 = "アクセサリー・ジュエリー"
        @creema_category2 = "ピアス"
        @creema_category3 = data["[Creema]カテゴリ"]
        # @creema_category3 = "ピアス（その他）"
        @minne_category = "ピアス"
        @creema_material = data["[Creema]素材"]
        # @creema_material = "樹脂・レジン"
        @iichi_material = data["[iichi]素材"]
        # @iichi_material = "プラスチック・樹脂"
        @color = data["カラー"]
        @tag1 = data["タグ1"]
        @tag2 = data["タグ2"]
        @tag3 = data["タグ3"]
        @tag4 = data["タグ4"]
        @tag5 = data["タグ5"]
        @size = data["サイズ"]
    end

    def validate
        result = []
        ValidateUtils.emptyStr("商品名称", @name, result)
        ValidateUtils.emptyStr("詳細", @detail, result)
        ValidateUtils.intWithoutZero("BASE金額", @baseprice, result)
        ValidateUtils.intWithoutZero("金額", @price, result)
        ValidateUtils.intWithoutZero("在庫数", @stock, result)
        ValidateUtils.emptyStr("画像1", @image, result)
        ValidateUtils.validSelect("[Creema]カテゴリ", @creema_category3, @@CREEMA_CATEGORIES, result)
        ValidateUtils.validSelect("[Creema]素材", @creema_material, @@CREEMA_MATERIALS, result)
        ValidateUtils.validSelect("[iichi]素材", @iichi_material, @@IICHI_MATERIALS, result)
        ValidateUtils.validSelect("カラー", @color, @@COLORS, result)
        ValidateUtils.emptyStr("サイズ", @size, result)
        result
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