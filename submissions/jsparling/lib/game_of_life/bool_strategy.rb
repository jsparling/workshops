module GameOfLife
  class BoolStrategy < GoLBools

    def initialize(cells)
      @cells = cells
    end


    # executes each tick
    def update
      new_cells = []
      cells.each_with_index do |row, row_index|
        new_row = []
        row.each_with_index do |cell, cell_index|
          count_live_neighbors(row_index, cell_index)
          new_row << true
        end
        new_cells << new_row
      end

      self.cells = new_cells
    end

    def count_live_neighbors(row_index, cell_index)


      neighbors.select { |value| value }.length
    end

    def neighbors(row, col)
      n = []

      prev_row = [row-1, 0].max
      next_row = [row+1, cells.length].min
      prev_row = [col-1, 0].max
      next_row = [col+1, cells.first.length].min

      n << [prev_row, prev_col]
      n << [prev_row, col]
      n << [prev_row, next_col]
      n << [row, prev_col]
      n << [row, next_col]
      n << [next_row, prev_col]
      n << [next_row, col]
      n << [next_row, next_col]

      n.uniq!
      n.map do |row, col|
        cells[row][col]
      end
    end

  end
end
