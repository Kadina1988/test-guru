class CreateJoinTableBadgeUser < ActiveRecord::Migration[6.1]
  def change
    create_join_table :badges, :users do |t|
      t.index %i[badge_id user_id]
    end
  end
end
