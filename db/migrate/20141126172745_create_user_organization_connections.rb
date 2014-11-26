class CreateUserOrganizationConnections < ActiveRecord::Migration
  def change
    create_table :user_organization_connections do |t|
      t.belongs_to :organization, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
