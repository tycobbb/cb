# frozen_string_literal: true
module Web
  class Mailer < ActionMailer::Base
    default from: "from@example.com"
    layout "mailer"
  end
end
