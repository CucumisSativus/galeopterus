class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title
      t.text :description
      t.belongs_to :list

      t.timestamps
    end
  end
end
