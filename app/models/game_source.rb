# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: game_sources
#
#  id          :integer          not null, primary key
#  game_id     :integer
#  source_url  :string(255)
#  source_name :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# -*- encoding : utf-8 -*-
class GameSource < ActiveRecord::Base
  belongs_to :games
  attr_accessible :source_name, :source_url
end
