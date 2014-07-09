
# Implement a linked list in Ruby

class LinkedList
  
  attr_accessor :head
  
  def initialize(head) 
    @head = head
  end

end

class Link
  
  attr_accessor :nxt, :content
  
  def initialize(content, nxt)
    @content, @nxt = content, nxt
  end
  
end


# solve the josephus problem given a linked list

def josephus(list, step)
  
  link_to_update = list.head
  current_link = list.head
  
  while true
    (step - 2).times do 
      link_to_update = link_to_update.nxt
    end
    
    step.times do 
      current_link = current_link.nxt
    end
    
    return link_to_update.content if (link_to_update == current_link && step % 2 == 0)
    return current_link.content if (link_to_update == link_to_update.nxt && step % 2 == 1)
    
    link_to_update.nxt = current_link
    link_to_update = current_link
  end
  
end

nine = Link.new('nine', nil)
eight = Link.new('eight', nine)
seven = Link.new('seven', eight)
six = Link.new('six', seven)
five = Link.new('five', six)
four = Link.new('four', five)
three = Link.new('three', four)
two = Link.new('two', three)
one = Link.new('one', two)
nine.nxt = one

list = LinkedList.new(one)


josephus(list, 2)