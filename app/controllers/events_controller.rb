class EventsController < ApplicationController
  def new
	@event = Event.new
  end

  def show
	@event = Event.find(params[:id])
  end

  def create
	@event = Event.new(params[:event])
	@event.approved = signed_in?
	if @event.save
	  msg = String.new
	  if signed_in?
		msg = "Event successfully added!"
	  else
		msg = "Event successfully suggested!"
	  end
	  flash[:success] = msg
	  redirect_to @event
	else
	  render 'new'
	end
  end
end
