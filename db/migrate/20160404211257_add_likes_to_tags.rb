class AddLikesToTags < ActiveRecord::Migration
  def change
      add_column :tags, :likes, :longint
  end
end
