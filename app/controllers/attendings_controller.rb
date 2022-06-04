class AttendingsController < ApplicationController

  before_action :authenticate_user!

  # create action taking user id and event id and creating row in attendings table
  def create
    @attending = Attending.new(attending_params)

    respond_to do |format|
      if @attending.save
        format.html { redirect_to my_events_path, notice: "You are attending this event!" }
      else
        format.html { redirect_to my_events_path, alert: "An error occured." }
      end
    end
  end

  def destroy
    # Where query to find all Attendings with event_id and user_id
    # Then find the Attending object by passing in the resulting where relation array
    # the splat* is used to pass an array as args to a method
    attended_event = Attending.where(attending_params)
    @attending = Attending.find(*attended_event.ids)
    @attending.destroy
    redirect_to root_path
    flash.notice = "You are no longer attending this event."
  end
  
  private

  def attending_params
    params.permit(:attendee_id, :attended_event_id)
  end

end