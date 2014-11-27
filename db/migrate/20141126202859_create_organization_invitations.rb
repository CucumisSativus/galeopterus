class CreateOrganizationInvitations < ActiveRecord::Migration
  def change
    create_table :organization_invitations do |t|
      t.belongs_to :organization, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
