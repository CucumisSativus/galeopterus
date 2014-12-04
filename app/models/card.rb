class Card < ActiveRecord::Base
  # relations

  belongs_to :list
  has_many :card_comments, dependent: :destroy

  # validators
  validates :list, presence: true

  def self.get_labels
    {
      green: '#4ffb70',
      red: '#d22f17',
      yellow: '#e3dd3d',
      blue: '#2241f4'
    }
  end
end
