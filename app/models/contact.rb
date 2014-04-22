class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, :presence => true
  validates :email, :uniqueness => true

  belongs_to :user
  has_many :contact_shares
  has_many :comments, :as => :commentable

  def self.contacts_for_user_id(user_id)
    Contact.select('*')
          .joins("LEFT OUTER JOIN contact_shares ON contacts.id = contact_shares.contact_id")
          .where("contacts.user_id = #{user_id} OR contact_shares.user_id = #{user_id}")
  end

  def self.favorite_contacts(user_id)
    Contact.select('contacts.*')
          .joins("LEFT OUTER JOIN contact_shares ON contacts.id = contact_shares.contact_id")
          .where("contacts.is_favorite = 't' OR contact_shares.is_favorite = 't'")
          .where("contacts.user_id = #{user_id} OR contact_shares.user_id = #{user_id}")
  end
end