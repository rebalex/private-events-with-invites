class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      @event.event_invitations.create!(invited_user: current_user, status: :accepted)
      redirect_to @event, notice: "Event created!"
    else
      flash.now[:danger] = "Event not created"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
    @invitation = @event.event_invitations.find_by(invited_user: current_user)
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :datetime, invited_user_ids: [])
  end
end
