class CreateContactGroups < ActiveRecord::Migration
  def change
    create_table :contact_groups do |t|
      t.string :name, :null => false
      t.integer :contact_id, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
    add_index :contact_groups, :contact_id
    add_index :contact_groups, :user_id
  end
end
