require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_accessor :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board 
    @next_mover_mark = next_mover_mark 


    @prev_move_pos = prev_move_pos
    
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  #This method generates an array of all moves that can be made after
  #the current move.
  def children
    childrens = [] 
    @board.rows.each_with_index do |row,i|
      row.each_with_index do |ele,j| 
        if @board.rows[i][j].nil? 
          other_mark = nil 
          child_board = @board.dup 
          child_board.rows[i][j] = self.next_mover_mark
          if self.next_mover_mark == :x 
            other_mark = :o 
          else   
            other_mark = :x 
          end  
          new_previous_pos = [i,j]
          child = TicTacToeNode.new(child_board,other_mark,new_previous_pos )
          childrens << child 
        end 
      end 
    end 
    childrens 
  end
end 
