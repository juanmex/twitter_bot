require 'json'
RSpec.describe TwitterBot do

  subject(:bot) { 
     TwitterBot::Bot.new({
       :consumer_key => "IsiZffYDlPUq3Y6EiPLqMGyNL",
       :consumer_secret => "rfxDqAiU1VQDdewevu1u4HZO7X1O1KeKUhaiTZYUx04NpMjV6a",
       :access_token => "112822368-iPMcKaVnl34o8I6SB5y8hwsHteR6wZeuCyABFhqr",
       :access_token_secret => "3kfFyxWoqk819NZx0hy9fF796p7ZxxsxK4wgTESgsN3Sr"
     })
  }



  it "send a tweet" do  
    puts bot.tweet("Hola mundo! Desde twitter_bot")
    true
  end
=begin
  it "get timeline by screen name" do  
    result = JSON.parse(bot.tweets("juan_m3x", 2))
    result.each do |tweet|
      puts "Tweet >>>>> " + tweet["text"]
    end
    true
  end
=end
end
