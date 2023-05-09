class Document < ApplicationRecord
  belongs_to :contact
  belongs_to :note
end
