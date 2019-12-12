require "twitter_bot/error"
require "twitter_bot/version"
require "twitter_bot/base"

require "twitter_bot/actions/actions"
require "twitter_bot/actions/tweet"
require "twitter_bot/actions/retweet"

require "twitter_bot/params/params"

require "twitter_bot/url/url"
require "twitter_bot/url/tweets"



require "twitter_bot/config"
require "twitter_bot/oauth"
require "twitter_bot/request"
require "twitter_bot/client"
require "twitter_bot/logger"
require "json"

module TwitterBot
  class Bird
    include TwitterBot::Actions::Tweet
    include TwitterBot::Actions::Retweet

    def initialize(credentials = {})
      @oauth_config = TwitterBot::Config.new(credentials)
    end

    def timeline(data)
      result = client.get(TwitterBot::Url.user_timeline(data))
      parse(result)
    end

    def reply
    end

    def favorite
    end

    def followers(data)
      result = client.get(TwitterBot::Url.followers_list(data))
      parse(result)
    end

    private

    def client
      @client ||= TwitterBot::Client.new(@oauth_config)
    end

    private

    def parse(result)
      data = JSON.parse(result)
      if data.is_a?(Hash) && data["errors"]
        raise InvalidRequest, data["errors"].map{|e| "#{e["code"]} - #{e["message"]}" }.join(",")
      end
      data
    end
  end
end
