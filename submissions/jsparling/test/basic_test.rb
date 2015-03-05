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

    assert_equal [[false, true, false], [true, false, true]], cell_array
  end

  def test_rule_one

    # no live neighbors
    strategy = GameOfLife::BoolStrategy.new([
      [false, false, false],
      [false, true, false],
      [false, false, false]
    ])
    strategy.update
    assert_equal [
      [false, false, false],
      [false, false, false],
      [false, false, false]
    ], strategy.cells
  end

  def test_rule_one_one_live_neighbor

    # one live neighbor
    strategy = GameOfLife::BoolStrategy.new([
      [false, false, false],
      [false, true, true],
      [false, false, false]
    ])
    strategy.update

    assert_equal [
      [false, false, false],
      [false, false, false],
      [false, false, false]
    ], strategy.cells
  end

  def test_rule_two

    # 4 live neighbors
    strategy = GameOfLife::BoolStrategy.new([
      [true, true, true],
      [true, true, false],
      [false, false, false]
    ])
    strategy.update
    assert_equal [
      [true, false, true],
      [true, false, true],
      [false, false, false]
    ], strategy.cells
  end

  def test_three_live_neigbors

    # 3 live
    strategy = GameOfLife::BoolStrategy.new([
      [false, false, true],
      [true, true, false],
      [false, false, true]
    ])
    strategy.update
    assert_equal [
      [false, true, false],
      [false, true, true],
      [false, true, false]
    ], strategy.cells
  end

  def test_rule_three

    # 3 live neighbors, dead -> alive
    strategy = GameOfLife::BoolStrategy.new([
      [false, false, true],
      [true, false, false],
      [true, false, false]
    ])
    strategy.update
    assert_equal [
      [false, false, false],
      [false, true, false],
      [false, false, false]
    ], strategy.cells
  end

  def test_l_shape
    strategy = GameOfLife::BoolStrategy.new([
      [false, true, false],
      [false, true, true],
      [false, false, false]
    ])
    strategy.update
    assert_equal  [
      [false, true, true],
      [false, true, true],
      [false, false, false]
    ], strategy.cells
  end

  def test_count_live_neighbors
    strategy = GameOfLife::BoolStrategy.new([
      [false, false, false],
      [false, true, true],
      [false, false, false]
    ])

    assert_equal 1, strategy.count_live_neighbors(0,0)
    assert_equal 2, strategy.count_live_neighbors(0,1)
    assert_equal 2, strategy.count_live_neighbors(0,2)
    assert_equal 1, strategy.count_live_neighbors(1,0)
    assert_equal 1, strategy.count_live_neighbors(1,1)
    assert_equal 1, strategy.count_live_neighbors(1,2)
    assert_equal 1, strategy.count_live_neighbors(2,0)
    assert_equal 2, strategy.count_live_neighbors(2,1)
    assert_equal 2, strategy.count_live_neighbors(2,2)
  end

end
