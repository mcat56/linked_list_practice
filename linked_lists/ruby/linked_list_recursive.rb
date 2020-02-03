class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def head_node
    @head
  end

  def find(data, current_node = @head)
    return current_node if current_node.data == data
    return nil if current_node.next_node == nil && current_node.data != data
    find(data, current_node.next_node)
  end

  def insert_after(existing, new)
    new_node = Node.new(new)
    prior = self.find(existing)
    following = prior.next_node
    prior.next_node = new_node
    new_node.next_node = following
  end

  def distance(node_one, node_two)
    (self.index(node_one) - self.index(node_two)).abs
  end

  def index(data)
    count = 0
    current_node = @head
    until current_node.data == data
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  def insert(index, data, current_node = @head, count = 0)
    new_node = Node.new(data)
    if count == index - 1
      new_next = current_node.next_node
      current_node.next_node = new_node
      new_node.next_node = new_next
      return
    end
    insert(index, data, current_node.next_node, count + 1) 
  end

  def include?(data, current_node = @head)
    return found = true if current_node.data == data
    return false if current_node.next_node == nil && current_node.data != data
    include?(data, current_node.next_node)
  end

  def last_node(current_node = @head)
    if current_node.next_node == nil
      return current_node
    end
    last_node(current_node.next_node)
  end

  def to_a(array = [], current_node = @head)
    if @head == nil
      return array
    elsif current_node.next_node == nil
      array<< current_node.data
      return array
    end
    array << current_node.data
    to_a(array, current_node.next_node)
  end

  def delete(data, current_node = @head)
    return @head = nil if self.count == 1
    if @head.data == data
      new_head = @head.next_node
      return @head = new_head
    elsif current_node.next_node == nil && current_node.data != data
      return
    elsif current_node.next_node.data == data
      return current_node.next_node = current_node.next_node.next_node
    end
    delete(data, current_node.next_node)
  end

  def pop(current_node = @head)
    count = self.count
    return nil if count == 0
    if count == 1
      data = @head.data
      @head = nil
      return data
    end
    if current_node.next_node.next_node == nil
      data = current_node.next_node.data
      current_node.next_node = nil
      return data
    end
    pop(current_node.next_node)
  end

  def count(current_node = @head)
    return 0 if @head == nil
    return 1 if current_node.next_node == nil
    1 + count(current_node.next_node)
  end

  def push(data, current_node = @head)
    node = Node.new(data)
    return @head = node if @head == nil
    return current_node.next_node = node if current_node.next_node == nil
    push(data, current_node.next_node)
  end

end
