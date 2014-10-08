class BoardsController < ApplicationController

  def create
    @board = Board.new board_params
    if @board.save
      BoardConnection.create user_id: current_user.id, board_id: @board.id
      redirect_to user_dashboard_path, notice: 'Board added successfuly!'
    else
    end
  end

  private

  def board_params
    params.require(:board).permit(:title)
  end
end
