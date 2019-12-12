module TwitterBot::Actions::Timeline
  
    def user(data)
      result = client.post(TwitterBot::StatusesUserTimelineUrl.new(data).to_s)
      parse(result)
    end
  
    
end