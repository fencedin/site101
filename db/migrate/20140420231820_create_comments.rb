class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :url
      t.text :response
      t.integer :wiki_id
      t.timestamps
    end
  end
end
