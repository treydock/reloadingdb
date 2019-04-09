class AddDiscardedAtToBrass < ActiveRecord::Migration[5.2]
  def change
    add_column :brasses, :discarded_at, :datetime
    add_index :brasses, :discarded_at
  end
end
