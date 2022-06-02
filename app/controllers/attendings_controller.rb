class AttendingsController < ApplicationController

  before_action :authenticate_user!

  # create action taking user id and event id and creating row in attendings table
  def create
    @attending = Attending.new(attendee_id: current_user.id,
                               attended_event_id: params[:event_id])

    respond_to do |format|
      if @attending.save
        format.html { redirect_to my_events_path, notice: "You are attending this event!" }
      else
        format.html { redirect_to my_events_path, alert: "An error occured." }
      end
    end
  end

  def destroy
    # Where query to find all Attendings with event_id (from params)
    # Then Where query to find all of those Attendings with user_id
    # Then find the Attending object using the Attending_id (pulled from active record relation so need to pop it out)
    attended_event = Attending.where(attended_event_id: params[:event_id])
    user_attended_event = attended_event.where(attendee_id: current_user.id)
    @attending = Attending.find(user_attended_event.ids.pop)
    @attending.destroy
    redirect_to root_path
    flash.notice = "You are no longer attending this event."
  end
  
  private

  def event_params
    params.require(:attending).permit(:event_id)
  end

end