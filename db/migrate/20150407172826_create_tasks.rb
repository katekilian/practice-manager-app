class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string  :description
      t.date    :due_date
      t.integer :category_id
      t.timestamps
    end
  end
end
