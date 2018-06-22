class Tree
    attr_accessor :children, :node_name

    def initialize(structure)
        @node_name = structure.keys[0]
        @children = structure.values[0].collect {|k,v| Tree.new({k => v})}
    end

    def visit_all(&block)
        visit &block
        children.each { |c| c.visit_all &block }
    end

    def visit(&block)
        block.call self
    end
end

tree = Tree.new({
    'grandpa' => {
        'dad' => {
            'child 1' => {},
            'child 2' => {}
        },
        'uncle' => {
            'child 3' => {},
            'child 4' => {}
        }
    }
})

puts "Visiting a node"
tree.visit { |node| puts node.node_name }
puts

puts "Visiting entire tree"
tree.visit_all { |node| puts node.node_name }