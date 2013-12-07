class CreateListSpaces < ActiveRecord::Migration
  def change
    create_table :list_spaces do |t|
      t.text :description
      t.decimal :price
      t.float :area
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.date :available_date
      t.attachment :image

      t.timestamps
    end
  end
end
