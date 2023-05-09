class Note < ApplicationRecord
  belongs_to :contact
  has_many :documents, required: false
end
