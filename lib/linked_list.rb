# frozen_string_literal: true

require_relative './node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    new_node = create_node(value)
    if head.nil?
      self.head = new_node
    else
      current_node = head
      current_node = current_node.next while current_node.next
      current_node.next = new_node
    end
  end

  def prepend(value)
    new_node = create_node(value)
    new_node.next = head
    self.head = new_node
  end

  def size
    return 0 if head.nil?

    counter = 1
    current_node = head
    while current_node.next
      counter += 1
      current_node = current_node.next
    end
    counter
  end

  def tail
    return nil if head.nil?

    current_node = head
    current_node = current_node.next while current_node.next
    current_node
  end

  def at(index)
    counter = 0
    current_node = head
    while current_node
      return current_node if index == counter

      counter += 1
      current_node = current_node.next
    end
    nil
  end

  def pop
    return nil if head.nil?

    if head.next.nil?
      self.head = nil
      return
    end

    current_node = head
    current_node = current_node.next while current_node.next.next
    current_node.next = nil
  end

  def contains?(value)
    current_node = head
    while current_node
      return true if current_node.value == value

      current_node = current_node.next
    end
    false
  end

  def find(value)
    counter = 0
    current_node = head
    while current_node
      return counter if current_node.value == value

      counter += 1
      current_node = current_node.next
    end
    nil
  end

  def to_s
    current_node = head
    while current_node
      puts " (#{current_node.value}) -> "
      current_node = current_node.next
    end
    puts ' nil '
  end

  def insert_at_index(value, index)
    counter  = 0
    new_node = create_node(value)
    current_node = head
    while counter != index
      counter += 1
      current_node = current_node.next
    end
    new_node.next = current_node.next
    current_node.next = new_node
  end

  def remove_at_index(index)
    counter = 0
    current_node = head
    while counter != index
      counter += 1
      current_node = current_node.next
    end
    current_node.next = current_node.next.next
  end

  def create_node(value = nil, next_node = nil)
    Node.new(value, next_node)
  end
end
