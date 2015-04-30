class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :genre
      t.text :abstract
      t.integer :pages
      t.string :image_cover_url
      t.date :published_on
      t.integer :total_in_library

      t.timestamps null: false
    end
  end
end
