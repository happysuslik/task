class RemoveColumnsforComments < ActiveRecord::Migration
  def change
    remove_column :comments, :avatars, :json
  end
end
