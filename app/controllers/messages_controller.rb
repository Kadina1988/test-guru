class MessagesController < ApplicationController

  def new;end

  def create
    message = params[:message][:body]
    user_email = current_user.email
    if message.empty?
      render :new
    else
      TestMailer.send_message(message, user_email).deliver_now
      redirect_to tests_path , notice: t('.message_to_admin')
    end
  end
end
