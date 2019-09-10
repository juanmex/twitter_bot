RSpec.describe TwitterBot::Bird do
  context "valid credentials" do
    subject(:bot) {
      TwitterBot::Bird.new({
        :consumer_key => "",
        :consumer_secret => "",
        :access_token => "",
        :access_token_secret => "",
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
      expect(e).to be_an_instance_of InvalidRequest
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
      expect(e).to be_an_instance_of InvalidRequest
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
      expect(e).to be_an_instance_of InvalidRequest
    end
  end
end
