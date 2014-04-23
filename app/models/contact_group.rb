class ContactGroup < ActiveRecord::Base
  validates :name, :presence => true
  #
  # belongs_to :user
  # belongs_to :contact
  #
  # def self.get_contacts
  #   Contact.select('contacts.*')
  #         .joins('contact_groups')
  #         .where("contact_groups. = #{name}")
  # end

  has_many :contact_group_contacts
  has_many :contacts, through: :contact_group_contacts

end
