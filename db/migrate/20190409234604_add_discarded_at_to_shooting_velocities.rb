class AddDiscardedAtToShootingVelocities < ActiveRecord::Migration[5.2]
  def change
    add_column :shooting_velocities, :discarded_at, :datetime
    add_index :shooting_velocities, :discarded_at
  end
end
