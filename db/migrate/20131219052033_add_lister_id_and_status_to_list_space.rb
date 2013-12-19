class AddListerIdAndStatusToListSpace < ActiveRecord::Migration
  def change
  add_column :list_spaces, :lister_id, :integer
  add_column :list_spaces, :status, :string, :default => "inactive"
  end
end
