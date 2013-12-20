# -*- encoding : utf-8 -*-
class CreateBellTags < ActiveRecord::Migration
  def change
    create_table :bell_tags do |t|
      t.references :tag
      t.references :bell

      t.timestamps
    end
    add_index :bell_tags, :tag_id
    add_index :bell_tags, :bell_id
  end
end
