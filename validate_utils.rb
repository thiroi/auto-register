class ValidateUtils
    def self.emptyStr(name, value, result)
        if name.empty? then
            result.push(Error.new(name + "が入力されていません"))
        end
    end

    def self.intWithoutZero(name, value, result)
        intValue = value.to_i
        if intValue.to_s == value.to_s then
            if intValue == 0 then
                result.push(Error.new(name + "は0ではない数字にしてください"))
            end
        else 
            result.push(Error.new(name + "に入力された「" + value + "」は数値ではありません"))
        end
    end

    def self.bigger(name, value, compareVal, result)
        intValue = value.to_i
        if intValue < compareVal then
            result.push(Error.new(name + "は" + compareVal.to_s + "より大きい数字にしてください"))
        end
    end

    def self.validSelect(name, value, validList, result)
        select = validList.find {|item| item.eql?(value)}
        if select == nil then
            result.push(Error.new(name + "に「" + value + "」は存在しない選択肢です。以下から選択してください" + validList.join(", ")))
        end
    end

end