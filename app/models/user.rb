class User < ApplicationRecord
  has_many :contacts
  has_many :notes
  has_many :tasks

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end