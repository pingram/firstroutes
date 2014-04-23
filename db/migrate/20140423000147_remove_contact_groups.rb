class RemoveContactGroups < ActiveRecord::Migration
  def change
    remove_column :contact_groups, :contact_id
    remove_column :contact_groups, :user_id
  end
end
