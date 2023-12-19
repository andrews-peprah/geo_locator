class CreateUrlResources < ActiveRecord::Migration[7.0]
  def change
    create_table :url_resources do |t|
      t.string :url, null: false
      t.timestamps
    end
    add_index :url_resources, :url, unique: true
  end
end
