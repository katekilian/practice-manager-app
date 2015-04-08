class ChangeTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :due_date, :date
  end
end
