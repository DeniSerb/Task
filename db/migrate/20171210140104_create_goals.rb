class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string  :title
      t.string  :description
      t.integer :priority
      t.boolean :complited, default: false
      t.date    :due_date
      t.integer :user_id

      t.timestamps
    end
  end
end
