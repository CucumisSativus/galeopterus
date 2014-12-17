require 'rails_helper'

describe Board do
  it { should respond_to(:title) }

  describe '#list_count' do
    it 'should count all lists' do
      list = FactoryGirl.create(:list)
      board = list.board
      3.times do
        List.create(board_id: board.id)
      end
      expect(board.list_count).to eq(4)
    end
  end
end
