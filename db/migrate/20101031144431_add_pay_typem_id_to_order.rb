class AddPayTypemIdToOrder < ActiveRecord::Migration
  def self.up
      remove_column :orders, :pay_typem
    add_column :orders, :pay_typem_id, :integer
  end

  def self.down
    remove_column :orders, :pay_typem_id
  end
end
