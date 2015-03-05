require 'test_helper'

class BasicTest < Minitest::Test

  def test_row_pattern_converter
    cell_array = GameOfLife::BoolStrategy.convert_row(".0.")

    assert_equal cell_array, [false, true, false]
  end

  def test_multiline_pattern
    cell_array = GameOfLife::BoolStrategy.convert_pattern(
      ".0.
      0.0"
      )

    assert_equal cell_array, [[false, true, false], [true, false, true]]
  end

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

  def test_three_live_neigbors
    # 3 live
    strategy = GameOfLife::BoolStrategy.new([
      [false, false, true],
      [true, true, false],
      [false, false, true]
    ])
    strategy.update
    assert strategy.cells[1][1]
  end

  def test_rule_three
    # 3 live neighbors, dead -> alive
    strategy = GameOfLife::BoolStrategy.new([
      [false, false, true],
      [true, false, false],
      [true, false, false]
    ])
    strategy.update
    assert strategy.cells[1][1]
  end

  def test_l_shape
    strategy = GameOfLife::BoolStrategy.new([
      [false, true, false],
      [false, true, true],
      [false, false, false]
    ])
    strategy.update
    assert_equal strategy.cells, [
      [false, true, true],
      [false, true, true],
      [false, false, false]
    ]
  end

end
