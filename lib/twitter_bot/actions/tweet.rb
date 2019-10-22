module TwitterBot::Actions::Tweet
  def tweet(data)
    result = client.post(TwitterBot::Url.statuses_update(data))
    parse(result)
  end

  alias_method :statuses_update, :tweet

  def delete_tweet(id)
    result = client.post(TwitterBot::Url.statuses_destroy(id))
    parse(result)
  end

  def show_tweet(data)
    result = client.post(TwitterBot::Url.statuses_show(data))
    parse(result)
  end
end
