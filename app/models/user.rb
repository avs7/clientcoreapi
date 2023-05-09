class User < ApplicationRecord
  has_many :contacts
  has_many :notes
  has_many :tasks
end