class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.string :details, null: false
      t.string :category

      t.timestamps
    end
  end
end
