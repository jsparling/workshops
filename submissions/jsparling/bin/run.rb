Bundler.require
$:.unshift File.expand_path('../../lib', __FILE__)

require 'game_of_life'

window = GameWindow.new BoolAdaptor.new GameOfLife::BoolStrategy.new
window.show
