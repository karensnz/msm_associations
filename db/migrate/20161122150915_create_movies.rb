class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :director_id
      t.integer :year
      t.integer :duration
      t.text :description
      t.string :image_url

      t.timestamps

    end
  end
end
