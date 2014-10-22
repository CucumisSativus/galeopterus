class AddListOrderToBoard < ActiveRecord::Migration
  def change
    add_column :boards, :list_order, :integer, array: true, default: []
  end
end
