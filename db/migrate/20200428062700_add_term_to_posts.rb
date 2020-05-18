class AddTermToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :term, :integer
  end
end
