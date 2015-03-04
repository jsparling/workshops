Bundler.require
$:.unshift File.expand_path('../../lib', __FILE__)

require 'game_of_life'

board = []
row_count = 100
col_count = 100
row_count.times do
  row = []
  col_count.times do
    row << [true, false].sample
  end
  board << row
end

window = GameWindow.new BoolAdaptor.new GameOfLife::BoolStrategy.new(board)
window.show
