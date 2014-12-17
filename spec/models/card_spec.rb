require 'rails_helper'

describe Card do
  it { should respond_to(:title) }
  it { should respond_to(:description) }

  describe '#archivisation' do
    it 'should archivise cards' do
      board = FactoryGirl.create(:board)
      @list = List.create(board_id: board.id)
      @card = Card.new(title: 'tytulik', list_id: @list.id, description: 'cokolwiek')
      @card.save
      @card.archivise!
      expect(Card.all.count).to eq(0)
    end

    it 'should unarchivise cards' do
      board = FactoryGirl.create(:board)
      @list = List.create(board_id: board.id)
      @card = Card.new(title: 'tytulik', list_id: @list.id, description: 'cokolwiek')
      @card.save
      @card.dearchivise!
      expect(Card.all.count).to eq(1)
    end
  end
end
