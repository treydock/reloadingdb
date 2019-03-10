class ChangeColumnsToNumeric < ActiveRecord::Migration[5.2]
  def change
    change_column :loads, :brass_length, :float
    change_column :loads, :powder_weight, :float
    change_column :loads, :col, :float
    change_column :loads, :speed, :integer
    change_column :bullets, :grain, :integer
  end
end
