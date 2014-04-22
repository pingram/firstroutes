class User < ActiveRecord::Base
  validates :name, :email, :username, :presence => true
  validates :username, :uniqueness => true

  has_many :contact_shares
  has_many :contacts
end
