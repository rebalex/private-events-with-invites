class EventInvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invitation, only: [ :update ]

  def index
    @invitations = current_user.event_invitations.includes(:invited_event)
  end

  def update
    if @invitation.update(invitation_params)
      redirect_back fallback_location: request.referer
    else
      redirect_back fallback_location: request.referer, alert: "Unable to update response."
    end
  end

  private

  def set_invitation
    @invitation = current_user.event_invitations.find(params[:id])
  end

  def invitation_params
    params.require(:event_invitation).permit(:status)
  end
end
