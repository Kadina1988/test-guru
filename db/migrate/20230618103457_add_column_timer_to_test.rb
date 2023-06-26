# frozen_string_literal: true

class AddColumnTimerToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :timer, :integer
  end
end
