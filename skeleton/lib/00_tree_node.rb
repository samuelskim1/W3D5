class PolyTreeNode

    attr_reader :value, :children, :parent
    def initialize(value)
        @value = value
        @children = []
        @parent = nil 
    end

    def parent=(new_parent)
        if new_parent != nil
            old_parent = self.parent
            old_parent_children = old_parent.children
            old_parent_children.delete(self) 
            #come back and check what we're passing into @children
           new_parent.children << self if !new_parent.children.include?(self) 
           @parent = new_parent 
        else 
             @parent = nil 
        end 
       
    end 

    def add_child

    end

    def remove_child

    end

end