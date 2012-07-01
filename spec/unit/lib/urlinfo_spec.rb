# encoding: UTF-8
require 'spec_helper'

require 'urlinfo'

describe URLInfo do
  describe "##get" do
    it "should return url of matched kye" do
      YAML.stub(:load_file).with("config/url.yml") do
        {
          "bizinfo" => {
            "venture" => "http://www.bizinfo.go.kr/venture"
          }
        }
      end

      URLInfo.get('venture').should == "http://www.bizinfo.go.kr/venture"
    end
  end
end

