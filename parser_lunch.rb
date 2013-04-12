class Parser

  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def parse
    array_of_lines = File.readlines(@filename)
      # array_of_lines.read.split("\n")
    array_of_lines  

    cleaned_array =  array_of_lines.reject {|items| items == " \n" }.map { |word| word.chomp} #cleans up data and removes extra \n

    qa_slices = cleaned_array.each_slice(2).map {|element| element} #this returns an array containing 2 element arrays

    qa_hash = Hash[qa_slices]  #this returns a hash of questions (key) and answers (value)

    array_of_card_objects = []  #stores newly created card objects

    qa_hash.each {|question, answer| array_of_card_objects << Card.new(question, answer)} #takes each question/answer pair and uses it as arguments to create new Card objects

    p array_of_card_objects  #lets see if we actually made card objects
  end
end

class Card
  attr_reader :question, :answer

  def initialize(question, answer)
    @question = question
    @answer = answer
  end
end

class Stack
  attr_reader :list

  def initialize(cards)  #use the array_of_card_objects to pass it in as argument
   @list = cards
  end

end

file = Parser.new('flashcard_samples.txt')
file.parse

# p file.parse

# cards =  file.parse.reject {|items| items == " \n" }.map { |word| word.chomp}

# slices = cards.each_slice(2).map {|element| element} #this returns an array containing 2 element arrays

# qa_hash = Hash[slices]  #this returns a hash of questions (key) and answers (value)

# array_of_card_objects = []  #stores newly created card objects

# qa_hash.each {|question, answer| array_of_card_objects << Card.new(question, answer)} #takes each question/answer pair and uses it as arguments to create new Card objects

# p array_of_card_objects  #lets see if we actually made card objects
