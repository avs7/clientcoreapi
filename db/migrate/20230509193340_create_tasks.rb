class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :details, null: false
      t.boolean :status, default: false, null: false
      t.string :priority, default: '1', null: false
      t.date :due_date

      t.timestamps
    end
  end
end