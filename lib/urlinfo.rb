# encoding: UTF-8

class URLInfo
  class << self
    def get(key)
      YAML.load_file("config/url.yaml")["bizinfo"][key]
    end
  end
end