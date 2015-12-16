class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.string :author_name
      t.integer :post_id

      t.timestamps
    end
    add_index :comments, :post_id
  end
end
