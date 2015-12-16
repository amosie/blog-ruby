class AddNulConstraintToPostsAuthorName < ActiveRecord::Migration
  def change
    change_column :posts, :author_name, :string, :null => false
  end
end
