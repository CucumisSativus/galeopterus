class OrganizationInvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: :create

  def create
    @invitation = OrganizationInvitation.new(user: @user, organization_id: params[:invitation][:organization_id])
    if @invitation.save
      redirect_to organization_path(params[:invitation][:organization_id]), notice: 'Invitation sent'
    else
      redirect_to organization_path(params[:invitation][:organization_id]), alert: 'Error on sending invitation'
    end
  end

  def accept
    @invitation = OrganizationInvitation.find(params[:id])
    UserOrganizationConnection.create(user_id: @invitation.user_id, organization_id: @invitation.organization_id)
    @invitation.destroy
    redirect_to user_dashboard_path, notice: 'invitation accepted'
  end

  def reject
    @invitation = OrganizationInvitation.find(params[:id])
    @invitation.destroy
    redirect_to user_dashboard_path, notice: 'invitation rejected'
  end

  private
  
  def find_user
    @user = User.find_by(email: params[:invitation][:email])
    return redirect_to organization_path(params[:invitation][:organization_id]) unless @user
  end
end
