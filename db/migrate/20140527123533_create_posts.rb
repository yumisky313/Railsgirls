class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.text :content
    	t.string :author
    	t.string :picture
      t.timestamps
    end
  end
end