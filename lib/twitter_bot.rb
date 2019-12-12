require "twitter_bot/error"
require "twitter_bot/version"
require "twitter_bot/base"

require "twitter_bot/params/params"
require "twitter_bot/url/url"

require "twitter_bot/config"
require "twitter_bot/oauth"
require "twitter_bot/request"
require "twitter_bot/client"
require "twitter_bot/logger"
require "json"

module TwitterBot
  class Bird

    def initialize(credentials = {})
      @oauth_config = TwitterBot::Config.new(credentials)
    end

    def tweet(data)
      result = client.post(TwitterBot::StatusesUpdateUrl.new(data).to_s)
      parse(result)
    end
  
    def delete(id)
      result = client.post(TwitterBot::StatusesDestroyUrl.new(id).to_s)
      parse(result)
    end
  
    def show(data)
      result = client.post(TwitterBot::StatusesShowUrl.new(data).to_s)
      parse(result)
    end

    def oembed(data)
      result = client.post(TwitterBot::Url.statuses_show(data))
      parse(result)
    end

    def lookup(data)
      result = client.post(TwitterBot::Url.statuses_show(data))
      parse(result)
    end

    alias_method :statuses_update, :tweet
    alias_method :statuses_destroy, :delete
    alias_method :statuses_show, :show
    alias_method :statuses_oembed, :oembed
    alias_method :statuses_lookup, :lookup

=begin

    def retweet(id)
      result = client.post(TwitterBot::Url.statuses_retweet(id))
      parse(result)
    end


    def user(data)
      result = client.post(TwitterBot::StatusesUserTimelineUrl.new(data).to_s)
      parse(result)
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
=end
    private

    def client
      @client ||= TwitterBot::Client.new(@oauth_config)
    end

    def parse(result)
      data = JSON.parse(result)
      if data.is_a?(Hash) && data["errors"]
        raise InvalidRequest, data["errors"].map{|e| "#{e["code"]} - #{e["message"]}" }.join(",")
      end
      data
    end
  end
end
