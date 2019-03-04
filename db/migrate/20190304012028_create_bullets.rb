class CreateBullets < ActiveRecord::Migration[5.2]
  def change
    create_table :bullets do |t|
      t.string :name
      t.integer :grain

      t.timestamps
    end
  end
end
