# -*- encoding : utf-8 -*-
class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :match_date
      t.string :name

      t.timestamps
    end
  end
end
