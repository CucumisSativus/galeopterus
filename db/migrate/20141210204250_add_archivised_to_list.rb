class AddArchivisedToList < ActiveRecord::Migration
  def change
    add_column :lists, :archivised, :boolean, default: false
  end
end
