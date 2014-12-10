class AddArchivisedToCard < ActiveRecord::Migration
  def change
    add_column :cards, :archivised, :boolean, default: false
  end
end
