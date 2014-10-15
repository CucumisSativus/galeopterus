class Card < ActiveRecord::Base
  # relations

  belongs_to :list
  has_many :card_comments

  # validators
  validates :list, presence: true
end
