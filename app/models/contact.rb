class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, :presence => true
  validates :email, :uniqueness => true

  belongs_to :user
  has_many :contact_shares
end