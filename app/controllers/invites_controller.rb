class InvitesController < ApplicationController
  before_action :authenticate_user!

  def create
    @invite = Invite.new(invite_params)

    respond_to do |format|
      if @invite.save
        format.html { redirect_to event_path(invite_params[:event_id]), notice: "Invite sent!" }
      else
        format.html { redirect_to root_path, status: :unprocessable_entity }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # Where query to find all invites with event_id and invitee_id
    # Then pass the active record relation (array) into Invite.find using splat*
    # to pass the ids array as args. Multiple ids exist if same invite was sent more than once
    invitee_invites = Invite.where(event_id: params[:event_id],
                                   invitee_id: params[:invitee_id])
    @invite = Invite.find(*invitee_invites.ids)
    @invite.destroy
    flash.notice = "Invite was removed."
  end
  
  private

  def invite_params
    # no require method here because I am not using an invite#new object above
    params.permit(:event_id, :invitee_id, :inviter_id)
  end

end