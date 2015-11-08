class ChangeLevelFromUsers < ActiveRecord::Migration
  def change
    change_column :users, :level, :integer, :default => 8
  end
end
