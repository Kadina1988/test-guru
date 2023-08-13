module UsersHelper
  def badges_header
    if @badges.empty?
      t('.no_badges', name: current_user.first_name)
    else
      t('.your_badges')
    end
  end
end
