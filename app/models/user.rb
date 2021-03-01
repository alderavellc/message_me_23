class User < ApplicationRecord
  has_many :messages
  validates :email, presence:true,
			  length: { maximum: 100 },
			  uniqueness: { case_sensitive: false }
  has_secure_password
end
