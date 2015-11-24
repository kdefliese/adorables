class DeleteVotesFromLinks < ActiveRecord::Migration
  def change
    change_table :links do |t|
      remove_column :links, :votes
    end
  end
end
