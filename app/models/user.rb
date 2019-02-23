class User < ApplicationRecord
  validates_presence_of :username
  validates :password, :presence => true, :on => :create
  validates :password, confirmation: {case_sensitive: true}
  validates :email, presence: true, uniqueness: true

  has_secure_password
end
