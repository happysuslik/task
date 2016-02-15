class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.references :user, index: true, foreign_key: true
    end
  end
end
