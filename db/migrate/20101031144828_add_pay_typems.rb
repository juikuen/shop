class AddPayTypems < ActiveRecord::Migration
  def self.up
    PayTypem.delete_all
    PayTypem.create(:name => 'Check')
    PayTypem.create(:name => 'Credit Card')
    PayTypem.create(:name => 'Purchase Order')

  end

  def self.down
    PayTypem.delete_all
  end
end
