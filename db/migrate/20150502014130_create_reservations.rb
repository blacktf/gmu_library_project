class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :reserved_on
      t.date :due_on
      t.integer :user_id
      t.integer :book_id
      t.references :book, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :reservations, :books
    add_foreign_key :reservations, :users
  end
end
