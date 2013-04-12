

class Card
  attr_reader :question, :answer

  def initialize(question, answer)
    @question = question
    @answer = answer
  end
end

class Parser

  attr_reader :filename

  def initialize(filename)
    @filename = filename
    # @stack = []
  end

  def parse
      # magic, don't touch
      file = File.open(@filename).reject {|items| items == " \n" }.map { |word| word.chomp}.each_slice(2).map {|element| element}      
      Hash[file].each { |question, answer|  @stack << Card.new(question, answer) }
      @stack
  end
end



file = Parser.new('flashcard_samples.txt')

p file.parse


