namespace :future_dates do

  desc "creates dates five years from today"
  task creates_future_dates: :environment do
    (5*365).times do |i|
      # Date here being a class you've written (the name might not work as Date since there exists a Ruby class named Date)
      TaskDate.create(date: i.days.from_now.beginning_of_day, week_number: i.days.from_now.strftime("%U").to_i, month: i.days.from_now.strftime("%B").to_i)
    end
  end

  # ran the rake task with %B up there.  it should've been %m. Must update all entries with %m
  # month: i.days.from_now.strftime("%m").to_i

end
