class Card < ActiveRecord::Base
  # relations

  belongs_to :list
  has_many :card_comments, dependent: :destroy

  # validators
  validates :list, presence: true
end
