# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'TestGuru <aziev.kadina@yandex.ru>'
  layout 'mailer'
end
