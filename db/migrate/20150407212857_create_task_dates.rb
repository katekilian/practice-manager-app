class CreateTaskDates < ActiveRecord::Migration
  def change
    create_table :task_dates do |t|
      t.datetime  :date
      t.integer   :week_number
      t.integer   :month
    end
  end
end
