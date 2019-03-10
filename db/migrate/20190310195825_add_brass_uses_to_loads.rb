class AddBrassUsesToLoads < ActiveRecord::Migration[5.2]
  def change
    add_column :loads, :brass_uses, :integer
  end
end
