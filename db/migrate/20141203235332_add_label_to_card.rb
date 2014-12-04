class AddLabelToCard < ActiveRecord::Migration
  def change
    add_column :cards, :label_color, :string
  end
end
