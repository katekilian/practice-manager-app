class TaskDate < ActiveRecord::Base

  has_many :tasks

  def pretty_date
    self.date.strftime("%a %B %e %Y")
  end

end
