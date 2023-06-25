class UsersController < ApplicationController

  def list_badges
    @badges = current_user.badges
  end
end
