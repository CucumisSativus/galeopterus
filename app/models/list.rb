class List < ActiveRecord::Base
  # relations

  belongs_to :board
  has_many :cards, dependent: :destroy

  validates :board, presence: true

  default_scope { where(archivised: false) }

  scope :archivised, -> { unscoped.where(archivised: true) }

  def archivise!
    self.archivised = true
    self.save
    cards.each do |card|
      card.archivise!
    end
  end

  def dearchivise!
    self.archivised = false
    self.save
    cards.unscoped.each do |card|
      card.dearchivise!
    end
  end
end
