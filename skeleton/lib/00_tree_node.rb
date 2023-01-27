class PolyTreeNode

    attr_reader :value

    def initialize(value)
        @value = value
        @children = []
        @parent
    end

    def parent=(parent)
        @parent = nil
    end


end