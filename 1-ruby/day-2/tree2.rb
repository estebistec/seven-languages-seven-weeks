
class Tree
  attr_accessor :children, :node_name

  def initialize(name, child_data)
    @children = child_data.inject([]) {|children, (k,v)| children.push(Tree.new(k, v))}
    @node_name = name
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new("Ruby", {"Reia" => {"a"=> {}, "b" => {}}, "MacRuby" => {"c" => {}}} )

puts "Visiting a node"

ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts  node.node_name}

