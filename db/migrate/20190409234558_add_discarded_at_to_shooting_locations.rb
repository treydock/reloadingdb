class AddDiscardedAtToShootingLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :shooting_locations, :discarded_at, :datetime
    add_index :shooting_locations, :discarded_at
  end
end
