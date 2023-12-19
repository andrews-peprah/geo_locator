class CreateGeoLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :geo_locations do |t|
      t.decimal :lat
      t.decimal :lng
      t.string :city
      t.string :country
      t.string :continent
      t.references :locationable, polymorphic: true, null: false
      t.timestamps
    end
  end
end
