# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_locale

  def default_url_options
    if I18n.locale != I18n.default_locale
      { lang: I18n.locale }
    else
      {}
    end
  end

  def after_sign_in_path_for(current_user)
    if current_user.is_a?(Admin)
      admin_tests_path
    else
      root_path
    end
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
