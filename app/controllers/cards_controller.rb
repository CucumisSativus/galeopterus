class CardsController < ApplicationController
  before_action :authenticate_user!

  def create
    @card = Card.create card_params
    if @card.save
      redirect_to board_path(params[:card][:board_id]), notice: 'Card added!'
    else
      redirect_to board_path(params[:card][:board_id]), notice: 'Error adding card!'
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @board = @card.list.board
    @card.destroy
    redirect_to board_path(@board), notice: 'Card removed'
  end

  private

  def card_params
    params.require(:card).permit(:title, :list_id)
  end
end
