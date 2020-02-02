class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def head_node
    @head
  end

  def find(data)
    current_node = @head
    until current_node.next_node == nil
      return current_node if current_node.data == data
      current_node = current_node.next_node
    end
    nil
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

  def insert(index, data)
    new_node = Node.new(data)
    current_node = @head
    (index - 1).times do
      current_node = current_node.next_node
    end
    new_next = current_node.next_node
    current_node.next_node = new_node
    new_node.next_node = new_next
  end



  def include?(data)
    current_node = @head
    found = false
    until current_node.next_node == nil
      return true if current_node.data == data
      current_node = current_node.next_node
    end
    found
  end

  def count
    if @head == nil
      count = 0
    else
      count = 1
      current_node = @head
      until current_node.next_node == nil
        count += 1
        current_node = current_node.next_node
      end
    end
    count
  end

  def last_node
    current_node = @head
    until current_node.next_node == nil
      current_node = current_node.next_node
    end
    return current_node
  end

  def to_a
    arr = []
    if @head == nil
      return arr
    else
      arr << @head.data
      current_node = @head
      until current_node.next_node == nil
        current_node = current_node.next_node
        arr << current_node.data
      end
    end
    arr
  end

  def delete(data)
    current_node = @head
    count = 0
    match = false
    if @head.data == data
      new_head = @head.next_node
      return @head = new_head
    end
    until current_node.data == data || current_node.next_node == nil
      count += 1
      current_node = current_node.next_node
    end
    if current_node.data == data
      match = true
    end
    return if match == false
    if self.count == 1
      @head = nil
    else
      current_node = @head
      (count - 1).times do
        current_node = current_node.next_node
      end
      if current_node.next_node.next_node != nil
        current_node.next_node = current_node.next_node.next_node
      else
        current_node.next_node = nil
      end
    end
  end

  def pop
    count = self.count
    if @head == nil
      return nil
    elsif @head.next_node == nil
      data = @head.data
      @head = nil
    else
      current_node = @head
      until current_node.next_node == nil
        current_node = current_node.next_node
      end
      data = current_node.data
      current_node = nil

      current_node = @head
      (count - 2).times do
        current_node = current_node.next_node
      end
      current_node.next_node = nil
    end
    data
  end

  def push(data)
    node = Node.new(data)
    if @head == nil
      @head = node
    else
      current_node = @head
      until current_node.next_node == nil
        current_node = current_node.next_node
      end
      current_node.next_node = node
    end
  end

end
