class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :overview
      t.integer :moviedb_id
      t.string :image

      t.timestamps
    end
  end
end
