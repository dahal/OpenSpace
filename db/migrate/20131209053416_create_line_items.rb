class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :cart_id
      t.integer :list_space_id
      t.integer :month,:default=>1

      t.timestamps
    end
  end
end
