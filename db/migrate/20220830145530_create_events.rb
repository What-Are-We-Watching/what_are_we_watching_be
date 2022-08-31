class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :name
      t.references :users, foreign_key: true
      t.integer :movie_selection_id
      t.integer :status, default: 0
      t.integer :guest_id

      t.timestamps
    end
  end
end
