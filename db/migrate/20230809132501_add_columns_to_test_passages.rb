class AddColumnsToTestPassages < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :checked_category, :boolean, default: false
    add_column :test_passages, :checked_level, :boolean, default: false
  end
end
