class CreatePaintings < ActiveRecord::Migration[7.1]
  def change
    create_table :paintings do |t|
      t.string :name
      t.text :description
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
