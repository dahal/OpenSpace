class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :name
      t.string :title
      t.text :content
      t.attachment :image

      t.timestamps
    end
  end
end
