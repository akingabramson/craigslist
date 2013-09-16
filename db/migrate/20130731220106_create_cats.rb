class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :username
      t.integer :lightweight

      t.timestamps
    end
  end
end
