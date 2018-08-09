# frozen_string_literal: true
class AppMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
