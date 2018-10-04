# frozen_string_literal: true
module Sessions
  class RootChannel < Web::Channel
    def subscribed
      session = ::Session::Repo.find_by_id!(params[:id])
      stream_for(session)
      RootEvent.sync_state(session).broadcast
    end
  end
end
