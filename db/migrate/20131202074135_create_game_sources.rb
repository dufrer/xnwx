# -*- encoding : utf-8 -*-
class CreateGameSources < ActiveRecord::Migration
  def change
    create_table :game_sources do |t|
      t.references :game
      t.string :source_url
      t.string :source_name

      t.timestamps
    end
    add_index :game_sources, :game_id
  end
end
