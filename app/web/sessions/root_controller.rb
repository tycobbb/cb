# frozen_string_literal: true
module Sessions
  class RootController < ::Web::Controller
    before_action :redirect_to_current_session, only: :new

    # actions
    def new
      session = ::Session::Repo.current

      if session
        redirect_to(session_path(session))
      else
        @session = ::Session.new
      end
    end

    def create
      @session = ::Session::Start.call

      if @session.errors.blank?
        redirect_to(session_path(@session))
      else
        @errors = @session.errors.messages
        render :new
      end
    end

    def show
      @session = ::Session::Repo.current
    end

    # filters
    private def redirect_to_new_session
      redirect_to(new_session_path)
    end

    private def redirect_to_current_session
      redirect_to(session_path(@session)) if @session
    end
  end
end
