class EventsController < ApplicationController
  before_filter :signed_in_admin, only: [:approve, :destroy]

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
	  @event.save
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
	@events = Event.paginate :per_page => 25, 
			:page => params[:page],
			:order => ("#{params[:sort]} #{params[:direction]}" || 'date desc')	
  end

  def approve
	@event = Event.find(params[:format])
	@event.approved = true
	@event.issue = ""
	@event.save
	flash[:success] = "Event approved."
	redirect_to events_url
  end

  def reportissue
	@event = Event.find(params[:format])
	Event.class_variable_set(:@@issue_event, params[:format])
  end

  def updateissue
	if Event.class_variable_get(:@@issue_event)
	  @event = Event.find(Event.class_variable_get(:@@issue_event))
	  Event.class_variable_set(:@@issue_event, nil)
	  @event.issue = params[:event][:issue]
	  @event.approved = false
	  @event.save
	  flash[:success] = "Issue successfully submitted."
	  redirect_to @event
	else
	  flash[:error] = "Issue unable to be submitted."
	  redirect_to events_url
	end
  end

  def destroy
	Event.find(params[:id]).destroy
	flash[:success] = "Event deleted."
	redirect_to events_url
  end

  def search
	@events = Event.search(params[:search], params[:page], 
						   params[:sort], params[:direction])
  end

  private

	def signed_in_admin
	  redirect_to root, notice: "Admin access only." unless signed_in?
	end
end
