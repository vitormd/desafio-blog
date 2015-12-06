class ChangePostsMessage < ActiveRecord::Migration
  def up
    change_table :posts do |t|
      t.change :message, :text
    end
  end
 
  def down
    change_table :posts do |t|
      t.change :message, :string
    end
  end
end
