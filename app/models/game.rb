# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  match_date :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Game < ActiveRecord::Base
  attr_accessible :match_date, :name
  has_many :game_sources
  BASE_SOURCE="http://zhibo8.cc"

  def self.initialize
  		
  end 
end
