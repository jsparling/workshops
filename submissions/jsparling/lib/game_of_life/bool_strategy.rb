module GameOfLife
  class BoolStrategy < GoLBools

    def initialize(cells)
      @cells = cells
    end

    # executes each tick
    def update
      cells.each_with_index do |row, row_index|
        row.each_with_index do |cell, cell_index|
          count_live_neighbors(row_index, cell_index)
        end
      end
    end

    def count_live_neighbors(row_index, cell_index)


      neighbors.select { |value| value }.length
    end

    def neighbors
      local_neighbors = []
      local_neighbors << @cells[row_index-1][cell_index-1]                                 1]
      local_neighbors << @cells[row_index-1][cell_index]
      local_neighbors << @cells[row_index-1][cell_index+1]

      local_neighbors << @cells[row_index][cell_index-1]
      local_neighbors << @cells[row_index][cell_index+1]

      local_neighbors << @cells[row_index+1][cell_index-1]                                 1]
      local_neighbors << @cells[row_index+1][cell_index]
      local_neighbors << @cells[row_index+1][cell_index+1]
      local_neighbors
    end

  end
end
