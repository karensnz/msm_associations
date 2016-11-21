class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :source
      t.text :caption
      t.string :image_url

      t.timestamps

    end
  end
end
