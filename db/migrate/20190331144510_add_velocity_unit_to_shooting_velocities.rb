class AddVelocityUnitToShootingVelocities < ActiveRecord::Migration[5.2]
  def change
    add_column :shooting_velocities, :velocity_unit, :string
  end
end
