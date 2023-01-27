require_relative "../skeleton/lib/00_tree_node.rb"

class KnightPathFinder 
   

    def initialize(pos)
        @pos = pos 
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [@pos]
    end 

    def self.valid_moves(pos)
       x = [-2, -1, 1, 2]
       y = [-2, -1, 1, 2]
    end 

    def new_move_positions(pos)
    end 

    def build_move_tree 
    end 


end 