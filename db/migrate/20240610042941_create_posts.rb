class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.bigint :user_id
      t.string :album_name
      t.string :singer_name
      t.text :body
      t.timestamps
    end
  end
end
