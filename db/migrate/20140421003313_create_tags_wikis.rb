class CreateTagsWikis < ActiveRecord::Migration
  def change
    create_table :tags_wikis do |t|
      t.integer :wiki_id
      t.integer :tag_id
    end
    remove_column :tags, :wiki_id, :integer
  end
end
