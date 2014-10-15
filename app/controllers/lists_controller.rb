class ListsController < ApplicationController
  before_action :authenticate_user!

  def create
    @list = List.new list_params
    @list.save
    redirect_to board_path(params[:list][:board_id])
  end

  def destroy
    @list = List.find(params[:id])
    @board = @list.board
    @list.destroy
    redirect_to board_path(@board), notice: 'List removed'
  end

  private

  def list_params
    params.require(:list).permit(:title, :board_id)
  end
end
