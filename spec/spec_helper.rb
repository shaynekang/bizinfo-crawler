require 'simplecov'

ENV['RACK_ENV'] = 'test'
$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/../"

SimpleCov.start
