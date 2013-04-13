require_relative 'stack.rb'
require_relative 'parse.rb'
require_relative 'card.rb'

class UserInterface

  def initialize(game)
    @game = game
  end

  def game_intro
    system "clear"
    puts "Press <enter> to start"
    puts "Type 'exit' to quit"
    puts "Type 'skip' to move on to the next question"
    @input = gets.chomp
    game_play
  end

  def game_play
    while @input != "exit"
      system "clear"
      rand_question = @game.pop

      puts "Question:\n#{rand_question.question}\n\n"
      
      counter = 0
      until counter == 3 
        @input = gets.chomp
        if @input.downcase == rand_question.answer.downcase
          puts "yay, you got the right answer"
          sleep(0.5)
          break
        elsif @input.downcase == "skip"
          puts "moving on..."
          sleep(0.5)
          break
        elsif @input.downcase == "exit"
          puts "Thanks for playing. Goodbye"
          break
        elsif @input.downcase != rand_question.answer.downcase
          puts "Wrong answer son, try again\n\n"
          if counter == 2
            puts "\nDumbass, the answer is #{rand_question.answer.upcase}\n"
            sleep(1)
          end
          counter +=1
        end
      end
      
      if @game.length == 0
        puts "Done with deck, GOODBYE!" 
        break
      end
    end
  end
end

deck = Deck.new(Parser.new('flashcard_samples.txt').parse)
deck_shuffle = UserInterface.new(deck.shuffle)
deck_shuffle.game_intro


