class AddDefaultVotes < ActiveRecord::Migration
  def change
    change_table :links do |t|
      change_column :links, :votes, :integer, default: 0
    end
  end
end
