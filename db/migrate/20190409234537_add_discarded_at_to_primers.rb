class AddDiscardedAtToPrimers < ActiveRecord::Migration[5.2]
  def change
    add_column :primers, :discarded_at, :datetime
    add_index :primers, :discarded_at
  end
end
