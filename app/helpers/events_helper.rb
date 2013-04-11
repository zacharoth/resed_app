module EventsHelper

  def display_time(event)
	if (event.time.hour == 0)
	  "12:#{event.time.min} am"
	elsif (event.time.hour < 12)
	  "#{event.time.hour}:#{event.time.min} am"
	elsif (event.time.hour == 12)
	  "#{event.time.hour}:#{event.time.min} pm"
	else
	  adj_hour = 24 - event.time.hour
	  "#{adj_hour}:#{event.time.min} pm"
	end
  end

  def display_date(event)
	months = ["January", "February", "March", "April", "May", "June", "July",
			"August", "September", "October", "November", "December"]
	month = months[event.time.month - 1]
    "#{month} #{event.date.day}, #{event.date.year}"
  end

  def display_cost(event)
	if !event.cost
	  ""
	elsif event.cost[0] == 'f'
	  "free"
	elsif event.cost[0] == 'l'
	  if event.cost[5] == '1'
		"under $15"
	  elsif event.cost[5] == '3'
		"under $30"
	  else
		"under $50"
	  end
	else
	  "over $50"
	end
  end
end
