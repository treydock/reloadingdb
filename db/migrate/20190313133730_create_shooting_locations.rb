class CreateShootingLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :shooting_locations do |t|
      t.string :name
      t.decimal :latitude
      t.decimal :longitude
      t.decimal :elevation
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
