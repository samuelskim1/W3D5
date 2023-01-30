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
           combos << [el1,el2] if el1.abs != el2.abs
           
        
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
        queue = [@root_node]
        until queue.empty? 
            element = queue.shift  
            children =  self.new_move_positions(element.value)
            child_knights = children.map{|child|PolyTreeNode.new(child)}
            child_knights.each do |knight| 
                    knight.parent = element
                     element.add_child(knight)
                     queue << knight 
            end  
        end
    end 

    def find_path(end_pos)
        self.build_move_tree

        queue = [@root_node]
        until queue.empty?
            element = queue.shift
            return self.trace_path_back(element) if element.value == end_pos
            
            element.children.each do |child|
                queue << child
            end


        end

        return "Not a valid position"

    end

    def trace_path_back(node)
        path = []

        until path[0] == @root_node.value
            path.unshift(node.value)
            node = node.parent
        end

        path
    end


end 