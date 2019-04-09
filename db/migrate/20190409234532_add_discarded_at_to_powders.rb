class AddDiscardedAtToPowders < ActiveRecord::Migration[5.2]
  def change
    add_column :powders, :discarded_at, :datetime
    add_index :powders, :discarded_at
  end
end
