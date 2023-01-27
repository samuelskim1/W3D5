class PolyTreeNode

    attr_reader :value, :children, :parent
    def initialize(value)
        @value = value
        @children = []
        @parent = nil 
    end

    def parent=(new_parent)
        old_parent = self.parent
        if !old_parent.nil?
            old_parent_children = old_parent.children
            old_parent_children.delete(self) 
        end
        
        if new_parent != nil
            #come back and check what we're passing into @children
           new_parent.children << self if !new_parent.children.include?(self)
        end 
           
        @parent = new_parent  

    end 

    def add_child

    end

    def remove_child

    end

end