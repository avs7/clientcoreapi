class Contact < ApplicationRecord
  has_many :notes, required: false
  has_many :tasks, required: false
  has_many :documents, required: false

  belongs_to :user
end
