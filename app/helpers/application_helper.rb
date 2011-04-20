module ApplicationHelper
  def pretty_date date_obj
    date_obj.strftime("%D %r")

  end

  def days_ago(past_time,current_time=DateTime.now)
    num_days = (current_time-past_time).to_i
    if num_days == 0
      "Today"
    elsif num_days == 1
      "Yesterday"
    else
      "#{num_days} days ago"
    end

  end
end
