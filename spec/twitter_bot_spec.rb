RSpec.describe TwitterBot::Bird do
  context "valid credentials" do
    
    subject(:bot) {
      TwitterBot::Bird.new({
        :consumer_key => "se8fsQ4ZE6ui7N0NpdttSPmVJ",
        :consumer_secret => "VA22hMrIYjYORlm21XxQiOblXgyvHCBv8r0VlSC1hcRS1Hn9QN",
        :access_token => "112822368-iPMcKaVnl34o8I6SB5y8hwsHteR6wZeuCyABFhqr",
        :access_token_secret => "3kfFyxWoqk819NZx0hy9fF796p7ZxxsxK4wgTESgsN3Sr",
      })
    }

    it "don't send a tweet" do
      expect { bot.tweet({ :status => @long_status }) }.to raise_error InvalidRequest
    end

    it "send a tweet" do
      tweet = bot.tweet({ :status => @status })
      expect(tweet).to be_an_instance_of Hash
      expect(tweet["text"]).to be_an_instance_of String
      expect(tweet["text"]).to eql @status
    rescue => e
      validate_exception(e)
    end

    it "delete a tweet" do
      last_tweet = bot.timeline("juan_m3x").first
      deleted_tweet = bot.delete_tweet(last_tweet["id"])
      expect(last_tweet["text"]).to eql deleted_tweet["text"]
    rescue => e
      validate_exception(e)
    end

    it "do a retweet" do
      tweets = bot.timeline("platzi")
      if tweets.is_a? Array
        tweet = tweets.first
        retweet = bot.retweet(tweet["id"])
      end
    end

    it "timeline by screen name" do
      tweets = bot.timeline("juan_m3x")
      expect(tweets).to be_an_instance_of Array
      tweet = tweets.first
      if tweet
        expect(tweet).to be_an_instance_of Hash
        expect(tweet["text"]).to be_an_instance_of String
      end
    rescue => e
      validate_exception(e)
    end

    it "followers by screen name" do
      followers = bot.followers("juan_m3x")
      expect(followers).to be_an_instance_of Hash
      expect(followers["users"]).to be_an_instance_of Array
      follower = followers["users"].first
      if follower
        expect(follower).to be_an_instance_of Hash
      end
    rescue => e
      validate_exception(e)
    end

  end
end
