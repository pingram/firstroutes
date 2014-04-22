class CreateContactShares < ActiveRecord::Migration
  def change
    create_table :contact_shares do |t|
      t.integer :contact_id, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
    add_index :contact_shares, :contact_id
    add_index :contact_shares, :user_id

    # do not want contacts user_id to be unique
    remove_index :contacts, :user_id
    add_index :contacts, :user_id
  end
end
