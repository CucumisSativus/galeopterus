class List < ActiveRecord::Base
  # relations

  belongs_to :board
  has_many :cards, dependent: :destroy

  validates :board, presence: true
end
