class WordGame

  #####################################################################  
  # You will need to add the necessary class methods, attributes, 
  # etc. in this class to make the tests in spec/wordgame_spec.rb pass.
  #####################################################################
    
  # Each game is for a single word.  If you want to 
  # play a new game, you create a new instance of WordGame.
    
  def initialize(word)
    @word = word.downcase
    # INSERT CODE HERE as needed
    @show_word = "-" * @word.size
    #guessed_letters = Array.new
    @guesses = ''
    @wrong_guesses=''
  end  
  
  # INSERT methods and attributes, etc. here as needed.  
  attr_accessor :word, :guesses, :wrong_guesses #, :show_word
  word = @word
  guesses = @guesses
  wrong_guesses=@wrong_guesses
 # show_word=@show_word
    
  def guess(letter_guess)

#       if letter_guesss.nil?
#           raise ArgumentError.new("Nil Error")
#       end
#       for k in 0..letter_guesss.length
#           letter_guess = letter_guesss[k]
          if letter_guess.nil?
              raise ArgumentError.new("Nil Error")
          elsif (letter_guess.empty? || letter_guess[/[a-zA-Z]+/]!=letter_guess)
              raise ArgumentError.new("Error")
          else
              i = 0
              word = @word.split(//)
              letter_guess = letter_guess.downcase

              #loop do
              if @wrong_guesses.size < 7
                  if @guesses.include?(letter_guess) || @wrong_guesses.include?(letter_guess)
                      return false
                  end

                  if @word.include?(letter_guess)
                      @guesses.concat(letter_guess)
                      for i in 0..word.length-1
                          for j in 0..@guesses.length-1
                              if word[i] == @guesses[j]
                                  @show_word[i] = @guesses[j] 
                              end
                          end
                      end
                  else
                      @wrong_guesses.concat(letter_guess)
                  end

              #break if @wrong_guesses.size <= 7
              end 

              if @word = @show_word
                 return true
              else @word != @show_word
                 return false
              end     
          end
  end 

  def word_with_guesses 
    return @show_word
  end 

  def check_win_or_lose
      if @wrong_guesses.size >= 7
          return :lose
      else
          if @word.eql?(@show_word)
              return :win
          else
              return :play
          end
      end
  end 

    
   # def guessed_letters(letter)
        
  # Get a word from remote "random word" service.  Do not change.
  #     
  # You can test get_random_word by running $ bundle exec irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> WordGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.new('watchout4snakes.com').start { |http|
      return http.post(uri, "").body
    }
  end
end
    

