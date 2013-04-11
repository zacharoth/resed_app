module EventsHelper

  def display_time(event)
	min = String.new
	if event.time.min == 0
	  min = "00"
	else
	  min = event.time.min
	end
	if (event.time.hour == 0)
	  "12:#{min} am"
	elsif (event.time.hour < 12)
	  "#{event.time.hour}:#{min} am"
	elsif (event.time.hour == 12)
	  "#{event.time.hour}:#{min} pm"
	else
	  adj_hour = event.time.hour - 12
	  "#{adj_hour}:#{min} pm"
	end
  end

  def display_date(event)
	months = ["January", "February", "March", "April", "May", "June", "July",
			"August", "September", "October", "November", "December"]
	month = months[event.time.month - 1]
    "#{month} #{event.date.day}, #{event.date.year}"
  end

  def display_cost(event)
	if event.cost
	  event.cost.to_s.gsub('_', ' ')
	else
	  nil
	end
  end
end
