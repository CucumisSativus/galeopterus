class AddMarkingToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :marked, :boolean, default: :false
  end
end
