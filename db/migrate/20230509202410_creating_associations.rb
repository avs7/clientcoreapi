class CreatingAssociations < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :contacts, :user, index: true, foreign_key: true

    add_belongs_to :notes, :contact, index: true, foreign_key: true
    add_belongs_to :tasks, :contact, index: true, foreign_key: true
    add_belongs_to :documents, :contact, index: true, foreign_key: true
    add_belongs_to :documents, :note, index: true, foreign_key: true

    add_belongs_to :tasks, :note, index: true, foreign_key: true

  end
end
