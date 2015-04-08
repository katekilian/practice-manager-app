class Task < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
  belongs_to :task_date

end
