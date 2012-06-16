# encoding: UTF-8
require 'yaml'

class URLInfo
  class << self
    def get(key)
      YAML.load_file("config/url.yaml")["bizinfo"][key]
    end
  end
end