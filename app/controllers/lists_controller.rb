class ListsController < ApplicationController
  before_action :authenticate_user!

  def create
    @list = List.new list_params
    # need to find related board to update lists order
    board = Board.find params[:list][:board_id]
    @list.save
    # ActiveRecord hack to save array :OOOOOOOOOOOOO
    board.list_order = board.list_order + [@list.id]
    board.save
    redirect_to board_path(params[:list][:board_id])
  end

  def destroy
    @list = List.find(params[:id])
    @board = @list.board
    # remove list id from board order list
    @board.list_order.delete_if { |item| item == @list.id }
    @list.destroy
    redirect_to board_path(@board), notice: 'List removed'
  end

  private

  def list_params
    params.require(:list).permit(:title, :board_id)
  end
end
