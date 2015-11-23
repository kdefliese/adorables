class ModifyVote < ActiveRecord::Migration
  def change
    change_table :votes do |t|
      change_column :votes, :value, :integer, default: 0
    end
  end
end
