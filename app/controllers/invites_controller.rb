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
    # Where query to find all invites with event_id (do not use .find beause it returns the object & 
    # cannot perform subsequent .where on it)
    # Then where query to find all of those invites with invitee_id
    # Then find the Invite object using the Attending_id (pulled from active record relation so need to pop it out)
    invites_event = Invite.where(event_id: params[:event_id])
    invitee_invite = invites_event.where(invitee_id: params[:invitee_id])
    @invite = Invite.find(invitee_invite.ids.pop)
    @invite.destroy
    flash.notice = "Invite was rescinded."
  end
  
  private

  def event_params
    params.require(:invite).permit(:event_id, :invitee_id)
  end

end