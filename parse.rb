

class Parser

  attr_reader :filename, :stack

  def initialize(filename)
    @filename = filename
    @stack = []
  end

  def parse
      # magic, don't touch son
      file = File.open(@filename).reject {|items| items == " \n" }.map { |word| word.chomp}.each_slice(2).map {|element| element}      
      Hash[file].each { |question, answer|  @stack << Card.new(question, answer) }
      @stack
  end
end





