class AddNotesToLoad < ActiveRecord::Migration[5.2]
  def change
    add_column :loads, :notes, :text
  end
end
