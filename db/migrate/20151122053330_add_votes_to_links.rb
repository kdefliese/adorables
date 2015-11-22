class AddVotesToLinks < ActiveRecord::Migration
  def change
    change_table :links do |t|
      add_column :links, :votes, :integer
    end
  end
end
