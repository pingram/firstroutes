class CreateContactGroupUser < ActiveRecord::Migration
  def change
    add_column :contact_groups, :user_id, :integer
  end
end
