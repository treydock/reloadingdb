class AddDiscardedAtToCalibers < ActiveRecord::Migration[5.2]
  def change
    add_column :calibers, :discarded_at, :datetime
    add_index :calibers, :discarded_at
  end
end
