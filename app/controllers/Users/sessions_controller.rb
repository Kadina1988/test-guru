# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = t('.welcome', name: current_user.first_name)
  end

end
