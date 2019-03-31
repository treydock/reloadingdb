class RemoveVelocitiesFromShootingGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :shooting_groups, :velocities, :text
  end
end
