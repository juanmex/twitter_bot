module TwitterBot
  class StatusesUpdateUrl < TwitterBot::QueryParams
    def initialize(data)
      super(TwitterBot::StatusesUpdateParams, :status, "statuses/update.json", data)
    end
  end

  class StatusesDestroyUrl < TwitterBot::PathParams
    def initialize(id)
      super("statuses/destroy/:id.json",{:id => id})
    end
  end
end
