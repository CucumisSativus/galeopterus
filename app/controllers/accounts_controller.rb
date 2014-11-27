class AccountsController < ApplicationController
  def index
    @boards = current_user.boards
    @invitations = current_user.organization_invitations
  end
end
