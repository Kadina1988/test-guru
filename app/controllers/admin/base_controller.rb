# frozen_string_literal: true
class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_requied!

  private

  def admin_requied!
    redirect_to root_path, alert: 'You are not Admin' unless current_user.is_a?(Admin)
  end
end

