class AddDiscardedAtToLoads < ActiveRecord::Migration[5.2]
  def change
    add_column :loads, :discarded_at, :datetime
    add_index :loads, :discarded_at
  end
end
