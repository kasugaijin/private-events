class InvitesController < ApplicationController
  before_action :authenticate_user!

  def create
    @invite = Invite.new(event_id: params[:event_id],
                         inviter_id: current_user.id,
                         invitee_id: params[:invitee_id]
                        )

    respond_to do |format|
      if @invite.save
        format.html { redirect_to event_path(params[:event_id]), notice: "Invite sent!" }
      else
        format.html { redirect_to root_path, status: :unprocessable_entity }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
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
    params.require(:invite).permit(:event_id, :invitee_id)
  end

end