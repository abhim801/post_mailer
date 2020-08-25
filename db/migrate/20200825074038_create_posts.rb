class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :short_description
      t.text :description
      t.boolean :active, default: false
      t.boolean :is_deleted, default: false
      t.datetime :deleted_at
      
      t.timestamps
    end
  end
end
