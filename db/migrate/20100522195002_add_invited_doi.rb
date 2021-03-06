class AddInvitedDoi < ActiveRecord::Migration
  def self.up
    add_column :papers, :invited, :boolean
    add_column :papers, :doi, :string
  end

  def self.down
    remove_column :papers, :invited
    remove_column :papers, :doi
  end
end
