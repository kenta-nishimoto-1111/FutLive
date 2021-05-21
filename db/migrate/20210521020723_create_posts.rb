class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :month,               null: false
      t.string :day,                 null: false
      t.string :access,              null: false
      t.string :post,                null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
