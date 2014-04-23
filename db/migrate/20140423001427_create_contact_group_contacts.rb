class CreateContactGroupContacts < ActiveRecord::Migration
  def change
    create_table :contact_group_contacts do |t|
      t.integer :contact_id, :null => false
      t.integer :contact_group_id, :null => false

      t.timestamps
    end
    add_index :contact_group_contacts, :contact_id
    add_index :contact_group_contacts, :contact_group_id
  end
end
