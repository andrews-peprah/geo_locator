class CreateIpResources < ActiveRecord::Migration[7.0]
  def change
    create_table :ip_resources do |t|
      t.inet :ip_address
      t.timestamps
    end
    add_index :ip_resources, :ip_address, unique: true
  end
end
