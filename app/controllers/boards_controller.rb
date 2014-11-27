# controller for boards
class BoardsController < ApplicationController
  before_action :authenticate_user!

  def create
    @board = Board.new board_params
    respond_to do |format|
      return unless @board.save
      BoardConnection.create user_id: current_user.id, board_id: @board.id
      format.html do
        redirect_to user_dashboard_path, notice: 'Board added successfuly!'
      end
      format.js {}
    end
  end

  def create_from_organization
    @board = Board.new board_params
    @board.organization_id = params[:organization_id]
    return unless @board.save
    redirect_to user_dashboard_path, notice: 'Board added successfuly!'
  end

  def show
    @board = Board.find(params[:id])
    return if @board == current_user.boards.where(id: params[:id]).first
    redirect_to user_dashboard_path, alert: 'You are not allowed to see this board!'
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    respond_to do |format|
      format.html { redirect_to user_dashboard_path, notice: 'Board removed' }
      format.js {}
    end
  end

  def update
    @board = Board.find params[:id]
    @board.update! board_params
    respond_to do |format|
      format.html {}
      format.json { render json: @board }
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, list_order: [])
  end
end
