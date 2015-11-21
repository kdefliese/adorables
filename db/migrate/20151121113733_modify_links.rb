class ModifyLinks < ActiveRecord::Migration
  def change
    change_table :links do |t|
      add_column :links, :user_id, :integer
    end

    add_index :links, :user_id
  end
end
