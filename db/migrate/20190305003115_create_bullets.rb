class CreateBullets < ActiveRecord::Migration[5.2]
  def change
    create_table :bullets do |t|
      t.string :name
      t.string :grain
      t.belongs_to :caliber
      t.belongs_to :user

      t.timestamps
    end
  end
end
