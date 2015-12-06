class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :message, null: false
      t.timestamps null: false
    end
  end
end
