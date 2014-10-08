class AccountsController < ApplicationController
  def index
    @boards = current_user.boards
  end
end
