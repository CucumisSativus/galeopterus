class Board < ActiveRecord::Base
  # relations

  has_many :lists, dependent: :destroy
  has_many :board_connections
  has_many :users, through: :board_connections

  def list_count
    lists.count
  end

  def card_count
    card_number = 0
    lists.each do |list|
      card_number = card_number + list.cards.count
    end
    card_number
  end

  def list_by_order
    ordered = []
    self.list_order.each { |id| ordered << self.lists.find(id) }
    ordered
  end

  def reorder_lists
    listsId = []
    self.lists.each do |list|
      listsId << list.id
    end
    self.list_order = listsId
    self.save!
  end
end
