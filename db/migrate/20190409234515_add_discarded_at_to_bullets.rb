class AddDiscardedAtToBullets < ActiveRecord::Migration[5.2]
  def change
    add_column :bullets, :discarded_at, :datetime
    add_index :bullets, :discarded_at
  end
end
