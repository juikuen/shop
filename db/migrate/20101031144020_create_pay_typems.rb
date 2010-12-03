class CreatePayTypems < ActiveRecord::Migration
  def self.up
    create_table :pay_typems do |t|
      t.string :name, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :pay_typems
  end
end
