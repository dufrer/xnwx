# -*- encoding : utf-8 -*-
class CreateBells < ActiveRecord::Migration
  def change
    create_table :bells do |t|
      t.string :name
      t.string :zone
      t.string :file_location
      t.integer :file_size
      t.string :duration
      t.string :singer

      t.timestamps
    end
  end
end
