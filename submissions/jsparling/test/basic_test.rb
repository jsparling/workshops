require 'test_helper'

class BasicTest < Minitest::Test

  def test_rule_one
    # no live neighbors
    strategy = GameOfLife::BoolStrategy.new([
      [false, false, false],
      [false, true, false],
      [false, false, false]
    ])
    strategy.update
    assert !strategy.cells[1][1]

    # one live neighbor
    strategy = GameOfLife::BoolStrategy.new([
      [false, false, false],
      [false, true, true],
      [false, false, false]
    ])
    strategy.update
    assert !strategy.cells[1][1]
  end

  def test_rule_two
    # 4 live neighbors
    strategy = GameOfLife::BoolStrategy.new([
      [true, true, true],
      [true, true, false],
      [false, false, false]
    ])
    strategy.update
    assert !strategy.cells[1][1]
  end

  def test_basic
    assert true
  end

end
