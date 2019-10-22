module TwitterBot::Actions::Retweet
  def retweet(id)
    result = client.post(TwitterBot::Url.statuses_retweet(id))
    parse(result)
  end
end
