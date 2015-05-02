class User < ActiveRecord::Base
  has_many :reservations
  validates :user_id, presence: true, uniqueness: true
  validates :name, presence: true
  has_secure_password
end
