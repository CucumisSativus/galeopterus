class Card < ActiveRecord::Base
  # relations

  belongs_to :list
  has_many :card_comments, dependent: :destroy

  # validators
  validates :list, presence: true

  default_scope { where(archivised: false) }

  scope :archivised, -> { unscoped.where(archivised: true) }

  def self.get_labels
    {
      green: '#4ffb70',
      red: '#d22f17',
      yellow: '#e3dd3d',
      blue: '#2241f4'
    }
  end

  def archivise!
    self.archivised = true
    self.save
  end

  def dearchivise!
    self.archivised = false
    self.save
  end
end
