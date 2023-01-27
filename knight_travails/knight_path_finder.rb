require_relative "../skeleton/lib/00_tree_node.rb"

class KnightPathFinder 
   

    def initialize(pos)
        @pos = pos 
        @root_node = PolyTreeNode.new(pos)
    end 

    def self.valid_moves(pos)
        @considered_positions = [@pos]
    end 

    def new_move_positions(pos)
    end 

    def build_move_tree 
    end 


end 