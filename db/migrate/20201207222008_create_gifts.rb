class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
