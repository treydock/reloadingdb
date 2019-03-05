class CreateBullets < ActiveRecord::Migration[5.2]
  def change
    create_table :bullets do |t|
      t.string :name
      t.string :grain
      t.string :caliber
      t.belongs_to :user

      t.timestamps
    end
  end
end
