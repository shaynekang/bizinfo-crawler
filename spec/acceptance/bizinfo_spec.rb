# encoding: UTF-8
require 'spec_helper'
require "#{File.dirname(__FILE__)}/../../runner"
require 'rack/test'

ENV['RACK_ENV'] = 'test'

require 'board'
require 'crawler'

describe 'BizInfo Crawler' do
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end

  it "should return rss bizinfo's venture page." do
    URLInfo.stub(:get).with('venture') { 'spec/fixture/venture.html' }
    get '/venture'
    last_response.body.should be_include("[대전] 대학생ㆍ청년창업 500 프로젝트사업")
  end
end