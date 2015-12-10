class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :message, null: false
      t.string :slug, null: false, unique: true
      t.timestamps null: false
    end
  end
end
