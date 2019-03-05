class CreateBullets < ActiveRecord::Migration[5.2]
  def change
    create_table :bullets do |t|
      t.string :name
      t.decimal :grain
      t.decimal :caliber
      t.references :user

      t.timestamps
    end
    add_index :bullets, :user
  end
end
