class AddOrganisationIdToBoard < ActiveRecord::Migration
  def change
    add_reference :boards, :organisation, index: true
  end
end
