# frozen_string_literal: true

require_relative 'lib/linked_list'
require_relative 'lib/node'

def main
  list = LinkedList.new

  list.append('dog')
  list.append('cat')
  list.append('parrot')
  list.append('hampster')
  list.append('snake')
  list.append('turtle')

  list.to_s
end

main
