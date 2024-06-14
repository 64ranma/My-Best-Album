class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.bigint :user_id, null: false
      t.string :album_name, null: false
      t.string :singer_name, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
