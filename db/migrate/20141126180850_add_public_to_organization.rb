class AddPublicToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :public, :boolean
  end
end
