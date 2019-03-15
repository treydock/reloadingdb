class RenameLoadsSpeedToVelocity < ActiveRecord::Migration[5.2]
  def change
    rename_column :loads, :speed, :velocity
    rename_column :loads, :speed_unit, :velocity_unit
  end
end
