class Config

    def initialize
        config = YAML.load_file("config.yaml")
        @mail = config["user"]["mail"]
        @pass = config["user"]["pass"]
    end

    def mail
        @mail
    end
  
    def pass
        @pass
    end
    
  end