# frozen_string_literal: true

class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :file, null: false
      t.string :rules

      t.timestamps
    end
  end
end
