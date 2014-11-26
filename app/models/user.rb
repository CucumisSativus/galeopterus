class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # relations

  has_many :board_connections
  has_many :boards, through: :board_connections
  has_many :user_organization_connections
  has_many :organizations, through: :user_organization_connections
end
