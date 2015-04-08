class AddTaskDateIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :task_date_id, :integer
    add_column :tasks, :user_id, :integer
  end
end
