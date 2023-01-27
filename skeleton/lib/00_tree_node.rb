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

    def add_child(child_node)
        children << child_node 
        child_node.parent = self 

    end

    def remove_child(child_node)
       raise "Not a child of node #{@value}" if !children.include?(child_node)
       
        children.delete(child_node)
        child_node.parent = nil 
    end

    def dfs(target_value)
        return self if self.value == target_value
        children.each do |child| 
            result = child.dfs(target_value)
            return result if !result.nil? 
        end
        return nil 
    end 

    def bfs(target_value)
        queue = [self]
        until queue.empty?
            first = queue.shift
            return first if first.value == target_value

            first.children.each do |child|
                queue << child
            end
        end 

        return nil
    end
    

    

end