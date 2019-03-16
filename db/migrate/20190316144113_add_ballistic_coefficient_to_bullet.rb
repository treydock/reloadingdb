class AddBallisticCoefficientToBullet < ActiveRecord::Migration[5.2]
  def change
    add_column :bullets, :ballistic_coefficient, :float
    add_column :bullets, :ballistic_coefficient_unit, :string
  end
end
