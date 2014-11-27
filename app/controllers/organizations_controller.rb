class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_organization, only: [:show, :edit, :update, :destroy]

  def index
    @organizations = current_user.organizations
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.admin = current_user
    if @organization.save
      UserOrganizationConnection.create(organization: @organization, user: current_user)
      redirect_to user_dashboard_path, notice: 'Organization created'
    else
      redirect_to user_dashboard_path, alert: 'Organization creation failed'
    end
  end

  def show
    @admin = @organization.admin
    @users = @organization.users
    @boards = @organization.boards
  end

  def edit
  end

  def update
    @organization.update(organization_params)
    if @organizatin.save
      redirect_to user_dashboard_path, notice: 'Organization updated'
    else
      redirect_to user_dashboard_path, alert: 'Organization update failed'
    end
  end

  def destroy
    @organization.destroy
    redirect_to user_dashboard_path, notice: 'Organization removed'
  end

  private

  def find_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name, :public)
  end
end
