RSpec.describe TwitterBot do

  subject(:bot) { 
    TwitterBot::Bot.new({
                        :consumer_key => "IsiZffYDlPUq3Y6EiPLqMGyNL",
                        :consumer_secret => "rfxDqAiU1VQDdewevu1u4HZO7X1O1KeKUhaiTZYUx04NpMjV6a",
                        :token => "112822368-iPMcKaVnl34o8I6SB5y8hwsHteR6wZeuCyABFhqr",
                        :token_secret => "3kfFyxWoqk819NZx0hy9fF796p7ZxxsxK4wgTESgsN3Sr"
                        })    
  }

  it "has a version number" do
    expect(TwitterBot::VERSION).not_to be nil
  end

  it "send a tweet" do  
    expect(bot.tweet).to eq("true")
  end

end
