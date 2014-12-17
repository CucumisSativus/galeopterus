require 'rails_helper'

describe List do
  it { should respond_to(:title) }

  describe '#archivisation' do
    it 'should archivise list' do
      list = FactoryGirl.create(:list)
      list.archivise!
      expect(List.all.count).to eq(0)
    end

    it 'should unarchivise list' do
      list = FactoryGirl.create(:list)
      list.dearchivise!
      expect(List.all.count).to eq(1)
    end
  end
end
 