# frozen_string_literal: true

module UsersHelper
  def badges_header
    if @badges.empty?
      "#{current_user.first_name} у вас нет бейджей"
    else
      'Ваши бейджи'
    end
  end
end
