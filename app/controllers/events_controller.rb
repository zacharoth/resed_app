class EventsController < ApplicationController
  def new
	@event = Event.new
  end

  def show
	@event = Event.find(params[:id])
  end

  def create
	if (params[:event][:date_applicable])
	  params[:event][:date] = nil
	end
	if (params[:event][:all_day])
	  params[:event][:time] = nil
	end
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

  def edit
	@event = Event.find(params[:id])
  end

  def update
	@event = Event.find(params[:id])
	if @event.update_attributes(params[:event])
	  @event.approved = signed_in?
	  msg = String.new
	  if signed_in?
		msg = "Event details updated"
	  else
		msg = "Event update suggested"
	  end
	  flash[:success] = msg
	  redirect_to @event
	else
	  render 'edit'
	end
  end

  def index
	@events = Event.paginate(page: params[:page])
  end
end
