module TwitterBot
  class Url
    attr_reader :relative_url
    attr_accessor :data

    def full_url
      base_url + @relative_url
    end

    def base_url
      "https://api.twitter.com/1.1/"
    end

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


  class QueryParams < TwitterBot::Url
    attr_accessor :default_attr
    attr_accessor :params_class

    def initialize(params_class, default_attr, relative_url, data)
      @data = data
      @relative_url = relative_url
      @default_attr = default_attr
      @params_class = params_class
    end

    def to_s
      params = case @data
      when String
        @params_class.new({ @default_attr => @data })
      when Hash
        @params_class.new(@data)
      else
        raise "Status --#{@data.class.name}-- not supported. Pleas use a String or a Hash"
      end
      "#{full_url}?#{params.to_query}"
    end
  end

  class PathParams < TwitterBot::Url
    def initialize(relative_url, data)
      @relative_url = relative_url
      @data = data
    end
    
    def to_s
      @data.each do |key , value|
        @relative_url[":#{key}"] = value
      end
      full_url
    end

  end

end
