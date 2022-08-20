class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :post_image1
      t.string :post_image2
      t.string :post_image3
      t.string :title
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
