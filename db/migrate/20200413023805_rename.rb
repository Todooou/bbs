class Rename < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :image, :picture
  end
end
