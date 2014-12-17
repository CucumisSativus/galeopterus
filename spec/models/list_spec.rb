require 'rails_helper'

describe List do
  it { should respond_to(:title) }

  describe '#archivisation' do
    it 'should archivise list' do
      # pending 'unable to hit db'
      board = FactoryGirl.create(:board)
      @list = List.create(board_id: board.id)
      @list.archivise!
      expect(List.all.count).to eq(0)
    end

    it 'should unarchivise list' do
      # pending 'unable to hit db'
      board = FactoryGirl.create(:board)
      @list = List.create(board_id: board.id)
      @list.dearchivise!
      expect(List.all.count).to eq(1)
    end
  end
end
 