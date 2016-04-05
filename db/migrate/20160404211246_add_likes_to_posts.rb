class AddLikesToPosts < ActiveRecord::Migration
  def change
      add_column :posts, :likes, :longint
  end
end
