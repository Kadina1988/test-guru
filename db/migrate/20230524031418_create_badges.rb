# frozen_string_literal: true

class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string  :title, null: false
      t.string  :file, null: false
      t.integer  :rule

      t.timestamps
    end
  end
end
