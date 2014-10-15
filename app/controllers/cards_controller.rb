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

  private

  def card_params
    params.require(:card).permit(:title, :list_id)
  end
end
