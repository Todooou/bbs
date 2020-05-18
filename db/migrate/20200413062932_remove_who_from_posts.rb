class RemoveWhoFromPosts < ActiveRecord::Migration[6.0]
  def change

    remove_column :posts, :who, :integer
  end
end
