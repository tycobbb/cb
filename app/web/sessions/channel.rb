# frozen_string_literal: true
module Sessions
  class Channel < Web::Channel
    def subscribed
      session = ::Session::Repo.find_by_id!(params[:id])
      stream_for(session)
      Event.sync_state(session).broadcast
    end
  end
end
