class Deck
  attr_reader :deck

  def initialize(deck)  #use the array_of_card_objects to pass it in as argument
   @deck = deck
  end

  def shuffle
    @deck.sort_by{rand}
  end


end



