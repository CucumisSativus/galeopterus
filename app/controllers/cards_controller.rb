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

  def update
    @card = Card.find params[:id]
    @card.update_attributes card_params
    if @card.save
      redirect_to board_path(@card.list.board_id), notice: 'Card updated!'
    else
      redirect_to board_path(@card.list.board_id), alert: 'Error updating card!'
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @board = @card.list.board
    @card.archivise!
    redirect_to board_path(@board), notice: 'Card archivised'
  end

  def dearchivise
    @card = Card.unscoped.find(params[:id])
    @board = @card.list.board
    @card.dearchivise!
    redirect_to board_path(@board), notice: 'Card restored'
  end

  def destroy_permanently
    @card = Card.unscoped.find(params[:id])
    @board = @card.list.board
    @card.destroy
    redirect_to board_path(@board), notice: 'Card removed'
  end

  def move_to_list
    @card = Card.find(params[:id])
    @card.list_id = params[:list_id]
    if @card.save
      respond_to do |format|
        format.json { render json: { status: :ok } }
      end
    else
      respond_to do |format|
        format.json { render json: { status: :unprocesable_entity } }
      end
    end
  end
  private

  def card_params
    params.require(:card).permit(:title, :list_id, :label_color, :end_date)
  end
end
