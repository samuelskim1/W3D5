class PolyTreeNode

    attr_reader :value, :children, :parent
    def initialize(value)
        @value = value
        @children = []
        @parent = nil 
    end

    def parent=(par)
        unless par == nil
            @parent = par 
            par.children << self if !par.children.include?(self) 
        end 
    end 

end