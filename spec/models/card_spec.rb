require 'rails_helper'

describe Card do
  it { should respond_to(:title) }
  it { should respond_to(:description) }

  describe '#archivisation' do
    it 'should archivise cards' do
      pending 'unable to hit db'
      @card = Card.new(title: 'tytulik', list_id: 1, description: 'cokolwiek')
      @card.save
      @card.archivise!
      expect(Card.first.archivised).to eq(true)
    end

    it 'should unarchivise cards' do
      pending 'unable to hit db'
      @card = Card.new(title: 'tytulik', list_id: 1, description: 'cokolwiek')
      @card.save
      @card.dearchivise!
      expect(Card.first.archivised).to eq(false)
    end
  end
end
