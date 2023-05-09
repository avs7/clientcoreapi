class Contact < ApplicationRecord
  has_many :notes
  has_many :tasks
  has_many :documents

  belongs_to :user
end
