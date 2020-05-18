class AddWhoToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :who, :string
  end
end
