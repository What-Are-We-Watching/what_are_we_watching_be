class CreateEventMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :event_movies do |t|
      t.references :event, foreign_key: true
      t.references :movie, foreign_key: true
      t.integer :vote

      t.timestamps
    end
  end
end
