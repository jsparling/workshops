Bundler.require(:default, :test)
$:.unshift File.expand_path('../../lib', __FILE__)

require 'game_of_life'


require 'minitest/autorun'
