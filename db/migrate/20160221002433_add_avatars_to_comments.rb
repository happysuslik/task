class AddAvatarsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :avatars, :json
  end
end
