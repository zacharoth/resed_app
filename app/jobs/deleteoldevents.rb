module DeleteOldEvents
  @queue = :del_old_events_queue
  def self.perform()
	@events = Event.all
	@events.each { |event|
	  if @event.date <= 2.days.ago
		@event.destroy unless (@event.date_applicable || @event.repeat)
	  end
	}
  end
end
