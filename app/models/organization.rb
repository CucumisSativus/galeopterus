class Organization < ActiveRecord::Base
  has_many :user_organization_connections
  has_many :users, through: :user_organization_connections

  has_many :boards
  belongs_to :admin, class_name: 'User'

  validates :public, :name, presence: true
end
