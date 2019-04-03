class AddScopeMoaAdjustmentToGun < ActiveRecord::Migration[5.2]
  def change
    add_column :guns, :scope_moa_adjustment, :float
  end
end
