# encoding: UTF-8
require 'spec_helper'
require 'rack/test'

require "runner"

describe 'BizInfo Crawler' do
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end

  def file(filename)
    File.open(filename, "r").map{|line| line}.join
  end

  it "should response rss page of bizinfo's venture board." do
    URLInfo.stub(:get).with('venture') { 'spec/fixture/venture.html' }
    Board.any_instance.stub(:url) { "" }
    get '/venture'
    last_response.body.should == file('spec/fixture/venture.xml')
  end
end