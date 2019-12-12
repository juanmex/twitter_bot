module TwitterBot
  class Params < TwitterBot::Base
    def to_query
      result = {}
      attributes.each do |attr|
        result[attr] = send(attr) if send(attr)
      end
      result.map { |key, value| "#{key}=#{value}" }.join("&")
    end
  end

  class StatusesUpdateParams < TwitterBot::Params
    attr_accessor :status,
                  :in_reply_to_status_id,
                  :auto_populate_reply_metadata,
                  :exclude_reply_user_ids,
                  :attachment_url,
                  :media_ids,
                  :possibly_sensitive,
                  :lat,
                  :long,
                  :place_id,
                  :display_coordinates,
                  :trim_user,
                  :enable_dmcommands,
                  :fail_dmcommands,
                  :card_uri
  end

  class StatusesShowParams < TwitterBot::Params
    attr_accessor :id,
                  :trim_user,
                  :include_my_retweet,
                  :include_entities,
                  :include_ext_alt_text,
                  :include_card_uri
                 
  end

  class StatusesUserTimelineParams < TwitterBot::Params
    attr_accessor :user_id,
                  :screen_name,
                  :since_id,
                  :count,
                  :max_id,
                  :trim_user,
                  :exclude_replies,
                  :include_rts
  end

  class FollowersListParams < TwitterBot::Params
    attr_accessor :user_id,
                  :screen_name,
                  :cursor,
                  :count,
                  :skip_status,
                  :include_user_entities
  end

  
end
