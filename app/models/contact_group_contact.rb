class ContactGroupContact < ActiveRecord::Base
  validates :contact_group_id, :contact_id, presence: true

  belongs_to :contact
  belongs_to :contact_group

end