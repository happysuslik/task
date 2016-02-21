class RemoveColumnsforComments < ActiveRecord::Migration
  def change
    remove_column :comments, :avatar, :string
    remove_column :comments, :avatar_file_name, :string
    remove_column :comments, :avatar_content_type, :string
    remove_column :comments, :avatar_file_size, :integer
    remove_column :comments, :avatar_updated_at, :datetime
  end
end
