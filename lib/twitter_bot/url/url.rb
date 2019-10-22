module TwitterBot
  class Url
    #https://stackoverflow.com/questions/37364454/what-is-a-ruby-factory-method
    #http://rohitrox.github.io/2013/07/02/ruby-dynamic-methods/
    #http://rubyblog.pro/2016/10/factory-method-pattern-in-ruby
    include TwitterBot::UrlTweet

    URL_CONFIGS = {
      :statuses_update => {
        :klass => StatusesUpdateParams,
        :attr => :status
      }
    }

    class << self

      def base_url
        "https://api.twitter.com/1.1/"
      end

      def statuses_update(data)
        params = case data
                 when String
                   StatusesUpdateParams.new({ :status => data })
                 when Hash
                   StatusesUpdateParams.new(data)
                 else
                   raise "Status --#{data.class.name}-- not supported. Use a String or a Hash"
                 end
        "#{base_url}statuses/update.json?#{params.to_query}"
      end
  
      def statuses_destroy(id)
        "#{base_url}statuses/destroy/#{id}.json"
      end

      def user_timeline(data)
        params = case data
                 when String
                   StatusesUserTimelineParams.new({ :screen_name => data })
                 when Hash
                   StatusesUserTimelineParams.new(data)
                 else
                   raise "Status --#{data.class.name}-- not supported. Use a String or a Hash"
                 end
        "#{base_url}statuses/user_timeline.json?#{params.to_query}"
      end

      def followers_list(data)
        params = case data
                 when String
                   FollowersListParams.new({ :screen_name => data })
                 when Hash
                   FollowersListParams.new(data)
                 else
                   raise "Status --#{data.class.name}-- not supported. Use a String or a Hash"
                 end
        "#{base_url}followers/list.json?#{params.to_query}"
      end

      def statuses_retweet(id)
        "#{base_url}statuses/retweet/#{id}.json"
      end

      def statuses_show(data)
        params = case data
                 when String
                   StatusesShowParams.new({ :id => data })
                 when Hash
                   StatusesShowParams.new(data)
                 else
                   raise "Status --#{data.class.name}-- not supported. Use a String or a Hash"
                 end
        "#{base_url}followers/show.json?#{params.to_query}"
      end
    end
  end
end
