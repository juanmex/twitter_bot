module TwitterBot
  class Url
    @base_url = "https://api.twitter.com/1.1/"

    class << self
      def user_timeline(data)
        params = case data
                 when String
                   StatusesUserTimelineParams.new({ :screen_name => data })
                 when Hash
                   StatusesUserTimelineParams.new(data)
                 else
                   raise "Status --#{data.class.name}-- not supported. Use a String or a Hash"
                 end
        "#{@base_url}statuses/user_timeline.json?#{params.to_query}"
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
        "#{@base_url}statuses/update.json?#{params.to_query}"
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
        "#{@base_url}followers/list.json?#{params.to_query}"
      end
    end
  end
end
