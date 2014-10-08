class Board < ActiveRecord::Base
  # relations

  has_many :lists
  has_many :board_connections
  has_many :users, through: :board_connections
end
