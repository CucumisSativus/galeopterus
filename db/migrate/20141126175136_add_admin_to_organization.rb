class AddAdminToOrganization < ActiveRecord::Migration
  def change
    add_reference :organizations, :admin, index: true
  end
end
