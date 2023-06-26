# frozen_string_literal: true

module Admin
  class BadgesController < Admin::BaseController
    before_action :find_badge, only: %i[show destroy]

    def index
      @badges = Badge.all
    end

    def show; end

    def new
      @badge = Badge.new
    end

    def create
      @badge = Badge.create(badge_params)

      if @badge.save
        redirect_to admin_badges_path
      else
        render :new
      end
    end

    def destroy
      @badge.destroy
      redirect_to admin_badges_path
    end

    private

    def find_badge
      @badge = Badge.find(params[:id])
    end

    def badge_params
      params.require(:badge).permit(:title, :file, :rules)
    end
  end
end
