class CreateCardComments < ActiveRecord::Migration
  def change
    create_table :card_comments do |t|
      t.text :comment_body
      t.belongs_to :card

      t.timestamps
    end
  end
end
