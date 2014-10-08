class BoardConnection < ActiveRecord::Base
  # relations

  belongs_to :user
  belongs_to :board
end
