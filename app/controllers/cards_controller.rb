class CardsController < ApplicationController
  before_action :authenticate_user!

  def create
    @card = Card.new card_params
    @list = List.find(params[:card][:list_id])
    if @card.save
      redirect_to board_path(@list.board_id), notice: 'Card added!'
    else
      redirect_to board_path(@list.board_id), alert: 'Error adding card!'
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @board = @card.list.board
    @card.destroy
    redirect_to board_path(@board), notice: 'Card removed'
  end

  def move_to_list
    @card = Card.find(params[:id])
    @card.list_id = params[:list_id]
    if @card.save
      respond_to do |format|
        format.json { render status: :ok }
      end
    else
      respond_to do |format|
        format.json { render status: :unprocesable_entity }
      end
    end
  end
  private

  def card_params
    params.require(:card).permit(:title, :list_id)
  end
end
