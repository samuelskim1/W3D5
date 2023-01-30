require_relative "../skeleton/lib/00_tree_node.rb"

class KnightPathFinder 
   

    def initialize(pos)
        @pos = pos 
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [@pos]
    end 

    def self.valid_moves(pos)
        combos = [] 
       x = [-2, -1, 1, 2]
       y = [-2, -1, 1, 2]

       x.each_with_index do |el1,i1| 
        y.each_with_index do |el2,i2| 
           combos << [el1,el2] if i2>i1 
        end 
        end 
        poss_combs = [] 
        combos.each do |position| 
            new_pos =[]
            new_pos<< (position.first + pos.first) 
            new_pos <<(position.last + pos.last)
            
           poss_combs << new_pos if new_pos.all?{|index|index>=0 && index < 8 }
              
        end 
        poss_combs 
    end 

    def new_move_positions(pos)
        all_valid = KnightPathFinder.valid_moves(pos)
        new_pos = []
        all_valid.each do |position|
            new_pos << position unless @considered_positions.include?(position)
        end

        @considered_positions.concat(new_pos)
        return new_pos
    
    end 

    def build_move_tree 
        
    end 


end 