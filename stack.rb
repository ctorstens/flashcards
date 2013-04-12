class Stack
  attr_reader :list

  def initialize(deck)  #use the array_of_card_objects to pass it in as argument
   @deck = deck
  end

  def shuffle!
    self.deck.shuffle
  end

  def get_card(shuffle)
  end
  

end



