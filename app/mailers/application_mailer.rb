# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@#{Settings.domain}"
  layout "mailer"
end
