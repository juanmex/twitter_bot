require "twitter_bot/version"
require "twitter_bot/base"
require "twitter_bot/config"
require "twitter_bot/oauth"
require "twitter_bot/request"
require "twitter_bot/client"

module TwitterBot
  class InvalidConfig < StandardError; end
  # Your code goes here...

  class Bot

    def initialize(credentials = {})
      @oauth_config = TwitterBot::Config.new(credentials)
    end

    def tweets(username, count)
      client.get(timeline_path(username, count))
    end

    def tweet(text)
      client.post(update_status_path(text))
    end

    def retweet
    end

    def reply
    end

    def favorite
    end

    private
    def timeline_path(username, count)
      "statuses/user_timeline.json?screen_name=#{username}&count=#{count}"
    end

    def update_status_path(status)
      "statuses/update.json?status=#{status}"
    end

    def client
      @client ||= TwitterBot::Client.new(@oauth_config)
    end
  end
  
end
