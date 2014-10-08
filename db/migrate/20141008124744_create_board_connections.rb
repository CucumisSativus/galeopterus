class CreateBoardConnections < ActiveRecord::Migration
  def change
    create_table :board_connections do |t|
      t.belongs_to :user
      t.belongs_to :board
      t.timestamps
    end
  end
end
