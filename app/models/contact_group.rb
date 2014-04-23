class ContactGroup < ActiveRecord::Base
  validates :name, :user_id, :presence => true

  belongs_to :user
  has_many :contact_group_contacts
  has_many :contacts, through: :contact_group_contacts
end
