class AddRunOutAndRoundsToLoads < ActiveRecord::Migration[5.2]
  def change
    add_column :loads, :run_out, :float
    add_column :loads, :rounds, :integer
  end
end
