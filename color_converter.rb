module ColorConverter
    def self.toCreemaId(color)
        case color
            when "白" then "color_1"
            when "黒" then "color_2"
            when "灰" then "color_3"
            when "茶" then "color_4"
            when "ベージュ" then "color_5"
            when "緑" then "color_6"
            when "青" then "color_7"
            when "紫" then "color_8"
            when "黄" then "color_9"
            when "ピンク" then "color_10"
            when "赤" then "color_11"
            when "オレンジ" then "color_12"
            when "シルバー" then "color_13"
            when "ゴールド" then "color_14"
            when "その他" then "color_15"
            else "error"
        end
    end

    def self.toIichiId(color)
        case color
            when "白" then "item_color_color_white"
            when "黒" then "item_color_color_black"
            when "灰" then "item_color_color_gray"
            when "茶" then "item_color_color_brown"
            when "ベージュ" then "item_color_color_beige"
            when "緑" then "item_color_color_green"
            when "青" then "item_color_color_blue"
            when "紫" then "item_color_color_purple"
            when "黄" then "item_color_color_yellow"
            when "ピンク" then "item_color_color_pink"
            when "赤" then "item_color_color_red"
            when "オレンジ" then "item_color_color_orange"
            when "シルバー" then "item_color_color_silver"
            when "ゴールド" then "item_color_color_gold"
            when "その他" then "item_color_color_none"
            else "error"
        end
    end
end