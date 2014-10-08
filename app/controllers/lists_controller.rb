class ListsController < ApplicationController

  def create
    @list = List.new list_params
    @list.save
    redirect_to board_path(params[:list][:board_id])
  end

  private

  def list_params
    params.require(:list).permit(:title, :board_id)
  end
end
