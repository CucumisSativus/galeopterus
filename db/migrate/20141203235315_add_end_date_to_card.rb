class AddEndDateToCard < ActiveRecord::Migration
  def change
    add_column :cards, :end_date, :datetime
  end
end
