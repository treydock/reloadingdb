class AddZeroDistanceUnitToGun < ActiveRecord::Migration[5.2]
  def change
    add_column :guns, :zero_distance_unit, :string
    rename_column :guns, :zero_range, :zero_distance
  end
end
