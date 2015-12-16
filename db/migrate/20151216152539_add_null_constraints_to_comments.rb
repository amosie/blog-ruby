class AddNullConstraintsToComments < ActiveRecord::Migration
  def change
      change_column :comments, :author_name, :string, :null => false
      change_column :comments, :post_id, :integer, :null => false
      change_column :comments, :body, :string, :null => false
  end
end
