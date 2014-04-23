class ContactGroup < ActiveRecord::Base
  validates :name, :contact_id, :user_id, :presence => true

  belongs_to :user
  belongs_to :contact

  def self.get_contacts
    Contact.select('contacts.*')
          .joins('contact_groups')
          .where("contact_groups.name = #{name}")
  end
end
