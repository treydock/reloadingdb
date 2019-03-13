class AddUnitsToLoads < ActiveRecord::Migration[5.2]
  def change
    add_column :loads, :col_unit, :string
    add_column :loads, :speed_unit, :string
    add_column :loads, :run_out_unit, :string
    add_column :loads, :brass_length_unit, :string
  end
end
