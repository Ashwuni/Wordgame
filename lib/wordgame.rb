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
  end  
  
  # INSERT methods and attributes, etc. here as needed.  

    
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
