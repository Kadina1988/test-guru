# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    def create
      super
      flash[:notice] = t('.welcome', name: current_user.first_name)
    end
  end
end
