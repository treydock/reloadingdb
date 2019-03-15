class CreateShootingGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :shooting_groups do |t|
      t.belongs_to :shooting_log, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.belongs_to :load, foreign_key: true
      t.integer :number
      t.integer :distance
      t.string :distance_unit
      t.integer :shots
      t.float :elevation_adjustment
      t.string :elevation_adjustment_direction
      t.string :elevation_adjustment_unit
      t.float :windage_adjustment
      t.string :windage_adjustment_direction
      t.string :windage_adjustment_unit
      t.integer :wind_speed
      t.string :wind_speed_unit
      t.integer :wind_direction
      t.float :group_size
      t.string :group_size_unit
      t.integer :velocity
      t.string :velocity_unit

      t.timestamps
    end
  end
end
