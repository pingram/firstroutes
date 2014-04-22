class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, :presence => true
  validates :email, :uniqueness => true

  belongs_to :user
  has_many :contact_shares

  def self.contacts_for_user_id(user_id)
    Contact.select('*')
          .joins("LEFT OUTER JOIN contact_shares ON contacts.id = contact_shares.contact_id")
          .where("contacts.user_id = #{user_id} OR contact_shares.user_id = #{user_id}")
  end
end