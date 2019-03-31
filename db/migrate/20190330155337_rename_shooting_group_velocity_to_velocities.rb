class RenameShootingGroupVelocityToVelocities < ActiveRecord::Migration[5.2]
  def up
    add_column :shooting_groups, :velocities, :text
    ShootingGroup.find_each do |s|
      s.velocities = [s.velocity]
      s.save!
    end
    remove_column :shooting_groups, :velocity
  end
  def down
    add_column :shooting_groups, :velocity, :integer
    ShootingGroup.find_each do |s|
      if s.velocities.present?
        s.velocity = s.velocities.first.to_i
        s.save!
      end
    end
    remove_column :shooting_groups, :velocities
  end
end
