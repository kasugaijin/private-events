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

  # to prevent errors, check if record exists
  # check destroy worked and notify
  def destroy
    @attending = Attending.find_by(attending_params)
    if @attending.nil?
      flash.alert = "This event attendance does not exist"
    elsif @attending.destroy
      flash.notice = "You are no longer attending this event."
    else
      flash.alert = "Error - attendance was not deleted."
    end
    redirect_to my_events_path
  end
  
  private

  def attending_params
    params.permit(:attendee_id, :attended_event_id)
  end

end