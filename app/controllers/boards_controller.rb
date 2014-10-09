class BoardsController < ApplicationController
  before_action :authenticate_user!

  def create
    @board = Board.new board_params
    if @board.save
      BoardConnection.create user_id: current_user.id, board_id: @board.id
      redirect_to user_dashboard_path, notice: 'Board added successfuly!'
    end
  end

  def show
    return if @board = current_user.boards.where(id: params[:id]).first
    redirect_to user_dashboard_path, alert: 'You are not allowed to see this board!'
  end

  private

  def board_params
    params.require(:board).permit(:title)
  end
end
