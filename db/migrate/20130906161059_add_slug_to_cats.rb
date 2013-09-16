class AddSlugToCats < ActiveRecord::Migration
  def change
    add_column :cats, :slug, :string, unique: true
    add_index :cats, :slug
  end
end
