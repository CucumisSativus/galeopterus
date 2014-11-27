class AddOrganizationIdToBoard < ActiveRecord::Migration
  def change
    add_reference :boards, :organization, index: true
  end
end
