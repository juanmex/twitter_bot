require 'uri'
require 'net/http'

RSpec.describe TwitterBot do

  subject(:bot) { 
    # TwitterBot::Bot.new({
    #                     :consumer_key => "IsiZffYDlPUq3Y6EiPLqMGyNL",
    #                     :consumer_secret => "rfxDqAiU1VQDdewevu1u4HZO7X1O1KeKUhaiTZYUx04NpMjV6a",
    #                     :token => "112822368-iPMcKaVnl34o8I6SB5y8hwsHteR6wZeuCyABFhqr",
    #                     :token_secret => "3kfFyxWoqk819NZx0hy9fF796p7ZxxsxK4wgTESgsN3Sr"
    #                     })
    
    url = URI("https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=freddier&count=2")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = 'OAuth oauth_consumer_key="IsiZffYDlPUq3Y6EiPLqMGyNL",oauth_token="112822368-iPMcKaVnl34o8I6SB5y8hwsHteR6wZeuCyABFhqr",oauth_signature_method="HMAC-SHA1",oauth_timestamp="1565660505",oauth_nonce="Qmz1dNGyPQ4",oauth_version="1.0",oauth_signature="0NTwZCwJ6QSLPa2PJMrV6R0dE18%3D"'    

    response = http.request(request)
    puts response.read_body
  }

  it "send a tweet" do  
    expect(bot.tweet).to eq("true")
  end

end
