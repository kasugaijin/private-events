class AttendingsController < ApplicationController

  before_action :authenticate_user!

  # create action taking user id and event id and creating row in attendings table
  def create
    user_id = current_user.id
    event = Event.find(params[:event_id])
    event_id = event.id
    @attending = Attending.new(attendee_id: user_id, attended_event_id: event_id)

    respond_to do |format|
      if @attending.save
        format.html { redirect_to my_events_path, notice: "You are attending this event!" }
      else
        format.html { redirect_to my_events_path, alert: "An error occured." }
      end
    end
  end

  def destroy

  end
  
  private

  def event_params
    params.require(:attending).permit(:event_id)
  end

end