module TwitterBot::Actions::Tweet
  
  def tweet(data)
    result = client.post(TwitterBot::StatusesUpdateUrl.new(data).to_s)
    parse(result)
  end

  alias_method :statuses_update, :tweet

  def delete_tweet(id)
    result = client.post(TwitterBot::StatusesDestroyUrl.new(id).to_s)
    parse(result)
  end

  def show_tweet(data)
    result = client.post(TwitterBot::Url.statuses_show(data))
    parse(result)
  end
end
