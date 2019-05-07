class Config

    def self.initialize
        config = YAML.load_file("config.yaml")
        @mail = config["user"]["mail"]
        @pass = config["user"]["pass"]
    end

    def self.mail
        @mail
    end
  
    def self.pass
        @pass
    end
    
  end