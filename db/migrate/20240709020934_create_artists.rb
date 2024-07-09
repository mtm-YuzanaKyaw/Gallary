class CreateArtists < ActiveRecord::Migration[7.1]
  def change
    create_table :artists do |t|
      t.string :artist_name
      t.string :phone

      t.timestamps
    end
  end
end
